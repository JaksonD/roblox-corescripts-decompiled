local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v4 = require(l_Parent_0.BlockingUtility);
local v5 = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_Dialog_0 = v6.Dialog;
local l_DialogSize_0 = v6.Enums.DialogSize;
local l_Orientation_0 = v6.Enums.Orientation;
local l_View_0 = v6.View;
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation);
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v20 = require(l_script_FirstAncestor_0.BeduiV2.Components.TextLink);
local v21 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.TextWithTranslation);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.translate);
local v23 = require(l_script_FirstAncestor_0.BeduiV2.Api.userBlock);
local v24 = require(l_script_FirstAncestor_0.BeduiV2.Api.userMute);
local l_blockUser_0 = v23.blockUser;
local l_isBlockedUser_0 = v23.isBlockedUser;
local l_isUserMuted_0 = v24.isUserMuted;
local l_muteUser_0 = v24.muteUser;
local l_TelemetryEventType_0 = v17.TelemetryEventType;
local l_useAbuseReportAnalytics_0 = v15.useAbuseReportAnalytics;
local l_useArTranslation_0 = v18.useArTranslation;
local l_useLayoutSlots_0 = v19.useLayoutSlots;
local function v55(v33, v34, v35) --[[ Line: 69 ]] --[[ Name: useBlockMuteActions ]]
    -- upvalues: l_useArTranslation_0 (copy), v7 (copy), l_useAbuseReportAnalytics_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_isBlockedUser_0 (copy), l_TelemetryEventType_0 (copy), v5 (copy), l_isUserMuted_0 (copy), l_LocalPlayer_0 (copy), l_muteUser_0 (copy), l_Players_0 (copy), v4 (copy), l_blockUser_0 (copy), l_ButtonVariant_0 (copy)
    local l_translateIntoString_0 = l_useArTranslation_0().translateIntoString;
    local v37, v38 = v7.useState("Hidden");
    local v39, v40 = v7.useState("Hidden");
    local l_sendEvent_0 = l_useAbuseReportAnalytics_0().sendEvent;
    local v42 = l_useRoactService_0(l_RoactNetworking_0);
    v7.useEffect(function() --[[ Line: 78 ]]
        -- upvalues: v33 (copy), l_isBlockedUser_0 (ref), v42 (copy), v38 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v5 (ref), v34 (copy), l_isUserMuted_0 (ref), v40 (copy)
        if v33 and v33.userId then
            l_isBlockedUser_0(v42, v33.userId):andThen(function(v43) --[[ Line: 81 ]]
                -- upvalues: v38 (ref)
                local l_responseBody_0 = v43.responseBody;
                v38(l_responseBody_0 and "Hidden" or "Visible");
            end):catch(function(v45) --[[ Line: 85 ]]
                -- upvalues: l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v5 (ref)
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = "isBlockedUser: " .. v5.pretty(v45, {
                            depth = 10
                        })
                    }
                });
            end);
            l_sendEvent_0({
                sub_event_type = l_TelemetryEventType_0.IsUserBlockAvailable
            });
        end;
        if v34 and v34.userId then
            local v46 = tonumber(v34.userId) or 0;
            if v46 == 0 or l_isUserMuted_0(v46) then
                return;
            else
                v40("Visible");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.IsUserMuteAvailable
                });
            end;
        end;
    end, {
        if v33 then v33.userId else nil, 
        if v34 then v34.userId else nil
    });
    local v48 = v7.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v34 (copy), l_LocalPlayer_0 (ref), v40 (copy), l_muteUser_0 (ref), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v35 (copy)
        if not v34 or not v34.userId then
            return;
        else
            local v47 = tonumber(v34.userId);
            if v47 and l_LocalPlayer_0 then
                v40("Loading");
                if l_muteUser_0(v47, l_LocalPlayer_0) then
                    l_sendEvent_0({
                        sub_event_type = l_TelemetryEventType_0.DidMuteUser
                    });
                else
                    l_sendEvent_0({
                        sub_event_type = l_TelemetryEventType_0.Error, 
                        error_detail = {
                            error_message = ("muteUser failed for userId: %*"):format(v47)
                        }
                    });
                end;
                v35();
            end;
            return;
        end;
    end, {
        v34, 
        l_sendEvent_0, 
        v35
    });
    local v51 = v7.useCallback(function(v49) --[[ Line: 133 ]]
        -- upvalues: l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), l_Players_0 (ref), v4 (ref)
        if not v49 or v49 == 0 then
            l_sendEvent_0({
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = "AddPlayerToBlockList invalid userId"
                }
            });
            return;
        else
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v49);
            if l_l_Players_0_PlayerByUserId_0 and not v4:AddPlayerToBlockList(l_l_Players_0_PlayerByUserId_0) then
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = ("AddPlayerToBlockList failed for userId: %*"):format(v49)
                    }
                });
            end;
            return;
        end;
    end, {
        l_sendEvent_0
    });
    local v53 = v7.useCallback(function() --[[ Line: 153 ]]
        -- upvalues: v33 (copy), v38 (copy), l_blockUser_0 (ref), v42 (copy), l_sendEvent_0 (copy), l_TelemetryEventType_0 (ref), v51 (copy), v35 (copy)
        if not v33 or not v33.userId then
            return;
        else
            v38("Loading");
            l_blockUser_0(v42, v33.userId):andThen(function() --[[ Line: 159 ]]
                -- upvalues: l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v33 (ref), v51 (ref), v35 (ref)
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.DidBlockUser
                });
                local v52 = tonumber(v33.userId);
                if v52 then
                    v51(v52);
                end;
                v35();
            end):catch(function() --[[ Line: 167 ]]
                -- upvalues: v38 (ref), l_sendEvent_0 (ref), l_TelemetryEventType_0 (ref), v33 (ref)
                v38("Error");
                l_sendEvent_0({
                    sub_event_type = l_TelemetryEventType_0.Error, 
                    error_detail = {
                        error_message = ("blockUser failed for userId: %*"):format(v33.userId)
                    }
                });
            end);
            return;
        end;
    end, {
        v33, 
        v35, 
        v51, 
        v42, 
        l_sendEvent_0
    });
    return {
        actions = v7.useMemo(function() --[[ Line: 177 ]]
            -- upvalues: v33 (copy), v37 (copy), l_translateIntoString_0 (copy), l_ButtonVariant_0 (ref), v53 (copy), v34 (copy), v39 (copy), v48 (copy)
            local v54 = {};
            if v33 and v37 ~= "Hidden" then
                table.insert(v54, {
                    text = l_translateIntoString_0(v33.label), 
                    variant = l_ButtonVariant_0.Alert, 
                    onActivated = v53, 
                    isLoading = v37 == "Loading"
                });
            end;
            if v34 and v39 ~= "Hidden" then
                table.insert(v54, {
                    text = l_translateIntoString_0(v34.label), 
                    variant = l_ButtonVariant_0.Alert, 
                    onActivated = v48, 
                    isLoading = v39 == "Loading"
                });
            end;
            return v54;
        end, {
            v33, 
            v34, 
            v53, 
            v48, 
            l_translateIntoString_0, 
            v37, 
            v39
        }), 
        blockState = v37, 
        muteState = v39
    };
