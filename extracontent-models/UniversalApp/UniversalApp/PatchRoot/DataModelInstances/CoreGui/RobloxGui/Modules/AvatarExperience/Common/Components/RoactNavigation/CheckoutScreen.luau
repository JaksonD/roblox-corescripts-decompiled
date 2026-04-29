local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local NotificationService = game:GetService("NotificationService")
local Modules = CoreGui.RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local Promise = require(CorePackages.Packages.Promise)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RemoveFromTryOn = require(Modules.AvatarExperience.Common.Actions.RemoveFromTryOn)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useStore = RoactUtils.Hooks.RoactRodux.useStore
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local getUseSelectorDeepEquals = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local OpenItemDetails = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local ApiFetchEconomyCurrency = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local FetchAssetOrBundleInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local GetOutfits = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfits)
local Constants = require(Modules.AvatarExperience.AvatarEditor.Constants)
local Constants2 = require(Modules.AvatarExperience.Common.Constants)

require(Modules.AvatarExperience.Common.Types)

local CharacterManagerUtils = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local sendUnifiedEventForDeferredAction = AvatarExperienceAnalytics.sendUnifiedEventForDeferredAction
local UnifiedEventLogEnums = AvatarExperienceAnalytics.UnifiedEventLogEnums
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAEGetEditableOutfitsType = require(Modules.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType)
local FFlagAXModeratedItemsFlow = AvatarExperienceFlags.FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlags.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlags.FFlagAXEnableExpiredUserLookCheckout
local CheckoutPageContainer = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutPageContainer

