local l_SessionService_0 = game:GetService("SessionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v5 = require(l_Parent_0.Responsive);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.UserLib);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Constants_0 = v6.App.Style.Constants;
local l_AppSessionService_0 = require(l_Parent_0.RoactServiceTags).AppSessionService;
local l_AppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).AppFeaturePolicies;
local l_ChatPolicies_0 = require(l_Parent_0.SocialPolicies).ChatPolicies;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local v15 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v16 = require(l_script_FirstAncestor_0.App.InExperienceAppChatContainer);
local v17 = require(l_script_FirstAncestor_0.Conversations.Thunks.getAllFriendsAsync);
local v18 = require(l_script_FirstAncestor_0.Conversations.Thunks.getLocalUserFriendsCount);
local l_GetLocalUser_0 = v7.Thunks.GetLocalUser;
local l_LayerCollectorProvider_0 = v6.Core.Layout.LayerCollector.LayerCollectorProvider;
local v21 = require(l_script_FirstAncestor_0.App.AppChatToastManagerInExp);
local v22 = require(l_script_FirstAncestor_0.Components.EventReceivers.AppChatPersistentEventReceivers);
local v23 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVisible);
local v24 = require(l_script_FirstAncestor_0.App.Hooks.usePreventExperienceControls);
local v25 = require(l_script_FirstAncestor_0.Hooks.useAppChatUpdateSession);
local v26 = require(l_Parent_0.Style);
local l_UiModeStyleProvider_0 = v26.UiModeStyleProvider;
local l_DesignTokenProvider_0 = v26.DesignTokenProvider;
local v29 = require(l_Parent_0.SquadsCore);
local l_SquadEventReceiver_0 = v29.SquadEventReceiver;
local l_SquadOverlay_0 = v29.SquadOverlay;
local v32 = require(l_script_FirstAncestor_0.App.Hooks.useParentContainerVisibilitySignal);
local v33 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local v34 = require(l_Parent_0.Foundation);
local v35 = require(l_script_FirstAncestor_0.Components.OSA.OverlayHost);
local l_FFlagAppChatGroupOsaDialogHost_0 = require(l_Parent_0.SharedFlags).FFlagAppChatGroupOsaDialogHost;
local v37 = game:DefineFastFlag("DebugAppChatDisplayOnJoin", false);
local v38 = game:DefineFastInt("AppChatInExperienceDisplayOrder", 5);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_PartyPageCarouselExperimentation_0 = require(l_Parent_0.SocialExperiments).PartyPageCarouselExperimentation;
local l_FFlagIsSquadEnabledAMP_0 = require(l_Parent_0.SharedFlags).FFlagIsSquadEnabledAMP;
local l_FFlagEnableAppChatSnoozeMenuFocus_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus;
local v45 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v45.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v45.FocusNavigationEventNameEnum;
local l_FocusRoot_0 = v45.FocusRoot;
local v49 = require(l_Parent_0.InputHandlers);
local l_NotificationSnoozeMenuVisibleSignal_0 = require(l_Parent_0.ToastNotification).Signals.NotificationSnoozeMenuVisibleSignal;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v53 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
wrapWithFocusRoot = function(v54, v55, v56) --[[ Line: 79 ]] --[[ Name: wrapWithFocusRoot ]]
    -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (copy), v3 (copy), l_FocusRoot_0 (copy), v53 (copy), l_FFlagEnableAppChatSnoozeMenuFocus_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    if l_FFlagEnableAppChatFocusableFixes_0 then
        return v3.createElement(l_FocusRoot_0, {
            eventHandlers = v55, 
            eventMap = v53, 
            isAutoFocusRoot = not l_FFlagEnableAppChatSnoozeMenuFocus_0 or v56, 
            isIsolated = true, 
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
        }, v54);
    else
        return v3.createElement(v3.Fragment, nil, v54);
    end;
