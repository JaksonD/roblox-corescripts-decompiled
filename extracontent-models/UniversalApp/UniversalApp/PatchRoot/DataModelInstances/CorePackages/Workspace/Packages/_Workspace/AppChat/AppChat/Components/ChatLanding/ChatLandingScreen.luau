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
local v42 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local l_ScheduledSquadsListExperimentation_0 = require(l_Parent_0.SocialExperiments).ScheduledSquadsListExperimentation;
local v44 = v9.PureComponent:extend("ChatLandingScreen");
v44.defaultProps = {
    navigation = nil
};
local function v49() --[[ Line: 62 ]]
    -- upvalues: v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_withLocalization_0 (copy), v18 (copy)
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v45) --[[ Line: 65 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), l_withLocalization_0 (ref), v9 (ref), v18 (ref)
            local v46 = v45.getScreenTopBar(v4.ChatLanding);
            v8.isType(v46, "table", "screenTopBar");
            return l_withLocalization_0({
                searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
                cancelText = "Feature.Chat.Action.Cancel"
            })(function(v47) --[[ Line: 72 ]]
                -- upvalues: v9 (ref), v18 (ref), v46 (copy), v45 (copy), v4 (ref)
                return v9.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    filterBox = v9.createElement(v18, {
                        initialInputText = v46.filterText, 
                        cancelText = v47.cancelText, 
                        searchPlaceholderText = v47.searchPlaceholderText, 
                        captureFocusOnMount = v46.shouldAutoFocusCenter, 
                        onSelectCallback = v46.closeInputBar or function() --[[ Line: 82 ]]

                        end, 
                        resetOnMount = function() --[[ Line: 84 ]] --[[ Name: resetOnMount ]]
                            -- upvalues: v45 (ref), v4 (ref)
                            v45.setScreenTopBar(v4.ChatLanding, {
                                shouldAutoFocusCenter = false
                            });
                        end, 
                        cancelCallback = function() --[[ Line: 90 ]] --[[ Name: cancelCallback ]]
                            -- upvalues: v45 (ref), v4 (ref)
                            v45.setScreenTopBar(v4.ChatLanding, {
                                shouldRenderCenter = false, 
                                filterText = ""
                            });
                        end, 
                        textChangedCallback = function(v48) --[[ Line: 97 ]] --[[ Name: textChangedCallback ]]
                            -- upvalues: v45 (ref), v4 (ref)
                            v45.setScreenTopBar(v4.ChatLanding, {
                                filterText = v48
                            });
                        end
                    })
                });
            end);
        end
    });
