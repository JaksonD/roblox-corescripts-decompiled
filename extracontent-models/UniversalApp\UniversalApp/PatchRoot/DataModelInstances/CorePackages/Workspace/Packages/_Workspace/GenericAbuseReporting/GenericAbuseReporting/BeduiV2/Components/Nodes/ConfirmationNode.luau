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
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local v21 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local v22 = require(l_script_FirstAncestor_0.BeduiV2.Api.userBlock);
local l_blockUser_0 = v22.blockUser;
local l_isBlockedUser_0 = v22.isBlockedUser;
local l_TelemetryEventType_0 = v15.TelemetryEventType;
local l_unblockUser_0 = v22.unblockUser;
local l_useAbuseReportAnalytics_0 = v14.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v17.useLayoutSlots;
local l_FFlagRemoveTitleAddEyebrowReport_0 = v6.FFlagRemoveTitleAddEyebrowReport;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v6.FFlagSupportSubmissionOnAllReportNodes;
local l_FFlagAddLayoutSlotsToReport_0 = v6.FFlagAddLayoutSlotsToReport;
local function v45(v32) --[[ Line: 73 ]] --[[ Name: useBlockToggle ]]
    -- upvalues: v4 (copy), l_useAbuseReportAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_isBlockedUser_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), l_unblockUser_0 (copy), l_blockUser_0 (copy)
    local v33, v34 = v4.useState(v32 and "Loading" or "Hidden");
    local v35, v36 = v4.useState(false);
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v38 = l_useRoactService_0(l_RoactNetworking_0);
    v4.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v32 (copy), l_isBlockedUser_0 (ref), v38 (copy), v34 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref)
        if v32 and v32.userId then
            l_isBlockedUser_0(v38, v32.userId):andThen(function(v39) --[[ Line: 83 ]]
                -- upvalues: v34 (ref)
                local l_responseBody_0 = v39.responseBody;
                v34(l_responseBody_0 and "Hidden" or "Visible");
            end):catch(function(v41) --[[ Line: 87 ]]
                -- upvalues: v34 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v34("Hidden");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "isBlockedUser: " .. v2.pretty(v41, {
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
            v34("Hidden");
            return;
        end;
    end, {
        v32 and v32.userId, 
        l_sendEvent_0, 
        v38
    });
    local v44 = v4.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v35 (copy), l_unblockUser_0 (ref), v38 (copy), v36 (copy), v34 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref), l_blockUser_0 (ref)
        if v32 == nil or v32.userId == nil then
            return;
        elseif v35 then
            l_unblockUser_0(v38, v32.userId):andThen(function() --[[ Line: 109 ]]
                -- upvalues: v36 (ref)
                v36(false);
            end):catch(function(v42) --[[ Line: 112 ]]
                -- upvalues: v34 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v34("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "unblockUser: " .. v2.pretty(v42, {
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
            l_blockUser_0(v38, v32.userId):andThen(function() --[[ Line: 124 ]]
                -- upvalues: l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v36 (ref)
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.DidBlockUser
                });
                v36(true);
            end):catch(function(v43) --[[ Line: 128 ]]
                -- upvalues: v34 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v34("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "blockUser: " .. v2.pretty(v43, {
                            depth = 10
                        })
                    }
                });
            end);
            return;
        end;
    end, {
        l_sendEvent_0, 
        v38, 
        v32 and v32.userId, 
        v35
    });
    return {
        blockToggleState = v33, 
        handleBlockToggleChange = v44, 
        isBlocked = v35
    };
