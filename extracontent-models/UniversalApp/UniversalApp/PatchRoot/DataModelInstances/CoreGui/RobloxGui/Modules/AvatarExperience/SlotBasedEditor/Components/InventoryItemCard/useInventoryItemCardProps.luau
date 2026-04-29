local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local Cryo = require(CorePackages.Packages.Cryo)
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useAvatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceSlotBasedEditor = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local InventoryItemType = AvatarExperienceSlotBasedEditor.Enums.InventoryItemType
local InventoryItemAvailability = AvatarExperienceSlotBasedEditor.Enums.InventoryItemAvailability
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommon.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ItemData = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local ToggleEquipAsset = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local EquipOutfit = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local Analytics = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local Analytics2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SendAnalytics = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local OpenItemDetails = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local NavigateWithLock = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local NormalizeAvatar = require(Modules.AvatarExperience.AvatarEditor.Actions.NormalizeAvatar)
local CatalogUtils = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local SetFullView = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommon.Enums.FullView
local getRemainingTimeFromExpiration = AvatarExperienceSlotBasedEditor.Utils.getRemainingTimeFromExpiration

require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
require(Modules.AvatarExperience.Common.Types)

local selectIsPortrait = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local NavigationUtils = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local useSlotBasedEditorContext = AvatarExperienceSlotBasedEditor.Context.useSlotBasedEditorContext
local SlotType = AvatarExperienceSlotBasedEditor.Enums.SlotType
local v39 = game:DefineFastFlag("AXR15PromptBeforeApplyingAvatar", false)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXFixStaleModerationStatusFromGrant = AvatarExperienceFlags.FFlagAXFixStaleModerationStatusFromGrant
local FFlagAXFixIecModerationFromInventoryFetch = AvatarExperienceFlags.FFlagAXFixIecModerationFromInventoryFetch
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlags.FFlagAXInventoryDurablesSupport
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlags.FFlagAXCustomizeMakeupSupport
local FFlagAXBlockMakeupEquipR6 = AvatarExperienceFlags.FFlagAXBlockMakeupEquipR6
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping

require(script.Parent.InventoryItemCard)

local useMakeupFtux = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Hooks.useMakeupFtux
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = AvatarExperienceCommon.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local MAX_MAKEUP_LAYERS = AvatarExperienceCommon.Constants.MAX_MAKEUP_LAYERS
local selectEquippedLayeredMakeupAssets = AvatarExperienceCommon.State.Selectors.selectEquippedLayeredMakeupAssets

local function selectIsR6(p1) -- line: 99
	-- upvalues: Constants (copy)
	return p1.AvatarExperience.AvatarEditor.Character.AvatarType == Constants.AvatarType.R6
end

