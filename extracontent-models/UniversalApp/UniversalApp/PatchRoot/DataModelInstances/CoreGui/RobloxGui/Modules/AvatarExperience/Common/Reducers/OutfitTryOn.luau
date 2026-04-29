local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)
local Cryo = require(CorePackages.Packages.Cryo)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local AvatarExperienceHeadRefinement = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceCatalog = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarExperienceRodux = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local tutils = require(CorePackages.Packages.tutils)
local TryOnLooksOutfit = require(Modules.AvatarExperience.Common.Actions.TryOnLooksOutfit)
local ToggleTryOn = require(Modules.AvatarExperience.Common.Actions.ToggleTryOn)
local TryOnColorUpdated = require(Modules.AvatarExperience.Common.Actions.TryOnColorUpdated)
local SetEquippedInTryOnManager = require(Modules.AvatarExperience.Common.Actions.SetEquippedInTryOnManager)
local SetSelectedTimedOption = require(Modules.AvatarExperience.Common.Actions.SetSelectedTimedOption)
local RemoveUnselectedItemsFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveUnselectedItemsFromTryOn)
local RemoveFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveFromTryOn)
local RemoveLookItemsFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveLookItemsFromTryOn)
local ReceivedBundleInfoForTryOn = require(Modules.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn)
local ClearTryOns = require(Modules.AvatarExperience.Common.Actions.ClearTryOns)
local SetOrderForTryOns = require(Modules.AvatarExperience.Common.Actions.SetOrderForTryOns)
local SetAdjustableTryOnIds = require(Modules.AvatarExperience.Common.Actions.SetAdjustableTryOnIds)
local AddSelectedBundleInfo = require(Modules.AvatarExperience.Common.Actions.AddSelectedBundleInfo)
local SetOutfitTryOns = require(Modules.AvatarExperience.Common.Actions.SetOutfitTryOns)
local SetAccessoryAdjustments = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetAccessoryAdjustments)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local ReducerUtils = AvatarExperienceRodux.Utils.ReducerUtils

require(Modules.AvatarExperience.Common.Types)

local RemoveLook = require(Modules.AvatarExperience.Common.Actions.RemoveLook)
local RemoveLookFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveLookFromTryOn)
local TryOnClassicHeadShape = AvatarExperienceHeadRefinement.Actions.TryOnClassicHeadShape
local NavigatedToNonTryOnPage = require(Modules.AvatarExperience.Common.Actions.NavigatedToNonTryOnPage)
local NavigatedToTryOnPage = require(Modules.AvatarExperience.Common.Actions.NavigatedToTryOnPage)
local DefaultTryOnBodyColorsToggled = require(Modules.AvatarExperience.Common.Actions.DefaultTryOnBodyColorsToggled)
local findItemInTryOnItems = AvatarExperienceCommon.Utils.findItemInTryOnItems
local getTryOnItemReducerKey = AvatarExperienceCommon.Utils.getTryOnItemReducerKey
local getFilteredTryOnItems = AvatarExperienceCatalog.Utils.TryOns.getFilteredTryOnItems
local removeMakeupAssetsFromTryOnsIfOverLimit = AvatarExperienceCatalog.Utils.TryOns.removeMakeupAssetsFromTryOnsIfOverLimit
local SetLastToggledLookType = AvatarExperienceCatalog.State.Actions.SetLastToggledLookType
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = AvatarExperienceCommon.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local LAYERED_MAKEUP_ORDER = AvatarExperienceCommon.Constants.LAYERED_MAKEUP_ORDER
local MAKEUP_LOOK_ASSET_TYPES = AvatarExperienceCommon.Constants.MAKEUP_LOOK_ASSET_TYPES
local LOOK_TYPE = AvatarExperienceCommon.Constants.LOOK_TYPE
local Constants2 = AvatarExperienceCommon.Constants
local ItemTypeEnum = AvatarExperienceCommon.Enums.ItemTypeEnum
local ASSET_TYPE_NAME_TO_ID_STRING = Constants2.ASSET_TYPE_NAME_TO_ID_STRING
local BUNDLE_TYPE_ID_STRINGS = Constants2.BUNDLE_TYPE_ID_STRINGS
local BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = Constants2.BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND
local LAYERED_CLOTHING_ORDER = Constants2.LAYERED_CLOTHING_ORDER
local LAYERED_ASSET_TYPES = Constants2.LAYERED_ASSET_TYPES
local ASSET_TYPE_TO_ACCESSORY_TYPE = Constants2.ASSET_TYPE_TO_ACCESSORY_TYPE
local CharacterHistoryStateChangeButtonActivated = AvatarExperienceCommon.State.Actions.CharacterHistoryStateChangeButtonActivated
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlags.FFlagParseHeadShapeFromAPIResponse
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlags.FFlagHeadRefinementFacialAnimationToggle
local FFlagDynamicHeadsMigration = AvatarExperienceFlags.FFlagDynamicHeadsMigration
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local n1 = 0

