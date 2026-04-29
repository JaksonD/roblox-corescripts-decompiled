local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)
local Cryo = require(CorePackages.Packages.Cryo)
local mutedError = require(Modules.LuaApp.mutedError)
local AvatarExperienceHeadRefinement = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local SetEquippedDynamicHeadShape = AvatarExperienceHeadRefinement.Actions.SetEquippedDynamicHeadShape
local SetEquippedStaticFacialAnimation = AvatarExperienceHeadRefinement.Actions.SetEquippedStaticFacialAnimation
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagDynamicHeadsMigration = AvatarExperienceFlags.FFlagDynamicHeadsMigration
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlags.FFlagHeadRefinementFacialAnimationToggle
local Constants = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Constants
local AssetTypeToAssetCategory = Constants.AssetTypeToAssetCategory
local AssetCategoryToAssetTypes = Constants.AssetCategoryToAssetTypes
local UpdateAvatarEquips = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAvatarEquips)
local ToggleEquipAsset = require(Modules.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset)
local EquipOutfit = require(Modules.AvatarExperience.AvatarEditor.Actions.EquipOutfit)
local UnequipOutfit = require(Modules.AvatarExperience.AvatarEditor.Actions.UnequipOutfit)
local BatchUnequipByAssetType = require(Modules.AvatarExperience.AvatarEditor.Actions.BatchUnequipByAssetType)
local ReceivedAvatarData = require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData)
local NormalizeAvatar = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local Constants3 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local LayeredClothingSortUtils = require(Modules.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils)
local LayeredMakeupSortUtils = require(Modules.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils)
local AssetMetadata = require(Modules.AvatarExperience.Common.Models.AssetMetadata)
local RemoveLayeredClothing = require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing)
local RemoveMakeup = require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveMakeup)
local SetOrder = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder)
local SetAccessoryAdjustments = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments)

require(Modules.AvatarExperience.Common.Types)

local HeadShape = AvatarExperienceHeadRefinement.Enums.HeadShape
local HeadShapeProperties = AvatarExperienceHeadRefinement.Enums.HeadShapeProperties
local GetFFlagAXEnableBatchUnequips = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableBatchUnequips)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local isMakeupAssetType = AvatarExperienceCommon.Utils.isMakeupAssetType
local CharacterHistoryStateChangeButtonActivated = AvatarExperienceCommon.State.Actions.CharacterHistoryStateChangeButtonActivated
local PurchaseItemsSuccess = AvatarExperienceCatalog.State.Actions.PurchaseItemsSuccess
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = AvatarExperienceCommon.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAX_MAKEUP_LAYERS = AvatarExperienceCommon.Constants.MAX_MAKEUP_LAYERS
local MAKEUP_LOOK_ASSET_TYPES = AvatarExperienceCommon.Constants.MAKEUP_LOOK_ASSET_TYPES
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local GetFFlagEnableNewCustomizeBundleEquip = require(Modules.AvatarExperience.Flags.GetFFlagEnableNewCustomizeBundleEquip)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXMISSaveWearFix = AvatarExperienceFlags.FFlagAXMISSaveWearFix
local v46 = game:DefineFastFlag("AXRefactorToggleEquipAsset3", false)
local FFlagAXModeratedItemsFlow = AvatarExperienceFlags.FFlagAXModeratedItemsFlow
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlags.FFlagParseHeadShapeFromAPIResponse
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local FFlagAXSkipEmotesInAvatarData = AvatarExperienceFlags.FFlagAXSkipEmotesInAvatarData
local FFlagAXBlockMakeupEquipR6 = AvatarExperienceFlags.FFlagAXBlockMakeupEquipR6

local function replaceOutfitParts(p1, p2) -- line: 99
	-- upvalues: GetFFlagEnableNewCustomizeBundleEquip (copy), Constants2 (copy), Cryo (copy)
	if GetFFlagEnableNewCustomizeBundleEquip() then
		if p2[Constants2.AssetTypeIdStrings.Head] or p2[Constants2.AssetTypeIdStrings.DynamicHead] then
			local t1 = {
				[Constants2.AssetTypeIdStrings.Head] = {},
				[Constants2.AssetTypeIdStrings.DynamicHead] = {}
			}

			for v59, _ in Constants2.DynamicHeadAssetTypes do
				t1[v59] = {}
			end

			p2 = Cryo.Dictionary.join(t1, p2)
		end

		return (Cryo.Dictionary.join(p1, p2))
	end

	return Cryo.Dictionary.join(p1, p2)
