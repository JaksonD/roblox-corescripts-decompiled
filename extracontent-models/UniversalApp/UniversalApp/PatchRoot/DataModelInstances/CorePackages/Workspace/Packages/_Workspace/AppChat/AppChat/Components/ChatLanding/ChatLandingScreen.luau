local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Components.ChatLanding.SnoozeToastNotificationsButton);
local v6 = require(l_script_FirstAncestor_0.Components.ChatLanding.ScheduledSquadsListButton);
local v7 = require(l_script_FirstAncestor_0.TopBarProvider);
local v8 = require(l_Parent_0.ArgCheck);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.RoactNavigation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v12 = require(l_Parent_0.UIBlox);
local v13 = require(l_Parent_0.Foundation);
local v14 = require(l_Parent_0.React);
local l_ScheduledSquadActionSourceEnum_0 = require(l_Parent_0.Squads).Enums.ScheduledSquadActionSourceEnum;
local l_IconButton_0 = v12.App.Button.IconButton;
local l_Images_0 = v12.App.ImageSet.Images;
local v18 = require(script.Parent.SearchTopBar);
local v19 = require(script.Parent.ChatLandingContainer);
local v20 = require(script.Parent.Logger);
local v21 = require(script.Parent.Utils.getCurrentRoute);
local v22 = require(script.Parent.ChatSearchBox);
local v23 = require(script.Parent.CheckAndOpenChatPushUpsell);
local v24 = require(l_script_FirstAncestor_0.Telemetry.withTelemetry);
local v25 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v26 = require(script.Parent.ChatLandingTelemetryEvents);
local v27 = require(l_script_FirstAncestor_0.Utils.resetForSquadLobbyForCompactMode);
local l_StreamNotificationsBellIcon_0 = require(l_Parent_0.StreamNotifications).StreamNotificationsBellIcon;
local v29 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local l_FFlagStreamNotificationBellEntryPoint_0 = require(l_Parent_0.SharedFlags).FFlagStreamNotificationBellEntryPoint;
local l_GetFFlagEnableAppChatInExperience_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppChatInExperience;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_FFlagEnablePartyQuickStartButton_0 = require(l_Parent_0.SharedFlags).FFlagEnablePartyQuickStartButton;
local l_GetFFlagEnablePushNotificationsUpsellModalChat_0 = require(l_Parent_0.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = require(l_Parent_0.SharedFlags).FFlagEnableHeaderBarButtonsUpdate;
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v39 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v40 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local l_ScheduledSquadsListExperimentation_0 = require(l_Parent_0.SocialExperiments).ScheduledSquadsListExperimentation;
local v42 = v9.PureComponent:extend("ChatLandingScreen");
v42.defaultProps = {
    navigation = nil
};
local function v47() --[[ Line: 60 ]]
    -- upvalues: v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_withLocalization_0 (copy), v18 (copy)
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v43) --[[ Line: 63 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), l_withLocalization_0 (ref), v9 (ref), v18 (ref)
            local v44 = v43.getScreenTopBar(v4.ChatLanding);
            v8.isType(v44, "table", "screenTopBar");
            return l_withLocalization_0({
                searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
                cancelText = "Feature.Chat.Action.Cancel"
            })(function(v45) --[[ Line: 70 ]]
                -- upvalues: v9 (ref), v18 (ref), v44 (copy), v43 (copy), v4 (ref)
                return v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    filterBox = v9.createElement(v18, {
                        initialInputText = v44.filterText, 
                        cancelText = v45.cancelText, 
                        searchPlaceholderText = v45.searchPlaceholderText, 
                        captureFocusOnMount = v44.shouldAutoFocusCenter, 
                        onSelectCallback = v44.closeInputBar or function() --[[ Line: 80 ]]

                        end, 
                        resetOnMount = function() --[[ Line: 82 ]] --[[ Name: resetOnMount ]]
                            -- upvalues: v43 (ref), v4 (ref)
                            v43.setScreenTopBar(v4.ChatLanding, {
                                shouldAutoFocusCenter = false
                            });
                        end, 
                        cancelCallback = function() --[[ Line: 88 ]] --[[ Name: cancelCallback ]]
                            -- upvalues: v43 (ref), v4 (ref)
                            v43.setScreenTopBar(v4.ChatLanding, {
                                shouldRenderCenter = false, 
                                filterText = ""
                            });
                        end, 
                        textChangedCallback = function(v46) --[[ Line: 95 ]] --[[ Name: textChangedCallback ]]
                            -- upvalues: v43 (ref), v4 (ref)
                            v43.setScreenTopBar(v4.ChatLanding, {
                                filterText = v46
                            });
                        end
                    })
                });
            end);
        end
    });