end;
return v7.memo(function(v56) --[[ Line: 220 ]] --[[ Name: InExpConfirmationNode ]]
    -- upvalues: l_useArTranslation_0 (copy), v55 (copy), l_useLayoutSlots_0 (copy), v7 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), v21 (copy), v20 (copy), l_Orientation_0 (copy)
    local l_translateIntoString_1 = l_useArTranslation_0().translateIntoString;
    local v58 = v55(v56.blockToggle, v56.muteToggle, v56.onNext);
    local l_actions_0 = v58.actions;
    local l_blockState_0 = v58.blockState;
    local l_muteState_0 = v58.muteState;
    local l_Body_0 = l_useLayoutSlots_0().Body;
    return v7.createElement(v7.Fragment, nil, {
        Content = v7.createElement(l_Body_0), 
        ConfirmationDialog = v7.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Small, 
            hasBackdrop = not v56.isStoryMode or false, 
            disablePortal = v56.isStoryMode and true or false, 
            onClose = v56.onNext
        }, {
            DialogTitle = v7.createElement(l_Dialog_0.Title, {
                text = l_translateIntoString_1(v56.title)
            }), 
            DialogContent = v7.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, {
                DialogContentView = v7.createElement(l_View_0, {
                    tag = "col gap-small size-full-0 auto-y"
                }, {
                    Message = v7.createElement(v21, {
                        input = v56.message, 
                        tag = "size-full-0 auto-y text-body-medium", 
                        layoutOrder = 2
                    }), 
                    Helpline = v56.helpline and v7.createElement(l_View_0, {
                        tag = "col gap-small size-full-0 auto-y", 
                        LayoutOrder = 3
                    }, {
                        Heading = v7.createElement(v21, {
                            input = v56.helpline.heading, 
                            tag = "size-full-0 auto-y text-body-medium", 
                            layoutOrder = 1
                        }), 
                        Link = v7.createElement(v20, {
                            text = l_translateIntoString_1(v56.helpline.buttonText), 
                            tag = "auto-xy text-body-medium text-wrap text-align-x-left radius-small content-emphasis", 
                            onActivated = function() --[[ Line: 265 ]] --[[ Name: onActivated ]]

                            end, 
                            layoutOrder = 2
                        })
                    }), 
                    ErrorMessage = if not (l_blockState_0 ~= "Error") or l_muteState_0 == "Error" then v7.createElement(v21, {
                        input = if l_blockState_0 == "Error" and v56.blockToggle then v56.blockToggle.errorLabel else if l_muteState_0 == "Error" and v56.muteToggle then v56.muteToggle.errorLabel else "", 
                        tag = "size-full-0 auto-y text-body-medium content-system-alert", 
                        layoutOrder = 4
                    }) else nil
                })
            }), 
            DialogActions = v7.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 4, 
                actions = l_actions_0, 
                orientation = l_Orientation_0.Vertical
            })
        })
    });
end);