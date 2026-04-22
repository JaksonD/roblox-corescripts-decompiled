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
local v60 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v61 = require(l_script_FirstAncestor_0.Flags.FFlagSupportViewingUserProfileOnOSA);
local v62 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v63 = require(l_script_FirstAncestor_0.Utils.navigateWithOsaGate);
local l_FFlagAppChatShowOSAOnPageEntry_0 = v6.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v6.FFlagEnableHeaderBarButtonsUpdate;
local v66 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v6.FFlagRemoveDependencyArrayAntipattern;
local l_NAV_BAR_WITH_FACEPILE_SIZE_0 = v66.NAV_BAR_WITH_FACEPILE_SIZE;
local v70 = {
    logger = l_Logger_0, 
    navigateToLuaAppPages = nil, 
    parameters = nil, 
    rnBypassActionSignal = nil, 
    setActiveConversationId = nil, 
    setBackButtonEnabled = nil, 
    setTabBarVisible = function() --[[ Line: 127 ]] --[[ Name: setTabBarVisible ]]

    end, 
    setInitialConversationId = function(_) --[[ Line: 128 ]] --[[ Name: setInitialConversationId ]]

    end, 
    wideMode = false, 
    notificationCount = 0, 
    navigateToRootStack = nil, 
    androidBackButtonSignal = nil, 
    initialConversationId = "", 
    chatPlacement = v18.Enum.Unknown
};
AppChatEntryPoint = function(v71) --[[ Line: 141 ]] --[[ Name: AppChatEntryPoint ]]
    -- upvalues: v4 (copy), v70 (copy), v18 (copy), l_useTokens_0 (copy), v13 (copy), v11 (ref), l_script_FirstAncestor_0 (copy), v12 (ref), l_useSelector_0 (copy), l_useCallback_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v46 (copy), v8 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v33 (copy), l_useState_0 (copy), v26 (copy), v27 (copy), v9 (copy), l_useRef_0 (copy), v61 (copy), v62 (copy), v51 (copy), v49 (copy), v50 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_FFlagAppChatShowOSAOnPageEntry_0 (copy), v63 (copy), v24 (copy), v25 (copy), v16 (copy), v3 (copy), v19 (copy), v54 (copy), v55 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), v31 (copy), v56 (copy), l_usePageSideMargin_0 (copy), v45 (copy), v60 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_useStyle_0 (copy), l_SetTabBarVisible_0 (copy), l_UserInputService_0 (copy), l_NAV_BAR_WITH_FACEPILE_SIZE_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v20 (copy), v58 (copy), v43 (copy), v47 (copy), l_HapticFeedbackConfig_0 (copy), l_LayerCollectorProvider_0 (copy), v42 (copy), l_RbxAnalyticsService_0 (copy), v15 (copy), v23 (copy), v17 (copy), v57 (copy), v22 (copy)
    local v72 = v4.Dictionary.join(v70, v71);
    local v73 = v18.isPlacementInExperience(v72.chatPlacement);
    local v74 = l_useTokens_0();
    if v13 then
        v11 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
        v12 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
    end;
    local v76 = l_useSelector_0(l_useCallback_0(function(v75) --[[ Line: 152 ]]
        return v75.LocalUserId;
    end, {})) or v72.localUserId;
    local v78 = l_useSelector_0(l_useCallback_0(function(v77) --[[ Line: 155 ]]
        return v77.GlobalGuiInset;
    end, {})) or {
        bottom = 0
    };
    local v80 = l_useSelector_0(l_useCallback_0(function(v79) --[[ Line: 158 ]]
        return v79.ChatAppReducer.LastEntryPoint;
    end, {}));
    local v81 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 165 ]]
        -- upvalues: v81 (copy), v46 (ref), v73 (copy), v8 (ref)
        v81(v46.rodux.GetChatLandingModal.API(v73)):catch(function(v82) --[[ Line: 166 ]]
            -- upvalues: v8 (ref)
            v8:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v82)));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v76, 
        v73
    } else l_dependencyArray_0(v81, v76, v73));
    local v83 = v33();
    local v84, v85 = l_useState_0({});
    local v86 = v26.useMemo(function() --[[ Line: 180 ]]
        -- upvalues: v27 (ref), v9 (ref), v72 (copy), v12 (ref), v11 (ref)
        return v27.createAppContainer(v9(v72.wideMode and v12 or v11, v72.navigateToRootStack, v72.androidBackButtonSignal, v72.androidBackButtonConnection));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72.wideMode, 
        v12, 
        v11, 
        v72.navigateToRootStack, 
        v72.androidBackButtonSignal, 
        v72.androidBackButtonConnection
    } else l_dependencyArray_0(v72.wideMode, v12, v11, v72.navigateToRootStack, v72.androidBackButtonSignal, v72.androidBackButtonConnection));
    local v87 = if v73 then v86 else l_useRef_0(v27.createAppContainer(v9(v72.wideMode and v12 or v11, v72.navigateToRootStack, v72.androidBackButtonSignal, v72.androidBackButtonConnection)));
    if not v73 then
        v87 = v87.current;
    end;
    local v88 = l_useRef_0(false);
    local v89 = l_useRef_0(nil);
    local v90 = l_useRef_0(function(...) --[[ Line: 228 ]]

    end);
    l_useEffect_0(function() --[[ Line: 230 ]]
        -- upvalues: v72 (copy), v8 (ref)
        if v72.logger then
            v8:setParent(v72.logger);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72.logger
    } else l_dependencyArray_0(v72.logger));
    local v92 = l_useCallback_0(function(v91) --[[ Line: 237 ]]
        -- upvalues: v88 (copy), v90 (copy)
        if not v88.current then
            return;
        else
            if v90.current then
                v90.current(v91);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v88, 
        v90
    } else l_dependencyArray_0(v88, v90));
    if v61 then
        local l_navigateToLuaAppPages_0 = v72.navigateToLuaAppPages;
        local l_l_navigateToLuaAppPages_0_0 = l_navigateToLuaAppPages_0 --[[ copy: 17 -> 48 ]];
        l_useEffect_0(function() --[[ Line: 253 ]]
            -- upvalues: v62 (ref), l_l_navigateToLuaAppPages_0_0 (copy), v51 (ref)
            v62(false).setOverlayDefaultProps({
                onViewUserProfile = if l_l_navigateToLuaAppPages_0_0 then l_l_navigateToLuaAppPages_0_0[v51.ViewUserProfile] else nil
            });
        end, {
            l_navigateToLuaAppPages_0
        });
    end;
    local v96 = l_useCallback_0(function(v95) --[[ Line: 263 ]]
        -- upvalues: v27 (ref), v51 (ref)
        return v27.Actions.navigate({
            routeName = v51.ChatConversation, 
            params = {
                conversationId = v95
            }
        });
    end, {});
    local v100 = l_useCallback_0(function(v97, v98) --[[ Line: 271 ]]
        -- upvalues: v27 (ref), v51 (ref), v72 (copy)
        local v99 = {
            v27.Actions.navigate({
                routeName = v51.ChatConversation, 
                params = {
                    conversationId = v97
                }
            }), 
            v27.Actions.navigate({
                routeName = v51.SquadLobby, 
                params = {
                    conversationId = v97, 
                    extraParams = v98
                }
            })
        };
        if v72.wideMode then
            return v27.Actions.navigate({
                routeName = v51.ChatLanding, 
                params = {
                    conversationId = v97
                }, 
                action = v27.StackActions.reset({
                    index = 2, 
                    actions = v99
                })
            });
        else
            table.insert(v99, 1, v27.Actions.navigate({
                routeName = v51.ChatLanding
            }));
            return v27.Actions.navigate({
                routeName = v51.ChatLandingStack, 
                params = {
                    conversationId = v97
                }, 
                action = v27.StackActions.reset({
                    index = 3, 
                    actions = v99
                })
            });
        end;
    end, {
        v72.wideMode
    });
    local v102 = l_useCallback_0(function(v101) --[[ Line: 320 ]]
        -- upvalues: v81 (copy), v49 (ref)
        return v81(v49("one_to_one", {
            v101
        }));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81
    } else l_dependencyArray_0(v81));
    local v104 = l_useCallback_0(function(v103) --[[ Line: 324 ]]
        -- upvalues: v81 (copy), v50 (ref)
        return v81(v50(v103));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81
    } else l_dependencyArray_0(v81));
    local v118 = l_useCallback_0(function(v105) --[[ Line: 329 ]]
        -- upvalues: v90 (copy), v72 (copy), l_GetFFlagIsSquadEnabled_0 (ref), v4 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v63 (ref), v81 (copy), v100 (copy), v51 (ref), v24 (ref), v25 (ref), v104 (copy), v8 (ref), v96 (copy), v102 (copy), v27 (ref)
        v90.current = v105;
        if not v72.updateExternalNavigationForScreen then
            return function() --[[ Line: 332 ]]
                -- upvalues: v90 (ref)
                v90.current = nil;
            end;
        else
            local l_updateExternalNavigationForScreen_0 = v72.updateExternalNavigationForScreen;
            if l_GetFFlagIsSquadEnabled_0() then
                l_updateExternalNavigationForScreen_0(function(v107) --[[ Line: 339 ]]
                    -- upvalues: v4 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v63 (ref), v81 (ref), v105 (copy), v100 (ref)
                    local l_conversationId_0 = v107.conversationId;
                    local v109 = v4.Dictionary.omit(v107, "conversationId");
                    if l_FFlagAppChatShowOSAOnPageEntry_0 then
                        v63({
                            conversationId = l_conversationId_0, 
                            dispatch = v81, 
                            onAccepted = function() --[[ Line: 346 ]] --[[ Name: onAccepted ]]
                                -- upvalues: v105 (ref), v100 (ref), l_conversationId_0 (copy), v109 (copy)
                                v105(v100(l_conversationId_0, v109));
                            end, 
                            requireMultiUserForU13 = true
                        });
                        return;
                    else
                        v105(v100(l_conversationId_0, v109));
                        return;
                    end;
                end, v51.SquadLobby);
            end;
            l_updateExternalNavigationForScreen_0(function(v110) --[[ Line: 357 ]]
                -- upvalues: l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v63 (ref), v81 (ref), v24 (ref), v25 (ref), v104 (ref), v8 (ref), v105 (copy), v96 (ref), v102 (ref)
                local v111 = v110 and v110.conversationId;
                if v111 then
                    if l_FFlagAppChatShowOSAOnPageEntry_0 then
                        v63({
                            conversationId = v111, 
                            dispatch = v81, 
                            onAccepted = function() --[[ Line: 365 ]] --[[ Name: onAccepted ]]
                                -- upvalues: v24 (ref), v25 (ref), v111 (copy), v104 (ref), v8 (ref), v105 (ref), v96 (ref)
                                if v24 then
                                    v25.start(v25.Events.ChatConversationTTI, {
                                        conversationId = v111
                                    });
                                end;
                                v104(v111):andThen(function() --[[ Line: 372 ]]
                                    -- upvalues: v8 (ref), v111 (ref), v105 (ref), v96 (ref)
                                    v8:info("Successfully fetched conversation details for conversationId {} for external navigation", v111);
                                    v105(v96(v111));
                                end):catch(function(v112) --[[ Line: 379 ]]
                                    -- upvalues: v8 (ref), v24 (ref), v25 (ref), v111 (ref)
                                    v8:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v112)));
                                    if v24 then
                                        v25.cancel(v25.Events.ChatConversationTTI, {
                                            conversationId = v111
                                        });
                                    end;
                                end);
                            end
                        });
                    else
                        if v24 then
                            v25.start(v25.Events.ChatConversationTTI, {
                                conversationId = v111
                            });
                        end;
                        v104(v111):andThen(function() --[[ Line: 399 ]]
                            -- upvalues: v8 (ref), v111 (copy), v105 (ref), v96 (ref)
                            v8:info("Successfully fetched conversation details for conversationId {} for external navigation", v111);
                            v105(v96(v111));
                        end):catch(function(v113) --[[ Line: 406 ]]
                            -- upvalues: v8 (ref), v24 (ref), v25 (ref), v111 (copy)
                            v8:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v113)));
                            if v24 then
                                v25.cancel(v25.Events.ChatConversationTTI, {
                                    conversationId = v111
                                });
                            end;
                        end);
                        return;
                    end;
                end;
                local v114 = v110 and v110.userId;
                if not v114 then
                    return;
                else
                    spawn(function() --[[ Line: 427 ]]
                        -- upvalues: v102 (ref), v114 (copy), v24 (ref), v25 (ref), v8 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v63 (ref), v81 (ref), v105 (ref), v96 (ref)
                        v102(v114):andThen(function(v115) --[[ Line: 429 ]]
                            -- upvalues: v24 (ref), v25 (ref), v8 (ref), v114 (ref), l_FFlagAppChatShowOSAOnPageEntry_0 (ref), v63 (ref), v81 (ref), v105 (ref), v96 (ref)
                            if v24 then
                                v25.start(v25.Events.ChatConversationTTI, {
                                    conversationId = v115.id
                                });
                            end;
                            v8:info("Successfully fetched conversation details for userId {} for external navigation", v114);
                            if l_FFlagAppChatShowOSAOnPageEntry_0 then
                                v63({
                                    conversationId = v115.id, 
                                    dispatch = v81, 
                                    onAccepted = function() --[[ Line: 443 ]] --[[ Name: onAccepted ]]
                                        -- upvalues: v105 (ref), v96 (ref), v115 (copy)
                                        v105(v96(v115.id));
                                    end
                                });
                                return;
                            else
                                v105(v96(v115.id));
                                return;
                            end;
                        end):catch(function(v116) --[[ Line: 451 ]]
                            -- upvalues: v8 (ref)
                            v8:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(v116)));
                        end);
                    end);
                    return;
                end;
            end, v51.ChatConversation);
            l_updateExternalNavigationForScreen_0(function(v117) --[[ Line: 461 ]]
                -- upvalues: v105 (copy), v27 (ref), v51 (ref), v72 (ref)
                v105(v27.Actions.navigate({
                    routeName = v51.ChatLanding, 
                    params = v117
                }));
                if v72.wideMode then
                    v105(v27.Actions.navigate({
                        routeName = v51.EmptyConversation
                    }));
                end;
            end, v51.ChatLanding);
            return function() --[[ Line: 473 ]]
                -- upvalues: l_updateExternalNavigationForScreen_0 (copy), v51 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v90 (ref)
                l_updateExternalNavigationForScreen_0(nil, v51.ChatLanding);
                l_updateExternalNavigationForScreen_0(nil, v51.ChatConversation);
                if l_GetFFlagIsSquadEnabled_0() then
                    l_updateExternalNavigationForScreen_0(nil, v51.SquadLobby);
                end;
                v90.current = nil;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v90
    } else l_dependencyArray_0(v90));
    local v120 = l_useCallback_0(function(v119) --[[ Line: 488 ]]
        -- upvalues: v16 (ref)
        return v16(false).getScreenTopBar(v119)(false);
    end, {});
    local v123 = l_useCallback_0(function(v121, v122) --[[ Line: 493 ]]
        -- upvalues: v16 (ref)
        v16(false).setScreenTopBar(v121, v122);
    end, {});
    local v125 = l_useCallback_0(function(v124) --[[ Line: 497 ]]
        -- upvalues: v3 (ref), v84 (copy)
        v3.isType(v124, "string", "screen");
        return v84[v124] or {};
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v84
    } else l_dependencyArray_0(v84));
    local v130 = l_useCallback_0(function(v126, v127) --[[ Line: 502 ]]
        -- upvalues: v3 (ref), v85 (copy), v4 (ref)
        v3.isType(v126, "string", "screen");
        v3.isType(v127, "table", "state");
        v85(function(v128) --[[ Line: 505 ]]
            -- upvalues: v4 (ref), v126 (copy), v127 (copy)
            local v129 = v4.Dictionary.join(v128[v126] or {}, v127);
            return v4.Dictionary.join(v128, {
                [v126] = v129
            });
        end);
    end, {});
    local v131 = if v19 then v120 else v125;
    local v132 = if v19 then v123 else v130;
    local v134 = l_useCallback_0(function(v133) --[[ Line: 521 ]]
        -- upvalues: v89 (copy), v92 (copy)
        if v89.current then
            v89.current:disconnect();
            v89.current = nil;
        end;
        if v133 then
            v89.current = v133:connect(v92);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v89
    } else l_dependencyArray_0(v89));
    l_useEffect_0(function() --[[ Line: 536 ]]
        -- upvalues: v88 (copy), v134 (copy), v72 (copy), v81 (copy), v54 (ref)
        v88.current = true;
        v134(v72.rnBypassActionSignal);
        return function() --[[ Line: 540 ]]
            -- upvalues: v88 (ref), v134 (ref), v81 (ref), v54 (ref)
            v88.current = false;
            v134(nil);
            v81(v54());
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 549 ]]
        -- upvalues: v72 (copy), v73 (copy), v81 (copy), v55 (ref), v51 (ref), v76 (copy)
        if v72.initialConversationId and v72.initialConversationId ~= "" and v73 then
            v81(v55({
                screen = v51.ChatConversation, 
                params = {
                    userId = v76, 
                    conversationId = v72.initialConversationId
                }
            }));
            v72.setInitialConversationId("");
        end;
        return function() --[[ Line: 558 ]]

        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81, 
        v76, 
        v72.initialConversationId, 
        v72.setInitialConversationId
    } else l_dependencyArray_0(v81, v76, v72.initialConversationId, v72.setInitialConversationId));
    local v135 = nil;
    local v136 = nil;
    if l_GetFFlagIsSquadEnabled_0() then
        v135 = l_useCurrentSquadParentChannelId_0();
        if l_GetFFlagEnableCrossExpVoice_0() then
            v136 = l_useIsVoiceConnected_0();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 579 ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (ref), v73 (copy), v72 (copy), v135 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v136 (ref), v81 (copy), v55 (ref), v51 (ref), v76 (copy)
        if l_GetFFlagIsSquadEnabled_0() and v73 and v72.initialConversationId == "" and v135 then
            if l_GetFFlagEnableCrossExpVoice_0() and v136 then
                v81(v55({
                    screen = v51.SquadLobby, 
                    params = {
                        userId = v76, 
                        conversationId = v135
                    }
                }));
                return;
            else
                v81(v55({
                    screen = v51.ChatConversation, 
                    params = {
                        userId = v76, 
                        conversationId = v135
                    }
                }));
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {} else l_dependencyArray_0());
    l_useEffect_0(function() --[[ Line: 601 ]]
        -- upvalues: v134 (copy), v72 (copy)
        v134(v72.rnBypassActionSignal);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72.rnBypassActionSignal
    } else l_dependencyArray_0(v72.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 610 ]]
        -- upvalues: v19 (ref), v4 (ref), v84 (copy), v85 (copy)
        if not v19 and not v4.isEmpty(v84) then
            v85({});
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v72.wideMode, 
        v19
    } else l_dependencyArray_0(v72.wideMode, v19));
    local v138 = v31(function(v137) --[[ Line: 620 ]]
        return v137.getChatHeaderSearch();
    end);
    local v140 = v31(function(v139) --[[ Line: 623 ]]
        return v139.getChatHeaderCreateChatGroup();
    end);
    local v142 = v31(function(v141) --[[ Line: 626 ]]
        -- upvalues: v56 (ref)
        return v141.getChatHeaderNotifications() and (not v56() or v141.getWebViewSupport());
    end);
    local v143 = l_usePageSideMargin_0(v87.current);
    local v144 = v26.useMemo(function() --[[ Line: 632 ]]
        -- upvalues: v73 (copy), v143 (copy)
        return {
            outer = v73 and 12 or v143, 
            inner = v73 and 12 or v143, 
            default = 12
        };
    end, {
        v143, 
        v73
    });
    local v145 = v45();
    local v146 = if v60() then nil else not v73 and v142;
    local v147 = if v60() then nil else v138 and not v73 and v145;
    local v148 = if v60() then nil else v140 and v145;
    local v149 = if v60() then nil else v73 and l_GetFFlagEnableAppChatInExperience_0();
    local v150 = l_useStyle_0();
    local v152 = l_useCallback_0(function(v151) --[[ Line: 658 ]]
        -- upvalues: v81 (copy), l_SetTabBarVisible_0 (ref)
        v81(l_SetTabBarVisible_0(v151));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v81
    } else l_dependencyArray_0(v81));
    local v153 = v26.createElement(v87, {
        externalDispatchConnector = v118, 
        parameters = v72.parameters, 
        setActiveConversationId = v72.setActiveConversationId, 
        setBackButtonEnabled = v72.setBackButtonEnabled, 
        setTabBarVisible = v152, 
        chatIsVisible = v83, 
        screenProps = {
            navigateToLuaAppPages = v72.navigateToLuaAppPages, 
            topBarHeight = math.max(l_UserInputService_0.NavBarSize.Y, if v74 then v74.Size.Size_1400 else l_NAV_BAR_WITH_FACEPILE_SIZE_0), 
            wideMode = v72.wideMode, 
            isInExperience = v73, 
            isVisible = v72.isVisible, 
            notificationCount = v72.notificationCount, 
            appChatOuterPadding = v144.outer, 
            appChatInnerPadding = v144.inner, 
            appChatDefaultPadding = v144.default, 
            topBarShowSearch = v147, 
            topBarShowCreateChatGroup = v148, 
            topBarShowNotifications = v146, 
            topBarShowSnoozeNotifications = v149, 
            topBarUtilityIconSideMargin = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v74.Size.Size_100 else nil, 
            showSearchRow = v73, 
            navigateToRootStack = v72.navigateToRootStack, 
            navigateToAddFriends = v72.navigateToAddFriends, 
            getScreenTopBar = if v19 then nil else v131, 
            setScreenTopBar = if v19 then nil else v132
        }
    });
    v153 = v26.createElement(v20, {
        navigateToLuaAppPages = v72.navigateToLuaAppPages, 
        dispatch = v81
    }, {
        navigation = v153
    });
    v153 = v26.createElement(v18.Provider, {
        value = {
            chatPlacement = v72.chatPlacement
        }
    }, {
        navigation = v153
    });
    if v58() then
        v153 = v26.createElement(v43, {}, {
            navigation = v153
        });
        v153 = v26.createElement(v47.InteractionFeedbackContext.Provider, {
            value = l_HapticFeedbackConfig_0
        }, {
            navigation = v153
        });
    end;
    if not v73 then
        v153 = v26.createElement(l_LayerCollectorProvider_0, {}, {
            navigation = v153
        });
    end;
    local v154 = v42();
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v158 = if l_GetFFlagIsSquadEnabled_0() then l_useSelector_0(function(v156) --[[ Line: 730 ]]
        local v157 = v156.Squad and v156.Squad.Squad and v156.Squad.Squad.currentSquad;
        if v157 and v157.squadId then
            return v157.squadId;
        else
            return nil;
        end;
    end) else nil;
    local v159 = v26.createElement(v15, {
        localUserId = v76, 
        entryPoint = v80
    }, {
        telemetry = v26.createElement(v23.Provider, {
            value = {
                context = "platformChat", 
                locale = v154, 
                entryPoint = v80 or "unknown", 
                userId = v76, 
                playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0, 
                currentSquadId = v158, 
                placement = v72.chatPlacement
            }
        }, {
            v26.createElement(if v19 then v26.Fragment else v17.Provider, if v19 then nil else {
                value = v4.Dictionary.join(v84, {
                    getScreenTopBar = v131, 
                    setScreenTopBar = v132
                })
            }, {
                navigation = v153, 
                BottomInsetBackground = if v78.bottom > 0 then v26.createElement("Frame", {
                    BackgroundColor3 = if v57() then v150.Theme.BackgroundDefault.Color else v150.Theme.NavigationBar.Color, 
                    BackgroundTransparency = if v57() then v150.Theme.BackgroundDefault.Transparency else v150.Theme.NavigationBar.Transparency, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, v78.bottom), 
                    ZIndex = 3
                }) else nil
            })
        })
    });
    if v24 then
        l_useEffect_0(function() --[[ Line: 784 ]]
            -- upvalues: v25 (ref), v72 (copy), v80 (copy), v158 (copy)
            v25.setSharedContext({
                placement = v72.chatPlacement, 
                entryPoint = v80, 
                hasActiveParty = v158 ~= nil
            });
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v72.chatPlacement, 
            v80, 
            v158
        } else l_dependencyArray_0(v72.chatPlacement, v80, v158));
    end;
    return v26.createElement(v22, {
        entryPoint = v80
    }, {
        v159
    });
end;
return l_memo_0(AppChatEntryPoint);