end;
return v4.memo(function(v46) --[[ Line: 151 ]] --[[ Name: ConfirmationNode ]]
    -- upvalues: l_useArTranslation_0 (copy), v21 (copy), l_useAbuseReportAnalytics_0 (copy), v45 (copy), l_FFlagAddLayoutSlotsToReport_0 (copy), l_useLayoutSlots_0 (copy), v4 (copy), l_TelemetryEventType_0 (copy), l_Sheet_0 (copy), l_FFlagRemoveTitleAddEyebrowReport_0 (copy), v16 (copy), v18 (copy), l_View_0 (copy), l_Toggle_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FillBehavior_0 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v48 = v21();
    local l_sendEvent_1 = l_useAbuseReportAnalytics_0().sendEvent;
    local l_blockToggle_0 = v46.blockToggle;
    local v51 = v45(l_blockToggle_0);
    local l_blockToggleState_0 = v51.blockToggleState;
    local l_handleBlockToggleChange_0 = v51.handleBlockToggleChange;
    local l_isBlocked_0 = v51.isBlocked;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if l_FFlagAddLayoutSlotsToReport_0 then
        v55 = l_useLayoutSlots_0();
        v56 = v55.Body;
        v57 = v55.Actions;
    end;
    v4.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: v46 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v46.helpline and v46.helpline.href then
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineShown
            });
        end;
    end, {
        v46.helpline and v46.helpline.href, 
        l_sendEvent_1
    });
    local v58 = v4.useCallback(function() --[[ Line: 176 ]]
        -- upvalues: v46 (copy)
        if v46.onNext then
            v46.onNext();
        end;
    end, {
        v46.onNext
    });
    local v59 = v4.useCallback(function() --[[ Line: 183 ]]
        -- upvalues: v46 (copy), v48 (copy), l_translateIntoString_0 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v46.helpline and v46.helpline.href then
            v48(l_translateIntoString_0(v46.helpline.heading or ""), v46.helpline.href);
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineOpened
            });
        end;
    end, {
        v46.helpline and v46.helpline.href, 
        v48, 
        l_translateIntoString_0, 
        v46.helpline and v46.helpline.heading, 
        l_sendEvent_1
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v56 else l_Sheet_0.Content, nil, {
            Eyebrow = if l_FFlagRemoveTitleAddEyebrowReport_0 then v4.createElement(v16, {
                eyebrow = v46.eyebrow, 
                layoutOrder = 0
            }) else nil, 
            Title = v4.createElement(v18, {
                input = v46.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            Message = v4.createElement(v18, {
                input = v46.message, 
                tag = "size-full-0 auto-y text-body-small", 
                layoutOrder = 2
            }), 
            ToggleContainer = if v46.blockToggle and l_blockToggleState_0 == "Visible" then v4.createElement(l_View_0, {
                onActivated = l_handleBlockToggleChange_0, 
                tag = "size-full-0 auto-y col padding-large radius-medium gap-xsmall bg-action-standard", 
                LayoutOrder = 3
            }, {
                TextContainer = v4.createElement(l_View_0, {
                    tag = "auto-y size-full-0 row gap-small flex-x-between", 
                    LayoutOrder = 1
                }, {
                    Label = v4.createElement(v18, {
                        input = v46.blockToggle.label or "", 
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
                Description = if v46.blockToggle.description then v4.createElement(v18, {
                    input = v46.blockToggle.description or "", 
                    tag = "text-body-small auto-xy text-wrap", 
                    layoutOrder = 2
                }) else nil
            }) else nil, 
            Error = if l_blockToggleState_0 == "Error" and v46.blockToggle then v4.createElement(v18, {
                input = v46.blockToggle.errorLabel or "", 
                tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left", 
                layoutOrder = 3
            }) else nil, 
            InformationContainer = if v46.helpline and v46.helpline.heading and l_blockToggleState_0 ~= "Loading" then v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium", 
                LayoutOrder = 4
            }, {
                InformationHeader = v4.createElement(v18, {
                    input = v46.helpline.heading, 
                    tag = "text-title-small content-emphasis auto-xy", 
                    layoutOrder = 1
                }), 
                ViewInformationButton = if v46.helpline and v46.helpline.href then v4.createElement(l_Button_0, {
                    text = l_translateIntoString_0(v46.helpline.buttonText), 
                    icon = "icons/navigation/externallink", 
                    variant = l_ButtonVariant_0.Standard, 
                    width = UDim.new(1, 0), 
                    onActivated = v59, 
                    LayoutOrder = 2
                }) else nil
            }) else nil
        }), 
        Actions = if v46.onNext then v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v57 else l_Sheet_0.Actions, nil, {
            Button = v4.createElement(l_Button_0, {
                text = "Close", 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v46.isSubmitting else false, 
                isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v46.isSubmitting else false, 
                onActivated = v58
            })
        }) else nil
    });
end);