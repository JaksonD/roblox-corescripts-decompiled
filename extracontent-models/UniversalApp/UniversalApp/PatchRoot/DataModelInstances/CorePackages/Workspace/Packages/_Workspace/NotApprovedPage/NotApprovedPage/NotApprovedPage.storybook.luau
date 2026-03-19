local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dev.ReactRoblox);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v9 = require(l_Parent_0.Dev.RoactRodux);
local v10 = require(l_Parent_0.Rodux);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Dev.Style).StyleProviderWithDefaultTheme;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v13 = require(l_Parent_0.UniversalAppPolicy);
local l_AppFeaturePolicies_0 = v13.AppFeaturePolicies;
local l_RoactAppPolicy_0 = v13.RoactAppPolicy;
local l_ResponsiveProvider_0 = require(l_Parent_0.Responsive).ResponsiveProvider;
local l_Dictionary_0 = v2.Dictionary;
local function v19(v18) --[[ Line: 43 ]] --[[ Name: reducer ]]
    return v18 or {};
end;
local function v25(v20) --[[ Line: 47 ]] --[[ Name: MockProviders ]]
    -- upvalues: v10 (copy), v19 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Signal_0 (copy), l_LayerCollectorProvider_0 (copy), v9 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ResponsiveProvider_0 (copy), v3 (copy), l_ProviderContainer_0 (copy)
    local v21 = {};
    local v22 = v10.Store.new(v19, {}, {
        v10.thunkMiddleware
    });
    table.insert(v21, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v21, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v24) --[[ Line: 68 ]] --[[ Name: Format ]]
                    return v24;
                end, 
                changed = l_Signal_0.new()
            }
        }
    });
    table.insert(v21, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    table.insert(v21, {
        class = v9.StoreProvider, 
        props = {
            store = v22
        }
    });
    table.insert(v21, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0
            }
        }
    });
    table.insert(v21, {
        class = l_ResponsiveProvider_0, 
        props = {}
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v21
    }, v20.children);
end;
return {
    roact = v3, 
    reactRoblox = v4, 
    mapStory = function(v26) --[[ Line: 112 ]] --[[ Name: mapStory ]]
        -- upvalues: l_Dictionary_0 (copy), v3 (copy), v25 (copy), l_FoundationProvider_0 (copy)
        return function(v27) --[[ Line: 113 ]]
            -- upvalues: l_Dictionary_0 (ref), v3 (ref), v25 (ref), l_FoundationProvider_0 (ref), v26 (copy)
            local v28 = l_Dictionary_0.union(v27, v27.definition and v27.definition.props or {});
            return v3.createElement(v25, {}, {
                FoundationProvider = v3.createElement(l_FoundationProvider_0, {
                    theme = "Dark", 
                    preferences = v27.settings, 
                    overlayGui = v27.focus
                }, {
                    story = v3.createElement(v26, v28)
                })
            });
        end;
    end, 
    storyRoots = {
        l_script_FirstAncestor_0
    }
};