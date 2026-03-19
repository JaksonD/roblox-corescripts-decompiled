local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local v2 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local v7 = require(l_Parent_0.RoactNavigation);
local v8 = require(l_Parent_0.RoactRodux);
local v9 = require(l_Parent_0.Rodux);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v11 = {
    state = {
        params = {}, 
        routeName = "", 
        key = ""
    }, 
    dispatch = function() --[[ Line: 34 ]] --[[ Name: dispatch ]]

    end, 
    goBack = function() --[[ Line: 35 ]] --[[ Name: goBack ]]

    end, 
    addListener = function() --[[ Line: 36 ]] --[[ Name: addListener ]]
        return {
            remove = function() --[[ Line: 38 ]] --[[ Name: remove ]]

            end
        };
    end, 
    isFocused = function() --[[ Line: 41 ]] --[[ Name: isFocused ]]

    end, 
    setParams = function() --[[ Line: 42 ]] --[[ Name: setParams ]]

    end, 
    getParam = function() --[[ Line: 43 ]] --[[ Name: getParam ]]

    end, 
    replace = function() --[[ Line: 44 ]] --[[ Name: replace ]]

    end, 
    push = function() --[[ Line: 45 ]] --[[ Name: push ]]

    end
};
local function v13(v12) --[[ Line: 48 ]] --[[ Name: reducer ]]
    return v12;
end;
return function(v14) --[[ Line: 52 ]] --[[ Name: MockProviders ]]
    -- upvalues: v9 (copy), v13 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_LayerCollectorProvider_0 (copy), v7 (copy), v11 (copy), v8 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), v2 (copy), l_ProviderContainer_0 (copy)
    local v15 = {};
    local v16 = v9.Store.new(v13, {}, {
        v9.thunkMiddleware
    });
    table.insert(v15, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v15, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v18) --[[ Line: 70 ]] --[[ Name: Format ]]
                    return v18;
                end
            }
        }
    });
    table.insert(v15, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    table.insert(v15, {
        class = v7.Provider, 
        props = {
            value = v11
        }
    });
    table.insert(v15, {
        class = v8.StoreProvider, 
        props = {
            store = v16
        }
    });
    table.insert(v15, {
        class = l_RoactAppPolicy_0.Provider, 
        props = {
            policy = {
                l_AppFeaturePolicies_0
            }
        }
    });
    return v2.createElement(l_ProviderContainer_0, {
        providers = v15
    }, v14.children);
end;