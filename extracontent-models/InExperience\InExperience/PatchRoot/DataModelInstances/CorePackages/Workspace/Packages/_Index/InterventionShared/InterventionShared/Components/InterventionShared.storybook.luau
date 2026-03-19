local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.Dev.RobloxAppUIBloxConfig);
v1.init(v2);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.Cryo);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local l_LayerCollectorProvider_0 = v1.Core.Layout.LayerCollector.LayerCollectorProvider;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local function v16(v12) --[[ Line: 28 ]] --[[ Name: MockProviders ]]
    -- upvalues: l_FoundationProvider_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Signal_0 (copy), l_LayerCollectorProvider_0 (copy), v3 (copy), l_ProviderContainer_0 (copy)
    local v13 = {};
    table.insert(v13, {
        class = l_FoundationProvider_0, 
        props = {}
    });
    table.insert(v13, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = true, 
            withUiModeSupport = false
        }
    });
    table.insert(v13, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v15) --[[ Line: 48 ]] --[[ Name: Format ]]
                    return v15;
                end, 
                changed = l_Signal_0.new()
            }
        }
    });
    table.insert(v13, {
        class = l_LayerCollectorProvider_0, 
        props = {}
    });
    return v3.createElement(l_ProviderContainer_0, {
        providers = v13
    }, v12.children);
end;
return {
    roact = v4, 
    mapStory = function(v17) --[[ Line: 68 ]] --[[ Name: mapStory ]]
        -- upvalues: v4 (copy), v16 (copy), v5 (copy)
        return function(v18) --[[ Line: 69 ]]
            -- upvalues: v4 (ref), v16 (ref), v17 (copy), v5 (ref)
            local v19 = v18 and v18.definition and v18.definition.props or {};
            return v4.createElement(v16, {}, {
                story = v4.createElement(v17, v5.Dictionary.union(v19, v18))
            });
        end;
    end
};