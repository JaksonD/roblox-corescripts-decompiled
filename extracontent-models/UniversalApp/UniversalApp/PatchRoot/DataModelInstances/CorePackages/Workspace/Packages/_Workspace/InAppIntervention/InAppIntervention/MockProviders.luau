local l_Parent_0 = script:FindFirstAncestor("InAppIntervention").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Rodux);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v8 = require(l_Parent_0.RoactRodux);
local function v10(v9) --[[ Line: 26 ]] --[[ Name: staticReducer ]]
    return v9;
end;
return function(v11) --[[ Line: 30 ]] --[[ Name: MockProviders ]]
    -- upvalues: v8 (copy), v2 (copy), v10 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_LayerCollectorProvider_0 (copy), l_FoundationProvider_0 (copy), v1 (copy), l_ProviderContainer_0 (copy)
    local v12 = {};
    table.insert(v12, {
        class = v8.StoreProvider, 
        props = {
            store = v2.Store.new(v10, {
                ScreenSize = Vector2.new(2400, 1800)
            }, {
                v2.thunkMiddleware
            })
        }
    });
    table.insert(v12, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v12, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v14) --[[ Line: 51 ]] --[[ Name: Format ]]
                    return v14;
                end
            }
        }
    });
    table.insert(v12, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    table.insert(v12, {
        class = l_FoundationProvider_0, 
        props = {
            theme = "Dark"
        }
    });
    return v1.createElement(l_ProviderContainer_0, {
        providers = v12
    }, v11.children);
end;