local function formatItem(p1, b1: boolean) -- line: 153
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), FFlagDynamicHeadsMigration (copy), ItemTypeEnum (copy), BUNDLE_TYPE_ID_STRINGS (copy), ASSET_TYPE_NAME_TO_ID_STRING (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagAXDurablesForMIS (copy), ASSET_TYPE_TO_ACCESSORY_TYPE (copy), LAYERED_CLOTHING_ORDER (copy), LAYERED_ASSET_TYPES (copy), Cryo (copy), FFlagAXCustomizeMakeupSupport (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), LAYERED_MAKEUP_ORDER (copy), n1 (ref)
	local v74 = not not p1.receivedBundleInfo
	local bundleInfo = p1.bundleInfo

	if FFlagAXMISEnableMultiShopping and (p1.bundleItems and not v74) then
		bundleInfo = {}

		for _, v77 in p1.bundleItems do
			if FFlagDynamicHeadsMigration and v77.type == ItemTypeEnum.Asset then
				local v78 = v77.assetType or (p1.itemSubType ~= BUNDLE_TYPE_ID_STRINGS.DynamicHead or ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead)

				if v78 then
					local t1 = {
						assetType = v78
					}

					if FFlagParseHeadShapeFromAPIResponse and v77.meta and v77.meta.headShape ~= nil then
						t1.headShape = v77.meta.headShape
					end

					if FFlagHeadRefinementFacialAnimationToggle and v77.meta and v77.meta.staticFacialAnimation ~= nil then
						t1.staticFacialAnimation = v77.meta.staticFacialAnimation
					end

					bundleInfo[v77.id] = t1
				end
			elseif v77.type == ItemTypeEnum.Asset and v77.assetType then
				local t2 = {
					assetType = v77.assetType
				}

				if FFlagParseHeadShapeFromAPIResponse and v77.meta and v77.meta.headShape ~= nil then
					t2.headShape = v77.meta.headShape
				end

				if FFlagHeadRefinementFacialAnimationToggle and v77.meta and v77.meta.staticFacialAnimation ~= nil then
					t2.staticFacialAnimation = v77.meta.staticFacialAnimation
				end

				bundleInfo[v77.id] = t2
			end
		end

		v74 = true
	end

	local t3 = {
		version = "1",
		itemId = p1.itemId,
		itemType = p1.itemType,
		itemSubType = p1.itemSubType,
		selectedInTryOnManager = p1.selectedInTryOnManager,
		isUnequipped = b1,
		receivedBundleInfo = v74,
		bundleInfo = if not FFlagAXMISEnableMultiShopping then p1.bundleInfo else bundleInfo,
		widgetInfo = p1.widgetInfo,
		isRecolorable = p1.isRecolorable,
		selectedTimedOptionIndex = if not FFlagAXDurablesForMIS then nil else p1.selectedTimedOptionIndex
	}

	if ASSET_TYPE_TO_ACCESSORY_TYPE[p1.itemSubType] then
		local t4 = {
			order = p1.overrideOrder or LAYERED_CLOTHING_ORDER[p1.itemSubType],
			isLayered = LAYERED_ASSET_TYPES[p1.itemSubType] ~= nil
		}

		t3 = Cryo.Dictionary.join(t3, t4)
	elseif FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1.itemSubType] then
		local t5 = {
			order = p1.overrideOrder or LAYERED_MAKEUP_ORDER[p1.itemSubType],
			isLayered = true
		}

		t3 = Cryo.Dictionary.join(t3, t5)
	end

	if not b1 then
		t3.itemRecency = n1
		n1 += 1
	end

	return t3
end
local function formatItemFromLookOutfit(p2, p3, s1: string?) -- line: 253
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (copy), LAYERED_CLOTHING_ORDER (copy), LAYERED_ASSET_TYPES (copy), Cryo (copy), FFlagAXCustomizeMakeupSupport (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), LAYERED_MAKEUP_ORDER (copy), LOOK_TYPE (copy), FFlagAXCatalogMakeupSupport (copy), n1 (ref)
	local t6 = {
		version = "1",
		itemId = p2.itemId,
		itemType = p2.itemType,
		itemSubType = p2.itemSubType,
		selectedInTryOnManager = p2.isNotSelectable ~= true,
		isUnequipped = false,
		receivedBundleInfo = false,
		lookId = s1
	}

	if ASSET_TYPE_TO_ACCESSORY_TYPE[p2.itemSubType] then
		local t7 = {
			order = p2.order or LAYERED_CLOTHING_ORDER[p2.itemSubType],
			isLayered = LAYERED_ASSET_TYPES[p2.itemSubType] ~= nil
		}

		t6 = Cryo.Dictionary.join(t6, t7)
	elseif FFlagAXCustomizeMakeupSupport and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p2.itemSubType] then
		local t8 = {
			order = p2.order or LAYERED_MAKEUP_ORDER[p2.itemSubType],
			isLayered = true
		}

		t6 = Cryo.Dictionary.join(t6, t8)
	end

	t6.itemRecency = if p3 ~= LOOK_TYPE.Avatar and (not FFlagAXCatalogMakeupSupport or p3 ~= LOOK_TYPE.Makeup) then n1 else p2.tryOnItemOrder
	n1 += 1

	return t6
