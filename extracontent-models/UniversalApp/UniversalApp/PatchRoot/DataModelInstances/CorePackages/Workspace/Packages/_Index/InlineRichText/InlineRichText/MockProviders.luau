local l_Parent_0 = script:FindFirstAncestor("InlineRichText").Parent;
local v1 = require(l_Parent_0.React);
local l_ProviderContainer_0 = require(l_Parent_0.RoactUtils).Components.ProviderContainer;
local v3 = require(l_Parent_0.Style);
local l_StyleProviderWithDefaultTheme_0 = v3.StyleProviderWithDefaultTheme;
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.Rodux);
local v8 = require(l_Parent_0.RoactRodux);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v10 = require(l_Parent_0.NavigationRodux);
local v11 = {
    withUiModeSupport = false
};
return function(v12) --[[ Line: 31 ]] --[[ Name: MockProviders ]]
    -- upvalues: v6 (copy), v11 (copy), l_FoundationProvider_0 (copy), v8 (copy), v7 (copy), v10 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v3 (copy), l_LocalizationProvider_0 (copy), v1 (copy), l_ProviderContainer_0 (copy)
    local v13 = v6.Dictionary.union(v11, v12);
    local v14 = {};
    table.insert(v14, {
        class = l_FoundationProvider_0, 
        props = {
            device = "Desktop", 
            theme = v13.themeName
        }
    });
    table.insert(v14, {
        class = v8.StoreProvider, 
        props = {
            store = v7.Store.new(function(v15, _) --[[ Line: 47 ]]
                return v15;
            end, {
                Navigation = {
                    lockNavigationActions = false
                }
            }, {
                v7.thunkMiddleware, 
                v10.Thunks.RNAdapterThunk.middleware(function(v17) --[[ Line: 55 ]]
                    print((("[Mock Providers Debug] Navigating to %* with detail %*"):format(v17.routeName, v17.params.detail)));
                end)
            })
        }
    });
    table.insert(v14, {
        class = l_StyleProviderWithDefaultTheme_0, 
        props = {
            withDarkTheme = v13.themeName ~= "Light", 
            withUiModeSupport = v13.withUiModeSupport
        }
    });
    table.insert(v14, {
        class = v3.DesignTokenProvider, 
        props = {
            tokenMappers = {}
        }
    });
    table.insert(v14, {
        class = l_LocalizationProvider_0, 
        props = {
            localization = {
                Format = function(_, v19) --[[ Line: 81 ]] --[[ Name: Format ]]
                    return v19;
                end
            }
        }
    });
    return v1.createElement(l_ProviderContainer_0, {
        providers = v14
    }, v13.children);
end;