local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_Parent_0.SharedFlags);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Sheet_0 = v3.Sheet;
local l_Toggle_0 = v3.Toggle;
local l_View_0 = v3.View;
local v14 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local v20 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local v21 = require(l_script_FirstAncestor_0.BeduiV2.Api.userBlock);
local l_blockUser_0 = v21.blockUser;
local l_isBlockedUser_0 = v21.isBlockedUser;
local l_TelemetryEventType_0 = v15.TelemetryEventType;
local l_unblockUser_0 = v21.unblockUser;
local l_useAbuseReportAnalytics_0 = v14.useAbuseReportAnalytics;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v6.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v6.FFlagSupportSubmissionOnAllReportNodes;
local function v42(v29) --[[ Line: 70 ]] --[[ Name: useBlockToggle ]]
    -- upvalues: v4 (copy), l_useAbuseReportAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_isBlockedUser_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), l_unblockUser_0 (copy), l_blockUser_0 (copy)
    local v30, v31 = v4.useState(v29 and "Loading" or "Hidden");
    local v32, v33 = v4.useState(false);
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    v4.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v29 (copy), l_isBlockedUser_0 (ref), v35 (copy), v31 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref)
        if v29 and v29.userId then
            l_isBlockedUser_0(v35, v29.userId):andThen(function(v36) --[[ Line: 80 ]]
                -- upvalues: v31 (ref)
                local l_responseBody_0 = v36.responseBody;
                v31(l_responseBody_0 and "Hidden" or "Visible");
            end):catch(function(v38) --[[ Line: 84 ]]
                -- upvalues: v31 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v31("Hidden");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "isBlockedUser: " .. v2.pretty(v38, {
                            depth = 10
                        })
                    }
                });
            end);
            l_sendEvent_0({
                sub_event_type = l_TelemetryEventType_0.IsUserBlockAvailable
            });
            return;
        else
            v31("Hidden");
            return;
        end;
    end, {
        v29 and v29.userId, 
        l_sendEvent_0, 
        v35
    });
    local v41 = v4.useCallback(function() --[[ Line: 99 ]]
        -- upvalues: v29 (copy), v32 (copy), l_unblockUser_0 (ref), v35 (copy), v33 (copy), v31 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref), l_blockUser_0 (ref)
        if v29 == nil or v29.userId == nil then
            return;
        elseif v32 then
            l_unblockUser_0(v35, v29.userId):andThen(function() --[[ Line: 106 ]]
                -- upvalues: v33 (ref)
                v33(false);
            end):catch(function(v39) --[[ Line: 109 ]]
                -- upvalues: v31 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v31("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "unblockUser: " .. v2.pretty(v39, {
                            depth = 10
                        })
                    }
                });
            end);
            l_sendEvent_0({
                sub_event_type = l_TelemetryEventType_0.DidUnblockUser
            });
            return;
        else
            l_blockUser_0(v35, v29.userId):andThen(function() --[[ Line: 121 ]]
                -- upvalues: l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v33 (ref)
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.DidBlockUser
                });
                v33(true);
            end):catch(function(v40) --[[ Line: 125 ]]
                -- upvalues: v31 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v31("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "blockUser: " .. v2.pretty(v40, {
                            depth = 10
                        })
                    }
                });
            end);
            return;
        end;
    end, {
        l_sendEvent_0, 
        v35, 
        v29 and v29.userId, 
        v32
    });
    return {
        blockToggleState = v30, 
        handleBlockToggleChange = v41, 
        isBlocked = v32
    };
