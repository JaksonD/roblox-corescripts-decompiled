local _ = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.PurchasePromptDeps);
local v5 = require(l_Parent_0.LoggingProtocol);
local l_Roact_0 = v4.Roact;
local _ = v4.Rodux;
local l_RoactRodux_0 = v4.RoactRodux;
local _ = v4.UIBlox.Style.Provider;
local l_LocaleProvider_0 = require(l_Parent_0.IAPExperience).Locale.LocaleProvider;
local l_Toast_0 = require(l_Parent_0.ToastLite).Components.Toast;
local _ = require(l_script_FirstAncestor_0.Reducers.Reducer);
local _ = require(l_script_FirstAncestor_0.Services.ABTest);
local _ = require(l_script_FirstAncestor_0.Services.Network);
local _ = require(l_script_FirstAncestor_0.Services.Analytics);
local _ = require(l_script_FirstAncestor_0.Services.PlatformInterface);
local v17 = require(l_script_FirstAncestor_0.Services.ExternalSettings);
local _ = require(l_script_FirstAncestor_0.Thunk);
local v19 = require(script.Parent.Connection.EventConnections);
local v20 = require(script.Parent.Connection.LayoutValuesProvider);
local v21 = require(script.Parent.Connection.provideRobloxLocale);
local v22 = require(l_script_FirstAncestor_0.Components.Connection.PurchasePromptPolicy);
local v23 = require(script.Parent.ProductPurchase.ProductPurchaseContainer);
local v24 = require(script.Parent.RobuxUpsell.RobuxUpsellContainer);
local v25 = require(script.Parent.PremiumUpsell.PremiumUpsellContainer);
local v26 = require(script.Parent.SubscriptionPurchase.SubscriptionPurchaseContainer);
local v27 = require(script.Parent.Connection.renderWithCoreScriptsStyleProvider);
local v28 = require(l_script_FirstAncestor_0.Events.FocusNavigationOptimizationTelemetry);
local l_SelectionCursorProvider_0 = require(l_Parent_0.UIBlox).App.SelectionImage.SelectionCursorProvider;
local v30 = require(l_Parent_0.ReactFocusNavigation);
local v31 = v30.FocusNavigationService.new(v30.EngineInterface.CoreGui);
local v32 = require(l_Parent_0.FocusNavigationUtils);
local l_Provider_1 = v32.FocusNavigableSurfaceRegistry.Provider;
local l_FocusRoot_0 = v32.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v32.FocusNavigableSurfaceIdentifierEnum;
local v36 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableToastLiteRender);
local v37 = require(l_Parent_0.SharedFlags);
local l_FFlagAddCursorProviderToPurchasePromptApp_0 = v37.FFlagAddCursorProviderToPurchasePromptApp;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = v37.FFlagPurchasePromptSubtitleForTimedOptions;
local v40 = require(l_script_FirstAncestor_0.Enums.RequestType);
local v41 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v42 = game:DefineFastFlag("PurchasePromptAppConditionalFocusNavigation", false);
local v43 = game:DefineFastFlag("PurchasePromptAppTrackRenderPerformance", false);
local v44 = game:DefineFastFlag("PurchasePromptAppFixStyleLink", false);
local v45 = l_Roact_0.Component:extend("PurchasePromptApp");
v45.init = function(v46) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v46.state = {
        isTenFootInterface = v17.new().isTenFootInterface()
    };
    v46.renderCount = 0;
    v46.lastRenderTime = 0;
end;
v45.hasAnyActivePrompt = function(v47) --[[ Line: 76 ]] --[[ Name: hasAnyActivePrompt ]]
    -- upvalues: v42 (copy), v41 (copy), v40 (copy)
    if not v42 then
        return true;
    elseif not v47.props.store then
        return false;
    else
        local v48 = v47.props.store:getState();
        local l_promptState_0 = v48.promptState;
        local l_requestType_0 = v48.promptRequest.requestType;
        local v51 = false;
        if l_promptState_0 == v41.None then
            v51 = l_requestType_0 == v40.None;
        end;
        return not v51;
    end;