end;
v44.navigationOptions = function(v50) --[[ Line: 109 ]]
    -- upvalues: v3 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v42 (copy), v49 (copy), v24 (copy), v25 (copy), v9 (copy), v7 (copy), v4 (copy), v8 (copy), l_ScheduledSquadsListExperimentation_0 (copy), v13 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), l_AppPage_0 (copy), v38 (copy), v29 (copy), v5 (copy), v14 (copy), v6 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), v26 (copy), v39 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    local l_navigation_0 = v50.navigation;
    local v52 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
    local v53 = l_navigation_0.getScreenProps("wideMode", false);
    local l_v3_IconButtonWidth_0 = v3:GetIconButtonWidth(v53);
    local v55 = l_navigation_0.getScreenProps("isInExperience", false);
    local v56 = v52 and true or false;
    local v57 = l_GetFFlagEnableAppChatInExperience_0() and v55;
    local v58 = if l_navigation_0.getScreenProps("wideMode", false) then l_navigation_0.getScreenProps("appChatInnerPadding", 12) else l_navigation_0.getScreenProps("appChatOuterPadding", 12);
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        v58 = v58 - l_navigation_0.getScreenProps("topBarUtilityIconSideMargin", 0);
    end;
    local v59 = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
        raw = "Feature.Squads.Label.Party", 
        shouldLocalize = true
    } else {
        raw = "CommonUI.Features.Label.Chat", 
        shouldLocalize = true
    };
    if v42() then
        return {
            headerText = v59, 
            backButtonEnabled = false, 
            closeButtonEnabled = v57 and v56, 
            tabBarVisible = not v52 or nil, 
            isRoot = true, 
            isTitleLeftAligned = true, 
            leftPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12), 
            rightPaddingOverride = v58, 
            shouldBoldHeader = true
        };
    else
        return {
            headerText = v59, 
            backButtonEnabled = not v57 and v56, 
            closeButtonEnabled = v57 and v56, 
            tabBarVisible = not v52 or nil, 
            isRoot = true, 
            isTitleLeftAligned = true, 
            leftPaddingOverride = l_navigation_0.getScreenProps("appChatOuterPadding", 12), 
            rightPaddingOverride = v58, 
            renderCenter = v49, 
            shouldBoldHeader = true, 
            renderRight = function() --[[ Line: 170 ]] --[[ Name: renderRight ]]
                -- upvalues: v24 (ref), v25 (ref), v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (copy), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (copy), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v39 (ref), v53 (copy), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                return v24(v25.Context)(function(v60) --[[ Line: 171 ]]
                    -- upvalues: v9 (ref), v7 (ref), v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v26 (ref), v39 (ref), v53 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                    return v9.createElement(v7, {
                        screenName = v4.ChatLanding, 
                        render = function(v61) --[[ Line: 174 ]] --[[ Name: render ]]
                            -- upvalues: v4 (ref), v8 (ref), l_navigation_0 (ref), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v9 (ref), v13 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v38 (ref), v29 (ref), v5 (ref), l_v3_IconButtonWidth_0 (ref), v14 (ref), v6 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v60 (copy), v26 (ref), v39 (ref), v53 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                            local v62 = v61.getScreenTopBar(v4.ChatLanding);
                            v8.isType(v62, "table", "screenTopBar");
                            local v63 = l_navigation_0.getScreenProps("notificationCount", 0);
                            local v64 = l_navigation_0.getScreenProps("topBarShowSearch", false);
                            local v65 = l_navigation_0.getScreenProps("topBarShowCreateChatGroup", false);
                            local v66 = l_navigation_0.getScreenProps("topBarShowNotifications", false);
                            local v67 = l_navigation_0.getScreenProps("topBarShowSnoozeNotifications", false);
                            if v62.shouldRenderCenter then
                                return nil;
                            elseif l_ScheduledSquadsListExperimentation_0.getIsTopBarEntrypointEnabled() then
                                if l_FFlagEnableHeaderBarButtonsUpdate_0 then
                                    return v9.createElement(v13.View, {
                                        tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                                    }, {
                                        notifications = if v66 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                            notificationCount = v63, 
                                            layoutOrder = 1, 
                                            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                        }) else nil, 
                                        snoozeChatNotifications = if v67 then v9.createElement(v5, {
                                            layoutOrder = 2, 
                                            size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                        }) else nil, 
                                        scheduledSquadsButton = v14.createElement(v6, {
                                            layoutOrder = 3, 
                                            source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                        }), 
                                        filter = if v64 then v9.createElement(v13.IconButton, {
                                            size = v13.Enums.InputSize.Medium, 
                                            isCircular = true, 
                                            icon = v13.Enums.IconName.MagnifyingGlass, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                            LayoutOrder = 4, 
                                            onActivated = function() --[[ Line: 225 ]] --[[ Name: onActivated ]]
                                                -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                                v61.setScreenTopBar(v4.ChatLanding, {
                                                    shouldRenderCenter = true, 
                                                    shouldAutoFocusCenter = true, 
                                                    isSecondary = true
                                                });
                                                v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                            end
                                        }) else nil, 
                                        createNewChat = if v65 then v9.createElement(v13.IconButton, {
                                            size = v13.Enums.InputSize.Medium, 
                                            isCircular = true, 
                                            icon = v13.Enums.IconName.PlusLarge, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                            LayoutOrder = 5, 
                                            onActivated = function() --[[ Line: 248 ]] --[[ Name: onActivated ]]
                                                -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                                l_navigation_0.navigate(v4.CreateNewChat);
                                                v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                            end
                                        }) else nil
                                    });
                                else
                                    return v9.createFragment({
                                        notifications = v66 and if v39 then v9.createElement(v13.View, {
                                            tag = "radius-circle row align-x-center align-y-center", 
                                            Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                            LayoutOrder = 1, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                        }, {
                                            BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                                notificationCount = v63, 
                                                compactWidth = not v53, 
                                                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                            })
                                        }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                            notificationCount = v63, 
                                            compactWidth = not v53, 
                                            layoutOrder = 1, 
                                            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                        }), 
                                        snoozeChatNotifications = if v67 then v9.createElement(v5, {
                                            layoutOrder = 2, 
                                            size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                        }) else nil, 
                                        scheduledSquadsButton = v14.createElement(v6, {
                                            layoutOrder = 3, 
                                            source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                        }), 
                                        filter = v64 and if v39 then v9.createElement(v13.IconButton, {
                                            size = v13.Enums.InputSize.Medium, 
                                            isCircular = true, 
                                            icon = v13.Enums.IconName.MagnifyingGlass, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                            LayoutOrder = 4, 
                                            onActivated = function() --[[ Line: 308 ]] --[[ Name: onActivated ]]
                                                -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                                v61.setScreenTopBar(v4.ChatLanding, {
                                                    shouldRenderCenter = true, 
                                                    shouldAutoFocusCenter = true, 
                                                    isSecondary = true
                                                });
                                                v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                            end
                                        }) else v9.createElement(l_IconButton_0, {
                                            size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                            icon = l_Images_0["icons/common/search"], 
                                            layoutOrder = 4, 
                                            onActivated = function() --[[ Line: 322 ]] --[[ Name: onActivated ]]
                                                -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                                v61.setScreenTopBar(v4.ChatLanding, {
                                                    shouldRenderCenter = true, 
                                                    shouldAutoFocusCenter = true, 
                                                    isSecondary = true
                                                });
                                                v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                            end
                                        }), 
                                        createNewChat = v65 and if v39 then v9.createElement(v13.IconButton, {
                                            size = v13.Enums.InputSize.Medium, 
                                            isCircular = true, 
                                            icon = v13.Enums.IconName.PlusLarge, 
                                            testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                            LayoutOrder = 5, 
                                            onActivated = function() --[[ Line: 343 ]] --[[ Name: onActivated ]]
                                                -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                                l_navigation_0.navigate(v4.CreateNewChat);
                                                v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                            end
                                        }) else v9.createElement(l_IconButton_0, {
                                            size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                            icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                            layoutOrder = 5, 
                                            onActivated = function() --[[ Line: 358 ]] --[[ Name: onActivated ]]
                                                -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                                l_navigation_0.navigate(v4.CreateNewChat);
                                                v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                            end
                                        })
                                    });
                                end;
                            elseif l_FFlagEnableHeaderBarButtonsUpdate_0 then
                                return v9.createElement(v13.View, {
                                    tag = "auto-xy row align-x-right align-y-center gap-xsmall"
                                }, {
                                    filter = if v64 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                        LayoutOrder = 1, 
                                        onActivated = function() --[[ Line: 382 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                            v61.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else nil, 
                                    createNewChat = if v65 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                        LayoutOrder = 2, 
                                        onActivated = function() --[[ Line: 405 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else nil, 
                                    notifications = if v66 then v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v63, 
                                        layoutOrder = 3, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                    }) else nil, 
                                    snoozeChatNotifications = if v67 then v9.createElement(v5, {
                                        layoutOrder = 4, 
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                    }) else nil
                                });
                            else
                                return v9.createFragment({
                                    filter = v64 and if v39 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.MagnifyingGlass, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("search") else nil, 
                                        LayoutOrder = 1, 
                                        onActivated = function() --[[ Line: 445 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                            v61.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = l_Images_0["icons/common/search"], 
                                        layoutOrder = 1, 
                                        onActivated = function() --[[ Line: 459 ]] --[[ Name: onActivated ]]
                                            -- upvalues: v61 (copy), v4 (ref), v60 (ref), v26 (ref)
                                            v61.setScreenTopBar(v4.ChatLanding, {
                                                shouldRenderCenter = true, 
                                                shouldAutoFocusCenter = true, 
                                                isSecondary = true
                                            });
                                            v60.emit(v26.ChatLandingSearchBtnClicked, {});
                                        end
                                    }), 
                                    createNewChat = v65 and if v39 then v9.createElement(v13.IconButton, {
                                        size = v13.Enums.InputSize.Medium, 
                                        isCircular = true, 
                                        icon = v13.Enums.IconName.PlusLarge, 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("createChat") else nil, 
                                        LayoutOrder = 2, 
                                        onActivated = function() --[[ Line: 480 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }) else v9.createElement(l_IconButton_0, {
                                        size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                        icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                        layoutOrder = 2, 
                                        onActivated = function() --[[ Line: 495 ]] --[[ Name: onActivated ]]
                                            -- upvalues: l_navigation_0 (ref), v4 (ref), v60 (ref), v26 (ref)
                                            l_navigation_0.navigate(v4.CreateNewChat);
                                            v60.emit(v26.ChatLandingComposeBtnClicked, {});
                                        end
                                    }), 
                                    notifications = v66 and if v39 then v9.createElement(v13.View, {
                                        Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                        tag = "radius-circle row align-x-center align-y-center", 
                                        testId = if v38 then v29.chatLandingTopBarIconButton("notifications") else nil
                                    }, {
                                        BellIcon = v9.createElement(l_StreamNotificationsBellIcon_0, {
                                            notificationCount = v63, 
                                            compactWidth = not v53, 
                                            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                        })
                                    }) else v9.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = v63, 
                                        compactWidth = not v53, 
                                        layoutOrder = 3, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    }), 
                                    snoozeChatNotifications = if v67 then v9.createElement(v5, {
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
end;
v44.init = function(v68) --[[ Line: 546 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v4 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v21 (copy), l_FFlagEnablePartyQuickStartButton_0 (copy), v27 (copy), v10 (copy), v41 (copy), v40 (copy), v8 (copy)
    v68.navigateToConversation = function(v69) --[[ Line: 547 ]]
        -- upvalues: v20 (ref), v68 (copy), v4 (ref), l_FFlagEnableAppChatFocusableFixes_0 (ref)
        v20:info("Navigate To Conversation: {} from {screen}", v69);
        v68.props.navigation.navigate(v4.ChatConversation, {
            conversationId = v69, 
            navigatedWithFocus = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        });
        v68.resetScreenTopBar();
    end;
    v68.navigateToCreateChat = function() --[[ Line: 556 ]]
        -- upvalues: v20 (ref), v68 (copy), v4 (ref)
        v20:info("Navigate To CreateNewChat from {screen}");
        v68.props.navigation.push(v4.CreateNewChat);
    end;
    v68.navigateToToast = function(v70) --[[ Line: 561 ]]
        -- upvalues: v20 (ref), v68 (copy), v4 (ref)
        v20:info("Navigate To Toast from {screen}");
        v68.props.navigation.navigate(v4.RoactChatToast, v70);
    end;
    v68.navigateToPrivacy = function() --[[ Line: 566 ]]
        -- upvalues: v68 (copy), v4 (ref), v20 (ref)
        local v71 = v68.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v4.PrivacySettings];
        if v71 then
            v20:info("Navigate To PrivacySettings from {screen}");
            v71();
            return;
        else
            v20:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps");
            return;
        end;
    end;
    v68.navigateToSquadLobby = function(v72) --[[ Line: 577 ]]
        -- upvalues: v20 (ref), v21 (ref), v68 (copy), v4 (ref), l_FFlagEnablePartyQuickStartButton_0 (ref), v27 (ref), v10 (ref)
        v20:info("Navigate To SquadLobby from {screen}");
        local v73 = v21(v68.props.navigation.state);
        if v73 and v73.params and v73.params.conversationId == v72 and v73.routeName == v4.ChatConversation then
            v68.props.navigation.navigate(v4.SquadLobby, {
                conversationId = v72
            });
            return;
        elseif l_FFlagEnablePartyQuickStartButton_0 then
            v27(v68.props.navigation, v72);
            return;
        else
            v68.props.navigation.reset({
                v10.Actions.navigate({
                    routeName = v4.ChatLanding
                }), 
                v10.Actions.navigate({
                    routeName = v4.ChatConversation, 
                    params = {
                        conversationId = v72
                    }
                }), 
                v10.Actions.navigate({
                    routeName = v4.SquadLobby, 
                    params = {
                        conversationId = v72
                    }
                })
            }, 3);
            return;
        end;
    end;
    v68.setScreenTopBar = function(v74) --[[ Line: 609 ]]
        -- upvalues: v41 (ref), v40 (ref), v4 (ref), v68 (copy), v8 (ref)
        if v41 then
            v40(false).setScreenTopBar(v4.ChatLanding, v74);
            return;
        else
            local v75 = v68.props.navigation.getScreenProps("setScreenTopBar", nil);
            v8.isNotNil(v75, "setScreenTopBar in screenProps");
            v75(v4.ChatLanding, v74);
            return;
        end;
    end;
    v68.resetScreenTopBar = function() --[[ Line: 619 ]]
        -- upvalues: v41 (ref), v40 (ref), v4 (ref), v8 (ref), v68 (copy)
        local v76 = nil;
        v76 = if v41 then v40(false).getScreenTopBar(v4.ChatLanding)(false) or {} else v8.isNotNil(v68.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(v4.ChatLanding);
        if v76.filterText == "" and v76.shouldRenderCenter then
            v68.setScreenTopBar({
                shouldRenderCenter = false, 
                isSecondary = false
            });
        end;
    end;
end;
v44.render = function(v77) --[[ Line: 639 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v8 (copy), v9 (copy), v7 (copy), v4 (copy), v19 (copy), v22 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (copy), v23 (copy)
    v20:info("{screen} render");
    local v78 = v8.isNotNil(v77.props.navigation, "navigation in ChatLandingScreen");
    local v79 = v78 and v78.getParam("key", "") or "";
    local v80 = v78.getScreenProps("showSearchRow", true);
    local v81 = v78.getScreenProps("topBarHeight", 0);
    return v9.createElement(v7, {
        screenName = v4.ChatLanding, 
        render = function(v82) --[[ Line: 648 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v8 (ref), v9 (ref), v19 (ref), v78 (copy), v77 (copy), v79 (copy), v80 (copy), v22 (ref), v81 (copy), l_GetFFlagEnablePushNotificationsUpsellModalChat_0 (ref), v23 (ref)
            local v83 = v82.getScreenTopBar(v4.ChatLanding);
            v8.isType(v83, "table", "screenTopBar");
            local v84 = v9.createElement(v19, {
                isShowingFilterBox = v83.shouldRenderCenter, 
                filterText = v83.filterText, 
                topBarHeight = v78.getScreenProps("topBarHeight", 0), 
                navigateToAddFriends = v77.props.navigation.getScreenProps("navigateToAddFriends", {}), 
                navigateToConversation = v77.navigateToConversation, 
                navigateToCreateChat = v77.navigateToCreateChat, 
                navigateToPrivacy = v77.navigateToPrivacy, 
                navigateToSquadLobby = v77.navigateToSquadLobby, 
                navigateToToast = v77.navigateToToast, 
                key = "ChatLanding" .. v79
            });
            if v80 then
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
                        height = v81, 
                        initialText = v83.filterText, 
                        onFilter = function(v85) --[[ Line: 679 ]] --[[ Name: onFilter ]]
                            -- upvalues: v82 (copy), v4 (ref)
                            v82.setScreenTopBar(v4.ChatLanding, {
                                filterText = v85
                            });
                        end
                    }); 
                    v84
                });
            elseif l_GetFFlagEnablePushNotificationsUpsellModalChat_0() then
                return v9.createFragment({
                    v84; 
                    CheckAndOpenChatPushUpsell = v9.createElement(v23)
                });
            else
                return v84;
            end;
        end
    });
end;
v44.didMount = function(v86) --[[ Line: 700 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy), v42 (copy), l_GetFFlagEnableAppChatInExperience_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
    v20:info("{screen} mounted");
    if v42() then
        local l_navigation_1 = v86.props.navigation;
        local v88 = l_navigation_1.getScreenProps("navigateToRootStack", nil);
        local v89 = l_navigation_1.getScreenProps("isInExperience", false);
        local v90 = v88 and true or false;
        local v91 = l_GetFFlagEnableAppChatInExperience_0() and v89;
        local v92 = if l_navigation_1.getScreenProps("wideMode", false) then l_navigation_1.getScreenProps("appChatInnerPadding", 12) else l_navigation_1.getScreenProps("appChatOuterPadding", 12);
        local v93 = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then {
            raw = "Feature.Squads.Label.Party", 
            shouldLocalize = true
        } else {
            raw = "CommonUI.Features.Label.Chat", 
            shouldLocalize = true
        };
        v86.setScreenTopBar({
            shouldRenderCenter = false, 
            filterText = "", 
            headerText = v93, 
            backButtonEnabled = false, 
            closeButtonEnabled = v91 and v90, 
            isRoot = true, 
            isTitleLeftAligned = true, 
            leftPaddingOverride = l_navigation_1.getScreenProps("appChatOuterPadding", 12), 
            rightPaddingOverride = v92, 
            shouldBoldHeader = true
        });
        return;
    else
        v86.setScreenTopBar({
            shouldRenderCenter = false, 
            filterText = ""
        });
        return;
    end;
end;
return v44;