local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v3.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v3.FocusNavigationEventNameEnum;
local l_FocusRoot_0 = v3.FocusRoot;
local v7 = require(l_Parent_0.InputHandlers);
local v8 = require(l_Parent_0.React);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.ReactOtter);
local l_GuiService_0 = game:GetService("GuiService");
local l_DefaultReportDialog_0 = require(l_Parent_0.GenericAbuseReporting).UXFlows.DefaultReportDialog;
local v13 = require(l_Parent_0.NotificationModalsManager);
local v14 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v14.Hooks.useTokens;
local l_View_0 = v14.View;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v19 = require(l_Parent_0.DsaIllegalContentReporting);
local l_isShowUKOSAIllegalContentReportingLink_0 = v19.isShowUKOSAIllegalContentReportingLink;
local l_OSAReportLink_0 = v19.OSAReportLink;
local l_isShowGenericIllegalContentReportingLink_0 = v19.isShowGenericIllegalContentReportingLink;
local l_GenericReportLink_0 = v19.GenericReportLink;
local v24 = require(l_script_FirstAncestor_0.Common.Constants);
local v25 = require(l_script_FirstAncestor_0.Common.AnalyticsReducer);
local v26 = require(l_script_FirstAncestor_0.Common.ChatLineReportAnalytics);
local v27 = require(l_script_FirstAncestor_0.Common.buildReport);
local v28 = require(l_script_FirstAncestor_0.Common.isSystemMessage);
local v29 = require(l_script_FirstAncestor_0.Components.ChatLineReportSelectionModal);
local v30 = require(l_script_FirstAncestor_0.Components.ChatLineReportSelectionModalOld);
local v31 = require(l_script_FirstAncestor_0.Components.ChatLineReportVerbatim);
local v32 = require(l_script_FirstAncestor_0.Components.ChatLineReportCompleteModal);
local v33 = require(l_script_FirstAncestor_0.Common.ReportCategories);
local v34 = require(l_script_FirstAncestor_0.Enums.ChatLineSelectionMode);
local l_FFlagChatLineReportingFocusFixesEnabled_0 = require(l_Parent_0.SharedFlags).FFlagChatLineReportingFocusFixesEnabled;
local v36 = require(l_script_FirstAncestor_0.Flags.FFlagChatLineReportingReworkEnabled);
local l_FFlagMigrateAllOsaMessagingToCentralService_0 = require(l_Parent_0.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService;
local l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 = require(l_Parent_0.SharedFlags).FFlagAddGenericIllegalReportingToTwoStepFlow;
local v39 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
local v40 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v41) --[[ Line: 64 ]] --[[ Name: ChatLineReportStepHandler ]]
    -- upvalues: v8 (copy), v24 (copy), v25 (copy), l_GuiService_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v28 (copy), v10 (copy), v13 (copy), l_Images_0 (copy), v39 (copy), v26 (copy), v27 (copy), l_Players_0 (copy), v9 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v36 (copy), v29 (copy), v30 (copy), v34 (copy), l_DefaultReportDialog_0 (copy), v31 (copy), v33 (copy), l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 (copy), l_FFlagMigrateAllOsaMessagingToCentralService_0 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), l_View_0 (copy), l_OSAReportLink_0 (copy), l_isShowGenericIllegalContentReportingLink_0 (copy), l_GenericReportLink_0 (copy), v32 (copy), l_FocusNavigationEventNameEnum_0 (copy), v7 (copy), l_FocusRoot_0 (copy), v40 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v42, v43 = v8.useState(v24.ReportSteps.SELECT);
    local v44, v45 = v8.useState(nil);
    local v46, v47 = v8.useReducer(v25, v24.AnalyticsInitialState);
    local v48, v49 = v8.useState(not l_GuiService_0.MenuIsOpen);
    local v50, v51 = v8.useState(l_GuiService_0.MenuIsOpen);
    local v52, v53 = v8.useState(false);
    local v54, v55 = v8.useState(nil);
    local v56, v57 = v8.useState("");
    local v58 = l_useLocalization_0(v24.ChatLineLocalizationKeys);
    local v59 = l_useLocalization_0({
        ChatToastTitleSuccess = {
            "Feature.ReportAbuse.Label.UserTextMuted"; 
            name = v56
        }, 
        ChatToastTitleError = {
            "Feature.ReportAbuse.Label.UserTextMutedError"; 
            name = v56
        }, 
        ChatToastDescriptionErrorDoesNotExist = {
            "Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist"; 
            name = v56
        }
    });
    local v60 = l_useTokens_0();
    v8.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v47 (copy), v24 (ref), v41 (copy), v28 (ref), l_GuiService_0 (ref), v51 (copy), v49 (copy)
        v47({
            type = v24.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v47({
            type = v24.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
        local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
        local l_v47_0 = v47;
        local v63 = {
            type = v24.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y
        };
        local v64 = false;
        if l_ViewportSize_0.X < l_ViewportSize_0.Y then
            v64 = l_ViewportSize_0.X < 800;
        end;
        v63.is_portrait_mode = v64;
        l_v47_0(v63);
        l_v47_0 = 0;
        v63 = 0;
        for _, v66 in ipairs(v41.messages) do
            if not v28(v66) then
                l_v47_0 = l_v47_0 + 1;
                if v66.textChannel.Name ~= v24.ChannelTypes.General then
                    v63 = v63 + 1;
                end;
            end;
        end;
        v47({
            type = v24.AnalyticsActions.SetChatHistoryInformation, 
            selectable_chat_history_size = l_v47_0, 
            total_chat_history_size = #v41.messages, 
            num_non_general_channel_chats = v63
        });
        v64 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 127 ]]
            -- upvalues: v51 (ref), v49 (ref)
            v51(true);
            v49(false);
        end);
        local v67 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 131 ]]
            -- upvalues: v51 (ref), v49 (ref)
            v51(false);
            v49(true);
        end);
        return function() --[[ Line: 135 ]]
            -- upvalues: v64 (copy), v67 (copy)
            v64:Disconnect();
            v67:Disconnect();
        end;
    end, {});
    local v68, v69 = v10.useAnimatedBinding(1, function() --[[ Line: 141 ]]
        -- upvalues: v48 (copy), v52 (copy), v54 (copy), v24 (ref), v13 (ref), l_Images_0 (ref), v59 (copy), v58 (copy), v60 (copy), v41 (copy)
        if not v48 then
            if v52 then
                if v54 and v54.key == v24.SuccessfulMuteKey then
                    v13.SetUIBloxToast({
                        iconImage = l_Images_0[v24.ToastIconImageSuccess], 
                        toastTitle = v59.ChatToastTitleSuccess, 
                        toastSubtitle = v58.ChatToastDescriptionSuccess, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v60.Color.System.Success.Color3, 
                            Transparency = 0
                        }
                    });
                elseif v54 then
                    v13.SetUIBloxToast({
                        iconImage = l_Images_0[v24.ToastIconImageError], 
                        toastTitle = v59.ChatToastTitleError, 
                        toastSubtitle = if v54.key == v24.ErrorSelfMuteKey then v58.ChatToastDescriptionErrorSelf else v59.ChatToastDescriptionErrorDoesNotExist, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v60.Color.System.Warning.Color3, 
                            Transparency = 0
                        }
                    });
                end;
            end;
            v41.unmount();
        end;
    end);
    local v70 = v8.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v48 (copy)
        if v48 then
            return 0;
        else
            return 1;
        end;
    end, {
        v48
    });
    v8.useEffect(function() --[[ Line: 181 ]]
        -- upvalues: v69 (copy), v10 (ref), v70 (copy), v39 (ref)
        v69(v10.spring(v70, v39));
    end, {
        v70
    });
    local v71 = v8.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: v44 (copy), v43 (copy), v24 (ref)
        if v44 ~= nil then
            v43(v24.ReportSteps.SUBMIT);
        end;
    end);
    local v72 = v8.useCallback(function() --[[ Line: 192 ]]
        -- upvalues: v26 (ref), v46 (copy), v49 (copy)
        v26(v46, 2, false);
        v49(false);
    end, {
        v46
    });
    local v73 = v8.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v43 (copy), v24 (ref), v45 (copy)
        v43(v24.ReportSteps.SELECT);
        v45(nil);
    end);
    local v80 = v8.useCallback(function(v74, v75) --[[ Line: 204 ]]
        -- upvalues: v27 (ref), l_Players_0 (ref), v44 (copy), v9 (ref), v41 (copy), v28 (ref), v47 (copy), v24 (ref), v43 (copy)
        local v76 = {};
        local v77 = v27(l_Players_0.LocalPlayer.UserId, v44.userId, v74, v75, v44.messageId);
        v9.Dictionary.map(v41.messages, function(v78) --[[ Line: 215 ]]
            -- upvalues: v28 (ref), v76 (copy)
            if not v28(v78) then
                v76[#v76 + 1] = {
                    channel = v78.textChannel, 
                    messageId = v78.messageId
                };
            end;
        end);
        local v79 = {
            {
                channel = v44.textChannel, 
                messageId = v44.messageId
            }
        };
        v47({
            type = v24.AnalyticsActions.SetReasonSelection, 
            reason_selection = v74
        });
        v47({
            type = v24.AnalyticsActions.SetCommentAdded, 
            comment_added = #v75 > 0
        });
        l_Players_0:ReportChatAbuse(v76, v79, v77);
        v43(v24.ReportSteps.COMPLETE);
        return true;
    end, {
        v41.messages, 
        v44
    });
    local v82 = v8.useCallback(function(v81) --[[ Line: 247 ]]
        -- upvalues: v26 (ref), v46 (copy), v55 (copy), v57 (copy), v53 (copy), v49 (copy)
        if v81 then
            v26(v46, 1, true);
            v55(v81);
            v57(v81.args.RBX_NAME);
            v53(true);
            v49(false);
            return;
        else
            v26(v46, 1, false);
            v49(false);
            return;
        end;
    end, {
        v46
    });
    local v83 = v8.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v26 (ref), v46 (copy), v49 (copy)
        v26(v46, 1, false);
        v49(false);
    end, {
        v46
    });
    local v84 = if v42 == v24.ReportSteps.COMPLETE then v83 else v72;
    local v89 = v8.createElement("TextButton", {
        Active = v68:map(function(v85) --[[ Line: 271 ]]
            return v85 == 0;
        end), 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v68:map(function(v86) --[[ Line: 276 ]]
            return v86 + 0.3;
        end), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        Text = "", 
        Selectable = not l_FFlagChatLineReportingFocusFixesEnabled_0 and nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v8.Event.Activated] = v84, 
        ZIndex = 10
    }, {
        Frame = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Position = v68:map(function(v87) --[[ Line: 291 ]]
                -- upvalues: v50 (copy)
                if v50 then
                    return UDim2.new(0, 0, -v87, 0);
                else
                    return UDim2.new(0, 0, v87, 0);
                end;
            end)
        }, {
            ChatLineReportStep = if v42 == v24.ReportSteps.SELECT then v8.createElement(if v36 then v29 else v30, {
                onContinue = v71, 
                onBack = v72, 
                messages = v41.messages, 
                selectedMessage = v44, 
                setSelectedMessage = v45, 
                analyticsDispatch = v47, 
                mode = v34.Radio
            }) else if v42 == v24.ReportSteps.SUBMIT then v8.createElement(l_DefaultReportDialog_0, {
                analyticsContext = "ReportViaChatLine", 
                topCustomComponent = v8.createElement(v31, {
                    selectedMessage = v44
                }), 
                onSubmitProps = {
                    hasNextSteps = true, 
                    onProceedToNextStep = v80
                }, 
                localizationKeys = v24.GenericAbuseReportingLocalizationKeys, 
                onCloseProps = {
                    hasPreviousSteps = true, 
                    onBackToPreviousStep = v73
                }, 
                reportCategories = v33, 
                footerContent = if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then nil else function() --[[ Line: 331 ]]
                    -- upvalues: l_FFlagMigrateAllOsaMessagingToCentralService_0 (ref), l_isShowUKOSAIllegalContentReportingLink_0 (ref), v8 (ref), l_View_0 (ref), l_OSAReportLink_0 (ref), l_isShowGenericIllegalContentReportingLink_0 (ref), l_GenericReportLink_0 (ref)
                    if not l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowUKOSAIllegalContentReportingLink_0() then
                        return v8.createElement(l_View_0, {
                            tag = "size-full-0 auto-y"
                        }, {
                            OSALink = v8.createElement(l_OSAReportLink_0)
                        });
                    elseif l_FFlagMigrateAllOsaMessagingToCentralService_0 and l_isShowGenericIllegalContentReportingLink_0() then
                        return v8.createElement(l_View_0, {
                            tag = "size-full-0 auto-y padding-left-large padding-top-medium radius-medium"
                        }, v8.createElement(l_GenericReportLink_0));
                    else
                        return nil;
                    end;
                end, 
                onBeforeSubmitAnalytics = function(v88) --[[ Line: 352 ]] --[[ Name: onBeforeSubmitAnalytics ]]
                    return v88;
                end
            }) else if v42 == v24.ReportSteps.COMPLETE then v8.createElement(v32, {
                localizationKeys = v24.GenericAbuseReportingLocalizationKeys, 
                onDismiss = v82, 
                selectedMessage = v44
            }) else nil
        })
    });
    if l_FFlagChatLineReportingFocusFixesEnabled_0 then
        local v91 = v8.useMemo(function() --[[ Line: 369 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v7 (ref), v84 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v7.onRelease(function(v90) --[[ Line: 372 ]]
                        -- upvalues: v84 (ref)
                        v84();
                        v90:cancel();
                    end)
                }
            };
        end, {
            v84
        });
        return v8.createElement(l_FocusRoot_0, {
            eventHandlers = v91, 
            eventMap = v40, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            ChatLineReportStepHandler = v89
        });
    else
        return v89;
    end;
end;