return function(t1: {[any]: any}) --[[ useInventoryItemCardProps ]] -- line: 103
	-- upvalues: useRoactService (copy), Analytics (copy), Analytics2 (copy), useDispatch (copy), useNavigation (copy), useAvatarRoute (copy), React (copy), InventoryItemType (copy), ItemData (copy), useSelector (copy), FFlagAXCustomizeMakeupSupport (copy), useMakeupFtux (copy), selectEquippedLayeredMakeupAssets (copy), FFlagAXInventoryDurablesSupport (copy), getRemainingTimeFromExpiration (copy), useLocalization (copy), selectIsR6 (copy), selectIsPortrait (copy), FFlagAXFixIecModerationFromInventoryFetch (copy), Constants (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXFixStaleModerationStatusFromGrant (copy), Utils (copy), FFlagAXRootSlotBasedEditorFlag (copy), SendAnalytics (copy), useSlotBasedEditorContext (copy), SlotType (copy), ToggleEquipAsset (copy), SetFullView (copy), FullView (copy), NormalizeAvatar (copy), EquipOutfit (copy), FFlagAXBlockMakeupEquipR6 (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), v39 (copy), AvatarScreen (copy), NavigateWithLock (copy), MAX_MAKEUP_LAYERS (copy), FFlagAXMISEnableMultiShopping (copy), CatalogItemCardStatusIconTypeEnum (copy), InventoryItemAvailability (copy), NavigationUtils (copy), CatalogUtils (copy), OpenItemDetails (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), Cryo (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy)
	local v56 = useRoactService(Analytics)
	local v57 = useRoactService(Analytics2)
	local v58 = useDispatch()
	local v59 = useNavigation()
	local v60 = useAvatarRoute()
	local v61 = React.useRef(nil)
	local v62 = v60 and (v60.opaque and v60.opaque.name)
	local inventoryItemType = t1.inventoryItemType
	local v64 = React.useCallback(function(p2) -- line: 114
		-- upvalues: inventoryItemType (copy), InventoryItemType (copy), ItemData (copy), t1 (copy)
		if inventoryItemType == InventoryItemType.Asset then
			return (ItemData(p2.AvatarExperience.Common, t1.itemId, inventoryItemType))
		end

		return nil
	end, {
		inventoryItemType,
		t1.itemId
	})
	local v65 = useSelector(v64)
	local v66 = if not FFlagAXCustomizeMakeupSupport then nil else useMakeupFtux()
	local v67 = if not FFlagAXCustomizeMakeupSupport then nil else useSelector(selectEquippedLayeredMakeupAssets)
	local v68 = nil

	if FFlagAXInventoryDurablesSupport then
		local v69 = if not v65 then nil else getRemainingTimeFromExpiration(v65.expirationTime)
		local v70 = useLocalization({
			days = if not v69 or v69.unit ~= "days" then nil else {
				"Feature.Durables.TimeRemaining.Days",
				number = v69.value
			},
			hours = if not v69 or v69.unit ~= "hours" then nil else {
				"Feature.Durables.TimeRemaining.Hours",
				number = v69.value
			},
			minutes = if not v69 or v69.unit ~= "minutes" then nil else {
				"Feature.Durables.TimeRemaining.Minutes",
				number = v69.value
			}
		})

		v68 = if not v69 then nil else v70[v69.unit]
	end

	local v71 = React.useCallback(function(p3) -- line: 147
		-- upvalues: inventoryItemType (copy), InventoryItemType (copy), t1 (copy)
		if inventoryItemType == InventoryItemType.Outfit then
			return p3.AvatarExperience.AvatarEditor.OutfitInfos[t1.itemId]
		end

		return nil
	end, {
		inventoryItemType,
		t1.itemId
	})
	local v72 = useSelector(v71)
	local v73 = useSelector(selectIsR6)
	local v74 = useSelector(selectIsPortrait)
	local u75 = if not v65 then if not v72 then nil else v72.name else v65.name
	local v76 = if not v65 then nil else v65.assetType

	if FFlagAXFixIecModerationFromInventoryFetch and u75 == nil then
		u75 = ((if not v76 then nil else Constants.AssetTypeIdStringToName[v76])) or ""
	end

	local v77 = if not FFlagAXModeratedItemsFlow or not v72 then nil else v72.inventoryType
	local u78 = if not v65 then nil else v65.moderationStatus

	if FFlagAXFixStaleModerationStatusFromGrant and (not v65 or (v65.creatingUniverseId == nil or not (string.len(v65.creatingUniverseId) > 0))) and t1.availabilityStatus ~= nil then
		u78 = Utils.getModerationStatusFromAvailabilityStatus(t1.availabilityStatus)
	end

	local v79 = if not v65 then nil else v65.updateCounter
	local v80 = if not FFlagAXRootSlotBasedEditorFlag then v72 ~= nil and (v72.containsDynamicHead or v72.outfitType == Constants.OutfitTypes.DynamicHead) else nil
	local v81 = React.useCallback(function(p4, p5, p6) -- line: 186
		-- upvalues: v58 (copy), SendAnalytics (copy)
		v58(SendAnalytics(p4, p5, p6))
	end, { v58 })
	local v82 = if not FFlagAXCustomizeMakeupSupport then nil else useSlotBasedEditorContext()
	local v83 = React.useCallback(function() -- line: 194
		-- upvalues: t1 (copy), v76 (copy), v56 (copy), FFlagAXCustomizeMakeupSupport (copy), v82 (copy), SlotType (copy), v81 (copy), v58 (copy), ToggleEquipAsset (copy), v59 (copy), SetFullView (copy), v62 (copy), FullView (copy), NormalizeAvatar (copy)
		if t1.itemId and v76 then
			local v100 = if not t1.isSelected then v56.equipAsset else v56.unequipAsset
			local layerIndex = nil
			local t2 = nil
			local v103 = nil

			if FFlagAXCustomizeMakeupSupport and v82 then
				local v104 = v82.signalStore.getSlotIndex()

				v103 = v82.signalStore.getSlots()[v104]

				if not t1.isSelected and v103 and v103.slotType == SlotType.LayeredSlot then
					layerIndex = v103.layerIndex
					t2 = {}

					for _, v106 in v103.assetTypes do
						table.insert(t2, (tostring(v106.Value)))
					end
				end
			end

			v81(v100, t1.itemId, v76)
			v58(ToggleEquipAsset(v76, t1.itemId, v59, nil, layerIndex, nil, if not FFlagAXCustomizeMakeupSupport then nil else t2))
			v58(SetFullView(v56, v62, FullView.None))

			if FFlagAXCustomizeMakeupSupport and t1.isSelected and v103 and v103.slotType ~= SlotType.LayeredSlot then
				v58(NormalizeAvatar())
			end
		end
	end, if not FFlagAXCustomizeMakeupSupport then {
		t1.itemId,
		v76,
		t1.isSelected,
		v56,
		v81,
		v58,
		v59,
		v62
	} else {
		t1.itemId,
		v76,
		t1.isSelected,
		v56,
		v81,
		v58,
		v59,
		v62,
		v82
	})
	local v84 = React.useCallback(function() -- line: 270
		-- upvalues: v72 (copy), v56 (copy), v59 (copy), t1 (copy), v58 (copy), SetFullView (copy), v62 (copy), FullView (copy), EquipOutfit (copy)
		if v72 then
			local t3 = {
				outfitInfo = v72,
				analytics = v56,
				navigation = v59,
				isSelected = t1.isSelected
			}

			v58(SetFullView(v56, v62, FullView.None))
			v58(EquipOutfit(t3))
		end
	end, {
		v72,
		v76,
		v56,
		v59,
		t1.isSelected,
		v58,
		v62
	})
	local v85 = React.useCallback(function() -- line: 289
		-- upvalues: t1 (copy), v73 (copy), v76 (copy), Constants (copy), v72 (copy), FFlagAXBlockMakeupEquipR6 (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), v39 (copy), v59 (copy), AvatarScreen (copy), v84 (copy), v83 (copy), v58 (copy), NavigateWithLock (copy), Utils (copy)
		if not t1.itemId or (not v73 or t1.isSelected) then
			return false
		end

		local v108 = v76 == Constants.AssetTypeIdStrings.HairAccessory
		local v109 = v72 and v72.outfitType == Constants.OutfitTypes.Shoes
		local v110 = v76 and Constants.LayeredAssetTypes[v76] ~= nil
		local v111 = if not FFlagAXBlockMakeupEquipR6 then nil else v76 and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v76]
		local v112 = if not v39 then nil else v72 and (v72.outfitType == Constants.OutfitTypes.Avatar and v72.avatarType == Constants.AvatarType.R15)

		if v110 and not v108 or v109 or v112 or v111 then
			v58(NavigateWithLock(function() -- line: 307
				-- upvalues: v59 (copy), AvatarScreen (copy), v109 (copy), v112 (copy), v84 (copy), v83 (copy)
				v59.navigate(AvatarScreen.R15UpgradePrompt, {
					bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning",
					onSwitchSelected = if not v109 and not v112 then v83 else v84
				})
			end))

			return true
		end

		local v113 = v76 == Constants.AssetTypeIdStrings.EmoteAnimation
		local v114 = Utils.isAnimationAssetType(v76)

		if v113 or v114 then
			local v115 = not v113 and "Feature.Avatar.Message.R15AnimationsPrompt" or "Feature.Avatar.Message.R15EmotesPrompt"

			v58(NavigateWithLock(function() -- line: 324
				-- upvalues: v59 (copy), AvatarScreen (copy), v115 (copy)
				v59.navigate(AvatarScreen.R15UpgradePrompt, {
					bodyTextKey = v115
				})
			end))

			return false
		end

		return false
	end, {
		t1.itemId,
		v76,
		v72,
		v73,
		t1.isSelected,
		v59,
		v83,
		v84,
		v58
	})
	local v86 = if not FFlagAXCustomizeMakeupSupport then nil else React.useCallback(function() -- line: 349
		-- upvalues: v82 (copy), inventoryItemType (copy), InventoryItemType (copy), v76 (copy), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (copy), SlotType (copy), v67 (copy), MAX_MAKEUP_LAYERS (copy), v66 (copy), t1 (copy), v59 (copy), AvatarScreen (copy), v83 (copy), FFlagAXMISEnableMultiShopping (copy)
		if not v82 then
			return false
		end

		local v116 = v82.signalStore.getSlots()
		local v117 = v82.signalStore.getSlotIndex()
		local v118 = inventoryItemType == InventoryItemType.Asset and (v76 and ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v76])
		local v119 = v117 and (v116 and (v116[v117] and v116[v117].slotType == SlotType.LayeredSlot))
		local v120 = v67 and #v67 == MAX_MAKEUP_LAYERS

		if v66 and v66.shouldShowMakeupMax6LayersPrompt() and not t1.isSelected and v118 and v117 and not v119 and v120 then
			v59.navigate(AvatarScreen.MakeupMax6LayersPrompt, {
				onConfirm = function(p7) --[[ onConfirm ]] -- line: 376
					-- upvalues: v66 (copy), v83 (copy)
					if p7 then
						v66.hideMakeupMax6LayersPrompt()
					end

					v83()
				end
			})

			if FFlagAXMISEnableMultiShopping then
				v66.incrementSeenMakeupMax6LayersPrompt()
			end

			return true
		end

		return false
	end, {
		v66,
		v76,
		t1.isSelected,
		v67,
		v82,
		v59,
		v83,
		inventoryItemType
	})
	local v87 = React.useCallback(function() -- line: 407
		-- upvalues: FFlagAXCustomizeMakeupSupport (copy), v85 (copy), v86 (copy), inventoryItemType (copy), InventoryItemType (copy), t1 (copy), v83 (copy), v72 (copy), v84 (copy)
		if if not FFlagAXCustomizeMakeupSupport then v85() else v85() or v86() then
			return
		end

		if inventoryItemType == InventoryItemType.Asset and t1.itemId then
			v83()

			return
		end

		if inventoryItemType == InventoryItemType.Outfit and v72 then
			v84()
		end
	end, if not FFlagAXCustomizeMakeupSupport then {
		inventoryItemType,
		t1.itemId,
		v83,
		v72,
		v84
	} else {
		inventoryItemType,
		t1.itemId,
		v83,
		v72,
		v84,
		v86
	})
	local t4 = nil
	local v89 = React.useCallback(function(s1: string) -- line: 435
		-- upvalues: v76 (copy), Constants (copy), v77 (copy), FFlagAXModeratedItemsFlow (copy), v59 (copy), AvatarScreen (copy), inventoryItemType (copy), u75 (ref)
		local v122 = if not v76 then v77 else Constants.AssetTypeIdStringToName[v76]
		local v123 = nil

		if FFlagAXModeratedItemsFlow then
			v123 = not v76 and "Feature.Catalog.Label.Bundle" or Constants.AssetTypeLocalized[v76]
		end

		v59.navigate(AvatarScreen.ItemsUnavailablePrompt, {
			items = {{
				category = if not FFlagAXModeratedItemsFlow then inventoryItemType else v122,
				categoryLoc = v123,
				itemName = u75
			}},
			messageType = s1
		})
	end, {
		v59,
		u78,
		u75,
		v76,
		v77
	})

	if Utils.isModerationPendingOrRejected(u78) then
		local v90 = if Enum.ModerationStatus.NotReviewed ~= u78 then CatalogItemCardStatusIconTypeEnum.Moderated else CatalogItemCardStatusIconTypeEnum.PendingModeration

		t4 = {
			type = "placeholder",
			iconType = v90
		}

		function v87() -- line: 467
			-- upvalues: Utils (copy), u78 (ref), v89 (copy)
			local v124 = Utils.getMessageTypeFromModerationStatus(u78)

			if not v124 then
				error("ItemsUnavailablePrompt prop messageType cannot be nil")
			end

			v89(v124)
		end
	end

	if FFlagAXModeratedItemsFlow and t1.availabilityStatus == InventoryItemAvailability.Unavailable then
		t4 = {
			type = "placeholder",
			iconType = "Error"
		}

		function v87() -- line: 482
			-- upvalues: v89 (copy)
			v89("UnavailableItems")
		end
	end

	local v91 = v72 and (v72.creatingUniverseId ~= nil and string.len(v72.creatingUniverseId) > 0)
	local v92 = inventoryItemType == InventoryItemType.Asset or v91
	local v93 = React.useCallback(function() -- line: 494
		-- upvalues: inventoryItemType (copy), InventoryItemType (copy), t1 (copy), v74 (copy), NavigationUtils (copy), v59 (copy), AvatarScreen (copy), v58 (copy), NavigateWithLock (copy), Constants (copy), CatalogUtils (copy), v65 (copy), v57 (copy), v60 (copy), OpenItemDetails (copy)
		if inventoryItemType == InventoryItemType.Outfit then
			local t5 = {
				outfitId = t1.itemId,
				ZIndex = 2,
				showFullWithNoPeekView = not v74,
				renderBottomBar = false,
				NextSelectionLeft = if not v74 then nil else t1.resultsListRef
			}

			v58(NavigateWithLock(function() -- line: 505
				-- upvalues: NavigationUtils (copy), v59 (copy), AvatarScreen (copy), t5 (copy)
				NavigationUtils.closeFiltersAndItemDetails(v59)
				NavigationUtils.closeTryOnManager(v59)
				v59.navigate(AvatarScreen.OutfitDetails, t5)
			end))

			return
		end

		if inventoryItemType == InventoryItemType.Asset and t1.itemId then
			local t6 = {
				itemId = t1.itemId,
				itemType = Constants.ItemType.Asset,
				itemSubType = CatalogUtils.GetItemSubType(inventoryItemType, v65),
				priceInRobux = if not v65 then nil else v65.priceInRobux,
				catalogAnalytics = v57,
				avatarRoute = v60,
				navigation = v59,
				itemDetailsPeekViewRefs = t1.itemDetailsPeekViewRefs,
				resultsListRef = t1.resultsListRef,
				showFullWithNoPeekView = true,
				closePreviousItemDetails = true
			}

			v58(OpenItemDetails(t6))
		end
	end, {
		inventoryItemType,
		t1.itemId,
		v74,
		v65,
		v57,
		v60,
		v59,
		t1.itemDetailsPeekViewRefs,
		t1.resultsListRef,
		v58
	})
	local t7 = {
		itemId = t1.itemId,
		inventoryItemType = inventoryItemType,
		itemName = u75 or "",
		showDynamicHeadIcon = if not FFlagAXRootSlotBasedEditorFlag then v80 else nil,
		isSelected = t1.isSelected,
		thumbnailRef = v61,
		onActivated = v87,
		onDetailsButtonActivated = if not v92 then nil else v93,
		impressionsTag = t1.impressionsTag,
		gridInformation = t1.gridInformation,
		assetType = if not v76 then nil else tonumber(v76),
		outfitType = if not FFlagAXModeratedItemsFlow then nil else v77,
		hideName = t1.hideName or false,
		availabilityStatus = if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else t1.availabilityStatus,
		moderationStatus = u78,
		updateCounter = v79,
		itemStatus = t4,
		expirationTime = if not FFlagAXInventoryDurablesSupport then nil else v68
	}

	React.useEffect(function() -- line: 569
		-- upvalues: v61 (copy), Cryo (copy), t7 (copy), InventoryItemType (copy), OrganicEventImpressionsSchema (copy), t1 (copy), ImpressionsUtil (copy)
		if v61.current then
			local v127 = Cryo.Dictionary.join(t7, {
				itemType = if t7.inventoryItemType ~= InventoryItemType.Asset then if t7.inventoryItemType ~= InventoryItemType.Outfit then nil else "Bundle" else "Asset"
			})

			v61.current:SetAttribute(v127.impressionsTag, v127.itemId)

			local v128 = OrganicEventImpressionsSchema[t1.impressionsSchema]

			ImpressionsUtil.writeItemAttributes(v128, v61.current, v127)
		end
	end, {
		t7,
		t1.impressionsSchema
	})

	return t7
end
