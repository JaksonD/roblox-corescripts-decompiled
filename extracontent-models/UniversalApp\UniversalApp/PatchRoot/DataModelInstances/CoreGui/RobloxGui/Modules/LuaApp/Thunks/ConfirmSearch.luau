local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_NavigateSideways_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateSideways;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_SearchSourceEvent_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchSourceEvent;
local v8 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_OmniSearchSessionUtil_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Sessions.OmniSearchSessionUtil;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v12 = require(l_Modules_0.LuaApp.SearchUuid);
local v13 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v14 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local v15 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v16 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local function v21(v18, v19, v20) --[[ Line: 57 ]] --[[ Name: navigateToSearch ]]
    -- upvalues: l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_NavigateSideways_0 (copy), l_AppPage_0 (copy)
    l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer);
    v18:dispatch(l_NavigateSideways_0({
        name = l_AppPage_0.SearchPage, 
        key = tostring(v19), 
        detail = v19, 
        extraProps = {
            omniSearchInfo = v20
        }
    }, false));
end;
return function(v22, v23) --[[ Line: 70 ]]
    -- upvalues: l_SearchTypes_0 (copy), v12 (copy), v15 (copy), v16 (copy), v8 (copy), l_OmniSearchSessionUtil_0 (copy), l_SearchSourceEvent_0 (copy), v13 (copy), l_SessionType_0 (copy), l_getAppFeaturePolicies_0 (copy), v21 (copy), v14 (copy), v17 (copy)
    return function(v24) --[[ Line: 71 ]]
        -- upvalues: v23 (copy), l_SearchTypes_0 (ref), v22 (ref), v12 (ref), v15 (ref), v16 (ref), v8 (ref), l_OmniSearchSessionUtil_0 (ref), l_SearchSourceEvent_0 (ref), v13 (ref), l_SessionType_0 (ref), l_getAppFeaturePolicies_0 (ref), v21 (ref), v14 (ref), v17 (ref)
        local l_searchType_0 = v23.searchType;
        if v23.isAutocompleteSuggestion and l_searchType_0 == l_SearchTypes_0.Auto then
            l_searchType_0 = l_SearchTypes_0.Games;
        end;
        if v22 and #v22 > 1950 then
            v22 = string.sub(v22, 1, 1950);
        end;
        local v26 = v12();
        local v27 = v24:getState();
        local v28 = v27.Navigation.history[#v27.Navigation.history];
        v24:dispatch(v15(v26, l_searchType_0));
        v24:dispatch(v16(v26, {
            searchKeyword = v22, 
            isKeywordSuggestionEnabled = true
        }));
        if v8.isSearchTypeInOmniSearch(l_searchType_0) then
            local v29 = l_OmniSearchSessionUtil_0.generateUuid();
            l_OmniSearchSessionUtil_0.create(v23.sessionService, v29, v22, l_searchType_0, v26, l_SearchSourceEvent_0.ConfirmSearch);
            if l_searchType_0 ~= l_SearchTypes_0.Auto then
                local l_name_0 = v28[#v28].name;
                v13(v23.eventIngest, l_searchType_0, "search", v22, false, l_name_0);
            end;
            v23.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
            local v31 = {
                omniSearchUuid = v29, 
                searchKeyword = v22
            };
            if not l_getAppFeaturePolicies_0().getSearchWithoutNavigatingEnabled() then
                v21(v24, v26, v31);
                return;
            end;
        elseif l_searchType_0 == l_SearchTypes_0.Catalog then
            v23.topBarAnalytics.reportSearched("catalog", v22);
            if v23.isAvatarAutocompleteEnabled then
                v14(v23.eventIngest, "catalog", v22, v23.isAutocompleteSuggestion, v23.pageOwner, v23.allAutocompleteSuggestions);
            end;
            local v32 = {
                searchKeyword = v22
            };
            v17.navigateToSearch(v23.navigation, v26, v32);
        end;
    end;
end;