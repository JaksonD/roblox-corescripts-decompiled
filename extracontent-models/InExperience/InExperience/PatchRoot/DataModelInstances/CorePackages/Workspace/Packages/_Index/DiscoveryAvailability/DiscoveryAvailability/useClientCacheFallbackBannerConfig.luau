local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryAvailability");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_selectCurrentRoactNavigationRoute_0 = require(l_Parent_0.NavigationRodux).Selectors.selectCurrentRoactNavigationRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v8 = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.LuauPolyfill);
local v10 = require(l_Parent_0.Promise);
local v11 = require(l_Parent_0.SignalsReact);
local v12 = require(l_script_FirstAncestor_0.Signals);
local l_useRoactService_0 = v8.useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppOmniRecommendationsRequest_0 = require(l_Parent_0.RoactServiceTags).AppOmniRecommendationsRequest;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_OmniFeedConstants_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedConstants;
return function(v19) --[[ Line: 37 ]] --[[ Name: useClientCacheFallbackBannerConfig ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), l_selectCurrentRoactNavigationRoute_0 (copy), l_AppPage_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppOmniRecommendationsRequest_0 (copy), l_AppLogging_0 (copy), v11 (copy), v12 (copy), l_RetrievalStatus_0 (copy), v2 (copy), l_OmniFeedConstants_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v10 (copy)
    local v20 = l_useDispatch_0();
    local v21 = l_useSelector_0(l_selectCurrentRoactNavigationRoute_0);
    local v22 = if v21 then v21.routeName else l_AppPage_0.Home;
    local v23 = l_useRoactService_0(l_RoactNetworking_0);
    local v24 = l_useRoactService_0(l_AppOmniRecommendationsRequest_0);
    local v25 = l_useRoactService_0(l_AppLogging_0);
    local v27 = l_useSelector_0(function(v26) --[[ Line: 48 ]]
        return v26.Startup.HomePageDataStatus;
    end);
    local v28 = v11.useSignalState(v12.getCacheStore().getHomePageDataSource);
    local v29 = false;
    if v22 == l_AppPage_0.Home then
        v29 = false;
        if v27 == l_RetrievalStatus_0.Done then
            v29 = v28 == "Cache";
        end;
    end;
    local v31 = v2.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v22 (copy), l_AppPage_0 (ref), v20 (copy), v19 (copy), v23 (copy), v24 (copy), l_OmniFeedConstants_0 (ref), v25 (copy), l_DiscoveryEventErrorLogger_0 (ref), v10 (ref)
        if v22 == l_AppPage_0.Home then
            return v20(v19(v23, v24, l_AppPage_0.Home, nil, nil, l_OmniFeedConstants_0.OmniRecommendationsRequestIntent.ManualRefresh, v25)):catch(function(v30) --[[ Line: 73 ]]
                -- upvalues: l_DiscoveryEventErrorLogger_0 (ref), v10 (ref)
                l_DiscoveryEventErrorLogger_0.reportError("ClientCacheFallbackBannerRefreshError", "Error refreshing omni recommendations");
                return v10.reject(v30);
            end);
        else
            l_DiscoveryEventErrorLogger_0.reportError("ClientCacheFallbackBannerRefreshError", "Current page is not the home page");
            return v10.reject();
        end;
    end, {
        v20, 
        v23, 
        v24, 
        v25, 
        v22
    });
    return {
        shouldShowBanner = v29, 
        onRefreshButtonClick = v31
    };
end;