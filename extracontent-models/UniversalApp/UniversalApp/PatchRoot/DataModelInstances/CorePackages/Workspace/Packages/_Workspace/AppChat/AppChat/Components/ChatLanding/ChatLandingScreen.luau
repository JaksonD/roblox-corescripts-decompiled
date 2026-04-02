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
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v39 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDomLocatorFoundationMigration);
local v40 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v41 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local l_ScheduledSquadsListExperimentation_0 = require(l_Parent_0.SocialExperiments).ScheduledSquadsListExperimentation;
local v43 = v9.PureComponent:extend("ChatLandingScreen");
v43.defaultProps = {
    navigation = nil
};
local function v48() --[[ Line: 61 ]]
    -- upvalues: v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_withLocalization_0 (copy), v18 (copy)
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v44) --[[ Line: 64 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), l_withLocalization_0 (ref), v9 (ref), v18 (ref)
            local v45 = v44.getScreenTopBar(v4.ChatLanding);
            v8.isType(v45, "table", "screenTopBar");
            return l_withLocalization_0({
                searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
                cancelText = "Feature.Chat.Action.Cancel"
            })(function(v46) --[[ Line: 71 ]]
                -- upvalues: v9 (ref), v18 (ref), v45 (copy), v44 (copy), v4 (ref)
                return v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    filterBox = v9.createElement(v18, {
                        initialInputText = v45.filterText, 
                        cancelText = v46.cancelText, 
                        searchPlaceholderText = v46.searchPlaceholderText, 
                        captureFocusOnMount = v45.shouldAutoFocusCenter, 
                        onSelectCallback = v45.closeInputBar or function() --[[ Line: 81 ]]

                        end, 
                        resetOnMount = function() --[[ Line: 83 ]] --[[ Name: resetOnMount ]]
                            -- upvalues: v44 (ref), v4 (ref)
                            v44.setScreenTopBar(v4.ChatLanding, {
                                shouldAutoFocusCenter = false
                            });
                        end, 
                        cancelCallback = function() --[[ Line: 89 ]] --[[ Name: cancelCallback ]]
                            -- upvalues: v44 (ref), v4 (ref)
                            v44.setScreenTopBar(v4.ChatLanding, {
                                shouldRenderCenter = false, 
                                filterText = ""
                            });
                        end, 
                        textChangedCallback = function(v47) --[[ Line: 96 ]] --[[ Name: textChangedCallback ]]
                            -- upvalues: v44 (ref), v4 (ref)
                            v44.setScreenTopBar(v4.ChatLanding, {
                                filterText = v47
                            });
                        end
                    })
                });
            end);
        end
    });
