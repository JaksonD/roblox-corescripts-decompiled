local l_Parent_0 = script:FindFirstAncestor("SingleSignOn").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v8 = require(l_Parent_0.Foundation);
local l_Text_0 = v8.Text;
local l_View_0 = v8.View;
local l_Progress_0 = v8.Progress;
local l_ProgressShape_0 = v8.Enums.ProgressShape;
local l_ProgressSize_0 = v8.Enums.ProgressSize;
local l_Button_0 = v8.Button;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_ButtonSize_0 = v8.Enums.ButtonSize;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_ThirdPartySwitchAccountComponent_0 = require(l_Parent_0.AuthCommon).Components.ThirdPartySwitchAccountComponent;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local v20 = game:DefineFastInt("SingleSignOnErrorAntiSpamDelaySeconds", 5);
return function(v21) --[[ Line: 33 ]] --[[ Name: SingleSignOnError ]]
    -- upvalues: l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), l_useDesignTokens_0 (copy), v1 (copy), l_useNavigation_0 (copy), v20 (copy), l_ThirdPartyUserService_0 (copy), l_TelemetryConfigs_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_Progress_0 (copy), l_ProgressShape_0 (copy), l_ProgressSize_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), l_AppPage_0 (copy), l_ThirdPartySwitchAccountComponent_0 (copy)
    local v22 = l_useLocalization_0({
        message = "CommonUI.Features.Labels.ServerCommunicationError", 
        retry = "CommonUI.Features.Labels.Retry"
    });
    local v23 = l_useRoactService_0(l_AppLogging_0);
    local v24 = l_useDesignTokens_0();
    local v25, v26 = v1.useState(false);
    local v27 = l_useNavigation_0();
    local l_v20_0 = v20;
    local v29 = if v21.isAccountSwitchingSupported ~= nil then v21.isAccountSwitchingSupported else l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:IsAccountSwitchingSupported();
    local v30 = if v21.thirdPartyUserName ~= nil then v21.thirdPartyUserName else l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0:GetUserPlatformName();
    v1.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: l_v20_0 (copy), v26 (copy)
        if l_v20_0 > 0 then
            task.delay(l_v20_0, function() --[[ Line: 55 ]]
                -- upvalues: v26 (ref)
                v26(true);
            end);
            return;
        else
            v26(true);
            return;
        end;
    end, {
        v26, 
        l_v20_0
    });
    v1.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v23 (copy), l_TelemetryConfigs_0 (ref)
        v23:logEventOnce("single_sign_on_error_did_mount");
        v23:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SingleSignOnErrorMountTelemetryConfig, 1);
    end, {
        v23
    });
    return v1.createElement(l_View_0, {
        tag = "size-full"
    }, {
        Background = if v21.renderBackground then v21.renderBackground() else nil, 
        Content = v1.createElement(l_View_0, {
            Size = UDim2.fromOffset(v24.LuaApps.LandingPage.buttonWidth, 0), 
            tag = "col anchor-center-center position-center-center gap-xxlarge align-x-center auto-y"
        }, {
            ErrorMessage = v1.createElement(l_Text_0, {
                LayoutOrder = 1, 
                tag = "size-full-0 text-align-x-center auto-y", 
                Text = v22.message
            }), 
            ActionContainer = v1.createElement(l_View_0, {
                tag = "size-full-0 auto-xy", 
                LayoutOrder = 2
            }, {
                ProgressIndicator = if not v25 then v1.createElement(l_View_0, {
                    tag = "col size-full auto-xy align-x-center align-y-center"
                }, {
                    Progress = v1.createElement(l_Progress_0, {
                        shape = l_ProgressShape_0.Circle, 
                        size = l_ProgressSize_0.Large
                    })
                }) else nil, 
                ButtonContainer = v1.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y gap-xxlarge"
                }, {
                    LogInButton = v1.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        isDisabled = not v25, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_ButtonSize_0.Large, 
                        tag = "size-full-0 auto-y", 
                        text = v22.retry, 
                        onActivated = function() --[[ Line: 106 ]] --[[ Name: onActivated ]]
                            -- upvalues: v23 (copy), l_TelemetryConfigs_0 (ref), v27 (copy), l_AppPage_0 (ref)
                            v23:logEventOnce("single_sign_on_error_retry");
                            v23:logRobloxTelemetryCounter(l_TelemetryConfigs_0.SingleSignOnErrorRetryButtonClickedConfig, 1);
                            v27.replace(l_AppPage_0.SingleSignOnContainer);
                        end, 
                        width = UDim.new(1, 0)
                    }), 
                    ThirdPartySwitchAccountComponent = if v29 then v1.createElement(l_ThirdPartySwitchAccountComponent_0, {
                        layoutOrder = 2, 
                        isDisabled = not v25, 
                        dividerTextKey = "CommonUI.Features.Labels.With", 
                        thirdPartyUserName = v30
                    }) else nil
                })
            })
        })
    });
end;