end;
return v4.memo(function(v43) --[[ Line: 148 ]] --[[ Name: ConfirmationNode ]]
    -- upvalues: l_useArTranslation_0 (copy), v20 (copy), l_useAbuseReportAnalytics_0 (copy), v42 (copy), v4 (copy), l_TelemetryEventType_0 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v16 (copy), v17 (copy), l_View_0 (copy), l_Toggle_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v45 = v20();
    local l_sendEvent_1 = l_useAbuseReportAnalytics_0().sendEvent;
    local l_blockToggle_0 = v43.blockToggle;
    local v48 = v42(l_blockToggle_0);
    local l_blockToggleState_0 = v48.blockToggleState;
    local l_handleBlockToggleChange_0 = v48.handleBlockToggleChange;
    local l_isBlocked_0 = v48.isBlocked;
    v4.useEffect(function() --[[ Line: 160 ]]
        -- upvalues: v43 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v43.helpline and v43.helpline.href then
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineShown
            });
        end;
    end, {
        v43.helpline and v43.helpline.href, 
        l_sendEvent_1
    });
    local v52 = v4.useCallback(function() --[[ Line: 166 ]]
        -- upvalues: v43 (copy)
        if v43.onNext then
            v43.onNext();
        end;
    end, {
        v43.onNext
    });
    local v53 = v4.useCallback(function() --[[ Line: 173 ]]
        -- upvalues: v43 (copy), v45 (copy), l_translateIntoString_0 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v43.helpline and v43.helpline.href then
            v45(l_translateIntoString_0(v43.helpline.heading or ""), v43.helpline.href);
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineOpened
            });
        end;
    end, {
        v43.helpline and v43.helpline.href, 
        v45, 
        l_translateIntoString_0, 
        v43.helpline and v43.helpline.heading, 
        l_sendEvent_1
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(l_Sheet_0.Content, nil, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v4.createElement(v16, {
                eyebrow = v43.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v4.createElement(v17, {
                input = v43.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            Message = v4.createElement(v17, {
                input = v43.message, 
                tag = "size-full-0 auto-y text-body-small", 
                layoutOrder = 2
            }), 
            ToggleContainer = if v43.blockToggle and l_blockToggleState_0 == "Visible" then v4.createElement(l_View_0, {
                onActivated = l_handleBlockToggleChange_0, 
                tag = "size-full-0 auto-y col padding-large radius-medium gap-xsmall bg-action-standard", 
                LayoutOrder = 3
            }, {
                TextContainer = v4.createElement(l_View_0, {
                    tag = "auto-y size-full-0 row gap-small flex-x-between", 
                    LayoutOrder = 1
                }, {
                    Label = v4.createElement(v17, {
                        input = v43.blockToggle.label or "", 
                        tag = "text-title-large content-emphasis auto-xy", 
                        layoutOrder = 1
                    }), 
                    Toggle = v4.createElement(l_Toggle_0, {
                        isChecked = l_isBlocked_0, 
                        onActivated = l_handleBlockToggleChange_0, 
                        label = "", 
                        Selectable = false, 
                        LayoutOrder = 2
                    })
                }), 
                Description = if v43.blockToggle.description then v4.createElement(v17, {
                    input = v43.blockToggle.description or "", 
                    tag = "text-body-small auto-xy text-wrap", 
                    layoutOrder = 2
                }) else nil
            }) else nil, 
            Error = if l_blockToggleState_0 == "Error" and v43.blockToggle then v4.createElement(v17, {
                input = v43.blockToggle.errorLabel or "", 
                tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left", 
                layoutOrder = 3
            }) else nil, 
            InformationContainer = if v43.helpline and v43.helpline.heading and l_blockToggleState_0 ~= "Loading" then v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium", 
                LayoutOrder = 4
            }, {
                InformationHeader = v4.createElement(v17, {
                    input = v43.helpline.heading, 
                    tag = "text-title-small content-emphasis auto-xy", 
                    layoutOrder = 1
                }), 
                ViewInformationButton = if v43.helpline and v43.helpline.href then v4.createElement(l_Button_0, {
                    text = l_translateIntoString_0(v43.helpline.buttonText), 
                    icon = "icons/navigation/externallink", 
                    variant = l_ButtonVariant_0.Standard, 
                    width = UDim.new(1, 0), 
                    onActivated = v53, 
                    LayoutOrder = 2
                }) else nil
            }) else nil
        }), 
        Actions = if v43.onNext then v4.createElement(l_Sheet_0.Actions, nil, {
            Button = v4.createElement(l_Button_0, {
                text = "Close", 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v43.isSubmitting else false, 
                isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v43.isSubmitting else false, 
                onActivated = v52
            })
        }) else nil
    });
end);