end
local function formatBundleFromLookOutfit(p4, s2: string?) -- line: 292
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), LAYERED_CLOTHING_ORDER (copy), FFlagAXCustomizeMakeupSupport (copy), LAYERED_MAKEUP_ORDER (copy), FFlagParseHeadShapeFromAPIResponse (copy), n1 (ref)
	local t9 = {
		version = "1",
		selectedInTryOnManager = p4.isNotSelectable ~= true,
		isUnequipped = false,
		receivedBundleInfo = false,
		itemType = p4.itemType,
		itemId = p4.itemId,
		itemSubType = if not FFlagAXMISEnableMultiShopping then nil else p4.itemSubType,
		lookId = s2
	}
	local t10 = {}

	for _, v95 in p4.items do
		t10[v95.itemId] = {
			assetType = v95.itemSubType,
			order = LAYERED_CLOTHING_ORDER[v95.itemSubType] or if not FFlagAXCustomizeMakeupSupport then nil else LAYERED_MAKEUP_ORDER[v95.itemSubType],
			headShape = if not FFlagParseHeadShapeFromAPIResponse then nil else v95.headShape
		}
	end

	t9.bundleInfo = t10
	t9.itemRecency = p4.tryOnItemOrder or n1
	n1 += 1

	return t9
end
local function removeItem(p5, p6, t11: {[any]: any}) -- line: 324
	-- upvalues: getTryOnItemReducerKey (copy), ASSET_TYPE_NAME_TO_ID_STRING (copy), ItemTypeEnum (copy), BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND (copy), Cryo (copy)
	local v99 = getTryOnItemReducerKey(t11.itemId, t11.itemType)
	local v100 = p6[v99]

	v100.isUnequipped = true

	local v101 = t11.itemSubType == ASSET_TYPE_NAME_TO_ID_STRING.Face
	local v102 = t11.itemType == ItemTypeEnum.Bundle and BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND[t11.itemSubType] == "Body"

	return Cryo.Dictionary.join(p5, {
		TryOnItems = Cryo.Dictionary.join(p6, {
			[v99] = Cryo.None
		}),
		LastToggledItem = v100,
		LastTryOnClassicHeadShape = if not v101 then nil else Cryo.None,
		BodyColor3s = if not v102 then nil else Cryo.None,
		BodyPartColorRangeIds = if not v102 then nil else Cryo.None
	})
end
local function getTryOnItemsContainsRecolorableBody(t12: {[any]: any}) -- line: 362
	-- upvalues: BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND (copy)
	for _, v106 in t12 do
		if v106.itemType == "Bundle" and BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND[v106.itemSubType] == "Body" and v106.isRecolorable then
			return true
		end
	end

	return false
end
local function getTryOnItemsMakeupAndAvatarLookIds(t13: {[any]: any}) -- line: 375
	-- upvalues: Cryo (copy), MAKEUP_LOOK_ASSET_TYPES (copy)
	local None = Cryo.None
	local None2 = Cryo.None

	for _, v111 in t13 do
		if v111.lookId and not MAKEUP_LOOK_ASSET_TYPES[v111.itemSubType] then
			None = v111.lookId
		end

		if v111.lookId and MAKEUP_LOOK_ASSET_TYPES[v111.itemSubType] then
			None2 = v111.lookId
		end
	end

	return None, None2
