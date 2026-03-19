local l_Parent_0 = script:FindFirstAncestor("ChatLineReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
return function(v6) --[[ Line: 22 ]] --[[ Name: MockProviders ]]
    -- upvalues: l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_LayerCollectorProvider_0 (copy), v1 (copy), l_ProviderContainer_0 (copy)
    local v7 = {};
    table.insert(v7, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true
        }
    });
    table.insert(v7, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v9) --[[ Line: 36 ]] --[[ Name: Format ]]
                    return v9;
                end
            }
        }
    });
    table.insert(v7, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    return v1.createElement(l_ProviderContainer_0, {
        providers = v7
    }, v6.children);
end;