end;
v43.navigationOptions = function(v49) --[[ Line: 108 ]]
    -- upvalues: v3 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v48 (copy), v24 (copy), v25 (copy), v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_ScheduledSquadsListExperimentation_0 (copy), v13 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), l_AppPage_0 (copy), v38 (copy), v29 (copy), v5 (copy), v14 (copy), v6 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), v26 (copy), v39 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    local l_navigation_0 = v49.navigation;
    local v51 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
    local v52 = l_navigation_0.getScreenProps("wideMode", false);
    local l_v3_IconButtonWidth_0 = v3:GetIconButtonWidth(v52);
    local v54 = l_navigation_0.getScreenProps("isInExperience", false);
    local v55 = v51 and true or false;
    local v56 = l_GetFFlagEnableAppChatInExperience_0() and v54;
    local v57 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        v57 = v57 - l_navigation_0.getScreenProps("topBarUtilityIconSideMargin", 0);
    end;
    return {
        headerText = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
            raw = "Feature.Squads.Label.Party", 
            shouldLocalize = true
        } else {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        }, 
        backButtonEnabled = not v56 and v55, 
        closeButtonEnabled = v56 and v55, 
        tabBarVisible = not v51 or nil, 
        isRoot = true, 
        isTitleLeftAligned = true, 
        leftPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12), 
        rightPaddingOverride = v57, 
        renderCenter = v48, 
        shouldBoldHeader = true, 
        renderRight = function() --[[ Line: 152 ]] --[[ Name: renderRight ]]
            -- upvalues: v24 (ref), v25 (ref), v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (copy), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (copy), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v39 (ref), v52 (copy), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
            return v24(v25.Context)(function(v58) --[[ Line: 153 ]]
                -- upvalues: v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v39 (ref), v52 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                return v9.createElement(v7, {
                    screenName = v4.ChatLanding, 
                    render = function(v59) --[[ Line: 156 ]] --[[ Name: render ]]
                        -- upvalues: v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v9 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v58 (copy), v26 (ref), v39 (ref), v52 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                        local v60 = v59.getScreenTopBar(v4.ChatLanding);
                        v8.isType(v60, "table", "screenTopBar");
                        local v61 = l_navigation_0.getScreenProps("notificationCount", 0);
                        local v62 = l_navigation_0.getScreenProps("topBarShowSearch", false);
                        local v63 = l_navigation_0.getScreenProps("topBarShowCreateChatGroup", false);
                        local v64 = l_navigation_0.getScreenProps("topBarShowNotifications", false);
                        local v65 = l_navigation_0.getScreenProps("topBarShowSnoozeNotifications", false);
                        if v60.shouldRenderCenter then
                            return nil;
                        elseif l_ScheduledSquadsListExperimentation_0.getIsTopBarEntrypointEnabled() then
                            if l_FFlagEnableHeaderBarButtonsUpdate_0 then
                                return v9.createElement(v13.View, {
                                    tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                                }, {
                                    notifications = if v64 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v61, 
                                        layoutOrder = 1, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                    }) else nil, 
                                    snoozeChatNotifications = if v65 then v9.createElement(v5, {
                                        layoutOrder = 2, 
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                    }) else nil, 
                                    scheduledSquadsButton = v14.createElement(v6, {
                                        layoutOrder = 3, 
                                        source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                    }), 
                                    filter = if v62 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                        LayoutOrder = 4, 
                                        onActivated = function() --[[ Line: 207 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                            v59.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else nil, 
                                    createNewChat = if v63 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                        LayoutOrder = 5, 
                                        onActivated = function() --[[ Line: 230 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else nil
                                });
                            else
                                return v9.createFragment({
                                    notifications = v64 and if v39 then v9.createElement(v13.View, {
                                        tag = "radius-circle row align-x-center align-y-center", 
                                        Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                        LayoutOrder = 1, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                    }, {
                                        BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                            notificationCount = v61, 
                                            compactWidth = not v52, 
                                            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                        })
                                    }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v61, 
                                        compactWidth = not v52, 
                                        layoutOrder = 1, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    }), 
                                    snoozeChatNotifications = if v65 then v9.createElement(v5, {
                                        layoutOrder = 2, 
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                    }) else nil, 
                                    scheduledSquadsButton = v14.createElement(v6, {
                                        layoutOrder = 3, 
                                        source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                    }), 
                                    filter = v62 and if v39 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                        LayoutOrder = 4, 
                                        onActivated = function() --[[ Line: 290 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                            v59.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = l_Images_0["icons/common/search"], 
                                        layoutOrder = 4, 
                                        onActivated = function() --[[ Line: 304 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                            v59.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }), 
                                    createNewChat = v63 and if v39 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                        LayoutOrder = 5, 
                                        onActivated = function() --[[ Line: 325 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                        layoutOrder = 5, 
                                        onActivated = function() --[[ Line: 340 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    })
                                });
                            end;
                        elseif l_FFlagEnableHeaderBarButtonsUpdate_0 then
                            return v9.createElement(v13.View, {
                                tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                            }, {
                                filter = if v62 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.MagnifyingGlass, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                    LayoutOrder = 1, 
                                    onActivated = function() --[[ Line: 364 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                        v59.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }) else nil, 
                                createNewChat = if v63 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.PlusLarge, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                    LayoutOrder = 2, 
                                    onActivated = function() --[[ Line: 387 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }) else nil, 
                                notifications = if v64 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = v61, 
                                    layoutOrder = 3, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                }) else nil, 
                                snoozeChatNotifications = if v65 then v9.createElement(v5, {
                                    layoutOrder = 4, 
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                }) else nil
                            });
                        else
                            return v9.createFragment({
                                filter = v62 and if v39 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.MagnifyingGlass, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                    LayoutOrder = 1, 
                                    onActivated = function() --[[ Line: 427 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                        v59.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }) else v9.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = l_Images_0["icons/common/search"], 
                                    layoutOrder = 1, 
                                    onActivated = function() --[[ Line: 441 ]] --[[ Name: onActivated ]]
                                        -- upvalues: v59 (copy), v4 (ref), v58 (ref), v26 (ref)
                                        v59.setScreenTopBar(v4.ChatLanding, {
                                            shouldRenderCenter = true, 
                                            shouldAutoFocusCenter = true, 
                                            isSecondary = true
                                        });
                                        v58.emit(v26.ChatLandingSearchBtnClicked, {});
                                    end
                                }), 
                                createNewChat = v63 and if v39 then v9.createElement(v13.IconButton, {
                                    size = v13.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v13.Enums.IconName.PlusLarge, 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                    LayoutOrder = 2, 
                                    onActivated = function() --[[ Line: 462 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }) else v9.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                    layoutOrder = 2, 
                                    onActivated = function() --[[ Line: 477 ]] --[[ Name: onActivated ]]
                                        -- upvalues: l_navigation_0 (ref), v4 (ref), v58 (ref), v26 (ref)
                                        l_navigation_0.navigate(v4.CreateNewChat);
                                        v58.emit(v26.ChatLandingComposeBtnClicked, {});
                                    end
                                }), 
                                notifications = v64 and if v39 then v9.createElement(v13.View, {
                                    Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                    tag = "radius-circle row align-x-center align-y-center", 
                                    testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                }, {
                                    BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v61, 
                                        compactWidth = not v52, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    })
                                }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = v61, 
                                    compactWidth = not v52, 
                                    layoutOrder = 3, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                }), 
                                snoozeChatNotifications = if v65 then v9.createElement(v5, {
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
v43.init = function(v66) --[[ Line: 528 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v21 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v27 (copy), v10 (copy), v41 (copy), v40 (copy), v8 (copy)
    v66.navigateToConversation = function(v67) --[[ Line: 529 ]]
        -- upvalues: v20 (ref), v66 (copy), v4 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        v20:info("Navigate To Conversation: {} from {screen}", v67);
        v66.props.navigation.navigate(v4.ChatConversation, {
            conversationId = v67, 
            navigatedWithFocus = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        });
        v66.resetScreenTopBar();
    end;
    v66.navigateToCreateChat = function() --[[ Line: 538 ]]
        -- upvalues: v20 (ref), v66 (copy), v4 (ref)
        v20:info("Navigate To CreateNewChat from {screen}");
        v66.props.navigation.push(v4.CreateNewChat);
    end;
    v66.navigateToToast = function(v68) --[[ Line: 543 ]]
        -- upvalues: v20 (ref), v66 (copy), v4 (ref)
        v20:info("Navigate To Toast from {screen}");
        v66.props.navigation.navigate(v4.RoactChatToast, v68);
    end;
    v66.navigateToPrivacy = function() --[[ Line: 548 ]]
        -- upvalues: v66 (copy), v4 (ref), v20 (ref)
        local v69 = v66.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v4.PrivacySettings];
        if v69 then
            v20:info("Navigate To PrivacySettings from {screen}");
            v69();
            return;
        else
            v20:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v66.navigateToSquadLobby = function(v70) --[[ Line: 559 ]]
        -- upvalues: v20 (ref), v21 (ref), v66 (copy), v4 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref), v27 (ref), v10 (ref)
        v20:info("Navigate To SquadLobby from {screen}");
        local v71 = v21(v66.props.navigation.state);
        if v71 and v71.params and v71.params.conversationId == v70 and v71.routeName == v4.ChatConversation then
            v66.props.navigation.navigate(v4.SquadLobby, {
                conversationId = v70
            });
            return;
        elseif l_FFlagEnablePartyQuickStartButton_0 then
            v27(v66.props.navigation, v70);
            return;
        else
            v66.props.navigation.reset({
                v10.Actions.navigate({
                    routeName = v4.ChatLanding
                }), 
                v10.Actions.navigate({
                    routeName = v4.ChatConversation, 
                    params = {
                        conversationId = v70
                    }
                }), 
                v10.Actions.navigate({
                    routeName = v4.SquadLobby, 
                    params = {
                        conversationId = v70
                    }
                })
            }, 3);
            return;
        end;
    end;
    v66.setScreenTopBar = function(v72) --[[ Line: 591 ]]
        -- upvalues: v41 (ref), v40 (ref), v4 (ref), v66 (copy), v8 (ref)
        if v41 then
            v40(false).setScreenTopBar(v4.ChatLanding, v72);
            return;
        else
            local v73 = v66.props.navigation.getScreenProps("setScreenTopBar", nil);
            v8.isNotNil(v73, "setScreenTopBar in screenProps");
            v73(v4.ChatLanding, v72);
            return;
        end;
    end;
    v66.resetScreenTopBar = function() --[[ Line: 601 ]]
        -- upvalues: v41 (ref), v40 (ref), v4 (ref), v8 (ref), v66 (copy)
        local v74 = nil;
        v74 = if v41 then v40(false).getScreenTopBar(v4.ChatLanding)(false) or {} else v8.isNotNil(v66.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(v4.ChatLanding);
        if v74.filterText == "" and v74.shouldRenderCenter then
            v66.setScreenTopBar({
                shouldRenderCenter = false, 
                isSecondary = false
            });
        end;
    end;
end;
v43.render = function(v75) --[[ Line: 621 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v8 (copy), v9 (copy), v7 (copy), v4 (copy), v19 (copy), v22 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (copy), v23 (copy)
    v20:info("{screen} render");
    local v76 = v8.isNotNil(v75.props.navigation, "navigation in ChatLandingScreen");
    local v77 = v76 and v76.getParam("key", "") or "";
    local v78 = v76.getScreenProps("showSearchRow", true);
    local v79 = v76.getScreenProps("topBarHeight", 0);
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v80) --[[ Line: 630 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), v9 (ref), v19 (ref), v76 (copy), v75 (copy), v77 (copy), v78 (copy), v22 (ref), v79 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (ref), v23 (ref)
            local v81 = v80.getScreenTopBar(v4.ChatLanding);
            v8.isType(v81, "table", "screenTopBar");
            local v82 = v9.createElement(v19, {
                isShowingFilterBox = v81.shouldRenderCenter, 
                filterText = v81.filterText, 
                topBarHeight = v76.getScreenProps("topBarHeight", 0), 
                navigateToAddFriends = v75.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                navigateToConversation = v75.navigateToConversation, 
                navigateToCreateChat = v75.navigateToCreateChat, 
                navigateToPrivacy = v75.navigateToPrivacy, 
                navigateToSquadLobby = v75.navigateToSquadLobby, 
                navigateToToast = v75.navigateToToast, 
                key = "ChatLanding" .. v77
            });
            if v78 then
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
                        height = v79, 
                        initialText = v81.filterText, 
                        onFilter = function(v83) --[[ Line: 661 ]] --[[ Name: onFilter ]]
                            -- upvalues: v80 (copy), v4 (ref)
                            v80.setScreenTopBar(v4.ChatLanding, {
                                filterText = v83
                            });
                        end
                    }); 
                    v82
                });
            elseif l_GetFFlagEnablePushNotificationsUpsellModalChat_0() then
                return v9.createFragment({
                    v82; 
                    CheckAndOpenChatPushUpsell = v9.createElement(v23)
                });
            else
                return v82;
            end;
        end
    });
end;
v43.didMount = function(v84) --[[ Line: 682 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    v20:info("{screen} mounted");
    v84.setScreenTopBar({
        shouldRenderCenter = false, 
        filterText = ""
    });
end;
return v43;