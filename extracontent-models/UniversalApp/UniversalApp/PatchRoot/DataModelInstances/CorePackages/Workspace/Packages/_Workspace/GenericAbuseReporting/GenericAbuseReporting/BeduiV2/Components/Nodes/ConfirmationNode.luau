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
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Components.Eyebrow);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local l_useArTranslation_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).useArTranslation;
local v22 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useOpenLink);
local v23 = require(l_script_FirstAncestor_0.BeduiV2.Api.userBlock);
local l_blockUser_0 = v23.blockUser;
local l_isBlockedUser_0 = v23.isBlockedUser;
local l_TelemetryEventType_0 = v16.TelemetryEventType;
local l_unblockUser_0 = v23.unblockUser;
local l_useAbuseReportAnalytics_0 = v14.useAbuseReportAnalytics;
local l_useLayoutSlots_0 = v18.useLayoutSlots;
local l_FFlagSupportSubmissionOnAllReportNodes_0 = v6.FFlagSupportSubmissionOnAllReportNodes;
local l_FFlagAddLayoutSlotsToReport_0 = v6.FFlagAddLayoutSlotsToReport;
local l_FFlagRemoveHardcodedStringsInReportNodes_0 = v6.FFlagRemoveHardcodedStringsInReportNodes;
local function v46(v33) --[[ Line: 68 ]] --[[ Name: useBlockToggle ]]
    -- upvalues: v4 (copy), l_useAbuseReportAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_isBlockedUser_0 (copy), l_TelemetryEventType_0 (copy), v2 (copy), l_unblockUser_0 (copy), l_blockUser_0 (copy)
    local v34, v35 = v4.useState(v33 and "Loading" or "Hidden");
    local v36, v37 = v4.useState(false);
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    v4.useEffect(function() --[[ Line: 75 ]]
        -- upvalues: v33 (copy), l_isBlockedUser_0 (ref), v39 (copy), v35 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref)
        if v33 and v33.userId then
            l_isBlockedUser_0(v39, v33.userId):andThen(function(v40) --[[ Line: 78 ]]
                -- upvalues: v35 (ref)
                local l_responseBody_0 = v40.responseBody;
                v35(l_responseBody_0 and "Hidden" or "Visible");
            end):catch(function(v42) --[[ Line: 82 ]]
                -- upvalues: v35 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v35("Hidden");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "isBlockedUser: " .. v2.pretty(v42, {
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
            v35("Hidden");
            return;
        end;
    end, {
        v33 and v33.userId, 
        l_sendEvent_0, 
        v39
    });
    local v45 = v4.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v33 (copy), v36 (copy), l_unblockUser_0 (ref), v39 (copy), v37 (copy), v35 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v2 (ref), l_blockUser_0 (ref)
        if v33 == nil or v33.userId == nil then
            return;
        elseif v36 then
            l_unblockUser_0(v39, v33.userId):andThen(function() --[[ Line: 104 ]]
                -- upvalues: v37 (ref)
                v37(false);
            end):catch(function(v43) --[[ Line: 107 ]]
                -- upvalues: v35 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v35("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "unblockUser: " .. v2.pretty(v43, {
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
            l_blockUser_0(v39, v33.userId):andThen(function() --[[ Line: 119 ]]
                -- upvalues: l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v37 (ref)
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.DidBlockUser
                });
                v37(true);
            end):catch(function(v44) --[[ Line: 123 ]]
                -- upvalues: v35 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v2 (ref)
                v35("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "blockUser: " .. v2.pretty(v44, {
                            depth = 10
                        })
                    }
                });
            end);
            return;
        end;
    end, {
        l_sendEvent_0, 
        v39, 
        v33 and v33.userId, 
        v36
    });
    return {
        blockToggleState = v34, 
        handleBlockToggleChange = v45, 
        isBlocked = v36
    };
