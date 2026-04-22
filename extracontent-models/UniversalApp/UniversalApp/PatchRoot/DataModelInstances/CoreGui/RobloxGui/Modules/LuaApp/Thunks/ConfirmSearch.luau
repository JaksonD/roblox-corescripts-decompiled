local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v5 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_NavigateSideways_0 = v5.Thunks.NavigateSideways;
local l_Selectors_0 = v5.Selectors;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_SearchSourceEvent_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchSourceEvent;
local v11 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_OmniSearchSessionUtil_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Sessions.OmniSearchSessionUtil;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.SearchUuid);
local v16 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v17 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local v18 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v19 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v24(v21, v22, v23) --[[ Line: 60 ]] --[[ Name: navigateToSearch ]]
    -- upvalues: l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_NavigateSideways_0 (copy), l_AppPage_0 (copy)
    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer);
    v21:dispatch(l_NavigateSideways_0({
        name = l_AppPage_0.SearchPage, 
        key = tostring(v22), 
        detail = v22, 
        extraProps = {
            omniSearchInfo = v23
        }
    }, false));
end;
return function(v25, v26) --[[ Line: 73 ]]
    -- upvalues: l_SearchTypes_0 (copy), v15 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v18 (copy), v19 (copy), v11 (copy), l_OmniSearchSessionUtil_0 (copy), l_SearchSourceEvent_0 (copy), v16 (copy), l_SessionType_0 (copy), l_getAppFeaturePolicies_0 (copy), v24 (copy), v17 (copy), v20 (copy)
    return function(v27) --[[ Line: 74 ]]
        -- upvalues: v26 (copy), l_SearchTypes_0 (ref), v25 (ref), v15 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v18 (ref), v19 (ref), v11 (ref), l_OmniSearchSessionUtil_0 (ref), l_SearchSourceEvent_0 (ref), v16 (ref), l_SessionType_0 (ref), l_getAppFeaturePolicies_0 (ref), v24 (ref), v17 (ref), v20 (ref)
        local l_searchType_0 = v26.searchType;
        if v26.isAutocompleteSuggestion and l_searchType_0 == l_SearchTypes_0.Auto then
            l_searchType_0 = l_SearchTypes_0.Games;
        end;
        if v25 and #v25 > 1950 then
            v25 = string.sub(v25, 1, 1950);
        end;
        local v29 = v15();
        local v30 = v27:getState();
        local v31 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v30) else v30.Navigation.history[#v30.Navigation.history];
        v27:dispatch(v18(v29, l_searchType_0));
        v27:dispatch(v19(v29, {
            searchKeyword = v25, 
            isKeywordSuggestionEnabled = true
        }));
        if v11.isSearchTypeInOmniSearch(l_searchType_0) then
            local v32 = l_OmniSearchSessionUtil_0.generateUuid();
            l_OmniSearchSessionUtil_0.create(v26.sessionService, v32, v25, l_searchType_0, v29, l_SearchSourceEvent_0.ConfirmSearch);
            if l_searchType_0 ~= l_SearchTypes_0.Auto then
                local l_name_0 = v31[#v31].name;
                v16(v26.eventIngest, l_searchType_0, "search", v25, false, l_name_0);
            end;
            v26.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
            local v34 = {
                omniSearchUuid = v32, 
                searchKeyword = v25
            };
            if not l_getAppFeaturePolicies_0().getSearchWithoutNavigatingEnabled() then
                v24(v27, v29, v34);
                return;
            end;
        elseif l_searchType_0 == l_SearchTypes_0.Catalog then
            v26.topBarAnalytics.reportSearched("catalog", v25);
            if v26.isAvatarAutocompleteEnabled then
                v17(v26.eventIngest, "catalog", v25, v26.isAutocompleteSuggestion, v26.pageOwner, v26.allAutocompleteSuggestions);
            end;
            local v35 = {
                searchKeyword = v25
            };
            v20.navigateToSearch(v26.navigation, v29, v35);
        end;
    end;
end;