local function selectRobuxFetchInfo(p1) -- line: 47
	local LocalUserId = p1.LocalUserId
	local v39 = p1.UserRobux[LocalUserId]

	return {
		localUserId = p1.LocalUserId,
		userRobux = v39
	}
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function() --[[ CheckoutScreen ]] -- line: 53
	-- upvalues: useRoactService (copy), RoactNetworking (copy), Analytics (copy), useDispatch (copy), useStore (copy), useNavigation (copy), useAvatarRoute (copy), useSelector (copy), selectRobuxFetchInfo (copy), getUseSelectorDeepEquals (copy), React (copy), RemoveFromTryOn (copy), UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), OpenItemDetails (copy), ApiFetchEconomyCurrency (copy), FetchAssetOrBundleInfo (copy), FFlagAXEnableExpiredUserLookCheckout (copy), RobloxEventReceiver (copy), NotificationService (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), GetOutfits (copy), Constants (copy), FFlagAEGetEditableOutfitsType (copy), Constants2 (copy), Promise (copy), CheckoutPageContainer (copy), CharacterManagerUtils (copy)
	local v40 = useRoactService(RoactNetworking)
	local v41 = useRoactService(Analytics)
	local v42 = useDispatch()
	local v43 = useStore()
	local v44 = useNavigation()
	local v45 = useAvatarRoute()
	local v46 = useSelector(selectRobuxFetchInfo, getUseSelectorDeepEquals())
	local v47 = React.useCallback(function(s1: string, s2: string) -- line: 63
		-- upvalues: v42 (copy), RemoveFromTryOn (copy)
		v42(RemoveFromTryOn(s1, s2))
	end, {
		v42,
		v40,
		v41
	})
	local v48 = React.useCallback(function(s3: string, s4: string, s5: string) -- line: 67
		-- upvalues: UnifiedEventLogEnums (copy), sendUnifiedEventForDeferredAction (copy), v42 (copy), OpenItemDetails (copy), v41 (copy), v45 (copy), v44 (copy)
		local ASSET = nil

		if s4 == "Asset" then
			ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET
		elseif s4 == "Bundle" then
			ASSET = UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE
		end

		sendUnifiedEventForDeferredAction({
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			elementName = "CLICK_ITEM_DETAILS",
			itemId = s3,
			itemType = ASSET
		})
		v42(OpenItemDetails({
			itemId = s3,
			itemType = s4,
			itemSubType = s5,
			catalogAnalytics = v41,
			avatarRoute = v45,
			navigation = v44,
			showFullWithNoPeekView = true
		}))
	end, { v42 })
	local v49 = React.useCallback(function() -- line: 93
		-- upvalues: v42 (copy), ApiFetchEconomyCurrency (copy), v40 (copy), v46 (copy)
		v42(ApiFetchEconomyCurrency(v40, v46.localUserId, true))
	end, {
		v42,
		v40,
		v46
	})
	local v50 = React.useCallback(function(s6: string, s7: string) -- line: 97
		-- upvalues: v42 (copy), FetchAssetOrBundleInfo (copy), v40 (copy), v41 (copy)
		v42(FetchAssetOrBundleInfo(v40, v41, s6, s7, true))
	end, {
		v42,
		v40,
		v41
	})
	local u51 = nil
	local u52 = nil
	local v53 = nil

	if FFlagAXEnableExpiredUserLookCheckout then
		u51 = React.useMemo(function() -- line: 121
			-- upvalues: RobloxEventReceiver (copy), NotificationService (copy)
			return RobloxEventReceiver.new(NotificationService)
		end, {})
		u52 = React.useRef(nil)
		v53 = React.useCallback(function(p2: ((...any) -> ...any)?) -- line: 126
			-- upvalues: u51 (ref), u52 (ref), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), v40 (copy), v42 (copy), GetOutfits (copy), Constants (copy), FFlagAEGetEditableOutfitsType (copy), Constants2 (copy), v43 (copy), FetchAssetOrBundleInfo (copy), v41 (copy), Promise (copy)
			if u51 == nil then
				return
			end

			if u52.current ~= nil then
				u52.current:disconnect()
				u52.current = nil
			end

			u52.current = u51:observeEvent("AvatarAssetOwnershipNotifications", function() -- line: 138
				-- upvalues: u52 (ref), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), v40 (copy), v42 (copy), GetOutfits (copy), Constants (copy), FFlagAEGetEditableOutfitsType (copy), Constants2 (copy), v43 (copy), FetchAssetOrBundleInfo (copy), v41 (copy), p2 (copy), Promise (copy)
				if u52.current ~= nil then
					u52.current:disconnect()
					u52.current = nil
				end

				local v63 = if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else v40
				local v64 = v42(GetOutfits(Constants.EditableCharacterKey, true, Constants.EditableCharacterKey, if not FFlagAEGetEditableOutfitsType then nil else Constants2.OutfitTypes.Avatar, v63, true, true))
				local v65 = if Constants2.OutfitTypes.Makeup == nil then nil else v42(GetOutfits(Constants.MakeupOutfitKey, true, Constants.MakeupOutfitKey, if not FFlagAEGetEditableOutfitsType then nil else Constants2.OutfitTypes.Makeup, v63, true, true))
				local v66 = if not v65 or typeof(v65.andThen) ~= "function" then nil else v65:andThen(function() -- line: 189
					-- upvalues: v43 (copy), Constants (copy), v42 (copy), FetchAssetOrBundleInfo (copy), v40 (copy), v41 (copy), Constants2 (copy)
					local v68 = v43:getState()
					local v69 = v68.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[Constants.MakeupOutfitKey]

					if v69 == nil then
						return
					end

					local OutfitInfos = v68.AvatarExperience.AvatarEditor.OutfitInfos
					local t1 = {}

					for _, v73 in v69 do
						local v74 = OutfitInfos[v73]

						if v74 ~= nil and v74.assets ~= nil then
							for _, v76 in v74.assets do
								for v77 in v76 do
									if not t1[v77] then
										t1[v77] = true
										v42(FetchAssetOrBundleInfo(v40, v41, v77, Constants2.ItemType.Asset, true))
									end
								end
							end
						end
					end
				end)

				if p2 then
					local t2 = {}

					if v64 and typeof(v64.andThen) == "function" then
						table.insert(t2, v64)
					end

					if v66 and typeof(v66.andThen) == "function" then
						table.insert(t2, v66)
					elseif v65 and typeof(v65.andThen) == "function" then
						table.insert(t2, v65)
					end

					if #t2 > 0 then
						Promise.all(t2):andThen(p2, p2)

						return
					end

					p2()
				end
			end)
		end, {
			v42,
			v43,
			v40,
			v41,
			u51
		})
		React.useEffect(function() -- line: 248
			-- upvalues: u52 (ref)
			return function() -- line: 249
				-- upvalues: u52 (ref)
				if u52.current ~= nil then
					u52.current:disconnect()
					u52.current = nil
				end
			end
		end, {})
	end

	return React.createElement(CheckoutPageContainer, {
		onRemoveItem = v47,
		onOpenItemDetailsPage = v48,
		fetchUserRobux = v49,
		fetchItemData = v50,
		fetchOutfits = if not FFlagAXEnableExpiredUserLookCheckout then nil else v53,
		getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = CharacterManagerUtils.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		getBundleOutfitInfoFromProvidedTryOns = CharacterManagerUtils.getBundleOutfitInfoFromProvidedTryOns
	})
end)