end
local function reconcileAllTryOnState(t14: {[any]: any}) -- line: 392
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), getTryOnItemsMakeupAndAvatarLookIds (copy), getTryOnItemsContainsRecolorableBody (copy), Cryo (copy), tutils (copy), LOOK_TYPE (copy)
	local TryOnItems = t14.TryOnItems
	local v114 = nil
	local v115 = nil

	if FFlagAXMISEnableMultiShopping then
		v114, v115 = getTryOnItemsMakeupAndAvatarLookIds(TryOnItems)
	end

	local v116 = getTryOnItemsContainsRecolorableBody(TryOnItems)

	if FFlagAXMISEnableMultiShopping then
		v116 = v116 or v114 ~= nil
	end

	local v117 = if not v116 then Cryo.None else t14.BodyColor3s
	local v118 = if not v116 then Cryo.None else t14.BodyPartColorRangeIds
	local v119 = not not v116 and t14.DefaultTryOnBodyColorsToggled
	local v120 = if not FFlagAXMISEnableMultiShopping then nil else tutils.fieldCount(TryOnItems) == 0
	local v121 = if not FFlagAXMISEnableMultiShopping then nil else if not v120 then t14.LookType else Cryo.None
	local v122 = if not FFlagAXMISEnableMultiShopping then nil else if not v120 and v115 then LOOK_TYPE.Makeup else Cryo.None

	return Cryo.Dictionary.join(t14, {
		BodyColor3s = v117,
		BodyPartColorRangeIds = v118,
		DefaultTryOnBodyColorsToggled = v119,
		LookId = if not FFlagAXMISEnableMultiShopping then nil else v114,
		LookType = if not FFlagAXMISEnableMultiShopping then nil else v121,
		MakeupLookId = if not FFlagAXMISEnableMultiShopping then nil else v115,
		MakeupLookType = if not FFlagAXMISEnableMultiShopping then nil else v122,
		ShouldTryOnWithoutEquippedItems = if not FFlagAXMISEnableMultiShopping then nil else not v120 and t14.ShouldTryOnWithoutEquippedItems
	})
end

local v70 = if not AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser)
local t15 = {
	TryOnItems = {},
	DefaultTryOnBodyColorsToggled = false,
	LookId = nil,
	LookType = nil,
	MakeupLookId = nil,
	MakeupLookType = nil,
	LastToggledLookType = nil,
	LastTryOnClassicHeadShape = nil,
	OutfitIdMap = {},
	AdjustableTryOnIds = if not v70 then nil else {},
	ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil
}