end;
InExperienceAppChat = function() --[[ Line: 93 ]] --[[ Name: InExperienceAppChat ]]
    -- upvalues: v3 (copy), l_useDispatch_0 (copy), v23 (copy), v37 (copy), v33 (copy), v32 (copy), v25 (copy), v24 (copy), v15 (copy), v17 (copy), l_PartyPageCarouselExperimentation_0 (copy), v18 (copy), l_GetLocalUser_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useSelector_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v49 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableAppChatSnoozeMenuFocus_0 (copy), l_NotificationSnoozeMenuVisibleSignal_0 (copy), l_SquadEventReceiver_0 (copy), v22 (copy), v21 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), l_UiModeStyleProvider_0 (copy), l_Constants_0 (copy), l_DesignTokenProvider_0 (copy), v38 (copy), l_SquadOverlay_0 (copy), l_LayerCollectorProvider_0 (copy), v5 (copy), l_RoactAppPolicy_0 (copy), l_AppFeaturePolicies_0 (copy), l_ChatPolicies_0 (copy), l_RoactServices_0 (copy), l_AppSessionService_0 (copy), l_SessionService_0 (copy), v16 (copy), l_FFlagAppChatGroupOsaDialogHost_0 (copy), v35 (copy), v34 (copy)
    local v57 = v3.useRef(nil);
    local v58 = l_useDispatch_0();
    local v59, v60 = v23(v37);
    local l_showParentContainer_0 = v3.useContext(v33).showParentContainer;
    local l_hideParentContainer_0 = v3.useContext(v33).hideParentContainer;
    local l_updateCurrentSquadId_0 = v3.useContext(v33).updateCurrentSquadId;
    local v64, v65 = v3.useState("");
    local v66, v67 = v3.useState(true);
    v32();
    v25(v59);
    v24(v59);
    v3.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v59 (copy), v58 (copy), v15 (ref), v17 (ref), l_PartyPageCarouselExperimentation_0 (ref), v18 (ref)
        if v59 then
            v58(v15(true));
            v58(v17(true));
            if l_PartyPageCarouselExperimentation_0.getPartyPageCarouselEnabled() then
                v58(v18());
            end;
        end;
    end, {
        v58, 
        v59
    });
    v3.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v58 (copy), l_GetLocalUser_0 (ref)
        v58(l_GetLocalUser_0());
    end, {
        v58
    });
    if l_GetFFlagIsSquadEnabled_0() then
        local v70 = l_useSelector_0(function(v68) --[[ Line: 125 ]]
            local v69 = v68.Squad and v68.Squad.Squad and v68.Squad.Squad.currentSquad;
            if v69 and v69.squadId then
                return v69.squadId;
            else
                return "";
            end;
        end);
        local l_v70_0 = v70 --[[ copy: 11 -> 16 ]];
        v3.useEffect(function() --[[ Line: 130 ]]
            -- upvalues: l_updateCurrentSquadId_0 (copy), l_v70_0 (copy)
            l_updateCurrentSquadId_0(l_v70_0);
        end, {
            v70, 
            l_updateCurrentSquadId_0
        });
    end;
    local v73 = if l_GetFFlagIsSquadEnabled_0() then l_useSelector_0(function(v72) --[[ Line: 136 ]]
        return v72.Squad.SquadPrompt.arguments;
    end) else nil;
    local v75 = if l_FFlagEnableAppChatFocusableFixes_0 then v3.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v49 (ref), l_hideParentContainer_0 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v49.onRelease(function(v74) --[[ Line: 145 ]]
                    -- upvalues: l_hideParentContainer_0 (ref)
                    l_hideParentContainer_0();
                    v74:cancel();
                end)
            }
        };
    end, {
        l_hideParentContainer_0
    }) else nil;
    local v77 = not l_FFlagIsSquadEnabledAMP_0 or l_useAppPolicy_0(function(v76) --[[ Line: 155 ]]
        return v76.getCanAccessParty();
    end);
    local v78 = l_GetFFlagIsSquadEnabled_0() and v73 and v73.promptType;
    if l_FFlagEnableAppChatSnoozeMenuFocus_0 then
        v3.useEffect(function() --[[ Line: 163 ]]
            -- upvalues: l_NotificationSnoozeMenuVisibleSignal_0 (ref), v67 (copy)
            local v80 = l_NotificationSnoozeMenuVisibleSignal_0:connect(function(v79) --[[ Line: 164 ]]
                -- upvalues: v67 (ref)
                v67(not v79.visible);
            end);
            return function() --[[ Line: 168 ]]
                -- upvalues: v80 (copy)
                v80:disconnect();
            end;
        end, {});
    end;
    local v82 = {
        SquadEventReceiver = if l_FFlagIsSquadEnabledAMP_0 and v77 or not l_FFlagIsSquadEnabledAMP_0 and l_GetFFlagIsSquadEnabled_0() then v3.createElement(l_SquadEventReceiver_0) else nil, 
        AppChatPersistentEventReceivers = v3.createElement(v22, {
            isInExperience = true
        }), 
        AppChatToastManagerInExp = v3.createElement(v21, {
            hideAllChatToasts = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then nil else v59, 
            isAppChatVisible = if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then v59 else nil, 
            navigateToChat = function(v81) --[[ Line: 185 ]] --[[ Name: navigateToChat ]]
                -- upvalues: l_showParentContainer_0 (copy), v65 (copy)
                l_showParentContainer_0();
                v65(v81);
            end
        }), 
        AppChatContainer = v3.createElement(l_UiModeStyleProvider_0, {
            style = {
                themeName = l_Constants_0.ThemeName.Dark, 
                fontName = l_Constants_0.FontName.Gotham
            }
        }, {
            v3.createElement(l_DesignTokenProvider_0, {
                tokenMappers = {}
            }, if l_FFlagEnableAppChatFocusableFixes_0 then {
                AppChatScreenGui = if not not v59 or v78 then v3.createElement("ScreenGui", {
                    ResetOnSpawn = false, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets, 
                    DisplayOrder = v38, 
                    ref = v57
                }, wrapWithFocusRoot({
                    SquadOverlay = if v78 then v3.createElement(l_SquadOverlay_0) else nil, 
                    AppChat = if v59 then v3.createElement(l_LayerCollectorProvider_0, {}, {
                        containerRef = v3.createElement(v5.ContainerRef.Provider, {
                            value = v57
                        }, {
                            if not l_FFlagIsSquadEnabledAMP_0 then v3.createElement(l_RoactAppPolicy_0.Provider, {
                                policy = {
                                    l_AppFeaturePolicies_0, 
                                    l_ChatPolicies_0
                                }
                            }, {
                                v3.createElement(l_RoactServices_0.ServiceProvider, {
                                    services = {
                                        [l_AppSessionService_0] = l_SessionService_0
                                    }
                                }, {
                                    InExperienceAppChatContainer = v3.createElement(v16, {
                                        hideAppChat = v60, 
                                        initialConversationId = v64, 
                                        setInitialConversationId = v65
                                    })
                                })
                            }) else v3.createElement(l_RoactServices_0.ServiceProvider, {
                                services = {
                                    [l_AppSessionService_0] = l_SessionService_0
                                }
                            }, {
                                InExperienceAppChatContainer = v3.createElement(v16, {
                                    hideAppChat = v60, 
                                    initialConversationId = v64, 
                                    setInitialConversationId = v65
                                })
                            })
                        })
                    }) else nil
                }, v75, v66)) else nil
            } else {
                SquadOverlay = if l_GetFFlagIsSquadEnabled_0() and v73 and v73.promptType then v3.createElement(l_SquadOverlay_0) else nil, 
                AppChat = if v59 then v3.createElement("ScreenGui", {
                    ResetOnSpawn = false, 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets, 
                    DisplayOrder = v38, 
                    ref = v57
                }, {
                    LayerCollectorProvider = v3.createElement(l_LayerCollectorProvider_0, {}, {
                        containerRef = v3.createElement(v5.ContainerRef.Provider, {
                            value = v57
                        }, {
                            if not l_FFlagIsSquadEnabledAMP_0 then v3.createElement(l_RoactAppPolicy_0.Provider, {
                                policy = {
                                    l_AppFeaturePolicies_0, 
                                    l_ChatPolicies_0
                                }
                            }, {
                                wrapWithFocusRoot(v3.createElement(l_RoactServices_0.ServiceProvider, {
                                    services = {
                                        [l_AppSessionService_0] = l_SessionService_0
                                    }
                                }, {
                                    InExperienceAppChatContainer = v3.createElement(v16, {
                                        hideAppChat = v60, 
                                        initialConversationId = v64, 
                                        setInitialConversationId = v65
                                    })
                                }), v75, v66)
                            }) else wrapWithFocusRoot(v3.createElement(l_RoactServices_0.ServiceProvider, {
                                services = {
                                    [l_AppSessionService_0] = l_SessionService_0
                                }
                            }, {
                                InExperienceAppChatContainer = v3.createElement(v16, {
                                    hideAppChat = v60, 
                                    initialConversationId = v64, 
                                    setInitialConversationId = v65
                                })
                            }), v75, v66)
                        })
                    })
                }) else nil
            })
        })
    };
    if l_FFlagAppChatGroupOsaDialogHost_0 then
        v82.OverlayHost = v3.createElement(v35, {
            providers = {
                {
                    class = v34.FoundationProvider, 
                    props = {
                        theme = v34.Enums.Theme.Dark
                    }
                }
            }
        });
    end;
    return v3.createElement(v3.Fragment, {}, v82);
end;
return InExperienceAppChat;