end;
return v4.memo(function(v47) --[[ Line: 146 ]] --[[ Name: ConfirmationNode ]]
    -- upvalues: l_useArTranslation_0 (copy), v22 (copy), l_useAbuseReportAnalytics_0 (copy), v46 (copy), l_FFlagAddLayoutSlotsToReport_0 (copy), l_useLayoutSlots_0 (copy), v4 (copy), l_TelemetryEventType_0 (copy), l_Sheet_0 (copy), v17 (copy), v19 (copy), l_View_0 (copy), l_Toggle_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_FFlagRemoveHardcodedStringsInReportNodes_0 (copy), l_FillBehavior_0 (copy), l_FFlagSupportSubmissionOnAllReportNodes_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v49 = v22();
    local l_sendEvent_1 = l_useAbuseReportAnalytics_0().sendEvent;
    local l_blockToggle_0 = v47.blockToggle;
    local v52 = v46(l_blockToggle_0);
    local l_blockToggleState_0 = v52.blockToggleState;
    local l_handleBlockToggleChange_0 = v52.handleBlockToggleChange;
    local l_isBlocked_0 = v52.isBlocked;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if l_FFlagAddLayoutSlotsToReport_0 then
        v56 = l_useLayoutSlots_0();
        v57 = v56.Body;
        v58 = v56.Actions;
    end;
    v4.useEffect(function() --[[ Line: 165 ]]
        -- upvalues: v47 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v47.helpline and v47.helpline.href then
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineShown
            });
        end;
    end, {
        v47.helpline and v47.helpline.href, 
        l_sendEvent_1
    });
    local v59 = v4.useCallback(function() --[[ Line: 171 ]]
        -- upvalues: v47 (copy)
        if v47.onNext then
            v47.onNext();
        end;
    end, {
        v47.onNext
    });
    local v60 = v4.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v47 (copy), v49 (copy), l_translateIntoString_0 (copy), l_sendEvent_1 (copy), l_TelemetryEventType_0 (ref)
        if v47.helpline and v47.helpline.href then
            v49(l_translateIntoString_0(v47.helpline.heading or ""), v47.helpline.href);
            l_sendEvent_1({
                sub_event_type = l_TelemetryEventType_0.HelplineOpened
            });
        end;
    end, {
        v47.helpline and v47.helpline.href, 
        v49, 
        l_translateIntoString_0, 
        v47.helpline and v47.helpline.heading, 
        l_sendEvent_1
    });
    return v4.createElement(v4.Fragment, nil, {
        Content = v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v57 else l_Sheet_0.Content, nil, {
            Eyebrow = v4.createElement(v17, {
                eyebrow = v47.eyebrow, 
                layoutOrder = 0
            }), 
            Title = v4.createElement(v19, {
                input = v47.title, 
                tag = "size-full-0 auto-y text-heading-medium", 
                layoutOrder = 1
            }), 
            Message = v4.createElement(v19, {
                input = v47.message, 
                tag = "size-full-0 auto-y text-body-small", 
                layoutOrder = 2
            }), 
            ToggleContainer = if v47.blockToggle and l_blockToggleState_0 == "Visible" then v4.createElement(l_View_0, {
                onActivated = l_handleBlockToggleChange_0, 
                tag = "size-full-0 auto-y col padding-large radius-medium gap-xsmall bg-action-standard", 
                LayoutOrder = 3
            }, {
                TextContainer = v4.createElement(l_View_0, {
                    tag = "auto-y size-full-0 row gap-small flex-x-between", 
                    LayoutOrder = 1
                }, {
                    Label = v4.createElement(v19, {
                        input = v47.blockToggle.label or "", 
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
                Description = if v47.blockToggle.description then v4.createElement(v19, {
                    input = v47.blockToggle.description or "", 
                    tag = "text-body-small auto-xy text-wrap", 
                    layoutOrder = 2
                }) else nil
            }) else nil, 
            Error = if l_blockToggleState_0 == "Error" and v47.blockToggle then v4.createElement(v19, {
                input = v47.blockToggle.errorLabel or "", 
                tag = "size-full-0 auto-y content-system-alert text-body-small padding-bottom-medium align-x-left", 
                layoutOrder = 3
            }) else nil, 
            InformationContainer = if v47.helpline and v47.helpline.heading and l_blockToggleState_0 ~= "Loading" then v4.createElement(l_View_0, {
                tag = "size-full-0 auto-y col gap-medium", 
                LayoutOrder = 4
            }, {
                InformationHeader = v4.createElement(v19, {
                    input = v47.helpline.heading, 
                    tag = "text-title-small content-emphasis auto-xy", 
                    layoutOrder = 1
                }), 
                ViewInformationButton = if v47.helpline and v47.helpline.href then v4.createElement(l_Button_0, {
                    text = l_translateIntoString_0(v47.helpline.buttonText), 
                    icon = "icons/navigation/externallink", 
                    variant = l_ButtonVariant_0.Standard, 
                    width = UDim.new(1, 0), 
                    onActivated = v60, 
                    LayoutOrder = 2
                }) else nil
            }) else nil
        }), 
        Actions = if v47.onNext then v4.createElement(if l_FFlagAddLayoutSlotsToReport_0 then v58 else l_Sheet_0.Actions, nil, {
            Button = v4.createElement(l_Button_0, {
                text = if l_FFlagRemoveHardcodedStringsInReportNodes_0 then l_translateIntoString_0(v47.nextButtonText) else "Close", 
                variant = l_ButtonVariant_0.Emphasis, 
                fillBehavior = l_FillBehavior_0.Fill, 
                isLoading = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v47.isSubmitting else false, 
                isDisabled = if l_FFlagSupportSubmissionOnAllReportNodes_0 then v47.isSubmitting else false, 
                onActivated = v59
            })
        }) else nil
    });
end);