local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local TryOnLookV2 = require(CoreGui.RobloxGui.Modules.AvatarExperience.Common.Thunks.TryOnLookV2)
local React = require(CorePackages.Packages.React)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local RobloxSubscriptionPurchaseApp = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)
local FetchAssetOrBundleInfo = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local ClearReceivedCatalogData = require(Modules.AvatarExperience.Common.Actions.ClearReceivedCatalogData)
local FFlagAXMarketplaceSessionSubscriptionRefetch = AvatarExperienceFlags.FFlagAXMarketplaceSessionSubscriptionRefetch
local FFlagAXFixBlackbirdSubscriptionRefresh = AvatarExperienceFlags.FFlagAXFixBlackbirdSubscriptionRefresh
local FFlagAXFixBlackbirdSubscriptionRefreshForLook = AvatarExperienceFlags.FFlagAXFixBlackbirdSubscriptionRefreshForLook
local FFlagAXSubscriptionRefetchClearCatalogData = AvatarExperienceFlags.FFlagAXSubscriptionRefetchClearCatalogData
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local useMarketplaceResultsFetcher = require(script.Parent.useMarketplaceResultsFetcher)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen

local function v26(p1) -- line: 53
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end
local function v27(p2) -- line: 57
	return p2.AvatarExperience.AvatarScene.OutfitTryOn
end

return function() --[[ useRefetchMarketplaceOnSubscriptionChange ]] -- line: 61
	-- upvalues: RobloxSubscriptionPurchaseApp (copy), useSignalState (copy), useAvatarRoute (copy), FFlagAXFixBlackbirdSubscriptionRefresh (copy), useDispatch (copy), useRoactService (copy), RoactNetworking (copy), Analytics (copy), useSelector (copy), v26 (copy), FFlagAXFixBlackbirdSubscriptionRefreshForLook (copy), v27 (copy), React (copy), FetchAssetOrBundleInfo (copy), TryOnLookV2 (copy), GetCatalogCategoriesStore (copy), AvatarScreen (copy), useMarketplaceResultsFetcher (copy), FFlagAXSubscriptionRefetchClearCatalogData (copy), ClearReceivedCatalogData (copy), FFlagAXMarketplaceSessionSubscriptionRefetch (copy)
	local v30 = RobloxSubscriptionPurchaseApp.RobloxSubscriptionSignals.get()
	local v31 = useSignalState(v30.getHasRobloxSubscription)
	local opaque = useAvatarRoute().opaque
	local v33 = if not opaque then nil else opaque.name
	local v34 = if not opaque or not opaque.params then nil else opaque.params.detail
	local u35 = nil

	if FFlagAXFixBlackbirdSubscriptionRefresh then
		local v36 = useDispatch()
		local v37 = useRoactService(RoactNetworking)
		local v38 = useRoactService(Analytics)
		local v39 = useSelector(v26)
		local u40 = nil

		if FFlagAXFixBlackbirdSubscriptionRefreshForLook then
			u40 = useSelector(v27)
		end

		u35 = React.useCallback(function() -- line: 82
			-- upvalues: v39 (copy), v36 (copy), FetchAssetOrBundleInfo (copy), v37 (copy), v38 (copy), FFlagAXFixBlackbirdSubscriptionRefreshForLook (copy), u40 (ref), TryOnLookV2 (copy)
			for _, v49 in v39 do
				v36(FetchAssetOrBundleInfo(v37, v38, v49.itemId, v49.itemType, true))
			end

			if FFlagAXFixBlackbirdSubscriptionRefreshForLook then
				if u40.LookId then
					v36(TryOnLookV2(v37, nil, {}, u40.LookId, nil, nil, true))
				end

				if u40.MakeupLookId then
					v36(TryOnLookV2(v37, nil, {}, u40.MakeupLookId, nil, nil, true))
				end
			end
		end, {
			v39,
			v37,
			v38,
			if not FFlagAXFixBlackbirdSubscriptionRefreshForLook then nil else u40
		})
	end

	local v41 = GetCatalogCategoriesStore.getCatalogSearchSelectionStore()
	local v42 = useSignalState(v41.selectedCategoryId)
	local v43 = useSignalState(v41.selectedSubcategoryId)
	local v44 = React.useMemo(function() -- line: 109
		-- upvalues: v33 (copy), AvatarScreen (copy), v34 (copy), v42 (copy), v43 (copy)
		if v33 ~= AvatarScreen.CatalogSearch then
			return nil
		end

		if typeof(v34) ~= "string" or v34 == "" then
			return nil
		end

		return {
			searchUuid = v34,
			categoryId = v42,
			subcategoryId = v43
		}
	end, {
		v33,
		v34,
		v42,
		v43
	})
	local fetchMarketplace = useMarketplaceResultsFetcher(v44).fetchMarketplace
	local v46 = if not FFlagAXSubscriptionRefetchClearCatalogData then nil else useDispatch()
	local v47 = React.useRef(nil)

	React.useEffect(function() -- line: 139
		-- upvalues: v47 (copy), v31 (copy), FFlagAXSubscriptionRefetchClearCatalogData (copy), v46 (copy), ClearReceivedCatalogData (copy), fetchMarketplace (copy), FFlagAXFixBlackbirdSubscriptionRefresh (copy), u35 (ref)
		local current = v47.current

		v47.current = v31

		if current == false and v31 == true then
			if FFlagAXSubscriptionRefetchClearCatalogData and v46 then
				v46(ClearReceivedCatalogData())
			end

			fetchMarketplace()

			if FFlagAXFixBlackbirdSubscriptionRefresh then
				u35()
			end
		end
	end, {
		v31,
		if not FFlagAXFixBlackbirdSubscriptionRefresh then nil else u35
	})

	if FFlagAXMarketplaceSessionSubscriptionRefetch then
		React.useLayoutEffect(function() -- line: 165
			-- upvalues: v30 (copy), FFlagAXSubscriptionRefetchClearCatalogData (copy), v46 (copy), ClearReceivedCatalogData (copy), fetchMarketplace (copy)
			if v30.getGainedRobloxSubscriptionThisSession() then
				if FFlagAXSubscriptionRefetchClearCatalogData and v46 then
					v46(ClearReceivedCatalogData())
				end

				fetchMarketplace()
			end
		end, {})
	end
end
