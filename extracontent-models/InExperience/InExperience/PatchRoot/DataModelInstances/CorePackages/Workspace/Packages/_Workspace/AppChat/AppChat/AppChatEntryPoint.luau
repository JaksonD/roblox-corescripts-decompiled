local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
local v6 = require(l_Parent_0.SharedFlags);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v8 = require(l_script_FirstAncestor_0.Logger);
local v9 = require(l_script_FirstAncestor_0.getRoactChatStackNavigator);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v11 = nil;
local v12 = nil;
local v13 = not require(l_script_FirstAncestor_0.Flags.getFFlagAppChatRemoveDynamicRequires)();
local l_usePageSideMargin_0 = require(l_Parent_0.CollectionViews).usePageSideMargin;
if not v13 then
    v11 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
    v12 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
end;
local v15 = require(l_script_FirstAncestor_0.LegacyAnalytics.AnalyticsProvider);
local v16 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v17 = require(l_script_FirstAncestor_0.TopBarContext);
local v18 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v20 = require(l_script_FirstAncestor_0.LuaAppNavigationContextProvider);
local l_SetTabBarVisible_0 = require(l_Parent_0.AppTabBarRodux).Actions.SetTabBarVisible;
local v22 = require(l_script_FirstAncestor_0.Analytics.RoactChatAnalyticsProvider);
local v23 = require(l_script_FirstAncestor_0.Telemetry.Layers.AppTelemetryLayer);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v25 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v26 = require(l_Parent_0.React);
local v27 = require(l_Parent_0.RoactNavigation);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v26.memo;
local v31 = require(l_script_FirstAncestor_0.Hooks.useAppPolicy);
local l_useCallback_0 = v26.useCallback;
local v33 = require(l_script_FirstAncestor_0.Hooks.useChatIsVisible);
local l_useCurrentSquadParentChannelId_0 = require(l_Parent_0.SquadsCore).Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v26.useEffect;
local l_useIsVoiceConnected_0 = require(l_Parent_0.CrossExperienceVoice).Hooks.useIsVoiceConnected;
local l_useRef_0 = v26.useRef;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useState_0 = v26.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v42 = require(l_script_FirstAncestor_0.Hooks.useRobloxLocale);
local v43 = require(l_script_FirstAncestor_0.Components.ChatConversation.MessageInteraction.ReplyingContext.ReplyingToMessageProvider);
local l_LayerCollectorProvider_0 = require(l_Parent_0.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider;
local v45 = require(l_script_FirstAncestor_0.Hooks.useIsChatEnabled);
local v46 = require(l_Parent_0.AppChatNetworking);
local v47 = require(l_Parent_0.InteractionFeedback);
local l_HapticFeedbackConfig_0 = require(l_script_FirstAncestor_0.Utils.HapticFeedback).HapticFeedbackConfig;
local v49 = require(l_script_FirstAncestor_0.Conversations.Thunks.createConversation);
local v50 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v51 = require(script.Parent.EnumScreens);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagEnableCrossExpVoice_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossExpVoice;
local v54 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local v55 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local v56 = require(l_script_FirstAncestor_0.Flags.getFFlagHideNotificationIconForVR);
local v57 = require(l_script_FirstAncestor_0.Flags.getFFlagFixChatsBottomInsetBackgroundColor);
local v58 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local l_GetFFlagEnableAppChatInExperience_0 = v6.GetFFlagEnableAppChatInExperience;
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v61 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v62 = require(l_script_FirstAncestor_0.Utils.navigateWithOsaGate);
local l_FFlagAppChatShowOSAOnPageEntry_0 = v6.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v6.FFlagEnableHeaderBarButtonsUpdate;
local v65 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v6.FFlagRemoveDependencyArrayAntipattern;
local l_NAV_BAR_WITH_FACEPILE_SIZE_0 = v65.NAV_BAR_WITH_FACEPILE_SIZE;
local v69 = {
    logger = l_Logger_0, 
    navigateToLuaAppPages = nil, 
    parameters = nil, 
    rnBypassActionSignal = nil, 
    setActiveConversationId = nil, 
    setBackButtonEnabled = nil, 
    setTabBarVisible = function() --[[ Line: 126 ]] --[[ Name: setTabBarVisible ]]

    end, 
    setInitialConversationId = function(_) --[[ Line: 127 ]] --[[ Name: setInitialConversationId ]]

    end, 
    wideMode = false, 
    notificationCount = 0, 
    navigateToRootStack = nil, 
    androidBackButtonSignal = nil, 
    initialConversationId = "", 
    chatPlacement = v18.Enum.Unknown
};
AppChatEntryPoint = function(v70) --[[ Line: 140 ]] --[[ Name: AppChatEntryPoint ]]
    -- upvalues: v4 (copy), v69 (copy), v18 (copy), l_useTokens_0 (copy), v13 (copy), v11 (ref), l_script_FirstAncestor_0 (copy), v12 (ref), l_useSelector_0 (copy), l_useCallback_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v46 (copy), v8 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v33 (copy), l_useState_0 (copy), v26 (copy), v27 (copy), v9 (copy), l_useRef_0 (copy), v60 (copy), v61 (copy), v51 (copy), v49 (copy), v50 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v62 (copy), v24 (copy), v25 (copy), v16 (copy), v3 (copy), v19 (copy), v54 (copy), v55 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), v31 (copy), v56 (copy), l_usePageSideMargin_0 (copy), v45 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_useStyle_0 (copy), l_SetTabBarVisible_0 (copy), l_UserInputService_0 (copy), l_NAV_BAR_WITH_FACEPILE_SIZE_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v20 (copy), v58 (copy), v43 (copy), v47 (copy), l_HapticFeedbackConfig_0 (copy), l_LayerCollectorProvider_0 (copy), v42 (copy), l_RbxAnalyticsService_0 (copy), v15 (copy), v23 (copy), v17 (copy), v57 (copy), v22 (copy)
    local v71 = v4.Dictionary.join(v69, v70);
    local v72 = v18.isPlacementInExperience(v71.chatPlacement);
    local v73 = l_useTokens_0();
    if v13 then
        v11 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
        v12 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
    end;
    local v75 = l_useSelector_0(l_useCallback_0(function(v74) --[[ Line: 151 ]]
        return v74.LocalUserId;
    end, {})) or v71.localUserId;
    local v77 = l_useSelector_0(l_useCallback_0(function(v76) --[[ Line: 154 ]]
        return v76.GlobalGuiInset;
    end, {})) or {
        bottom = 0
    };
    local v79 = l_useSelector_0(l_useCallback_0(function(v78) --[[ Line: 157 ]]
        return v78.ChatAppReducer.LastEntryPoint;
    end, {}));
    local v80 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 164 ]]
        -- upvalues: v80 (copy), v46 (ref), v72 (copy), v8 (ref)
        v80(v46.rodux.GetChatLandingModal.API(v72)):catch(function(v81) --[[ Line: 165 ]]
            -- upvalues: v8 (ref)
            v8:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v81)));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80, 
        v75, 
        v72
    } else l_dependencyArray_0(v80, v75, v72));
    local v82 = v33();
    local v83, v84 = l_useState_0({});
    local v85 = v26.useMemo(function() --[[ Line: 179 ]]
        -- upvalues: v27 (ref), v9 (ref), v71 (copy), v12 (ref), v11 (ref)
        return v27.createAppContainer(v9(v71.wideMode and v12 or v11, v71.navigateToRootStack, v71.androidBackButtonSignal, v71.androidBackButtonConnection));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71.wideMode, 
        v12, 
        v11, 
        v71.navigateToRootStack, 
        v71.androidBackButtonSignal, 
        v71.androidBackButtonConnection
    } else l_dependencyArray_0(v71.wideMode, v12, v11, v71.navigateToRootStack, v71.androidBackButtonSignal, v71.androidBackButtonConnection));
    local v86 = if v72 then v85 else l_useRef_0(v27.createAppContainer(v9(v71.wideMode and v12 or v11, v71.navigateToRootStack, v71.androidBackButtonSignal, v71.androidBackButtonConnection)));
    if not v72 then
        v86 = v86.current;
    end;
    local v87 = l_useRef_0(false);
    local v88 = l_useRef_0(nil);
    local v89 = l_useRef_0(function(...) --[[ Line: 227 ]]

    end);
    l_useEffect_0(function() --[[ Line: 229 ]]
        -- upvalues: v71 (copy), v8 (ref)
        if v71.logger then
            v8:setParent(v71.logger);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71.logger
    } else l_dependencyArray_0(v71.logger));
    local v91 = l_useCallback_0(function(v90) --[[ Line: 236 ]]
        -- upvalues: v87 (copy), v89 (copy)
        if not v87.current then
            return;
        else
            if v89.current then
                v89.current(v90);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v87, 
        v89
    } else l_dependencyArray_0(v87, v89));
    if v60 then
        local l_navigateToLuaAppPages_0 = v71.navigateToLuaAppPages;
        local l_l_navigateToLuaAppPages_0_0 = l_navigateToLuaAppPages_0 --[[ copy: 17 -> 47 ]];
        l_useEffect_0(function() --[[ Line: 252 ]]
            -- upvalues: v61 (ref), l_l_navigateToLuaAppPages_0_0 (copy), v51 (ref)
            v61(false).setOverlayDefaultProps({
                onViewUserProfile = if l_l_navigateToLuaAppPages_0_0 then l_l_navigateToLuaAppPages_0_0[v51.ViewUserProfile] else nil
            });
        end, {
            l_navigateToLuaAppPages_0
        });
    end;
    local v95 = l_useCallback_0(function(v94) --[[ Line: 262 ]]
        -- upvalues: v27 (ref), v51 (ref)
        return v27.Actions.navigate({
            routeName = v51.ChatConversation, 
            params = {
                conversationId = v94
            }
        });
    end, {});
    local v99 = l_useCallback_0(function(v96, v97) --[[ Line: 270 ]]
        -- upvalues: v27 (ref), v51 (ref), v71 (copy)
        local v98 = {
            v27.Actions.navigate({
                routeName = v51.ChatConversation, 
                params = {
                    conversationId = v96
                }
            }), 
            v27.Actions.navigate({
                routeName = v51.SquadLobby, 
                params = {
                    conversationId = v96, 
                    extraParams = v97
                }
            })
        };
        if v71.wideMode then
            return v27.Actions.navigate({
                routeName = v51.ChatLanding, 
                params = {
                    conversationId = v96
                }, 
                action = v27.StackActions.reset({
                    index = 2, 
                    actions = v98
                })
            });
        else
            table.insert(v98, 1, v27.Actions.navigate({
                routeName = v51.ChatLanding
            }));
            return v27.Actions.navigate({
                routeName = v51.ChatLandingStack, 
                params = {
                    conversationId = v96
                }, 
                action = v27.StackActions.reset({
                    index = 3, 
                    actions = v98
                })
            });
        end;
    end, {
        v71.wideMode
    });
    local v101 = l_useCallback_0(function(v100) --[[ Line: 319 ]]
        -- upvalues: v80 (copy), v49 (ref)
        return v80(v49("one_to_one", {
            v100
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80
    } else l_dependencyArray_0(v80));
    local v103 = l_useCallback_0(function(v102) --[[ Line: 323 ]]
        -- upvalues: v80 (copy), v50 (ref)
        return v80(v50(v102));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80
    } else l_dependencyArray_0(v80));
    local v117 = l_useCallback_0(function(v104) --[[ Line: 328 ]]
        -- upvalues: v89 (copy), v71 (copy), l_GetFFlagIsSquadEnabled_0 (ref), v4 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v62 (ref), v80 (copy), v99 (copy), v51 (ref), v24 (ref), v25 (ref), v103 (copy), v8 (ref), v95 (copy), v101 (copy), v27 (ref)
        v89.current = v104;
        if not v71.updateExternalNavigationForScreen then
            return function() --[[ Line: 331 ]]
                -- upvalues: v89 (ref)
                v89.current = nil;
            end;
        else
            local l_updateExternalNavigationForScreen_0 = v71.updateExternalNavigationForScreen;
            if l_GetFFlagIsSquadEnabled_0() then
                l_updateExternalNavigationForScreen_0(function(v106) --[[ Line: 338 ]]
                    -- upvalues: v4 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v62 (ref), v80 (ref), v104 (copy), v99 (ref)
                    local l_conversationId_0 = v106.conversationId;
                    local v108 = v4.Dictionary.omit(v106, "conversationId");
                    if l_FFlagAppChatShowOSAOnPageEntry_0 then
                        v62({
                            conversationId = l_conversationId_0, 
                            dispatch = v80, 
                            onAccepted = function() --[[ Line: 345 ]] --[[ Name: onAccepted ]]
                                -- upvalues: v104 (ref), v99 (ref), l_conversationId_0 (copy), v108 (copy)
                                v104(v99(l_conversationId_0, v108));
                            end, 
                            requireMultiUserForU13 = true
                        });
                        return;
                    else
                        v104(v99(l_conversationId_0, v108));
                        return;
                    end;
                end, v51.SquadLobby);
            end;
            l_updateExternalNavigationForScreen_0(function(v109) --[[ Line: 356 ]]
                -- upvalues: l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v62 (ref), v80 (ref), v24 (ref), v25 (ref), v103 (ref), v8 (ref), v104 (copy), v95 (ref), v101 (ref)
                local v110 = v109 and v109.conversationId;
                if v110 then
                    if l_FFlagAppChatShowOSAOnPageEntry_0 then
                        v62({
                            conversationId = v110, 
                            dispatch = v80, 
                            onAccepted = function() --[[ Line: 364 ]] --[[ Name: onAccepted ]]
                                -- upvalues: v24 (ref), v25 (ref), v110 (copy), v103 (ref), v8 (ref), v104 (ref), v95 (ref)
                                if v24 then
                                    v25.start(v25.Events.ChatConversationTTI, {
                                        conversationId = v110
                                    });
                                end;
                                v103(v110):andThen(function() --[[ Line: 371 ]]
                                    -- upvalues: v8 (ref), v110 (ref), v104 (ref), v95 (ref)
                                    v8:info("Successfully fetched conversation details for conversationId {} for external navigation", v110);
                                    v104(v95(v110));
                                end):catch(function(v111) --[[ Line: 378 ]]
                                    -- upvalues: v8 (ref), v24 (ref), v25 (ref), v110 (ref)
                                    v8:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v111)));
                                    if v24 then
                                        v25.cancel(v25.Events.ChatConversationTTI, {
                                            conversationId = v110
                                        });
                                    end;
                                end);
                            end
                        });
                    else
                        if v24 then
                            v25.start(v25.Events.ChatConversationTTI, {
                                conversationId = v110
                            });
                        end;
                        v103(v110):andThen(function() --[[ Line: 398 ]]
                            -- upvalues: v8 (ref), v110 (copy), v104 (ref), v95 (ref)
                            v8:info("Successfully fetched conversation details for conversationId {} for external navigation", v110);
                            v104(v95(v110));
                        end):catch(function(v112) --[[ Line: 405 ]]
                            -- upvalues: v8 (ref), v24 (ref), v25 (ref), v110 (copy)
                            v8:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v112)));
                            if v24 then
                                v25.cancel(v25.Events.ChatConversationTTI, {
                                    conversationId = v110
                                });
                            end;
                        end);
                        return;
                    end;
                end;
                local v113 = v109 and v109.userId;
                if not v113 then
                    return;
                else
                    spawn(function() --[[ Line: 426 ]]
                        -- upvalues: v101 (ref), v113 (copy), v24 (ref), v25 (ref), v8 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v62 (ref), v80 (ref), v104 (ref), v95 (ref)
                        v101(v113):andThen(function(v114) --[[ Line: 428 ]]
                            -- upvalues: v24 (ref), v25 (ref), v8 (ref), v113 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v62 (ref), v80 (ref), v104 (ref), v95 (ref)
                            if v24 then
                                v25.start(v25.Events.ChatConversationTTI, {
                                    conversationId = v114.id
                                });
                            end;
                            v8:info("Successfully fetched conversation details for userId {} for external navigation", v113);
                            if l_FFlagAppChatShowOSAOnPageEntry_0 then
                                v62({
                                    conversationId = v114.id, 
                                    dispatch = v80, 
                                    onAccepted = function() --[[ Line: 442 ]] --[[ Name: onAccepted ]]
                                        -- upvalues: v104 (ref), v95 (ref), v114 (copy)
                                        v104(v95(v114.id));
                                    end
                                });
                                return;
                            else
                                v104(v95(v114.id));
                                return;
                            end;
                        end):catch(function(v115) --[[ Line: 450 ]]
                            -- upvalues: v8 (ref)
                            v8:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(v115)));
                        end);
                    end);
                    return;
                end;
            end, v51.ChatConversation);
            l_updateExternalNavigationForScreen_0(function(v116) --[[ Line: 460 ]]
                -- upvalues: v104 (copy), v27 (ref), v51 (ref), v71 (ref)
                v104(v27.Actions.navigate({
                    routeName = v51.ChatLanding, 
                    params = v116
                }));
                if v71.wideMode then
                    v104(v27.Actions.navigate({
                        routeName = v51.EmptyConversation
                    }));
                end;
            end, v51.ChatLanding);
            return function() --[[ Line: 472 ]]
                -- upvalues: l_updateExternalNavigationForScreen_0 (copy), v51 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v89 (ref)
                l_updateExternalNavigationForScreen_0(nil, v51.ChatLanding);
                l_updateExternalNavigationForScreen_0(nil, v51.ChatConversation);
                if l_GetFFlagIsSquadEnabled_0() then
                    l_updateExternalNavigationForScreen_0(nil, v51.SquadLobby);
                end;
                v89.current = nil;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v89
    } else l_dependencyArray_0(v89));
    local v119 = l_useCallback_0(function(v118) --[[ Line: 487 ]]
        -- upvalues: v16 (ref)
        return v16(false).getScreenTopBar(v118)(false);
    end, {});
    local v122 = l_useCallback_0(function(v120, v121) --[[ Line: 492 ]]
        -- upvalues: v16 (ref)
        v16(false).setScreenTopBar(v120, v121);
    end, {});
    local v124 = l_useCallback_0(function(v123) --[[ Line: 496 ]]
        -- upvalues: v3 (ref), v83 (copy)
        v3.isType(v123, "string", "screen");
        return v83[v123] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v83
    } else l_dependencyArray_0(v83));
    local v129 = l_useCallback_0(function(v125, v126) --[[ Line: 501 ]]
        -- upvalues: v3 (ref), v84 (copy), v4 (ref)
        v3.isType(v125, "string", "screen");
        v3.isType(v126, "table", "state");
        v84(function(v127) --[[ Line: 504 ]]
            -- upvalues: v4 (ref), v125 (copy), v126 (copy)
            local v128 = v4.Dictionary.join(v127[v125] or {}, v126);
            return v4.Dictionary.join(v127, {
                [v125] = v128
            });
        end);
    end, {});
    local v130 = if v19 then v119 else v124;
    local v131 = if v19 then v122 else v129;
    local v133 = l_useCallback_0(function(v132) --[[ Line: 520 ]]
        -- upvalues: v88 (copy), v91 (copy)
        if v88.current then
            v88.current:disconnect();
            v88.current = nil;
        end;
        if v132 then
            v88.current = v132:connect(v91);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v88
    } else l_dependencyArray_0(v88));
    l_useEffect_0(function() --[[ Line: 535 ]]
        -- upvalues: v87 (copy), v133 (copy), v71 (copy), v80 (copy), v54 (ref)
        v87.current = true;
        v133(v71.rnBypassActionSignal);
        return function() --[[ Line: 539 ]]
            -- upvalues: v87 (ref), v133 (ref), v80 (ref), v54 (ref)
            v87.current = false;
            v133(nil);
            v80(v54());
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 548 ]]
        -- upvalues: v71 (copy), v72 (copy), v80 (copy), v55 (ref), v51 (ref), v75 (copy)
        if v71.initialConversationId and v71.initialConversationId ~= "" and v72 then
            v80(v55({
                screen = v51.ChatConversation, 
                params = {
                    userId = v75, 
                    conversationId = v71.initialConversationId
                }
            }));
            v71.setInitialConversationId("");
        end;
        return function() --[[ Line: 557 ]]

        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80, 
        v75, 
        v71.initialConversationId, 
        v71.setInitialConversationId
    } else l_dependencyArray_0(v80, v75, v71.initialConversationId, v71.setInitialConversationId));
    local v134 = nil;
    local v135 = nil;
    if l_GetFFlagIsSquadEnabled_0() then
        v134 = l_useCurrentSquadParentChannelId_0();
        if l_GetFFlagEnableCrossExpVoice_0() then
            v135 = l_useIsVoiceConnected_0();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 578 ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (ref), v72 (copy), v71 (copy), v134 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v135 (ref), v80 (copy), v55 (ref), v51 (ref), v75 (copy)
        if l_GetFFlagIsSquadEnabled_0() and v72 and v71.initialConversationId == "" and v134 then
            if l_GetFFlagEnableCrossExpVoice_0() and v135 then
                v80(v55({
                    screen = v51.SquadLobby, 
                    params = {
                        userId = v75, 
                        conversationId = v134
                    }
                }));
                return;
            else
                v80(v55({
                    screen = v51.ChatConversation, 
                    params = {
                        userId = v75, 
                        conversationId = v134
                    }
                }));
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {} else l_dependencyArray_0());
    l_useEffect_0(function() --[[ Line: 600 ]]
        -- upvalues: v133 (copy), v71 (copy)
        v133(v71.rnBypassActionSignal);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71.rnBypassActionSignal
    } else l_dependencyArray_0(v71.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 609 ]]
        -- upvalues: v19 (ref), v4 (ref), v83 (copy), v84 (copy)
        if not v19 and not v4.isEmpty(v83) then
            v84({});
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71.wideMode, 
        v19
    } else l_dependencyArray_0(v71.wideMode, v19));
    local v137 = v31(function(v136) --[[ Line: 619 ]]
        return v136.getChatHeaderSearch();
    end);
    local v139 = v31(function(v138) --[[ Line: 622 ]]
        return v138.getChatHeaderCreateChatGroup();
    end);
    local v141 = v31(function(v140) --[[ Line: 625 ]]
        -- upvalues: v56 (ref)
        return v140.getChatHeaderNotifications() and (not v56() or v140.getWebViewSupport());
    end);
    local v142 = l_usePageSideMargin_0(v86.current);
    local v143 = v26.useMemo(function() --[[ Line: 631 ]]
        -- upvalues: v72 (copy), v142 (copy)
        return {
            outer = v72 and 12 or v142, 
            inner = v72 and 12 or v142, 
            default = 12
        };
    end, {
        v142, 
        v72
    });
    local v144 = not v72 and v141;
    local v145 = v137 and not v72;
    local v146 = v45();
    v139 = v139 and v146;
    v145 = v145 and v146;
    local v147 = v72 and l_GetFFlagEnableAppChatInExperience_0();
    local v148 = l_useStyle_0();
    local v150 = l_useCallback_0(function(v149) --[[ Line: 651 ]]
        -- upvalues: v80 (copy), l_SetTabBarVisible_0 (ref)
        v80(l_SetTabBarVisible_0(v149));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v80
    } else l_dependencyArray_0(v80));
    local v151 = v26.createElement(v86, {
        externalDispatchConnector = v117, 
        parameters = v71.parameters, 
        setActiveConversationId = v71.setActiveConversationId, 
        setBackButtonEnabled = v71.setBackButtonEnabled, 
        setTabBarVisible = v150, 
        chatIsVisible = v82, 
        screenProps = {
            navigateToLuaAppPages = v71.navigateToLuaAppPages, 
            topBarHeight = math.max(l_UserInputService_0.NavBarSize.Y, if v73 then v73.Size.Size_1400 else l_NAV_BAR_WITH_FACEPILE_SIZE_0), 
            wideMode = v71.wideMode, 
            isInExperience = v72, 
            isVisible = v71.isVisible, 
            notificationCount = v71.notificationCount, 
            appChatOuterPadding = v143.outer, 
            appChatInnerPadding = v143.inner, 
            appChatDefaultPadding = v143.default, 
            topBarShowSearch = v145, 
            topBarShowCreateChatGroup = v139, 
            topBarShowNotifications = v144, 
            topBarShowSnoozeNotifications = v147, 
            topBarUtilityIconSideMargin = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v73.Size.Size_100 else nil, 
            showSearchRow = v72, 
            navigateToRootStack = v71.navigateToRootStack, 
            navigateToAddFriends = v71.navigateToAddFriends, 
            getScreenTopBar = if v19 then nil else v130, 
            setScreenTopBar = if v19 then nil else v131
        }
    });
    v151 = v26.createElement(v20, {
        navigateToLuaAppPages = v71.navigateToLuaAppPages, 
        dispatch = v80
    }, {
        navigation = v151
    });
    v151 = v26.createElement(v18.Provider, {
        value = {
            chatPlacement = v71.chatPlacement
        }
    }, {
        navigation = v151
    });
    if v58() then
        v151 = v26.createElement(v43, {}, {
            navigation = v151
        });
        v151 = v26.createElement(v47.InteractionFeedbackContext.Provider, {
            value = l_HapticFeedbackConfig_0
        }, {
            navigation = v151
        });
    end;
    if not v72 then
        v151 = v26.createElement(l_LayerCollectorProvider_0, {}, {
            navigation = v151
        });
    end;
    local v152 = v42();
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v156 = if l_GetFFlagIsSquadEnabled_0() then l_useSelector_0(function(v154) --[[ Line: 723 ]]
        local v155 = v154.Squad and v154.Squad.Squad and v154.Squad.Squad.currentSquad;
        if v155 and v155.squadId then
            return v155.squadId;
        else
            return nil;
        end;
    end) else nil;
    local v157 = v26.createElement(v15, {
        localUserId = v75, 
        entryPoint = v79
    }, {
        telemetry = v26.createElement(v23.Provider, {
            value = {
                context = "platformChat", 
                locale = v152, 
                entryPoint = v79 or "unknown", 
                userId = v75, 
                playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0, 
                currentSquadId = v156, 
                placement = v71.chatPlacement
            }
        }, {
            v26.createElement(if v19 then v26.Fragment else v17.Provider, if v19 then nil else {
                value = v4.Dictionary.join(v83, {
                    getScreenTopBar = v130, 
                    setScreenTopBar = v131
                })
            }, {
                navigation = v151, 
                BottomInsetBackground = if v77.bottom > 0 then v26.createElement("Frame", {
                    BackgroundColor3 = if v57() then v148.Theme.BackgroundDefault.Color else v148.Theme.NavigationBar.Color, 
                    BackgroundTransparency = if v57() then v148.Theme.BackgroundDefault.Transparency else v148.Theme.NavigationBar.Transparency, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, v77.bottom), 
                    ZIndex = 3
                }) else nil
            })
        })
    });
    if v24 then
        l_useEffect_0(function() --[[ Line: 777 ]]
            -- upvalues: v25 (ref), v71 (copy), v79 (copy), v156 (copy)
            v25.setSharedContext({
                placement = v71.chatPlacement, 
                entryPoint = v79, 
                hasActiveParty = v156 ~= nil
            });
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v71.chatPlacement, 
            v79, 
            v156
        } else l_dependencyArray_0(v71.chatPlacement, v79, v156));
    end;
    return v26.createElement(v22, {
        entryPoint = v79
    }, {
        v157
    });
end;
return l_memo_0(AppChatEntryPoint);