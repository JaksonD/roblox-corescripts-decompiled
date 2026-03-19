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
local l_NAV_BAR_WITH_FACEPILE_SIZE_0 = require(l_script_FirstAncestor_0.Constants).NAV_BAR_WITH_FACEPILE_SIZE;
local v64 = {
    logger = l_Logger_0, 
    navigateToLuaAppPages = nil, 
    parameters = nil, 
    rnBypassActionSignal = nil, 
    setActiveConversationId = nil, 
    setBackButtonEnabled = nil, 
    setTabBarVisible = function() --[[ Line: 121 ]] --[[ Name: setTabBarVisible ]]

    end, 
    setInitialConversationId = function(_) --[[ Line: 122 ]] --[[ Name: setInitialConversationId ]]

    end, 
    wideMode = false, 
    notificationCount = 0, 
    navigateToRootStack = nil, 
    androidBackButtonSignal = nil, 
    initialConversationId = "", 
    chatPlacement = v18.Enum.Unknown
};
AppChatEntryPoint = function(v65) --[[ Line: 135 ]] --[[ Name: AppChatEntryPoint ]]
    -- upvalues: v4 (copy), v64 (copy), v18 (copy), l_useTokens_0 (copy), v13 (copy), v11 (ref), l_script_FirstAncestor_0 (copy), v12 (ref), l_useSelector_0 (copy), l_useCallback_0 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v46 (copy), v8 (copy), l_dependencyArray_0 (copy), v33 (copy), l_useState_0 (copy), v26 (copy), v27 (copy), v9 (copy), l_useRef_0 (copy), v60 (copy), v61 (copy), v51 (copy), v49 (copy), v50 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v24 (copy), v25 (copy), v16 (copy), v3 (copy), v19 (copy), v54 (copy), v55 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), l_useIsVoiceConnected_0 (copy), v31 (copy), v56 (copy), l_usePageSideMargin_0 (copy), v45 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_useStyle_0 (copy), l_SetTabBarVisible_0 (copy), l_UserInputService_0 (copy), l_NAV_BAR_WITH_FACEPILE_SIZE_0 (copy), v20 (copy), v58 (copy), v43 (copy), v47 (copy), l_HapticFeedbackConfig_0 (copy), l_LayerCollectorProvider_0 (copy), v42 (copy), l_RbxAnalyticsService_0 (copy), v15 (copy), v23 (copy), v17 (copy), v57 (copy), v22 (copy)
    local v66 = v4.Dictionary.join(v64, v65);
    local v67 = v18.isPlacementInExperience(v66.chatPlacement);
    local v68 = l_useTokens_0();
    if v13 then
        v11 = require(l_script_FirstAncestor_0.Navigators.Compact.rootNavigator);
        v12 = require(l_script_FirstAncestor_0.Navigators.Wide.rootNavigator);
    end;
    local v70 = l_useSelector_0(l_useCallback_0(function(v69) --[[ Line: 146 ]]
        return v69.LocalUserId;
    end, {})) or v66.localUserId;
    local v72 = l_useSelector_0(l_useCallback_0(function(v71) --[[ Line: 149 ]]
        return v71.GlobalGuiInset;
    end, {})) or {
        bottom = 0
    };
    local v74 = l_useSelector_0(l_useCallback_0(function(v73) --[[ Line: 152 ]]
        return v73.ChatAppReducer.LastEntryPoint;
    end, {}));
    local v75 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 158 ]]
        -- upvalues: v75 (copy), v46 (ref), v67 (copy), v8 (ref)
        v75(v46.rodux.GetChatLandingModal.API(v67)):catch(function(v76) --[[ Line: 159 ]]
            -- upvalues: v8 (ref)
            v8:warning("Error in GetChatLandingModal request. Error: {}", (tostring(v76)));
        end);
    end, l_dependencyArray_0(v75, v70, v67));
    local v77 = v33();
    local v78, v79 = l_useState_0({});
    local v80 = v26.useMemo(function() --[[ Line: 169 ]]
        -- upvalues: v27 (ref), v9 (ref), v66 (copy), v12 (ref), v11 (ref)
        return v27.createAppContainer(v9(v66.wideMode and v12 or v11, v66.navigateToRootStack, v66.androidBackButtonSignal, v66.androidBackButtonConnection));
    end, l_dependencyArray_0(v66.wideMode, v12, v11, v66.navigateToRootStack, v66.androidBackButtonSignal, v66.androidBackButtonConnection));
    local v81 = if v67 then v80 else l_useRef_0(v27.createAppContainer(v9(v66.wideMode and v12 or v11, v66.navigateToRootStack, v66.androidBackButtonSignal, v66.androidBackButtonConnection)));
    if not v67 then
        v81 = v81.current;
    end;
    local v82 = l_useRef_0(false);
    local v83 = l_useRef_0(nil);
    local v84 = l_useRef_0(function(...) --[[ Line: 208 ]]

    end);
    l_useEffect_0(function() --[[ Line: 210 ]]
        -- upvalues: v66 (copy), v8 (ref)
        if v66.logger then
            v8:setParent(v66.logger);
        end;
    end, l_dependencyArray_0(v66.logger));
    local v86 = l_useCallback_0(function(v85) --[[ Line: 216 ]]
        -- upvalues: v82 (copy), v84 (copy)
        if not v82.current then
            return;
        else
            if v84.current then
                v84.current(v85);
            end;
            return;
        end;
    end, l_dependencyArray_0(v82, v84));
    if v60 then
        local l_navigateToLuaAppPages_0 = v66.navigateToLuaAppPages;
        local l_l_navigateToLuaAppPages_0_0 = l_navigateToLuaAppPages_0 --[[ copy: 17 -> 47 ]];
        l_useEffect_0(function() --[[ Line: 228 ]]
            -- upvalues: v61 (ref), l_l_navigateToLuaAppPages_0_0 (copy), v51 (ref)
            v61(false).setOverlayDefaultProps({
                onViewUserProfile = if l_l_navigateToLuaAppPages_0_0 then l_l_navigateToLuaAppPages_0_0[v51.ViewUserProfile] else nil
            });
        end, {
            l_navigateToLuaAppPages_0
        });
    end;
    local v90 = l_useCallback_0(function(v89) --[[ Line: 238 ]]
        -- upvalues: v27 (ref), v51 (ref)
        return v27.Actions.navigate({
            routeName = v51.ChatConversation, 
            params = {
                conversationId = v89
            }
        });
    end, {});
    local v94 = l_useCallback_0(function(v91, v92) --[[ Line: 246 ]]
        -- upvalues: v27 (ref), v51 (ref), v66 (copy)
        local v93 = {
            v27.Actions.navigate({
                routeName = v51.ChatConversation, 
                params = {
                    conversationId = v91
                }
            }), 
            v27.Actions.navigate({
                routeName = v51.SquadLobby, 
                params = {
                    conversationId = v91, 
                    extraParams = v92
                }
            })
        };
        if v66.wideMode then
            return v27.Actions.navigate({
                routeName = v51.ChatLanding, 
                params = {
                    conversationId = v91
                }, 
                action = v27.StackActions.reset({
                    index = 2, 
                    actions = v93
                })
            });
        else
            table.insert(v93, 1, v27.Actions.navigate({
                routeName = v51.ChatLanding
            }));
            return v27.Actions.navigate({
                routeName = v51.ChatLandingStack, 
                params = {
                    conversationId = v91
                }, 
                action = v27.StackActions.reset({
                    index = 3, 
                    actions = v93
                })
            });
        end;
    end, {
        v66.wideMode
    });
    local v96 = l_useCallback_0(function(v95) --[[ Line: 295 ]]
        -- upvalues: v75 (copy), v49 (ref)
        return v75(v49("one_to_one", {
            v95
        }));
    end, l_dependencyArray_0(v75));
    local v98 = l_useCallback_0(function(v97) --[[ Line: 299 ]]
        -- upvalues: v75 (copy), v50 (ref)
        return v75(v50(v97));
    end, l_dependencyArray_0(v75));
    local v111 = l_useCallback_0(function(v99) --[[ Line: 303 ]]
        -- upvalues: v84 (copy), v66 (copy), l_GetFFlagIsSquadEnabled_0 (ref), v4 (ref), v94 (copy), v51 (ref), v24 (ref), v25 (ref), v98 (copy), v8 (ref), v90 (copy), v96 (copy), v27 (ref)
        v84.current = v99;
        if not v66.updateExternalNavigationForScreen then
            return function() --[[ Line: 306 ]]
                -- upvalues: v84 (ref)
                v84.current = nil;
            end;
        else
            local l_updateExternalNavigationForScreen_0 = v66.updateExternalNavigationForScreen;
            if l_GetFFlagIsSquadEnabled_0() then
                l_updateExternalNavigationForScreen_0(function(v101) --[[ Line: 313 ]]
                    -- upvalues: v4 (ref), v99 (copy), v94 (ref)
                    local l_conversationId_0 = v101.conversationId;
                    local v103 = v4.Dictionary.omit(v101, "conversationId");
                    v99(v94(l_conversationId_0, v103));
                end, v51.SquadLobby);
            end;
            l_updateExternalNavigationForScreen_0(function(v104) --[[ Line: 320 ]]
                -- upvalues: v24 (ref), v25 (ref), v98 (ref), v8 (ref), v99 (copy), v90 (ref), v96 (ref)
                local v105 = v104 and v104.conversationId;
                if v105 then
                    if v24 then
                        v25.start(v25.Events.ChatConversationTTI, {
                            conversationId = v105
                        });
                    end;
                    v98(v105):andThen(function() --[[ Line: 330 ]]
                        -- upvalues: v8 (ref), v105 (copy), v99 (ref), v90 (ref)
                        v8:info("Successfully fetched conversation details for conversationId {} for external navigation", v105);
                        v99(v90(v105));
                    end):catch(function(v106) --[[ Line: 337 ]]
                        -- upvalues: v8 (ref), v24 (ref), v25 (ref), v105 (copy)
                        v8:warning("Error in fetchLatestConversationDetails request before navigate to conversation. error: {}", (tostring(v106)));
                        if v24 then
                            v25.cancel(v25.Events.ChatConversationTTI, {
                                conversationId = v105
                            });
                        end;
                    end);
                    return;
                else
                    local v107 = v104 and v104.userId;
                    if not v107 then
                        return;
                    else
                        spawn(function() --[[ Line: 357 ]]
                            -- upvalues: v96 (ref), v107 (copy), v24 (ref), v25 (ref), v8 (ref), v99 (ref), v90 (ref)
                            v96(v107):andThen(function(v108) --[[ Line: 359 ]]
                                -- upvalues: v24 (ref), v25 (ref), v8 (ref), v107 (ref), v99 (ref), v90 (ref)
                                if v24 then
                                    v25.start(v25.Events.ChatConversationTTI, {
                                        conversationId = v108.id
                                    });
                                end;
                                v8:info("Successfully fetched conversation details for userId {} for external navigation", v107);
                                v99(v90(v108.id));
                            end):catch(function(v109) --[[ Line: 371 ]]
                                -- upvalues: v8 (ref)
                                v8:warning("Error in CreateConversation request before navigate to conversation. error: {}", (tostring(v109)));
                            end);
                        end);
                        return;
                    end;
                end;
            end, v51.ChatConversation);
            l_updateExternalNavigationForScreen_0(function(v110) --[[ Line: 381 ]]
                -- upvalues: v99 (copy), v27 (ref), v51 (ref), v66 (ref)
                v99(v27.Actions.navigate({
                    routeName = v51.ChatLanding, 
                    params = v110
                }));
                if v66.wideMode then
                    v99(v27.Actions.navigate({
                        routeName = v51.EmptyConversation
                    }));
                end;
            end, v51.ChatLanding);
            return function() --[[ Line: 393 ]]
                -- upvalues: l_updateExternalNavigationForScreen_0 (copy), v51 (ref), l_GetFFlagIsSquadEnabled_0 (ref), v84 (ref)
                l_updateExternalNavigationForScreen_0(nil, v51.ChatLanding);
                l_updateExternalNavigationForScreen_0(nil, v51.ChatConversation);
                if l_GetFFlagIsSquadEnabled_0() then
                    l_updateExternalNavigationForScreen_0(nil, v51.SquadLobby);
                end;
                v84.current = nil;
            end;
        end;
    end, l_dependencyArray_0(v84));
    local v113 = l_useCallback_0(function(v112) --[[ Line: 404 ]]
        -- upvalues: v16 (ref)
        return v16(false).getScreenTopBar(v112)(false);
    end, {});
    local v116 = l_useCallback_0(function(v114, v115) --[[ Line: 409 ]]
        -- upvalues: v16 (ref)
        v16(false).setScreenTopBar(v114, v115);
    end, {});
    local v118 = l_useCallback_0(function(v117) --[[ Line: 413 ]]
        -- upvalues: v3 (ref), v78 (copy)
        v3.isType(v117, "string", "screen");
        return v78[v117] or {};
    end, l_dependencyArray_0(v78));
    local v123 = l_useCallback_0(function(v119, v120) --[[ Line: 418 ]]
        -- upvalues: v3 (ref), v79 (copy), v4 (ref)
        v3.isType(v119, "string", "screen");
        v3.isType(v120, "table", "state");
        v79(function(v121) --[[ Line: 421 ]]
            -- upvalues: v4 (ref), v119 (copy), v120 (copy)
            local v122 = v4.Dictionary.join(v121[v119] or {}, v120);
            return v4.Dictionary.join(v121, {
                [v119] = v122
            });
        end);
    end, {});
    local v124 = if v19 then v113 else v118;
    local v125 = if v19 then v116 else v123;
    local v127 = l_useCallback_0(function(v126) --[[ Line: 436 ]]
        -- upvalues: v83 (copy), v86 (copy)
        if v83.current then
            v83.current:disconnect();
            v83.current = nil;
        end;
        if v126 then
            v83.current = v126:connect(v86);
        end;
    end, l_dependencyArray_0(v83));
    l_useEffect_0(function() --[[ Line: 447 ]]
        -- upvalues: v82 (copy), v127 (copy), v66 (copy), v75 (copy), v54 (ref)
        v82.current = true;
        v127(v66.rnBypassActionSignal);
        return function() --[[ Line: 451 ]]
            -- upvalues: v82 (ref), v127 (ref), v75 (ref), v54 (ref)
            v82.current = false;
            v127(nil);
            v75(v54());
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 459 ]]
        -- upvalues: v66 (copy), v67 (copy), v75 (copy), v55 (ref), v51 (ref), v70 (copy)
        if v66.initialConversationId and v66.initialConversationId ~= "" and v67 then
            v75(v55({
                screen = v51.ChatConversation, 
                params = {
                    userId = v70, 
                    conversationId = v66.initialConversationId
                }
            }));
            v66.setInitialConversationId("");
        end;
        return function() --[[ Line: 468 ]]

        end;
    end, l_dependencyArray_0(v75, v70, v66.initialConversationId, v66.setInitialConversationId));
    local v128 = nil;
    local v129 = nil;
    if l_GetFFlagIsSquadEnabled_0() then
        v128 = l_useCurrentSquadParentChannelId_0();
        if l_GetFFlagEnableCrossExpVoice_0() then
            v129 = l_useIsVoiceConnected_0();
        end;
    end;
    l_useEffect_0(function() --[[ Line: 480 ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (ref), v67 (copy), v66 (copy), v128 (ref), l_GetFFlagEnableCrossExpVoice_0 (ref), v129 (ref), v75 (copy), v55 (ref), v51 (ref), v70 (copy)
        if l_GetFFlagIsSquadEnabled_0() and v67 and v66.initialConversationId == "" and v128 then
            if l_GetFFlagEnableCrossExpVoice_0() and v129 then
                v75(v55({
                    screen = v51.SquadLobby, 
                    params = {
                        userId = v70, 
                        conversationId = v128
                    }
                }));
                return;
            else
                v75(v55({
                    screen = v51.ChatConversation, 
                    params = {
                        userId = v70, 
                        conversationId = v128
                    }
                }));
            end;
        end;
    end, l_dependencyArray_0());
    l_useEffect_0(function() --[[ Line: 501 ]]
        -- upvalues: v127 (copy), v66 (copy)
        v127(v66.rnBypassActionSignal);
    end, l_dependencyArray_0(v66.rnBypassActionSignal));
    l_useEffect_0(function() --[[ Line: 505 ]]
        -- upvalues: v19 (ref), v4 (ref), v78 (copy), v79 (copy)
        if not v19 and not v4.isEmpty(v78) then
            v79({});
        end;
    end, l_dependencyArray_0(v66.wideMode, v19));
    local v131 = v31(function(v130) --[[ Line: 511 ]]
        return v130.getChatHeaderSearch();
    end);
    local v133 = v31(function(v132) --[[ Line: 514 ]]
        return v132.getChatHeaderCreateChatGroup();
    end);
    local v135 = v31(function(v134) --[[ Line: 517 ]]
        -- upvalues: v56 (ref)
        return v134.getChatHeaderNotifications() and (not v56() or v134.getWebViewSupport());
    end);
    local v136 = l_usePageSideMargin_0(v81.current);
    local v137 = v26.useMemo(function() --[[ Line: 523 ]]
        -- upvalues: v67 (copy), v136 (copy)
        return {
            outer = v67 and 12 or v136, 
            inner = v67 and 12 or v136, 
            default = 12
        };
    end, {
        v136, 
        v67
    });
    local v138 = not v67 and v135;
    local v139 = v131 and not v67;
    local v140 = v45();
    v133 = v133 and v140;
    v139 = v139 and v140;
    local v141 = v67 and l_GetFFlagEnableAppChatInExperience_0();
    local v142 = l_useStyle_0();
    local v144 = l_useCallback_0(function(v143) --[[ Line: 543 ]]
        -- upvalues: v75 (copy), l_SetTabBarVisible_0 (ref)
        v75(l_SetTabBarVisible_0(v143));
    end, l_dependencyArray_0(v75));
    local v145 = v26.createElement(v81, {
        externalDispatchConnector = v111, 
        parameters = v66.parameters, 
        setActiveConversationId = v66.setActiveConversationId, 
        setBackButtonEnabled = v66.setBackButtonEnabled, 
        setTabBarVisible = v144, 
        chatIsVisible = v77, 
        screenProps = {
            navigateToLuaAppPages = v66.navigateToLuaAppPages, 
            topBarHeight = math.max(l_UserInputService_0.NavBarSize.Y, if v68 then v68.Size.Size_1400 else l_NAV_BAR_WITH_FACEPILE_SIZE_0), 
            wideMode = v66.wideMode, 
            isInExperience = v67, 
            isVisible = v66.isVisible, 
            notificationCount = v66.notificationCount, 
            appChatOuterPadding = v137.outer, 
            appChatInnerPadding = v137.inner, 
            appChatDefaultPadding = v137.default, 
            topBarShowSearch = v139, 
            topBarShowCreateChatGroup = v133, 
            topBarShowNotifications = v138, 
            topBarShowSnoozeNotifications = v141, 
            showSearchRow = v67, 
            navigateToRootStack = v66.navigateToRootStack, 
            navigateToAddFriends = v66.navigateToAddFriends, 
            getScreenTopBar = if v19 then nil else v124, 
            setScreenTopBar = if v19 then nil else v125
        }
    });
    v145 = v26.createElement(v20, {
        navigateToLuaAppPages = v66.navigateToLuaAppPages, 
        dispatch = v75
    }, {
        navigation = v145
    });
    v145 = v26.createElement(v18.Provider, {
        value = {
            chatPlacement = v66.chatPlacement
        }
    }, {
        navigation = v145
    });
    if v58() then
        v145 = v26.createElement(v43, {}, {
            navigation = v145
        });
        v145 = v26.createElement(v47.InteractionFeedbackContext.Provider, {
            value = l_HapticFeedbackConfig_0
        }, {
            navigation = v145
        });
    end;
    if not v67 then
        v145 = v26.createElement(l_LayerCollectorProvider_0, {}, {
            navigation = v145
        });
    end;
    local v146 = v42();
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v150 = if l_GetFFlagIsSquadEnabled_0() then l_useSelector_0(function(v148) --[[ Line: 614 ]]
        local v149 = v148.Squad and v148.Squad.Squad and v148.Squad.Squad.currentSquad;
        if v149 and v149.squadId then
            return v149.squadId;
        else
            return nil;
        end;
    end) else nil;
    local v151 = v26.createElement(v15, {
        localUserId = v70, 
        entryPoint = v74
    }, {
        telemetry = v26.createElement(v23.Provider, {
            value = {
                context = "platformChat", 
                locale = v146, 
                entryPoint = v74 or "unknown", 
                userId = v70, 
                playSessionId = l_l_RbxAnalyticsService_0_PlaySessionId_0, 
                currentSquadId = v150, 
                placement = v66.chatPlacement
            }
        }, {
            v26.createElement(if v19 then v26.Fragment else v17.Provider, if v19 then nil else {
                value = v4.Dictionary.join(v78, {
                    getScreenTopBar = v124, 
                    setScreenTopBar = v125
                })
            }, {
                navigation = v145, 
                BottomInsetBackground = if v72.bottom > 0 then v26.createElement("Frame", {
                    BackgroundColor3 = if v57() then v142.Theme.BackgroundDefault.Color else v142.Theme.NavigationBar.Color, 
                    BackgroundTransparency = if v57() then v142.Theme.BackgroundDefault.Transparency else v142.Theme.NavigationBar.Transparency, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, v72.bottom), 
                    ZIndex = 3
                }) else nil
            })
        })
    });
    if v24 then
        l_useEffect_0(function() --[[ Line: 667 ]]
            -- upvalues: v25 (ref), v66 (copy), v74 (copy), v150 (copy)
            v25.setSharedContext({
                placement = v66.chatPlacement, 
                entryPoint = v74, 
                hasActiveParty = v150 ~= nil
            });
        end, l_dependencyArray_0(v66.chatPlacement, v74, v150));
    end;
    return v26.createElement(v22, {
        entryPoint = v74
    }, {
        v151
    });
end;
return l_memo_0(AppChatEntryPoint);