end;
v45.trackRenderPerformance = function(v52) --[[ Line: 95 ]] --[[ Name: trackRenderPerformance ]]
    -- upvalues: v43 (copy), v5 (copy), v28 (copy), v42 (copy)
    if not v43 then
        return;
    else
        v52.renderCount = v52.renderCount + 1;
        local v53 = tick();
        local v54 = v53 - v52.lastRenderTime;
        if v52.renderCount > 1 then
            local v55 = v54 * 1000;
            v5.default:logRobloxTelemetryStat(v28.RerenderTimingStat, v55, {
                optimizationEnabled = tostring(v42)
            });
        end;
        v52.lastRenderTime = v53;
        return;
    end;
end;
v45.renderWithStyle = function(_, v57) --[[ Line: 119 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v27 (copy)
    return v27(v57);
end;
v45.render = function(v58) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), l_Roact_0 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), v23 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy), v24 (copy), v25 (copy), v26 (copy), v19 (copy), v36 (copy), l_Toast_0 (copy), l_FFlagAddCursorProviderToPurchasePromptApp_0 (copy), v44 (copy), l_SelectionCursorProvider_0 (copy), v30 (copy), v31 (copy), l_Provider_1 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_RoactRodux_0 (copy), v20 (copy), v22 (copy)
    return v21(function() --[[ Line: 124 ]]
        -- upvalues: l_Roact_0 (ref), l_LocaleProvider_0 (ref), l_LocalizationService_0 (ref), v23 (ref), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (ref), v58 (copy), v24 (ref), v25 (ref), v26 (ref), v19 (ref), v36 (ref), l_Toast_0 (ref), l_FFlagAddCursorProviderToPurchasePromptApp_0 (ref), v44 (ref), l_SelectionCursorProvider_0 (ref), v30 (ref), v31 (ref), l_Provider_1 (ref), l_FocusRoot_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_RoactRodux_0 (ref), v20 (ref), v22 (ref)
        local v59 = {
            LocaleProvider = l_Roact_0.createElement(l_LocaleProvider_0, {
                locale = l_LocalizationService_0.RobloxLocaleId
            }, {
                ProductPurchaseContainer = l_Roact_0.createElement(v23, {
                    subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v58.props.subtitleView else nil
                }), 
                RobuxUpsellContainer = l_Roact_0.createElement(v24), 
                PremiumUpsellContainer = l_Roact_0.createElement(v25), 
                SubscriptionPurchaseContainer = l_Roact_0.createElement(v26)
            }), 
            EventConnections = l_Roact_0.createElement(v19), 
            Toast = if v36() then l_Roact_0.createElement(l_Toast_0) else nil
        };
        local v60 = l_FFlagAddCursorProviderToPurchasePromptApp_0 and v58:hasAnyActivePrompt();
        if v44 then
            v59 = l_Roact_0.createElement("Folder", nil, v59);
        end;
        if v60 then
            v58:trackRenderPerformance();
            v59 = {
                CursorProvider = l_Roact_0.createElement(l_SelectionCursorProvider_0, {}, {
                    FocusNavigationProvider = l_Roact_0.createElement(v30.FocusNavigationContext.Provider, {
                        value = v31
                    }, {
                        FocusNavigationRegistryProvider = l_Roact_0.createElement(l_Provider_1, nil, {
                            FocusNavigationCoreScriptsWrapper = l_Roact_0.createElement(l_FocusRoot_0, {
                                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
                                isIsolated = true, 
                                isAutoFocusRoot = true
                            }, v59)
                        })
                    })
                })
            };
        end;
        return l_Roact_0.createElement(l_RoactRodux_0.StoreProvider, {
            store = v58.props.store
        }, {
            StyleProvider = v58:renderWithStyle({
                LayoutValuesProvider = l_Roact_0.createElement(v20, {
                    isTenFootInterface = v58.state.isTenFootInterface
                }, {
                    PolicyProvider = l_Roact_0.createElement(v22.Provider, {
                        policy = {
                            v22.Mapper
                        }
                    }, v59)
                })
            })
        });
    end);
end;
return v45;