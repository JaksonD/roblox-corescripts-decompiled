local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceContainer");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_IXPService_0 = game:GetService("IXPService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v7 = require(l_script_FirstAncestor_0.Http.openWebview);
local v8 = require(l_Parent_0.RoactRodux);
local l_FetchingStatus_0 = require(l_Parent_0.Http).Reducers.FetchingStatus;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_Analytics_0 = require(l_Parent_0.Analytics).Analytics;
local l_requestInternalWrapper_0 = require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v18 = require(l_Parent_0.RoactAppExperiment);
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v23 = require(l_Parent_0.UIBlox);
local l_SelectionCursorProvider_0 = v23.App.SelectionImage.SelectionCursorProvider;
local l_CursorProvider_0 = v23.App.SelectionCursor.CursorProvider;
local v26 = require(l_Parent_0.Rodux);
local l_CountryCodeList_0 = require(l_Parent_0.AuthCommon).Reducers.CountryCodeList;
local v28 = require(l_Parent_0.Cryo);
local l_GetFFlagInExperienceContainerScreenSizeReducer_0 = require(l_Parent_0.SharedFlags).GetFFlagInExperienceContainerScreenSizeReducer;
local v30 = if l_GetFFlagInExperienceContainerScreenSizeReducer_0() then require(l_script_FirstAncestor_0.Actions.SetScreenSize) else nil;
local l_GetFFlagInExperienceContainerAppLinking_0 = require(l_Parent_0.SharedFlags).GetFFlagInExperienceContainerAppLinking;
local v32 = {
    reducer = {}
};
return function(v33) --[[ Line: 50 ]] --[[ Name: InExperienceProviderContainer ]]
    -- upvalues: v28 (copy), v32 (copy), v5 (copy), v26 (copy), l_CountryCodeList_0 (copy), l_FetchingStatus_0 (copy), l_GetFFlagInExperienceContainerScreenSizeReducer_0 (copy), v30 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v8 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v18 (copy), l_IXPService_0 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_RoactServices_0 (copy), l_RoactAnalytics_0 (copy), l_Analytics_0 (copy), l_RoactNetworking_0 (copy), l_requestInternalWrapper_0 (copy), l_HttpService_0 (copy), l_AppLinking_0 (copy), l_GetFFlagInExperienceContainerAppLinking_0 (copy), l_LinkingProtocol_0 (copy), l_SelectionCursorProvider_0 (copy), l_CursorProvider_0 (copy), l_ProviderContainer_0 (copy), v7 (copy)
    local v34 = v28.Dictionary.union(v32, v33);
    local v35 = v5.Children.only(v34.children);
    local v36 = {
        v26.thunkMiddleware
    };
    local v41 = v26.Store.new(v26.combineReducers(v28.Dictionary.join({
        CountryCodeList = l_CountryCodeList_0, 
        FetchingStatus = l_FetchingStatus_0, 
        ScreenSize = if l_GetFFlagInExperienceContainerScreenSizeReducer_0() then v26.createReducer(Vector2.new(400, 400), {
            [v30.name] = function(_, v38) --[[ Line: 64 ]]
                return v38.screenSize;
            end
        }) else function(_, _) --[[ Line: 68 ]]
            return Vector2.new(400, 400);
        end
    }, v34.reducer)), nil, v36);
    local v42 = {};
    table.insert(v42, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v42, {
        class = v8.StoreProvider, 
        props = {
            store = v41
        }
    });
    table.insert(v42, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }
    });
    table.insert(v42, {
        class = v18.Provider, 
        props = {
            value = l_IXPService_0
        }
    });
    table.insert(v42, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0
            }
        }
    });
    table.insert(v42, {
        class = l_RoactServices_0.ServiceProvider, 
        props = {
            services = {
                [l_RoactAnalytics_0] = l_Analytics_0.new(), 
                [l_RoactNetworking_0] = l_requestInternalWrapper_0(l_HttpService_0), 
                [l_AppLinking_0] = if l_GetFFlagInExperienceContainerAppLinking_0() then l_LinkingProtocol_0.default else nil
            }
        }
    });
    table.insert(v42, {
        class = l_SelectionCursorProvider_0
    });
    table.insert(v42, {
        class = l_CursorProvider_0
    });
    return v5.createElement(l_ProviderContainer_0, {
        providers = v42
    }, {
        Child = v5.cloneElement(v35, {
            showWebpage = v7
        })
    });
end;