end;
v42.navigationOptions = function(v48) --[[ Line: 107 ]]
    -- upvalues: v3 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v47 (copy), v24 (copy), v25 (copy), v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_ScheduledSquadsListExperimentation_0 (copy), v13 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), l_AppPage_0 (copy), v38 (copy), v29 (copy), v5 (copy), v14 (copy), v6 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), v26 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    local l_navigation_0 = v48.navigation;
    local v50 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
    local v51 = l_navigation_0.getScreenProps("wideMode", false);
    local l_v3_IconButtonWidth_0 = v3:GetIconButtonWidth(v51);
    local v53 = l_navigation_0.getScreenProps("isInExperience", false);
    local v54 = v50 and true or false;
    local v55 = l_GetFFlagEnableAppChatInExperience_0() and v53;
    local v56 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        v56 = v56 - l_navigation_0.getScreenProps("topBarUtilityIconSideMargin", 0);
    end;
    return {
        headerText = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
            raw = "Feature.Squads.Label.Party", 
            shouldLocalize = true
        } else {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        }, 
        backButtonEnabled = not v55 and v54, 
        closeButtonEnabled = v55 and v54, 
        tabBarVisible = not v50 or nil, 
        isRoot = true, 
        isTitleLeftAligned = true, 
        leftPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12), 
        rightPaddingOverride = v56, 
        renderCenter = v47, 
        shouldBoldHeader = true, 
        renderRight = function() --[[ Line: 151 ]] --[[ Name: renderRight ]]
            -- upvalues: v24 (ref), v25 (ref), v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (copy), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (copy), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v51 (copy), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
            return v24(v25.Context)(function(v57) --[[ Line: 152 ]]
                -- upvalues: v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v51 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                return v9.createElement(v7, {
                    screenName = v4.ChatLanding, 
                    render = function(v58) --[[ Line: 155 ]] --[[ Name: render ]]
                        -- upvalues: v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v9 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v57 (copy), v26 (ref), v51 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                        local v59 = v58.getScreenTopBar(v4.ChatLanding);
                        v8.isType(v59, "table", "screenTopBar");
                        local v60 = l_navigation_0.getScreenProps("notificationCount", 0);
                        local v61 = l_navigation_0.getScreenProps("topBarShowSearch", false);
                        local v62 = l_navigation_0.getScreenProps("topBarShowCreateChatGroup", false);
                        local v63 = l_navigation_0.getScreenProps("topBarShowNotifications", false);
                        local v64 = l_navigation_0.getScreenProps("topBarShowSnoozeNotifications", false);
                        if v59.shouldRenderCenter then
                            return nil;
                        elseif l_ScheduledSquadsListExperimentation_0.getIsTopBarEntrypointEnabled() then
                            if l_FFlagEnableHeaderBarButtonsUpdate_0 then
                                return v9.createElement(v13.View, {
                                    tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                                }, {
                                    notifications = if v63 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v60, 
                                        layoutOrder = 1, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                    }) else nil, 
                                    snoozeChatNotifications = if v64 then v9.createElement(v5, {
                                        layoutOrder = 2, 
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                    }) else nil, 
                                    scheduledSquadsButton = v14.createElement(v6, {
                                        layoutOrder = 3, 
                                        source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                    }), 
                                    filter = if v61 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                        LayoutOrder = 4, 
                                        onActivated = function() --[[ Line: 206 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                            v58.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else nil, 
                                    createNewChat = if v62 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                        LayoutOrder = 5, 
                                        onActivated = function() --[[ Line: 229 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else nil
                                });
                            else
                                return v9.createFragment({
                                    notifications = v63 and if v38 then v9.createElement(v13.View, {
                                        tag = "radius-circle row align-x-center align-y-center", 
                                        Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                        LayoutOrder = 1, 
                                        testId = v29.chatLandingTopBarIconButton("notifications")
                                    }, {
                                        BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                            notificationCount = v60, 
                                            compactWidth = not v51, 
                                            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                        })
                                    }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v60, 
                                        compactWidth = not v51, 
                                        layoutOrder = 1, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    }), 
                                    snoozeChatNotifications = if v64 then v9.createElement(v5, {
                                        layoutOrder = 2, 
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                    }) else nil, 
                                    scheduledSquadsButton = v14.createElement(v6, {
                                        layoutOrder = 3, 
                                        source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                    }), 
                                    filter = v61 and if v38 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = v29.chatLandingTopBarIconButton("search"), 
                                        LayoutOrder = 4, 
                                        onActivated = function() --[[ Line: 282 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                            v58.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = l_Images_0["icons/common/search"], 
                                        layoutOrder = 4, 
                                        onActivated = function() --[[ Line: 296 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                            v58.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }), 
                                    createNewChat = v62 and if v38 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = v29.chatLandingTopBarIconButton("createChat"), 
                                        LayoutOrder = 5, 
                                        onActivated = function() --[[ Line: 313 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                        layoutOrder = 5, 
                                        onActivated = function() --[[ Line: 325 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    })
                                });
                            end;
                        elseif l_FFlagEnableHeaderBarButtonsUpdate_0 then
                            return v9.createElement(v13.View, {
                                tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                            }, {
                                filter = if v61 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.MagnifyingGlass, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                    LayoutOrder = 1, 
                                    onActivated = function() --[[ Line: 345 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                        v58.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }) else nil, 
                                createNewChat = if v62 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.PlusLarge, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                    LayoutOrder = 2, 
                                    onActivated = function() --[[ Line: 368 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }) else nil, 
                                notifications = if v63 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = v60, 
                                    layoutOrder = 3, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                }) else nil, 
                                snoozeChatNotifications = if v64 then v9.createElement(v5, {
                                    layoutOrder = 4, 
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                }) else nil
                            });
                        else
                            return v9.createFragment({
                                filter = v61 and if v38 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.MagnifyingGlass, 
                                    testId = v29.chatLandingTopBarIconButton("search"), 
                                    LayoutOrder = 1, 
                                    onActivated = function() --[[ Line: 406 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                        v58.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }) else v9.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = l_Images_0["icons/common/search"], 
                                    layoutOrder = 1, 
                                    onActivated = function() --[[ Line: 420 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v58 (copy), v4 (ref), v57 (ref), v26 (ref)
                                        v58.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v57.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }), 
                                createNewChat = v62 and if v38 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.PlusLarge, 
                                    testId = v29.chatLandingTopBarIconButton("createChat"), 
                                    LayoutOrder = 2, 
                                    onActivated = function() --[[ Line: 437 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }) else v9.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                    layoutOrder = 2, 
                                    onActivated = function() --[[ Line: 449 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v57 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v57.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }), 
                                notifications = v63 and if v38 then v9.createElement(v13.View, {
                                    Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                    tag = "radius-circle row align-x-center align-y-center", 
                                    testId = v29.chatLandingTopBarIconButton("notifications")
                                }, {
                                    BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v60, 
                                        compactWidth = not v51, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    })
                                }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = v60, 
                                    compactWidth = not v51, 
                                    layoutOrder = 3, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                }), 
                                snoozeChatNotifications = if v64 then v9.createElement(v5, {
                                    layoutOrder = 4, 
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                }) else nil
                            });
                        end;
                    end
                });
            end);
        end
    };