return Rodux.createReducer(t15, {
	[TryOnColorUpdated.name] = function(t16: {[any]: any}?, p7) -- line: 451
		-- upvalues: t15 (copy)
		local v125 = table.clone(t16 or t15)

		v125.BodyColor3s = p7.colors
		v125.BodyPartColorRangeIds = p7.bodyPartColorRangeIds

		return v125
	end,
	[ToggleTryOn.name] = function(t17: {[any]: any}?, p8) -- line: 458
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), FFlagAXMISEnableMultiShopping (copy), reconcileAllTryOnState (copy), removeItem (copy), ReducerUtils (copy), formatItem (copy), getFilteredTryOnItems (copy), ItemTypeEnum (copy), ASSET_TYPE_NAME_TO_ID_STRING (copy), BUNDLE_TYPE_ID_STRINGS (copy), Cryo (copy), getTryOnItemsContainsRecolorableBody (copy), FFlagAXCatalogMakeupSupport (copy), removeMakeupAssetsFromTryOnsIfOverLimit (copy)
		local v128 = t17 or t15
		local v129 = v128.TryOnItems or {}
		local v130 = v128.LookId ~= nil
		local v131 = getTryOnItemReducerKey(p8.itemId, p8.itemType)

		if if not FFlagAXMISEnableMultiShopping then v129[v131] ~= nil and not v130 else v129[v131] ~= nil then
			if FFlagAXMISEnableMultiShopping then
				return reconcileAllTryOnState(removeItem(v128, v129, p8))
			end

			return removeItem(v128, v129, p8)
		end

		if FFlagAXMISEnableMultiShopping and p8.resetTryOnsBeforeToggleOn then
			v129 = {}
		end

		local v132 = ReducerUtils.filterTryOns(v129, p8)
		local v133 = formatItem(p8, false)

		if FFlagAXMISEnableMultiShopping then
			v132 = getFilteredTryOnItems(v129, v133)
		end

		local v134 = nil

		if v133.itemType == ItemTypeEnum.Asset and v133.itemSubType == ASSET_TYPE_NAME_TO_ID_STRING.EmoteAnimation or v133.itemType == ItemTypeEnum.Bundle and v133.itemSubType == tostring(BUNDLE_TYPE_ID_STRINGS.Animations) then
			v134 = v133
		end

		if not FFlagAXMISEnableMultiShopping and v130 then
			return Cryo.Dictionary.join(v128, {
				TryOnItems = {
					[p8.itemId] = v133
				},
				LastToggledItem = v133,
				LastAnimOrEmoteToggledItem = v134,
				LookId = Cryo.None,
				BodyColor3s = {},
				BodyPartColorRangeIds = Cryo.None,
				DefaultTryOnBodyColorsToggled = false
			})
		end

		local v135 = Cryo.Dictionary.join(v132, {
			[v131] = v133
		})
		local v136 = getTryOnItemsContainsRecolorableBody(v135)
		local v137 = if not v136 then Cryo.None else v128.BodyColor3s
		local v138 = if not v136 then Cryo.None else v128.BodyPartColorRangeIds
		local v139 = not not v136 and v128.DefaultTryOnBodyColorsToggled
		local v140 = Cryo.Dictionary.join(v128, {
			TryOnItems = v135,
			LastToggledItem = v133,
			LastAnimOrEmoteToggledItem = v134,
			BodyColor3s = v137,
			BodyPartColorRangeIds = v138,
			DefaultTryOnBodyColorsToggled = v139
		})

		if FFlagAXMISEnableMultiShopping then
			if FFlagAXCatalogMakeupSupport then
				v135 = removeMakeupAssetsFromTryOnsIfOverLimit(v135)
			end

			local v141 = Cryo.Dictionary.join(v140, {
				TryOnItems = v135,
				LastToggledItem = v133,
				LastAnimOrEmoteToggledItem = v134
			})

			return reconcileAllTryOnState(v141)
		end

		return v140
	end,
	[TryOnClassicHeadShape.name] = function(t18: {[any]: any}?, p9) -- line: 557
		-- upvalues: Cryo (copy)
		return Cryo.Dictionary.join(t18, {
			LastTryOnClassicHeadShape = if not p9.headShape then Cryo.None else p9.headShape
		})
	end,
	[TryOnLooksOutfit.name] = function(t19: {[any]: any}?, p10) -- line: 563
		-- upvalues: t15 (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), LOOK_TYPE (copy), MAKEUP_LOOK_ASSET_TYPES (copy), getTryOnItemReducerKey (copy), formatItemFromLookOutfit (copy), formatBundleFromLookOutfit (copy), Cryo (copy)
		local v146 = t19 or t15
		local t20 = {}

		if FFlagAXMISEnableMultiShopping and (FFlagAXCatalogMakeupSupport and p10.lookType == LOOK_TYPE.Makeup) then
			t20 = table.clone(v146.TryOnItems)

			for v148, v149 in t20 do
				if MAKEUP_LOOK_ASSET_TYPES[v149.itemSubType] then
					t20[v148] = nil
				end
			end
		end

		for _, v151 in p10.assetItemIdTypeAndSubtype do
			t20[getTryOnItemReducerKey(v151.itemId, v151.itemType)] = formatItemFromLookOutfit(v151, p10.lookType, if not FFlagAXMISEnableMultiShopping then nil else p10.lookId)
		end

		if p10.bundleItemIdTypeAndSubtype ~= nil then
			for _, v153 in p10.bundleItemIdTypeAndSubtype do
				t20[getTryOnItemReducerKey(v153.itemId, v153.itemType)] = formatBundleFromLookOutfit(v153, if not FFlagAXMISEnableMultiShopping then nil else p10.lookId)
			end
		end

		if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p10.lookType == LOOK_TYPE.Makeup then
			return Cryo.Dictionary.join(v146, {
				TryOnItems = t20,
				MakeupLookId = if not p10.lookId then Cryo.None else p10.lookId,
				MakeupLookType = p10.lookType,
				LastToggledLookType = p10.lookType,
				MakeupLookAnalyticsInfo = if not p10.analyticsInfo then Cryo.None else p10.analyticsInfo
			})
		end

		return Cryo.Dictionary.join(v146, {
			TryOnItems = t20,
			LookId = if not p10.lookId then Cryo.None else p10.lookId,
			LookAnalyticsInfo = if not p10.analyticsInfo then Cryo.None else p10.analyticsInfo,
			LookType = p10.lookType,
			MakeupLookId = Cryo.None,
			MakeupLookType = Cryo.None,
			MakeupLookAnalyticsInfo = Cryo.None,
			LastToggledLookType = if not FFlagAXMISEnableMultiShopping then nil else p10.lookType,
			BodyColor3s = if not p10.bodyColor3s then Cryo.None else p10.bodyColor3s,
			BodyPartColorRangeIds = if not p10.bodyPartColorRangeIds then Cryo.None else p10.bodyPartColorRangeIds,
			DefaultTryOnBodyColorsToggled = Cryo.None,
			Scale = if not p10.scale then Cryo.None else p10.scale,
			ShouldTryOnWithoutEquippedItems = if not FFlagAXMISEnableMultiShopping then nil else p10.lookId ~= nil
		})
	end,
	[SetEquippedInTryOnManager.name] = function(t21: {[any]: any}?, p11) -- line: 630
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), Cryo (copy)
		local v156 = t21 or t15
		local v157 = v156.TryOnItems or {}
		local v158 = getTryOnItemReducerKey(p11.itemId, p11.itemType)

		if v157[v158] == nil then
			return v156
		end

		return Cryo.Dictionary.join(v156, {
			TryOnItems = Cryo.Dictionary.join(v157, {
				[v158] = Cryo.Dictionary.join(v157[v158], {
					selectedInTryOnManager = p11.selectedInTryOnManager
				})
			})
		})
	end,
	[SetSelectedTimedOption.name] = function(t22: {[any]: any}?, p12) -- line: 648
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), Cryo (copy)
		local v161 = t22 or t15
		local v162 = v161.TryOnItems or {}
		local v163 = getTryOnItemReducerKey(p12.itemId, p12.itemType)

		if v162[v163] == nil then
			return v161
		end

		return Cryo.Dictionary.join(v161, {
			TryOnItems = Cryo.Dictionary.join(v162, {
				[v163] = Cryo.Dictionary.join(v162[v163], {
					selectedTimedOptionIndex = p12.selectedTimedOptionIndex
				})
			})
		})
	end,
	[RemoveUnselectedItemsFromTryOn.name] = function(t23: {[any]: any}?, _) -- line: 666
		-- upvalues: t15 (copy), Cryo (copy)
		local v166 = t23 or t15
		local t24 = {}

		for v168, v169 in v166.TryOnItems or {} do
			if v169.selectedInTryOnManager then
				t24[v168] = v169
			end
		end

		return Cryo.Dictionary.join(v166, {
			TryOnItems = t24
		})
	end,
	[RemoveLookFromTryOn.name] = if not FFlagAXMISEnableMultiShopping then nil else function(t25: {[any]: any}?, p14) -- line: 683
		-- upvalues: t15 (copy), FFlagAXCatalogMakeupSupport (copy), Cryo (copy)
		local v172 = t25 or t15
		local t26 = {}

		for v174, v175 in v172.TryOnItems or {} do
			if v175.lookId ~= p14.lookId then
				t26[v174] = v175
			end
		end

		if FFlagAXCatalogMakeupSupport and v172.MakeupLookId == p14.lookId then
			return Cryo.Dictionary.join(v172, {
				TryOnItems = t26,
				MakeupLookId = Cryo.None,
				MakeupLookType = Cryo.None,
				MakeupLookAnalyticsInfo = Cryo.None,
				LastToggledLookType = Cryo.None
			})
		end

		return Cryo.Dictionary.join(v172, {
			TryOnItems = t26,
			LookId = Cryo.None,
			LookType = Cryo.None,
			LookAnalyticsInfo = Cryo.None,
			BodyColor3s = Cryo.None,
			BodyPartColorRangeIds = Cryo.None,
			Scale = Cryo.None,
			LastToggledLookType = Cryo.None,
			ShouldTryOnWithoutEquippedItems = false
		})
	end,
	[RemoveFromTryOn.name] = function(t27: {[any]: any}?, p15) -- line: 717
		-- upvalues: t15 (copy), findItemInTryOnItems (copy), reconcileAllTryOnState (copy), removeItem (copy)
		local v178 = t27 or t15
		local v179 = v178.TryOnItems or {}
		local v180 = findItemInTryOnItems(v179, p15.itemId, p15.itemType)

		if v180 ~= nil then
			return reconcileAllTryOnState(removeItem(v178, v179, v180))
		end

		return v178
	end,
	[RemoveLookItemsFromTryOn.name] = function(t28: {[any]: any}?, p16) -- line: 730
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), ItemTypeEnum (copy), Cryo (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy)
		local v183 = t28 or t15

		if p16.lookId == v183.LookId then
			local v184 = v183.TryOnItems or {}

			for _, v186 in p16.assetIds do
				local v187 = getTryOnItemReducerKey(v186, ItemTypeEnum.Asset)

				if v184[v187] ~= nil then
					v184 = Cryo.Dictionary.join(v184, {
						[v187] = Cryo.None
					})
				end
			end

			if p16.bundleIds ~= nil then
				for _, v189 in p16.bundleIds do
					local v190 = getTryOnItemReducerKey(v189, ItemTypeEnum.Bundle)

					if v184[v190] ~= nil then
						v184 = Cryo.Dictionary.join(v184, {
							[v190] = Cryo.None
						})
					end
				end
			end

			v183 = Cryo.Dictionary.join(v183, {
				TryOnItems = v184,
				LookId = Cryo.None,
				LookType = Cryo.None,
				BodyColor3s = Cryo.None,
				BodyPartColorRangeIds = Cryo.None,
				Scale = Cryo.None,
				ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil
			})
		end

		if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p16.lookId == v183.MakeupLookId then
			local v191 = v183.TryOnItems or {}

			for _, v193 in p16.assetIds do
				local v194 = getTryOnItemReducerKey(v193, ItemTypeEnum.Asset)

				if v191[v194] ~= nil then
					v191 = Cryo.Dictionary.join(v191, {
						[v194] = Cryo.None
					})
				end
			end

			if p16.bundleIds ~= nil then
				for _, v196 in p16.bundleIds do
					local v197 = getTryOnItemReducerKey(v196, ItemTypeEnum.Bundle)

					if v191[v197] ~= nil then
						v191 = Cryo.Dictionary.join(v191, {
							[v197] = Cryo.None
						})
					end
				end
			end

			v183 = Cryo.Dictionary.join(v183, {
				TryOnItems = v191,
				MakeupLookId = Cryo.None,
				MakeupLookType = Cryo.None
			})
		end

		return v183
	end,
	[ReceivedBundleInfoForTryOn.name] = function(t29: {[any]: any}?, p17) -- line: 803
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), ItemTypeEnum (copy), Cryo (copy)
		local v200 = t29 or t15
		local v201 = v200.TryOnItems or {}
		local v202 = getTryOnItemReducerKey(p17.itemId, ItemTypeEnum.Bundle)

		if v201[v202] then
			local v203 = table.clone(v200.OutfitIdMap or {})

			v203[p17.itemId] = p17.outfitId

			return Cryo.Dictionary.join(v200, {
				TryOnItems = Cryo.Dictionary.join(v201, {
					[v202] = Cryo.Dictionary.join(v201[v202], {
						receivedBundleInfo = true
					})
				}),
				OutfitIdMap = v203
			})
		end

		return v200
	end,
	[ClearTryOns.name] = function(t30: {[any]: any}?, p18) -- line: 832
		-- upvalues: Cryo (copy), t15 (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy)
		if t30 then
			local v206 = not t30.LookId and p18.retainTryOnColor

			return Cryo.Dictionary.join(t15, {
				LastTryOnClassicHeadShape = t30.LastTryOnClassicHeadShape,
				DefaultTryOnBodyColorsToggled = if not v206 then nil else t30.DefaultTryOnBodyColorsToggled,
				BodyColor3s = if not v206 then nil else t30.BodyColor3s,
				BodyPartColorRangeIds = if not v206 then nil else t30.BodyPartColorRangeIds,
				OutfitIdMap = if not t30 then {} else t30.OutfitIdMap,
				ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil,
				LastToggledLookType = if not FFlagAXMISEnableMultiShopping or not FFlagAXCatalogMakeupSupport then nil else Cryo.None
			})
		end

		return t15
	end,
	[NavigatedToNonTryOnPage.name] = function(t31: {[any]: any}?, _) -- line: 854
		-- upvalues: t15 (copy)
		local v209 = table.clone(t15)

		if t31 and t31.OutfitIdMap then
			v209.OutfitIdMap = t31.OutfitIdMap
		end

		return v209
	end,
	[NavigatedToTryOnPage.name] = function(t32: {[any]: any}?, _) -- line: 862
		-- upvalues: t15 (copy)
		local v212 = table.clone(t15)

		if t32 and t32.OutfitIdMap then
			v212.OutfitIdMap = t32.OutfitIdMap
		end

		return v212
	end,
	[DefaultTryOnBodyColorsToggled.name] = function(t33: {[any]: any}?, p21) -- line: 870
		-- upvalues: t15 (copy)
		local v215 = table.clone(t33 or t15)

		v215.DefaultTryOnBodyColorsToggled = p21.state

		return v215
	end,
	[SetOrderForTryOns.name] = function(t34: {[any]: any}?, p22) -- line: 877
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), ItemTypeEnum (copy), Cryo (copy), Constants (copy)
		local itemIdToOrderMap = p22.itemIdToOrderMap
		local v219 = t34 or t15

		for v220, v221 in itemIdToOrderMap do
			local v222 = v219.TryOnItems or {}
			local v223 = getTryOnItemReducerKey(v220, ItemTypeEnum.Asset)

			if v222[v223] and v222[v223].itemType ~= ItemTypeEnum.Bundle then
				v219 = Cryo.Dictionary.join(v219, {
					TryOnItems = Cryo.Dictionary.join(v222, {
						[v223] = Cryo.Dictionary.join(v222[v223], {
							order = v221
						})
					})
				})
			elseif not v222[v223] then
				for v224, v225 in v222 do
					if v225.bundleInfo and v225.bundleInfo[v220] and v225.itemId ~= tostring(Constants.BlockyBundleId) then
						local bundleInfo = v225.bundleInfo
						local v227 = Cryo.Dictionary.join(bundleInfo, {
							[v220] = Cryo.Dictionary.join(bundleInfo[v220], {
								order = v221
							})
						})

						v219 = Cryo.Dictionary.join(t34, {
							TryOnItems = Cryo.Dictionary.join(v222, {
								[v224] = Cryo.Dictionary.join(v222[v224], {
									bundleInfo = v227
								})
							})
						})

						break
					end
				end
			end
		end

		return v219
	end,
	[SetAccessoryAdjustments.name] = function(t35: {[any]: any}?, p23) -- line: 933
		-- upvalues: t15 (copy), Cryo (copy)
		local v230 = t35 or t15
		local v231 = v230.TryOnItems or {}

		for v232, v233 in v231 do
			if v233.itemType == "Asset" then
				if v233.itemId ~= p23.itemId then
					continue
				end

				return Cryo.Dictionary.join(v230, {
					TryOnItems = Cryo.Dictionary.join(v231, {
						[v232] = Cryo.Dictionary.join(v233, {
							position = p23.position,
							rotation = p23.rotation,
							scale = p23.scale
						})
					})
				})
			end

			if v233.itemType == "Bundle" then
				for v234, v235 in v231 do
					if v235.bundleInfo and v235.bundleInfo[p23.itemId] then
						local bundleInfo = v235.bundleInfo
						local v237 = Cryo.Dictionary.join(bundleInfo, {
							[p23.itemId] = Cryo.Dictionary.join(bundleInfo[p23.itemId], {
								position = p23.position,
								rotation = p23.rotation,
								scale = p23.scale
							})
						})

						return Cryo.Dictionary.join(t35, {
							TryOnItems = Cryo.Dictionary.join(v231, {
								[v234] = Cryo.Dictionary.join(v231[v234], {
									bundleInfo = v237
								})
							})
						})
					end
				end
			end
		end

		return v230
	end,
	[AddSelectedBundleInfo.name] = function(t36: {[any]: any}?, p24) -- line: 978
		-- upvalues: t15 (copy), getTryOnItemReducerKey (copy), ItemTypeEnum (copy), Cryo (copy)
		local v240 = t36 or t15
		local v241 = v240.TryOnItems or {}
		local v242 = getTryOnItemReducerKey(p24.bundleId, ItemTypeEnum.Bundle)

		if v241[v242] then
			return Cryo.Dictionary.join(v240, {
				TryOnItems = Cryo.Dictionary.join(v241, {
					[v242] = Cryo.Dictionary.join(v241[v242], {
						bundleInfo = p24.bundleInfo
					})
				})
			})
		end

		return v240
	end,
	[SetOutfitTryOns.name] = function(_: {[any]: any}?, p25) -- line: 997
		return p25.outfitTryOns
	end,
	[RemoveLook.name] = function(t38: {[any]: any}?, p26) -- line: 1001
		-- upvalues: t15 (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), Cryo (copy)
		local v247 = t38 or t15

		if p26.lookId == v247.LookId or FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p26.lookId == v247.MakeupLookId then
			local t39 = {}

			if FFlagAXMISEnableMultiShopping then
				for v249, v250 in v247.TryOnItems or {} do
					if v250.lookId ~= p26.lookId then
						t39[v249] = v250
					end
				end
			end

			if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then
				if p26.lookId == v247.LookId then
					v247 = Cryo.Dictionary.join(v247, {
						TryOnItems = t39,
						LookId = Cryo.None,
						LookType = Cryo.None,
						BodyColor3s = Cryo.None,
						BodyPartColorRangeIds = Cryo.None,
						Scale = Cryo.None,
						ShouldTryOnWithoutEquippedItems = false,
						LastToggledLookType = Cryo.None
					})
				end

				if p26.lookId == v247.MakeupLookId then
					return (Cryo.Dictionary.join(v247, {
						TryOnItems = t39,
						MakeupLookId = Cryo.None,
						MakeupLookType = Cryo.None,
						LastToggledLookType = Cryo.None
					}))
				end
			else
				v247 = Cryo.Dictionary.join(v247, {
					TryOnItems = t39,
					LookId = Cryo.None,
					LookType = Cryo.None,
					BodyColor3s = Cryo.None,
					BodyPartColorRangeIds = Cryo.None,
					Scale = Cryo.None,
					ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil
				})
			end
		end

		return v247
	end,
	[CharacterHistoryStateChangeButtonActivated.name] = function(p27, p28) -- line: 1061
		-- upvalues: FFlagAXRootSlotBasedEditorFlag (copy)
		if FFlagAXRootSlotBasedEditorFlag and (p28.tryOn and p28.tryOn.OutfitTryOn) then
			return table.clone(p28.tryOn.OutfitTryOn)
		end

		return p27
	end,
	[SetAdjustableTryOnIds.name] = if not v70 then nil else function(t40: {[any]: any}?, p29) -- line: 1072
		-- upvalues: t15 (copy)
		local v255 = table.clone(t40 or t15)

		v255.AdjustableTryOnIds = p29.adjustableTryOnIds

		return v255
	end,
	[SetLastToggledLookType.name] = if not FFlagAXMISEnableMultiShopping then nil else function(t41: {[any]: any}?, p30) -- line: 1079
		-- upvalues: t15 (copy), Cryo (copy)
		local v258 = t41 or t15

		return Cryo.Dictionary.join(v258, {
			LastToggledLookType = p30.lastToggledLookType
		})
	end
})
