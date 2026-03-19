local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Provider_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_0.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = require(l_Parent_0.Roact);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local l_FFlagChatLineReportingFocusFixesEnabled_0 = require(l_Parent_0.SharedFlags).FFlagChatLineReportingFocusFixesEnabled;
local v13 = require(l_script_FirstAncestor_0.Components.ChatLineReportStepHandler);
local l_FoundationProvider_0 = require(l_Parent_0.Foundation).FoundationProvider;
local v15 = nil;
local v16 = nil;
local function v17() --[[ Line: 28 ]]
    -- upvalues: v16 (ref), v9 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v15 (ref)
    if v16 then
        v9.unmount(v16);
        if l_FFlagChatLineReportingFocusFixesEnabled_0 then
            v15:teardown();
        end;
    end;
end;
return {
    initialize = function(v18) --[[ Line: 38 ]]
        -- upvalues: v7 (copy), l_LayerCollectorProvider_0 (copy), v9 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), l_FoundationProvider_0 (copy), l_StyleProviderWithDefaultTheme_0 (copy), v13 (copy), v17 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v15 (ref), v8 (copy), v16 (ref), l_Provider_0 (copy), l_CoreGui_0 (copy)
        local v19 = v7.createElement("ScreenGui", {
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, {
            LayerCollector = v7.createElement(l_LayerCollectorProvider_0, {}, {
                LocalizationProvider = v9.createElement(l_LocalizationProvider_0, {
                    localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
                }, {
                    FoundationProvider = v7.createElement(l_FoundationProvider_0, {
                        theme = "Dark"
                    }, {
                        StyleProvider = v7.createElement(l_StyleProviderWithDefaultTheme_0, {
                            withDarkTheme = true
                        }, {
                            ChatLineReportStepHandler = v7.createElement(v13, {
                                unmount = v17, 
                                messages = v18
                            })
                        })
                    })
                })
            })
        });
        if l_FFlagChatLineReportingFocusFixesEnabled_0 then
            v15 = v8.FocusNavigationService.new(v8.EngineInterface.CoreGui);
            v16 = v9.mount(v7.createElement(v8.FocusNavigationContext.Provider, {
                value = v15
            }, {
                FocusNavigationRegistryProvider = v7.createElement(l_Provider_0, nil, {
                    ChatLineReportRoot = v19
                })
            }), l_CoreGui_0, "ChatLineReportRoot");
            return;
        else
            v16 = v9.mount(v19, l_CoreGui_0, "ChatLineReportRoot");
            return;
        end;
    end
};