end;
v42.init = function(v65) --[[ Line: 491 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v21 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v27 (copy), v10 (copy), v40 (copy), v39 (copy), v8 (copy)
    v65.navigateToConversation = function(v66) --[[ Line: 492 ]]
        -- upvalues: v20 (ref), v65 (copy), v4 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        v20:info("Navigate To Conversation: {} from {screen}", v66);
        v65.props.navigation.navigate(v4.ChatConversation, {
            conversationId = v66, 
            navigatedWithFocus = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        });
        v65.resetScreenTopBar();
    end;
    v65.navigateToCreateChat = function() --[[ Line: 501 ]]
        -- upvalues: v20 (ref), v65 (copy), v4 (ref)
        v20:info("Navigate To CreateNewChat from {screen}");
        v65.props.navigation.push(v4.CreateNewChat);
    end;
    v65.navigateToToast = function(v67) --[[ Line: 506 ]]
        -- upvalues: v20 (ref), v65 (copy), v4 (ref)
        v20:info("Navigate To Toast from {screen}");
        v65.props.navigation.navigate(v4.RoactChatToast, v67);
    end;
    v65.navigateToPrivacy = function() --[[ Line: 511 ]]
        -- upvalues: v65 (copy), v4 (ref), v20 (ref)
        local v68 = v65.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v4.PrivacySettings];
        if v68 then
            v20:info("Navigate To PrivacySettings from {screen}");
            v68();
            return;
        else
            v20:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v65.navigateToSquadLobby = function(v69) --[[ Line: 522 ]]
        -- upvalues: v20 (ref), v21 (ref), v65 (copy), v4 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref), v27 (ref), v10 (ref)
        v20:info("Navigate To SquadLobby from {screen}");
        local v70 = v21(v65.props.navigation.state);
        if v70 and v70.params and v70.params.conversationId == v69 and v70.routeName == v4.ChatConversation then
            v65.props.navigation.navigate(v4.SquadLobby, {
                conversationId = v69
            });
            return;
        elseif l_FFlagEnablePartyQuickStartButton_0 then
            v27(v65.props.navigation, v69);
            return;
        else
            v65.props.navigation.reset({
                v10.Actions.navigate({
                    routeName = v4.ChatLanding
                }), 
                v10.Actions.navigate({
                    routeName = v4.ChatConversation, 
                    params = {
                        conversationId = v69
                    }
                }), 
                v10.Actions.navigate({
                    routeName = v4.SquadLobby, 
                    params = {
                        conversationId = v69
                    }
                })
            }, 3);
            return;
        end;
    end;
    v65.setScreenTopBar = function(v71) --[[ Line: 554 ]]
        -- upvalues: v40 (ref), v39 (ref), v4 (ref), v65 (copy), v8 (ref)
        if v40 then
            v39(false).setScreenTopBar(v4.ChatLanding, v71);
            return;
        else
            local v72 = v65.props.navigation.getScreenProps("setScreenTopBar", nil);
            v8.isNotNil(v72, "setScreenTopBar in screenProps");
            v72(v4.ChatLanding, v71);
            return;
        end;
    end;
    v65.resetScreenTopBar = function() --[[ Line: 564 ]]
        -- upvalues: v40 (ref), v39 (ref), v4 (ref), v8 (ref), v65 (copy)
        local v73 = nil;
        v73 = if v40 then v39(false).getScreenTopBar(v4.ChatLanding)(false) or {} else v8.isNotNil(v65.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(v4.ChatLanding);
        if v73.filterText == "" and v73.shouldRenderCenter then
            v65.setScreenTopBar({
                shouldRenderCenter = false, 
                isSecondary = false
            });
        end;
    end;
end;
v42.render = function(v74) --[[ Line: 584 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v8 (copy), v9 (copy), v7 (copy), v4 (copy), v19 (copy), v22 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (copy), v23 (copy)
    v20:info("{screen} render");
    local v75 = v8.isNotNil(v74.props.navigation, "navigation in ChatLandingScreen");
    local v76 = v75 and v75.getParam("key", "") or "";
    local v77 = v75.getScreenProps("showSearchRow", true);
    local v78 = v75.getScreenProps("topBarHeight", 0);
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v79) --[[ Line: 593 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), v9 (ref), v19 (ref), v75 (copy), v74 (copy), v76 (copy), v77 (copy), v22 (ref), v78 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (ref), v23 (ref)
            local v80 = v79.getScreenTopBar(v4.ChatLanding);
            v8.isType(v80, "table", "screenTopBar");
            local v81 = v9.createElement(v19, {
                isShowingFilterBox = v80.shouldRenderCenter, 
                filterText = v80.filterText, 
                topBarHeight = v75.getScreenProps("topBarHeight", 0), 
                navigateToAddFriends = v74.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                navigateToConversation = v74.navigateToConversation, 
                navigateToCreateChat = v74.navigateToCreateChat, 
                navigateToPrivacy = v74.navigateToPrivacy, 
                navigateToSquadLobby = v74.navigateToSquadLobby, 
                navigateToToast = v74.navigateToToast, 
                key = "ChatLanding" .. v76
            });
            if v77 then
                return v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v9.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        VerticalFlex = Enum.UIFlexAlignment.Fill, 
                        Padding = UDim.new(0, 0)
                    }), 
                    ChatSearchBox = v9.createElement(v22, {
                        height = v78, 
                        initialText = v80.filterText, 
                        onFilter = function(v82) --[[ Line: 624 ]] --[[ Name: onFilter ]]
                            -- upvalues: v79 (copy), v4 (ref)
                            v79.setScreenTopBar(v4.ChatLanding, {
                                filterText = v82
                            });
                        end
                    }); 
                    v81
                });
            elseif l_GetFFlagEnablePushNotificationsUpsellModalChat_0() then
                return v9.createFragment({
                    v81; 
                    CheckAndOpenChatPushUpsell = v9.createElement(v23)
                });
            else
                return v81;
            end;
        end
    });
end;
v42.didMount = function(v83) --[[ Line: 645 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    v20:info("{screen} mounted");
    v83.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v42;