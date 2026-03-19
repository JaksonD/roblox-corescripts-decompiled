local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Foundation);
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.Roact);
local v7 = require(l_Parent_1.RoactRodux);
local v8 = require(l_Parent_1.Style);
local l_FoundationProvider_0 = v2.FoundationProvider;
local l_StyleProviderWithDefaultTheme_0 = v8.StyleProviderWithDefaultTheme;
local v11 = require(l_Parent_0.Context.CapturesContext);
local v12 = require(l_Parent_0.App.CapturesPolicy);
local v13 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Types);
return function(v15, v16) --[[ Line: 20 ]] --[[ Name: makeWrapWithProviders ]]
    -- upvalues: v5 (copy), v6 (copy), v7 (copy), v12 (copy), l_StyleProviderWithDefaultTheme_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), v11 (copy), l_FoundationProvider_0 (copy), v2 (copy), v13 (copy)
    local function v19(v17, v18) --[[ Line: 23 ]]
        -- upvalues: v5 (ref)
        if not v17 then
            return v18;
        else
            return v5.createElement("Folder", {
                Name = v17
            }, v18);
        end;
    end;
    return function(v20, v21, v22, v23) --[[ Line: 33 ]]
        -- upvalues: v6 (ref), v5 (ref), v7 (ref), v15 (copy), v12 (ref), l_StyleProviderWithDefaultTheme_0 (ref), l_LocalizationProvider_0 (ref), l_Localization_0 (ref), v16 (copy), v11 (ref), v19 (copy), l_FoundationProvider_0 (ref), v2 (ref), v13 (ref)
        return v6.mount(v5.createElement(v7.StoreProvider, {
            store = v15
        }, {
            PolicyProvider = v6.createElement(v12.Provider, {
                policy = {
                    v12.Mapper
                }
            }, {
                StyleProvider = v5.createElement(l_StyleProviderWithDefaultTheme_0, {
                    withDarkTheme = true
                }, {
                    LocalizationProvider = v6.createElement(l_LocalizationProvider_0, {
                        localization = l_Localization_0.new(v16.LocalizationService.RobloxLocaleId)
                    }, {
                        ContextProvider = v6.createElement(v11.Provider, {
                            value = v21
                        }, {
                            Portal = v6.createElement(v6.Portal, {
                                target = v20
                            }, v19(v23, {
                                FoundationProvider = v5.createElement(l_FoundationProvider_0, {
                                    theme = v2.Enums.Theme.Dark
                                }, {
                                    v22
                                })
                            }))
                        })
                    })
                })
            })
        }), nil, v13.ReactName);
    end;
end;