local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Dash = require(ProfilePlatformParent.Dash)
local Constants = require(ProfilePlatform.Common.Constants)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local memoize = require(ProfilePlatformParent.AppCommonLib).memoize
local dependencyArray = RoactUtils.Hooks.dependencyArray
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local Enums = require(ProfilePlatform.Common.Enums)
local EventNames = require(ProfilePlatform.Analytics.EventNames)
local NetworkingCatalog = require(ProfilePlatform.Networking.NetworkingCatalog)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local useMarketplaceAnalyticsContext = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)

require(ProfilePlatform.Common.AssetInfo)

local FFlagProfilePlatformNavigateToMarketplaceWebView = require(ProfilePlatform.Flags.FFlagProfilePlatformNavigateToMarketplaceWebView)
local Url = require(ProfilePlatformParent.Http).Url
local TextKeys = require(ProfilePlatform.Common.TextKeys)
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(ProfilePlatformParent.RobloxAppEnums).AppPage
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformUseCatalogItemOpenedNewFields = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local v25 = game:DefineFastInt("ProfilePlatformStoreItemLimit", 3)
local v26 = game:DefineFastFlag("ProfilePlatformHideStoreIfNoAssets", false)
local FFlagEnableCommunityProfileLoadingSkeletons = require(ProfilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local HttpService = game:GetService("HttpService")
local StoreGrid = require(script.Parent.StoreGrid)
local StoreGridSkeleton = require(script.Parent.StoreGridSkeleton)
local FFlagRemoveDependencyArrayAntipattern = require(ProfilePlatformParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local v32 = memoize(function(p1, p2, p3) -- line: 48
	-- upvalues: Enums (copy)
	local t1 = {}
	local n1 = 1

	for _, v39 in p1 do
		local v40 = if v39.itemType ~= Enums.ItemTypes.Bundle then p3[tostring(v39.assetId)] else p2[tostring(v39.assetId)]

		if v40 then
			v40.itemType = v39.itemType
			t1[n1] = v40
			n1 += 1
		end
	end

	return t1
end)

return function(t2: {[any]: any}) --[[ StoreContainer ]] -- line: 71
	-- upvalues: useProfileWrapperContext (copy), useProfileAnalyticsContext (copy), useDispatch (copy), React (copy), FFlagEnableCommunityProfileLoadingSkeletons (copy), useMarketplaceAnalyticsContext (copy), EventNames (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFields (copy), Enums (copy), useProfileJsonComponent (copy), Constants (copy), v32 (copy), useSelector (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), HttpService (copy), FFlagProfilePlatformNavigateToMarketplaceWebView (copy), Url (copy), NavigateDown (copy), AppPage (copy), TextKeys (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), NetworkingCatalog (copy), StoreGridSkeleton (copy), v26 (copy), StoreGrid (copy), Dash (copy), v25 (copy)
	local v42 = useProfileWrapperContext()
	local v43 = useProfileAnalyticsContext()
	local v44 = useDispatch()
	local v45, v46 = React.useState(not not FFlagEnableCommunityProfileLoadingSkeletons)
	local v47 = useMarketplaceAnalyticsContext()
	local v48 = React.useCallback(function(s1: string, s2: string, n2: number?) -- line: 80
		-- upvalues: v42 (copy), v43 (copy), EventNames (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFields (copy), Enums (copy), v47 (copy)
		v42.navigateTo.itemOrBundleDetails(s1, s2)
		v43.fireAnalyticsEvent(EventNames.CatalogItemOpened, if not FFlagProfilePlatformUseCatalogItemOpenedNewFields then {
			source = tostring(Enums.Components.Store),
			positionInComponent = tostring(n2),
			component = tostring(Enums.Components.Store),
			itemId = tostring(s1)
		} else {
			btnContext = tostring(Enums.Components.Store),
			btnUnitId = tostring(s1),
			btnSortPosition = tostring(n2)
		})
		v42.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(v47, s1, s2, tostring(Enums.Components.Store), n2)
	end, {
		v43,
		v42.navigateTo.itemOrBundleDetails,
		v42.externalAnalytics.catalogAnalytics
	})
	local v49 = useProfileJsonComponent(Enums.Components.Store).assets or {}
	local v50 = React.useCallback(function(p4) -- line: 114
		-- upvalues: Constants (copy), v32 (copy), v49 (copy)
		local v62 = p4[Constants.RODUX_KEY].BundleDetails or {}
		local v63 = p4[Constants.RODUX_KEY].AssetDetails or {}

		return v32(v49, v62, v63)
	end, { v49 })
	local v51 = useSelector(v50)
	local name = useProfileJsonComponent(Enums.Components.Store).name
	local v53 = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else v42.profileType
	local profileId = v42.profileId
	local v55 = if not FFlagProfilePlatformEnableCommunityProfilePage or v53 ~= Enums.ProfileTypes.Community then name else HttpService:UrlEncode(name)
	local v56 = if not FFlagProfilePlatformNavigateToMarketplaceWebView then nil else React.useCallback(function() -- line: 137
		-- upvalues: v43 (copy), EventNames (copy), v53 (copy), Enums (copy), Url (copy), profileId (copy), v55 (copy), v44 (copy), NavigateDown (copy), AppPage (copy), TextKeys (copy)
		v43.fireAnalyticsEvent(EventNames.StoreHeaderButton)

		local v64 = if v53 ~= Enums.ProfileTypes.Community then string.format("%scatalog?CreatorName=%s", Url.BASE_URL, v55) else string.format("%scommunities/%s/CommunityName/#!/store", Url.BASE_URL, profileId)

		v44(NavigateDown({
			name = AppPage.GenericWebPage,
			detail = v64,
			extraProps = {
				titleKey = TextKeys.Store
			}
		}))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v43, name, v53, profileId) else {
		v43,
		name,
		v53,
		profileId
	})
	local v57 = React.useCallback(function() -- line: 162
		-- upvalues: v43 (copy), EventNames (copy), v42 (copy), name (copy)
		v43.fireAnalyticsEvent(EventNames.StoreHeaderButton)
		v42.navigateTo.catalogSearch(name)
	end, {
		v42.navigateTo.catalogSearch,
		name,
		v43
	})

	React.useEffect(function() -- line: 174
		-- upvalues: v44 (copy), NetworkingCatalog (copy), v49 (copy), FFlagEnableCommunityProfileLoadingSkeletons (copy), v46 (copy)
		v44(NetworkingCatalog.GetItemAndBundleDetails.API(v49)):catch(function(_) -- line: 175
		end):finally(function() -- line: 175
			-- upvalues: FFlagEnableCommunityProfileLoadingSkeletons (copy), v46 (copy)
			if FFlagEnableCommunityProfileLoadingSkeletons then
				v46(false)
			end
		end)
	end, {
		v49,
		v44
	})

	if FFlagEnableCommunityProfileLoadingSkeletons and v45 then
		return React.createElement(StoreGridSkeleton, {
			layoutOrder = t2.layoutOrder,
			numSkeletons = #v49
		})
	end

	if v26 and #v51 == 0 then
		return nil
	end

	return React.createElement(StoreGrid, {
		layoutOrder = t2.layoutOrder,
		assets = Dash.slice(v51, 1, v25),
		openItemDetails = v48,
		navigateToCatalogSearch = if not FFlagProfilePlatformNavigateToMarketplaceWebView then v57 else v56
	})
end
