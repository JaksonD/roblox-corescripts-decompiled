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
local l_game_EngineFeature_0 = game:GetEngineFeature("SSUIMetaLua");
local l_FFlagMigrateAllOsaMessagingToCentralService_0 = require(l_Parent_0.SharedFlags).FFlagMigrateAllOsaMessagingToCentralService;
local l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 = require(l_Parent_0.SharedFlags).FFlagAddGenericIllegalReportingToTwoStepFlow;
local l_FFlagEnableGlobalChatAbuseReporting_0 = require(l_Parent_0.SharedFlags).FFlagEnableGlobalChatAbuseReporting;
local v41 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
local v42 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v43) --[[ Line: 66 ]] --[[ Name: ChatLineReportStepHandler ]]
    -- upvalues: v8 (copy), v24 (copy), v25 (copy), l_GuiService_0 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v28 (copy), l_FFlagEnableGlobalChatAbuseReporting_0 (copy), l_game_EngineFeature_0 (copy), v10 (copy), v13 (copy), l_Images_0 (copy), v41 (copy), v26 (copy), v27 (copy), l_Players_0 (copy), v9 (copy), l_FFlagChatLineReportingFocusFixesEnabled_0 (copy), v36 (copy), v29 (copy), v30 (copy), v34 (copy), l_DefaultReportDialog_0 (copy), v31 (copy), v33 (copy), l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 (copy), l_FFlagMigrateAllOsaMessagingToCentralService_0 (copy), l_isShowUKOSAIllegalContentReportingLink_0 (copy), l_View_0 (copy), l_OSAReportLink_0 (copy), l_isShowGenericIllegalContentReportingLink_0 (copy), l_GenericReportLink_0 (copy), v32 (copy), l_FocusNavigationEventNameEnum_0 (copy), v7 (copy), l_FocusRoot_0 (copy), v42 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v44, v45 = v8.useState(v24.ReportSteps.SELECT);
    local v46, v47 = v8.useState(nil);
    local v48, v49 = v8.useReducer(v25, v24.AnalyticsInitialState);
    local v50, v51 = v8.useState(not l_GuiService_0.MenuIsOpen);
    local v52, v53 = v8.useState(l_GuiService_0.MenuIsOpen);
    local v54, v55 = v8.useState(false);
    local v56, v57 = v8.useState(nil);
    local v58, v59 = v8.useState("");
    local v60 = l_useLocalization_0(v24.ChatLineLocalizationKeys);
    local v61 = l_useLocalization_0({
        ChatToastTitleSuccess = {
            "Feature.ReportAbuse.Label.UserTextMuted"; 
            name = v58
        }, 
        ChatToastTitleError = {
            "Feature.ReportAbuse.Label.UserTextMutedError"; 
            name = v58
        }, 
        ChatToastDescriptionErrorDoesNotExist = {
            "Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist"; 
            name = v58
        }
    });
    local v62 = l_useTokens_0();
    v8.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v49 (copy), v24 (ref), v43 (copy), v28 (ref), l_FFlagEnableGlobalChatAbuseReporting_0 (ref), l_GuiService_0 (ref), v53 (copy), v51 (copy)
        v49({
            type = v24.AnalyticsActions.AccumulateForTimeSpent, 
            accumulated_time_ms = workspace:GetServerTimeNow() * 1000
        });
        v49({
            type = v24.AnalyticsActions.SetPlaceId, 
            place_id = game.PlaceId
        });
        local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
        local l_v49_0 = v49;
        local v65 = {
            type = v24.AnalyticsActions.SetViewportInformation, 
            viewport_size_x = l_ViewportSize_0.X, 
            viewport_size_y = l_ViewportSize_0.Y
        };
        local v66 = false;
        if l_ViewportSize_0.X < l_ViewportSize_0.Y then
            v66 = l_ViewportSize_0.X < 800;
        end;
        v65.is_portrait_mode = v66;
        l_v49_0(v65);
        l_v49_0 = 0;
        v65 = 0;
        for _, v68 in ipairs(v43.messages) do
            if not v28(v68) then
                l_v49_0 = l_v49_0 + 1;
                if (not l_FFlagEnableGlobalChatAbuseReporting_0 or v68.textChannel) and v68.textChannel.Name ~= v24.ChannelTypes.General then
                    v65 = v65 + 1;
                end;
            end;
        end;
        v49({
            type = v24.AnalyticsActions.SetChatHistoryInformation, 
            selectable_chat_history_size = l_v49_0, 
            total_chat_history_size = #v43.messages, 
            num_non_general_channel_chats = v65
        });
        v66 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 132 ]]
            -- upvalues: v53 (ref), v51 (ref)
            v53(true);
            v51(false);
        end);
        local v69 = l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 136 ]]
            -- upvalues: v53 (ref), v51 (ref)
            v53(false);
            v51(true);
        end);
        return function() --[[ Line: 140 ]]
            -- upvalues: v66 (copy), v69 (copy)
            v66:Disconnect();
            v69:Disconnect();
        end;
    end, {});
    v8.useEffect(function() --[[ Line: 147 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v50 (copy)
        if l_game_EngineFeature_0 then
            pcall(function() --[[ Line: 149 ]]
                -- upvalues: v50 (ref)
                local l_SafetyService_0 = game:GetService("SafetyService");
                if v50 then
                    l_SafetyService_0:ReportChatLineReportingOpen();
                    return;
                else
                    l_SafetyService_0:ReportChatLineReportingClose();
                    return;
                end;
            end);
        end;
    end, {
        v50
    });
    local v71, v72 = v10.useAnimatedBinding(1, function() --[[ Line: 160 ]]
        -- upvalues: v50 (copy), v54 (copy), v56 (copy), v24 (ref), v13 (ref), l_Images_0 (ref), v61 (copy), v60 (copy), v62 (copy), v43 (copy)
        if not v50 then
            if v54 then
                if v56 and v56.key == v24.SuccessfulMuteKey then
                    v13.SetUIBloxToast({
                        iconImage = l_Images_0[v24.ToastIconImageSuccess], 
                        toastTitle = v61.ChatToastTitleSuccess, 
                        toastSubtitle = v60.ChatToastDescriptionSuccess, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v62.Color.System.Success.Color3, 
                            Transparency = 0
                        }
                    });
                elseif v56 then
                    v13.SetUIBloxToast({
                        iconImage = l_Images_0[v24.ToastIconImageError], 
                        toastTitle = v61.ChatToastTitleError, 
                        toastSubtitle = if v56.key == v24.ErrorSelfMuteKey then v60.ChatToastDescriptionErrorSelf else v61.ChatToastDescriptionErrorDoesNotExist, 
                        sequenceNumber = DateTime.now().UnixTimestamp, 
                        iconColorStyle = {
                            Color = v62.Color.System.Warning.Color3, 
                            Transparency = 0
                        }
                    });
                end;
            end;
            v43.unmount();
        end;
    end);
    local v73 = v8.useMemo(function() --[[ Line: 196 ]]
        -- upvalues: v50 (copy)
        if v50 then
            return 0;
        else
            return 1;
        end;
    end, {
        v50
    });
    v8.useEffect(function() --[[ Line: 200 ]]
        -- upvalues: v72 (copy), v10 (ref), v73 (copy), v41 (ref)
        v72(v10.spring(v73, v41));
    end, {
        v73
    });
    local v74 = v8.useCallback(function() --[[ Line: 205 ]]
        -- upvalues: v46 (copy), v45 (copy), v24 (ref)
        if v46 ~= nil then
            v45(v24.ReportSteps.SUBMIT);
        end;
    end);
    local v75 = v8.useCallback(function() --[[ Line: 211 ]]
        -- upvalues: v26 (ref), v48 (copy), v51 (copy)
        v26(v48, 2, false);
        v51(false);
    end, {
        v48
    });
    local v76 = v8.useCallback(function() --[[ Line: 218 ]]
        -- upvalues: v45 (copy), v24 (ref), v47 (copy)
        v45(v24.ReportSteps.SELECT);
        v47(nil);
    end);
    local v83 = v8.useCallback(function(v77, v78) --[[ Line: 223 ]]
        -- upvalues: v27 (ref), l_Players_0 (ref), v46 (copy), v9 (ref), v43 (copy), v28 (ref), v49 (copy), v24 (ref), v45 (copy)
        local v79 = {};
        local v80 = v27(l_Players_0.LocalPlayer.UserId, v46.userId, v77, v78, v46.messageId);
        v9.Dictionary.map(v43.messages, function(v81) --[[ Line: 234 ]]
            -- upvalues: v28 (ref), v79 (copy)
            if not v28(v81) then
                v79[#v79 + 1] = {
                    channel = v81.textChannel, 
                    messageId = v81.messageId
                };
            end;
        end);
        local v82 = {
            {
                channel = v46.textChannel, 
                messageId = v46.messageId
            }
        };
        v49({
            type = v24.AnalyticsActions.SetReasonSelection, 
            reason_selection = v77
        });
        v49({
            type = v24.AnalyticsActions.SetCommentAdded, 
            comment_added = #v78 > 0
        });
        l_Players_0:ReportChatAbuse(v79, v82, v80);
        v45(v24.ReportSteps.COMPLETE);
        return true;
    end, {
        v43.messages, 
        v46
    });
    local v85 = v8.useCallback(function(v84) --[[ Line: 266 ]]
        -- upvalues: v26 (ref), v48 (copy), v57 (copy), v59 (copy), v55 (copy), v51 (copy)
        if v84 then
            v26(v48, 1, true);
            v57(v84);
            v59(v84.args.RBX_NAME);
            v55(true);
            v51(false);
            return;
        else
            v26(v48, 1, false);
            v51(false);
            return;
        end;
    end, {
        v48
    });
    local v86 = v8.useCallback(function() --[[ Line: 280 ]]
        -- upvalues: v26 (ref), v48 (copy), v51 (copy)
        v26(v48, 1, false);
        v51(false);
    end, {
        v48
    });
    local v87 = if v44 == v24.ReportSteps.COMPLETE then v86 else v75;
    local v92 = v8.createElement("TextButton", {
        Active = v71:map(function(v88) --[[ Line: 290 ]]
            return v88 == 0;
        end), 
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v71:map(function(v89) --[[ Line: 295 ]]
            return v89 + 0.3;
        end), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        Text = "", 
        Selectable = not l_FFlagChatLineReportingFocusFixesEnabled_0 and nil, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v8.Event.Activated] = v87, 
        ZIndex = 10
    }, {
        Frame = v8.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Position = v71:map(function(v90) --[[ Line: 310 ]]
                -- upvalues: v52 (copy)
                if v52 then
                    return UDim2.new(0, 0, -v90, 0);
                else
                    return UDim2.new(0, 0, v90, 0);
                end;
            end)
        }, {
            ChatLineReportStep = if v44 == v24.ReportSteps.SELECT then v8.createElement(if v36 then v29 else v30, {
                onContinue = v74, 
                onBack = v75, 
                messages = v43.messages, 
                selectedMessage = v46, 
                setSelectedMessage = v47, 
                analyticsDispatch = v49, 
                mode = v34.Radio
            }) else if v44 == v24.ReportSteps.SUBMIT then v8.createElement(l_DefaultReportDialog_0, {
                analyticsContext = "ReportViaChatLine", 
                topCustomComponent = v8.createElement(v31, {
                    selectedMessage = v46
                }), 
                onSubmitProps = {
                    hasNextSteps = true, 
                    onProceedToNextStep = v83
                }, 
                localizationKeys = v24.GenericAbuseReportingLocalizationKeys, 
                onCloseProps = {
                    hasPreviousSteps = true, 
                    onBackToPreviousStep = v76
                }, 
                reportCategories = v33, 
                footerContent = if l_FFlagAddGenericIllegalReportingToTwoStepFlow_0 then nil else function() --[[ Line: 350 ]]
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
                onBeforeSubmitAnalytics = function(v91) --[[ Line: 371 ]] --[[ Name: onBeforeSubmitAnalytics ]]
                    return v91;
                end
            }) else if v44 == v24.ReportSteps.COMPLETE then v8.createElement(v32, {
                localizationKeys = v24.GenericAbuseReportingLocalizationKeys, 
                onDismiss = v85, 
                selectedMessage = v46
            }) else nil
        })
    });
    if l_FFlagChatLineReportingFocusFixesEnabled_0 then
        local v94 = v8.useMemo(function() --[[ Line: 388 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v7 (ref), v87 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v7.onRelease(function(v93) --[[ Line: 391 ]]
                        -- upvalues: v87 (ref)
                        v87();
                        v93:cancel();
                    end)
                }
            };
        end, {
            v87
        });
        return v8.createElement(l_FocusRoot_0, {
            eventHandlers = v94, 
            eventMap = v42, 
            isAutoFocusRoot = true, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, {
            ChatLineReportStepHandler = v92
        });
    else
        return v92;
    end;
end;