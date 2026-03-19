local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v3 = require(l_Parent_0.PurchasePromptDeps);
local l_Roact_0 = v3.Roact;
local l_Rodux_0 = v3.Rodux;
local l_RoactRodux_0 = v3.RoactRodux;
local l_LocaleProvider_0 = require(l_Parent_0.IAPExperience).Locale.LocaleProvider;
local v8 = require(l_script_FirstAncestor_0.Components.Connection.LayoutValuesProvider);
local v9 = require(l_script_FirstAncestor_0.Components.Connection.LocalizationContextProvider);
local v10 = require(l_script_FirstAncestor_0.Localization.getLocalizationContext);
local v11 = require(l_script_FirstAncestor_0.Reducers.Reducer);
local v12 = require(l_script_FirstAncestor_0.Services.LayoutValues);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local v14 = l_Roact_0.Component:extend("UnitTestContainer");
v14.init = function(v15) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), l_Rodux_0 (copy), v11 (copy), l_LocalizationService_0 (copy), v10 (copy)
    v15.layoutValues = v12.new(false).layout;
    v15.store = v15.props.overrideStore or l_Rodux_0.Store.new(v11, {});
    local v16 = v15.props.overrideLocale or l_LocalizationService_0.RobloxLocaleId;
    v15.localizationContext = v10(v16);
end;
v14.render = function(v17) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), l_RoactRodux_0 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v9 (copy), v8 (copy)
    local v18 = false;
    if v17.props[l_Roact_0.Children] ~= nil then
        v18 = #v17.props[l_Roact_0.Children] > 0;
    end;
    assert(v18, "UnitTestContainer: no children provided, nothing will be tested");
    return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
        store = v17.store
    }, {
        LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
            locale = l_LocalizationService_0.RobloxLocaleId
        }, {
            StyleProvider = l_Roact_0.createElement(l_StyleProviderWithDefaultTheme_0, {
                LocalizationContextProvider = l_Roact_0.createElement(v9, {
                    localizationContext = v17.localizationContext, 
                    render = function() --[[ Line: 48 ]] --[[ Name: render ]]
                        -- upvalues: l_Roact_0 (ref), v8 (ref), v17 (copy)
                        return l_Roact_0.createElement(v8, {
                            isTenFootInterface = false, 
                            render = function() --[[ Line: 51 ]] --[[ Name: render ]]
                                -- upvalues: l_Roact_0 (ref), v17 (ref)
                                return l_Roact_0.createElement("ScreenGui", {
                                    AutoLocalize = false, 
                                    IgnoreGuiInset = true
                                }, v17.props[l_Roact_0.Children]);
                            end
                        });
                    end
                })
            })
        })
    });
end;
return v14;