end
local function toggleSingleAsset(p3, t2: {[any]: any}, t3: {[any]: any}?) -- line: 161
	-- upvalues: Constants2 (copy), Cryo (copy), AssetMetadata (copy), FFlagAXCustomizeMakeupSupport (copy), LayeredMakeupSortUtils (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), MAX_MAKEUP_LAYERS (copy), LayeredClothingSortUtils (copy), mutedError (copy), Constants3 (copy), AssetTypeToAssetCategory (copy), AssetCategoryToAssetTypes (copy), HeadShapeProperties (copy), HeadShape (copy)
	local v64 = p3 or {}

	if t2.assetTypeId == Constants2.AssetTypeIdStrings.EmoteAnimation then
		return v64
	end

	local v65 = v64[t2.assetTypeId]
	local assetId = t2.assetId

	if v65 and v65[assetId] then
		local v67 = v64[t2.assetTypeId] or {}

		return Cryo.Dictionary.join(v64, {
			[t2.assetTypeId] = Cryo.Dictionary.join(v67, {
				[t2.assetId] = Cryo.None
			})
		})
	end

	local v68 = AssetMetadata.getDefaultMetadata(t2.assetTypeId)

	if t2.overrideOrder then
		v68.order = t2.overrideOrder

		local v69 = if not FFlagAXCustomizeMakeupSupport then nil else LayeredMakeupSortUtils.getSortedEquippedLayeredMakeup(v64)

		if FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[t2.assetTypeId] and v69 and #v69 == MAX_MAKEUP_LAYERS then
			local v70 = v69[#v69]

			v64 = Cryo.Dictionary.join(v64, {
				[v70.typeId] = Cryo.Dictionary.join(v64[v70.typeId] or {}, {
					[v70.id] = Cryo.None
				})
			})
		end
	elseif v68.isLayered and (not FFlagAXCustomizeMakeupSupport or Constants2.AssetTypeIdToAccessoryTypeEnum[t2.assetTypeId]) then
		local v71 = LayeredClothingSortUtils.getSortedEquippedLCIfNoDefault(v64)

		if v71 then
			local t4 = {
				id = t2.assetId,
				typeId = t2.assetTypeId
			}
			local v73, _ = LayeredClothingSortUtils.getTableAndOrderAfterEquippingIntoSort(v71, t4)

			for v75, v76 in v73 do
				if v76.id ~= t2.assetId then
					if not v64[v76.typeId] then
						mutedError(`EquippedAssets.lua missing asset typeId post sort ID:{ v76.id } typeId: { v76.typeId }`)
					else
						v64 = Cryo.Dictionary.join(v64, {
							[v76.typeId] = Cryo.Dictionary.join(v64[v76.typeId], {
								[v76.id] = Cryo.Dictionary.join(v64[v76.typeId][v76.id], {
									order = #v73 - v75
								})
							})
						})
					end
				else
					v68.order = #v73 - v75
				end
			end
		end
	elseif FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[t2.assetTypeId] then
		local v77 = LayeredMakeupSortUtils.getSortedEquippedLayeredMakeup(v64)

		if v77 then
			local t5 = {
				id = t2.assetId,
				typeId = t2.assetTypeId
			}
			local v79, _ = LayeredMakeupSortUtils.getTableAndOrderAfterEquippingIntoSort(v77, t5)

			for v81, v82 in v79 do
				if v82.id ~= t2.assetId then
					local v83 = v64[v82.typeId] or {}
					local v84 = v83[v82.id] or {}

					v64 = Cryo.Dictionary.join(v64, {
						[v82.typeId] = Cryo.Dictionary.join(v83, {
							[v82.id] = Cryo.Dictionary.join(v84, {
								order = #v79 - v81
							})
						})
					})
				else
					v68.order = math.min(#v79 - v81, MAX_MAKEUP_LAYERS - 1)
				end
			end

			if #v77 > MAX_MAKEUP_LAYERS then
				for i = MAX_MAKEUP_LAYERS + 1, #v77 do
					v64 = Cryo.Dictionary.join(v64, {
						[v77[i].typeId] = Cryo.Dictionary.join(v64[v77[i].typeId] or {}, {
							[v77[i].id] = Cryo.None
						})
					})
				end
			end

			return Cryo.Dictionary.join(v64, {
				[t2.assetTypeId] = Cryo.Dictionary.join(v64[t2.assetTypeId] or {}, {
					[t2.assetId] = v68
				})
			})
		end
	elseif t2.overrideAdjustments then
		v68 = Cryo.Dictionary.join(v68, t2.overrideAdjustments)
	end

	local t6 = {
		[t2.assetId] = v68
	}
	local v87 = v64[t2.assetTypeId] or {}

	if t2.assetTypeId == Constants2.AssetTypeIdStrings.Hat and (not t3 or not t3.ignoreAccessoryLimits) then
		if #Cryo.Dictionary.keys(v87) >= Constants3.MaxHats then
			return v64
		end

		return Cryo.Dictionary.join(v64, {
			[t2.assetTypeId] = Cryo.Dictionary.join(v87, t6)
		})
	end

	local v88 = AssetTypeToAssetCategory[t2.assetTypeId]

	if v88 then
		for _, v90 in AssetCategoryToAssetTypes[v88] do
			if v64[v90] and next(v64[v90]) then
				v64 = Cryo.Dictionary.join(v64, {
					[v90] = {}
				})
			end
		end
	end

	if t2.assetTypeId == Constants2.AssetTypeIdStrings.Head then
		for v91, _ in Constants2.DynamicHeadAssetTypes do
			v64 = Cryo.Dictionary.join(v64, {
				[v91] = {}
			})
		end
	end

	if t2.assetTypeId == Constants2.AssetTypeIdStrings.DynamicHead then
		v64 = Cryo.Dictionary.join(v64, {
			[Constants2.AssetTypeIdStrings.Head] = {}
		})
	end

	if t2.assetId and tostring(t2.assetId) == tostring(HeadShapeProperties[HeadShape.Default].assetId) then
		return (Cryo.Dictionary.join(v64, {
			[Constants2.AssetTypeIdStrings.Head] = {},
			[Constants2.AssetTypeIdStrings.DynamicHead] = {}
		}))
	end

	local v93 = Constants2.BypassAccessoryLimitsAccessoryAssetTypeIdStrings[t2.assetTypeId]

	if FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[t2.assetTypeId] then
		return Cryo.Dictionary.join(v64, {
			[t2.assetTypeId] = Cryo.Dictionary.join(v87, t6)
		})
	end

	return Cryo.Dictionary.join(v64, {
		[t2.assetTypeId] = if not t3 or (not t3.ignoreAccessoryLimits or not v93) then t6 else Cryo.Dictionary.join(v87, t6)
	})
end

return Rodux.createReducer(nil, {
	[ReceivedAvatarData.name] = function(p4, p5) -- line: 387
		-- upvalues: FFlagAXSkipEmotesInAvatarData (copy), Constants2 (copy), AssetMetadata (copy), FFlagAXModeratedItemsFlow (copy), Cryo (copy)
		local assets = p5.avatarData.assets

		if assets == nil then
			return p4
		end

		local t7 = {}

		for _, v99 in assets do
			local str = tostring(v99.assetType.id)
			local str2 = tostring(v99.id)

			if not FFlagAXSkipEmotesInAvatarData or str ~= Constants2.AssetTypeIdStrings.EmoteAnimation then
				local v102 = t7[str] or {}

				v102[str2] = AssetMetadata.fromMetadata(v99.meta, str)

				if FFlagAXModeratedItemsFlow then
					v102[str2].availabilityStatus = v99.availabilityStatus
				end

				t7[str] = v102
			end
		end

		local v103 = t7[Constants2.AssetTypeIdStrings.DynamicHead] or {}
		local v104 = t7[Constants2.AssetTypeIdStrings.Face] or {}

		if not Cryo.isEmpty(v103) and not Cryo.isEmpty(v104) then
			t7[Constants2.AssetTypeIdStrings.Face] = {}
		end

		return t7
	end,
	[ToggleEquipAsset.name] = function(p6, p7) -- line: 429
		-- upvalues: v46 (copy), toggleSingleAsset (copy), Constants2 (copy), Cryo (copy), AssetMetadata (copy), FFlagAXCustomizeMakeupSupport (copy), LayeredMakeupSortUtils (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), MAX_MAKEUP_LAYERS (copy), LayeredClothingSortUtils (copy), mutedError (copy), Constants3 (copy), AssetTypeToAssetCategory (copy), AssetCategoryToAssetTypes (copy), HeadShapeProperties (copy), HeadShape (copy)
		if v46 then
			return toggleSingleAsset(p6, p7)
		end

		local v107 = p6 or {}

		if p7.assetTypeId == Constants2.AssetTypeIdStrings.EmoteAnimation then
			return v107
		end

		local v108 = v107[p7.assetTypeId]
		local assetId = p7.assetId

		if v108 and v108[assetId] then
			local v110 = v107[p7.assetTypeId] or {}

			return Cryo.Dictionary.join(v107, {
				[p7.assetTypeId] = Cryo.Dictionary.join(v110, {
					[p7.assetId] = Cryo.None
				})
			})
		end

		local v111 = AssetMetadata.getDefaultMetadata(p7.assetTypeId)

		if p7.overrideOrder then
			v111.order = p7.overrideOrder

			local v112 = if not FFlagAXCustomizeMakeupSupport then nil else LayeredMakeupSortUtils.getSortedEquippedLayeredMakeup(v107)

			if FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p7.assetTypeId] and v112 and #v112 == MAX_MAKEUP_LAYERS then
				local v113 = v112[#v112]

				v107 = Cryo.Dictionary.join(v107, {
					[v113.typeId] = Cryo.Dictionary.join(v107[v113.typeId] or {}, {
						[v113.id] = Cryo.None
					})
				})
			end
		elseif v111.isLayered and (not FFlagAXCustomizeMakeupSupport or Constants2.AssetTypeIdToAccessoryTypeEnum[p7.assetTypeId]) then
			local v114 = LayeredClothingSortUtils.getSortedEquippedLCIfNoDefault(v107)

			if v114 then
				local t8 = {
					id = p7.assetId,
					typeId = p7.assetTypeId
				}
				local v116, _ = LayeredClothingSortUtils.getTableAndOrderAfterEquippingIntoSort(v114, t8)

				for v118, v119 in v116 do
					if v119.id ~= p7.assetId then
						if not v107[v119.typeId] then
							mutedError(`EquippedAssets.lua missing asset typeId post sort ID:{ v119.id } typeId: { v119.typeId }`)
						else
							v107 = Cryo.Dictionary.join(v107, {
								[v119.typeId] = Cryo.Dictionary.join(v107[v119.typeId], {
									[v119.id] = Cryo.Dictionary.join(v107[v119.typeId][v119.id], {
										order = #v116 - v118
									})
								})
							})
						end
					else
						v111.order = #v116 - v118
					end
				end
			end
		elseif FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p7.assetTypeId] then
			local v120 = LayeredMakeupSortUtils.getSortedEquippedLayeredMakeup(v107)

			if v120 then
				local t9 = {
					id = p7.assetId,
					typeId = p7.assetTypeId
				}
				local v122, _ = LayeredMakeupSortUtils.getTableAndOrderAfterEquippingIntoSort(v120, t9)

				for v124, v125 in v122 do
					if v125.id ~= p7.assetId then
						local v126 = v107[v125.typeId] or {}
						local v127 = v126[v125.id] or {}

						v107 = Cryo.Dictionary.join(v107, {
							[v125.typeId] = Cryo.Dictionary.join(v126, {
								[v125.id] = Cryo.Dictionary.join(v127, {
									order = #v122 - v124
								})
							})
						})
					else
						v111.order = math.min(#v122 - v124, MAX_MAKEUP_LAYERS - 1)
					end
				end

				if #v120 > MAX_MAKEUP_LAYERS then
					for i = MAX_MAKEUP_LAYERS + 1, #v120 do
						v107 = Cryo.Dictionary.join(v107, {
							[v120[i].typeId] = Cryo.Dictionary.join(v107[v120[i].typeId] or {}, {
								[v120[i].id] = Cryo.None
							})
						})
					end
				end

				return Cryo.Dictionary.join(v107, {
					[p7.assetTypeId] = Cryo.Dictionary.join(v107[p7.assetTypeId] or {}, {
						[p7.assetId] = v111
					})
				})
			end
		elseif p7.overrideAdjustments then
			v111 = Cryo.Dictionary.join(v111, p7.overrideAdjustments)
		end

		local t10 = {
			[p7.assetId] = v111
		}
		local v130 = v107[p7.assetTypeId] or {}

		if p7.assetTypeId == Constants2.AssetTypeIdStrings.Hat then
			if #Cryo.Dictionary.keys(v130) >= Constants3.MaxHats then
				return v107
			end

			return Cryo.Dictionary.join(v107, {
				[p7.assetTypeId] = Cryo.Dictionary.join(v130, t10)
			})
		end

		local v131 = AssetTypeToAssetCategory[p7.assetTypeId]

		if v131 then
			for _, v133 in AssetCategoryToAssetTypes[v131] do
				if v107[v133] and next(v107[v133]) then
					v107 = Cryo.Dictionary.join(v107, {
						[v133] = {}
					})
				end
			end
		end

		if p7.assetTypeId == Constants2.AssetTypeIdStrings.Head then
			for v134, _ in Constants2.DynamicHeadAssetTypes do
				v107 = Cryo.Dictionary.join(v107, {
					[v134] = {}
				})
			end
		end

		if p7.assetTypeId == Constants2.AssetTypeIdStrings.DynamicHead then
			v107 = Cryo.Dictionary.join(v107, {
				[Constants2.AssetTypeIdStrings.Head] = {}
			})
		end

		if p7.assetId and tostring(p7.assetId) == tostring(HeadShapeProperties[HeadShape.Default].assetId) then
			return (Cryo.Dictionary.join(v107, {
				[Constants2.AssetTypeIdStrings.Head] = {},
				[Constants2.AssetTypeIdStrings.DynamicHead] = {}
			}))
		end

		if FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p7.assetTypeId] then
			return Cryo.Dictionary.join(v107, {
				[p7.assetTypeId] = Cryo.Dictionary.join(v130, t10)
			})
		end

		return Cryo.Dictionary.join(v107, {
			[p7.assetTypeId] = t10
		})
	end,
	[UpdateAvatarEquips.name] = function(p8, p9) -- line: 643
		-- upvalues: Cryo (copy), toggleSingleAsset (copy)
		local assets = p9.assets

		if assets and not Cryo.isEmpty(assets) then
			for _, v140 in assets do
				p8 = toggleSingleAsset(p8, v140, {
					ignoreAccessoryLimits = true
				})
			end
		end

		return p8
	end,
	[EquipOutfit.name] = function(p10, p11) -- line: 658
		-- upvalues: replaceOutfitParts (copy)
		local v143 = p10 or {}

		if p11.fullReset then
			return p11.assets
		end

		return replaceOutfitParts(v143, p11.assets)
	end,
	[UnequipOutfit.name] = function(p12, p13) -- line: 670
		-- upvalues: Cryo (copy)
		local v146 = p12 or {}

		for v147, v148 in p13.assetTypeIdToAssetIdToAssetMetadataModel do
			for v149, _ in v148 do
				v146 = Cryo.Dictionary.join(v146, {
					[v147] = Cryo.Dictionary.join(v146[v147], {
						[v149] = Cryo.None
					})
				})
			end
		end

		return v146
	end,
	[RemoveLayeredClothing.name] = function(p14, p15) -- line: 688
		-- upvalues: Constants2 (copy)
		local v153 = p14 or {}
		local v154 = false
		local t11 = {}

		for k, v in pairs(v153) do
			local t12 = {}
			local v159 = false

			for v160, v161 in v do
				local v162 = k == Constants2.AssetTypeIdStrings.HairAccessory

				if v161.isLayered and (not v162 or p15.hasLayeredHair) then
					v159 = true
				else
					t12[v160] = v161
				end
			end

			if v159 then
				v154 = true
				t11[k] = t12
			else
				t11[k] = v
			end
		end

		if v154 then
			return t11
		end

		return v153
	end,
	[SetOrder.name] = function(p16, p17) -- line: 722
		-- upvalues: Cryo (copy)
		for v165, v166 in p17.assetIdToOrderAndAssetTypeId do
			local assetTypeId = v166.assetTypeId
			local order = v166.order
			local v169 = p16[assetTypeId]
			local v170 = v169[v165]

			p16 = Cryo.Dictionary.join(p16, {
				[assetTypeId] = Cryo.Dictionary.join(v169, {
					[v165] = Cryo.Dictionary.join(v170, {
						order = order
					})
				})
			})
		end

		return p16
	end,
	[SetAccessoryAdjustments.name] = function(p18, p19) -- line: 746
		-- upvalues: Cryo (copy)
		for v173, v174 in p18 do
			for v175, v176 in v174 do
				if v175 == p19.itemId then
					return Cryo.Dictionary.join(p18, {
						[v173] = Cryo.Dictionary.join(v174, {
							[v175] = Cryo.Dictionary.join(v176, {
								position = p19.position,
								rotation = p19.rotation,
								scale = p19.scale
							})
						})
					})
				end
			end
		end

		return p18
	end,
	[BatchUnequipByAssetType.name] = function(p20, p21) -- line: 767
		-- upvalues: GetFFlagAXEnableBatchUnequips (copy), Constants2 (copy), Cryo (copy)
		if not GetFFlagAXEnableBatchUnequips() then
			return p20
		end

		local v179 = p20 or {}

		for _, v181 in p21.assetTypeIds do
			if v181 == Constants2.AssetTypeIdStrings.DynamicHead then
				for v182, _ in Constants2.DynamicHeadAssetTypes do
					v179 = Cryo.Dictionary.join(v179, {
						[v182] = Cryo.None
					})
				end
			end

			v179 = Cryo.Dictionary.join(v179, {
				[v181] = Cryo.None
			})
		end

		return v179
	end,
	[CharacterHistoryStateChangeButtonActivated.name] = function(p22, p23) -- line: 796
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		if FFlagAXRootSlotBasedEditorFlag and (p23.equipped and p23.equipped.EquippedAssets) then
			return table.clone(p23.equipped.EquippedAssets)
		end

		return p22
	end,
	[SetEquippedDynamicHeadShape.name] = if not FFlagDynamicHeadsMigration then nil else function(p24, p25) -- line: 808
		-- upvalues: Constants2 (copy), Cryo (copy)
		local v188 = p24[Constants2.AssetTypeIdStrings.DynamicHead]

		if not v188 then
			return p24
		end

		local t13 = {}
		local v190 = false

		for v191, v192 in v188 do
			if v192.supportsHeadShapes ~= false then
				t13[v191] = Cryo.Dictionary.join(v192, {
					headShape = p25.headShapeName
				})
				v190 = true
			else
				t13[v191] = v192
			end
		end

		if not v190 then
			return p24
		end

		return Cryo.Dictionary.join(p24, {
			[Constants2.AssetTypeIdStrings.DynamicHead] = t13
		})
	end,
	[SetEquippedStaticFacialAnimation.name] = if not FFlagHeadRefinementFacialAnimationToggle then nil else function(p26, p27) -- line: 848
		-- upvalues: Constants2 (copy), Cryo (copy)
		local v195 = p26[Constants2.AssetTypeIdStrings.DynamicHead]

		if not v195 then
			return p26
		end

		local t14 = {}

		for v197, v198 in v195 do
			t14[v197] = Cryo.Dictionary.join(v198, {
				staticFacialAnimation = p27.isEnabled
			})
		end

		return Cryo.Dictionary.join(p26, {
			[Constants2.AssetTypeIdStrings.DynamicHead] = t14
		})
	end,
	[PurchaseItemsSuccess.name] = if not FFlagAXMISEnableMultiShopping then nil else function(p28, p29) -- line: 868
		-- upvalues: MAKEUP_LOOK_ASSET_TYPES (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), Cryo (copy), toggleSingleAsset (copy), FFlagAXMISSaveWearFix (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy)
		local v201 = p28 or {}

		if p29.equippableAssets and #p29.equippableAssets > 0 then
			if p29.shouldClearEquippedMakeup then
				for v202, _ in MAKEUP_LOOK_ASSET_TYPES do
					v201[v202] = {}
				end
			end

			if p29.replaceAllEquippedAssets then
				v201 = {}
			end

			for _, v205 in p29.equippableAssets do
				local v206 = v201[v205.assetTypeId]
				local assetId = v205.assetId

				if (not v206 or not v206[assetId]) and tostring(v205.assetTypeId) ~= tostring(Enum.AvatarAssetType.EmoteAnimation.Value) then
					local t15 = nil

					if FFlagParseHeadShapeFromAPIResponse and v205.headShape ~= nil then
						t15 = {
							headShape = v205.headShape
						}
					end

					local t16 = nil

					if FFlagHeadRefinementFacialAnimationToggle then
						local staticFacialAnimation = v205.staticFacialAnimation

						if staticFacialAnimation ~= nil then
							t16 = {
								staticFacialAnimation = staticFacialAnimation
							}
						end
					end

					local v211 = if not t15 and not t16 then nil else Cryo.Dictionary.join(t15 or {}, t16 or {})

					v201 = toggleSingleAsset(v201, {
						assetId = v205.assetId,
						assetTypeId = v205.assetTypeId,
						overrideOrder = v205.order,
						overrideAdjustments = v211
					}, {
						ignoreAccessoryLimits = true
					})
				end
			end

			if FFlagAXMISSaveWearFix and p29.makeupAssetsOnHumanoid then
				for v212, _ in ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
					if v201[v212] then
						for v214, _ in v201[v212] do
							if p29.makeupAssetsOnHumanoid[v214] ~= nil then
								v201[v212][v214].order = p29.makeupAssetsOnHumanoid[v214]
							else
								v201[v212][v214] = nil
							end
						end
					end
				end
			end
		end

		return v201
	end,
	[NormalizeAvatar.name] = FFlagAXCustomizeMakeupSupport and function(p30, _) -- line: 933
		-- upvalues: FFlagAXBlockMakeupEquipR6 (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), Cryo (copy)
		local v218 = p30 or {}
		local t17 = {}

		for v220, _ in if not FFlagAXBlockMakeupEquipR6 then pairs(ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE) else ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE do
			local v222 = v218[v220]

			if v222 then
				for v223, v224 in v222 do
					table.insert(t17, {
						assetId = v223,
						assetTypeId = v220,
						metadata = v224
					})
				end
			end
		end

		table.sort(t17, function(p32, p33) -- line: 960
			return p32.metadata.order ~= nil and (p33.metadata.order == nil or p32.metadata.order < p33.metadata.order)
		end)

		for v225, v226 in t17 do
			local assetTypeId = v226.assetTypeId
			local assetId = v226.assetId
			local v229 = v218[assetTypeId] and v218[assetTypeId][assetId] or v226.metadata
			local v230 = Cryo.Dictionary.join(v229, {
				order = v225 - 1
			})

			v218 = Cryo.Dictionary.join(v218, {
				[assetTypeId] = Cryo.Dictionary.join(v218[assetTypeId] or {}, {
					[assetId] = v230
				})
			})
		end

		return v218
	end or nil,
	[RemoveMakeup.name] = FFlagAXBlockMakeupEquipR6 and function(p34, _) -- line: 986
		-- upvalues: isMakeupAssetType (copy), Cryo (copy)
		local v233 = p34 or {}

		for v234, _ in v233 do
			if isMakeupAssetType(v234) then
				v233 = Cryo.Dictionary.join(v233, {
					[v234] = Cryo.None
				})
			end
		end

		return v233
	end or nil
})
