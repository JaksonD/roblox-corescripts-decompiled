local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v3 = require(l_script_FirstAncestor_0.Constants);
local v4 = require(l_script_FirstAncestor_0.EnumScreens);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v6 = require(script.Parent.ChatTopBarBase);
local v7 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v8 = require(l_script_FirstAncestor_0.Components.ChatLanding.SearchTopBar);
local v9 = require(l_script_FirstAncestor_0.Components.ChatLanding.SnoozeToastNotificationsButton);
local v10 = require(l_script_FirstAncestor_0.Components.ChatLanding.ScheduledSquadsListButton);
local v11 = require(l_script_FirstAncestor_0.Hooks.useChatLandingVisibility);
local v12 = require(l_Parent_0.Foundation);
local v13 = require(l_Parent_0.React);
local v14 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v18 = require(l_script_FirstAncestor_0.Telemetry.useTelemetry);
local v19 = require(l_script_FirstAncestor_0.Telemetry.Layers.ChatLandingTelemetryLayer);
local v20 = require(l_script_FirstAncestor_0.Components.ChatLanding.ChatLandingTelemetryEvents);
local l_StreamNotificationsBellIcon_0 = require(l_Parent_0.StreamNotifications).StreamNotificationsBellIcon;
local l_IconButton_0 = v14.App.Button.IconButton;
local l_Images_0 = v14.App.ImageSet.Images;
local v24 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v25 = require(l_Parent_0.SharedFlags);
local l_GetFFlagAppChatRebrandStringUpdates_0 = v25.GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = v25.GetFFlagIsSquadEnabled;
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v25.FFlagEnableHeaderBarButtonsUpdate;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v25.FFlagRemoveDependencyArrayAntipattern;
local l_FFlagStreamNotificationBellEntryPoint_0 = v25.FFlagStreamNotificationBellEntryPoint;
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local l_ScheduledSquadActionSourceEnum_0 = require(l_Parent_0.Squads).Enums.ScheduledSquadActionSourceEnum;
local l_ScheduledSquadsListExperimentation_0 = require(l_Parent_0.SocialExperiments).ScheduledSquadsListExperimentation;
local function v44() --[[ Line: 55 ]] --[[ Name: SearchTopBarWrapper ]]
    -- upvalues: v7 (copy), v4 (copy), l_useLocalization_0 (copy), v13 (copy), v8 (copy)
    local v34 = v7(false);
    local l_setScreenTopBar_0 = v34.setScreenTopBar;
    local v36 = v34.getScreenTopBar(v4.ChatLanding)(false);
    local v37 = l_useLocalization_0({
        searchPlaceholderText = "Feature.Chat.Label.SearchWord", 
        cancelText = "Feature.Chat.Action.Cancel"
    });
    local v39 = v13.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v36 (copy)
        local l_closeInputBar_0 = v36.closeInputBar;
        if l_closeInputBar_0 then
            l_closeInputBar_0();
        end;
    end, {
        v36.closeInputBar
    });
    local v40 = v13.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: l_setScreenTopBar_0 (copy), v4 (ref)
        l_setScreenTopBar_0(v4.ChatLanding, {
            shouldAutoFocusCenter = false
        });
    end, {
        l_setScreenTopBar_0
    });
    local v41 = v13.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: l_setScreenTopBar_0 (copy), v4 (ref)
        l_setScreenTopBar_0(v4.ChatLanding, {
            shouldRenderCenter = false, 
            filterText = ""
        });
    end, {
        l_setScreenTopBar_0
    });
    local v43 = v13.useCallback(function(v42) --[[ Line: 85 ]]
        -- upvalues: l_setScreenTopBar_0 (copy), v4 (ref)
        l_setScreenTopBar_0(v4.ChatLanding, {
            filterText = v42
        });
    end, {
        l_setScreenTopBar_0
    });
    return v13.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        filterBox = v13.createElement(v8, {
            initialInputText = v36.filterText, 
            cancelText = v37.cancelText, 
            searchPlaceholderText = v37.searchPlaceholderText, 
            captureFocusOnMount = v36.shouldAutoFocusCenter, 
            onSelectCallback = v39, 
            resetOnMount = v40, 
            cancelCallback = v41, 
            textChangedCallback = v43
        })
    });
end;
local function v45() --[[ Line: 109 ]]
    -- upvalues: v13 (copy), v44 (copy)
    return v13.createElement(v44);
end;
return function(v46) --[[ Line: 113 ]] --[[ Name: ChatLandingTopBar ]]
    -- upvalues: v5 (copy), v3 (copy), v7 (copy), l_useSignalState_0 (copy), v11 (copy), v18 (copy), v19 (copy), v45 (copy), v13 (copy), v4 (copy), v20 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ScheduledSquadsListExperimentation_0 (copy), l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v12 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy), l_AppPage_0 (copy), v31 (copy), v24 (copy), v9 (copy), v10 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v6 (copy)
    if not v5() then
        return nil;
    else
        local l_screenName_0 = v46.screenName;
        local l_navigation_0 = v46.navigation;
        local v49 = l_navigation_0.getScreenProps("wideMode", false);
        local l_v3_IconButtonWidth_0 = v3:GetIconButtonWidth(v49);
        local v51 = v7(false);
        local l_setScreenTopBar_1 = v51.setScreenTopBar;
        local v53 = v51.getScreenTopBar(l_screenName_0);
        local v54 = l_useSignalState_0(v53);
        local v55 = v11();
        local v56 = v18(v19.Context);
        local l_shouldRenderCenter_0 = v54.shouldRenderCenter;
        local l_rightHidden_0 = v54.rightHidden;
        local v59 = if l_shouldRenderCenter_0 then v45 else nil;
        local v60 = v13.useCallback(function() --[[ Line: 137 ]]
            -- upvalues: l_setScreenTopBar_1 (copy), v4 (ref), v56 (copy), v20 (ref)
            l_setScreenTopBar_1(v4.ChatLanding, {
                shouldRenderCenter = true, 
                shouldAutoFocusCenter = true, 
                isSecondary = true
            });
            v56.emit(v20.ChatLandingSearchBtnClicked, {});
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v56, 
            l_setScreenTopBar_1
        } else l_dependencyArray_0(v56, l_setScreenTopBar_1));
        local v61 = v13.useCallback(function() --[[ Line: 151 ]]
            -- upvalues: l_navigation_0 (copy), v4 (ref), v56 (copy), v20 (ref)
            l_navigation_0.navigate(v4.CreateNewChat);
            v56.emit(v20.ChatLandingComposeBtnClicked, {});
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v56, 
            l_navigation_0
        } else l_dependencyArray_0(v56, l_navigation_0));
        local v62 = nil;
        if not l_shouldRenderCenter_0 then
            v62 = function() --[[ Line: 162 ]]
                -- upvalues: l_rightHidden_0 (copy), v55 (copy), l_ScheduledSquadsListExperimentation_0 (ref), l_FFlagEnableHeaderBarButtonsUpdate_0 (ref), v13 (ref), v12 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref), l_AppPage_0 (ref), v31 (ref), v24 (ref), v9 (ref), l_v3_IconButtonWidth_0 (copy), v10 (ref), l_ScheduledSquadActionSourceEnum_0 (ref), v60 (copy), v61 (copy), v49 (copy), l_IconButton_0 (ref), l_Images_0 (ref), l_GetFFlagAppChatRebrandStringUpdates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
                if l_rightHidden_0 then
                    return nil;
                else
                    local l_topBarShowSearch_0 = v55.topBarShowSearch;
                    local l_topBarShowCreateChatGroup_0 = v55.topBarShowCreateChatGroup;
                    local l_topBarShowNotifications_0 = v55.topBarShowNotifications;
                    local l_topBarShowSnoozeNotifications_0 = v55.topBarShowSnoozeNotifications;
                    local l_notificationCount_0 = v55.notificationCount;
                    if l_ScheduledSquadsListExperimentation_0.getIsTopBarEntrypointEnabled() then
                        if l_FFlagEnableHeaderBarButtonsUpdate_0 then
                            return v13.createElement(v12.View, {
                                tag = "row align-x-right align-y-center gap-xsmall auto-xy"
                            }, {
                                notifications = if l_topBarShowNotifications_0 then v13.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = l_notificationCount_0, 
                                    layoutOrder = 1, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                    testId = if v31 then v24.chatLandingTopBarIconButton("notifications") else nil
                                }) else nil, 
                                snoozeChatNotifications = if l_topBarShowSnoozeNotifications_0 then v13.createElement(v9, {
                                    layoutOrder = 2, 
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                }) else nil, 
                                scheduledSquadsButton = v13.createElement(v10, {
                                    layoutOrder = 3, 
                                    source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                }), 
                                filter = if l_topBarShowSearch_0 then v13.createElement(v12.IconButton, {
                                    size = v12.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v12.Enums.IconName.MagnifyingGlass, 
                                    testId = if v31 then v24.chatLandingTopBarIconButton("search") else nil, 
                                    LayoutOrder = 4, 
                                    onActivated = v60
                                }) else nil, 
                                createNewChat = if l_topBarShowCreateChatGroup_0 then v13.createElement(v12.IconButton, {
                                    size = v12.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v12.Enums.IconName.PlusLarge, 
                                    testId = if v31 then v24.chatLandingTopBarIconButton("createChat") else nil, 
                                    LayoutOrder = 5, 
                                    onActivated = v61
                                }) else nil
                            });
                        else
                            return v13.createElement(v13.Fragment, nil, {
                                notifications = l_topBarShowNotifications_0 and if v31 then v13.createElement(v12.View, {
                                    tag = "row align-x-center align-y-center radius-circle", 
                                    Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                    LayoutOrder = 1, 
                                    testId = v24.chatLandingTopBarIconButton("notifications")
                                }, {
                                    BellIcon = v13.createElement(l_StreamNotificationsBellIcon_0, {
                                        notificationCount = l_notificationCount_0, 
                                        compactWidth = not v49, 
                                        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                    })
                                }) else v13.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = l_notificationCount_0, 
                                    compactWidth = not v49, 
                                    layoutOrder = 1, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                }), 
                                snoozeChatNotifications = if l_topBarShowSnoozeNotifications_0 then v13.createElement(v9, {
                                    layoutOrder = 2, 
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                                }) else nil, 
                                scheduledSquadsButton = v13.createElement(v10, {
                                    layoutOrder = 3, 
                                    source = l_ScheduledSquadActionSourceEnum_0.ChatLandingScreen
                                }), 
                                filter = l_topBarShowSearch_0 and if v31 then v13.createElement(v12.IconButton, {
                                    size = v12.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v12.Enums.IconName.MagnifyingGlass, 
                                    testId = v24.chatLandingTopBarIconButton("search"), 
                                    LayoutOrder = 4, 
                                    onActivated = v60
                                }) else v13.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = l_Images_0["icons/common/search"], 
                                    layoutOrder = 4, 
                                    onActivated = v60
                                }), 
                                createNewChat = l_topBarShowCreateChatGroup_0 and if v31 then v13.createElement(v12.IconButton, {
                                    size = v12.Enums.InputSize.Medium, 
                                    isCircular = true, 
                                    icon = v12.Enums.IconName.PlusLarge, 
                                    testId = v24.chatLandingTopBarIconButton("createChat"), 
                                    LayoutOrder = 5, 
                                    onActivated = v61
                                }) else v13.createElement(l_IconButton_0, {
                                    size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                    icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                    layoutOrder = 5, 
                                    onActivated = v61
                                })
                            });
                        end;
                    elseif l_FFlagEnableHeaderBarButtonsUpdate_0 then
                        return v13.createElement(v12.View, {
                            tag = "row align-x-right align-y-center gap-xsmall auto-xy"
                        }, {
                            filter = if l_topBarShowSearch_0 then v13.createElement(v12.IconButton, {
                                size = v12.Enums.InputSize.Medium, 
                                isCircular = true, 
                                icon = v12.Enums.IconName.MagnifyingGlass, 
                                testId = if v31 then v24.chatLandingTopBarIconButton("search") else nil, 
                                LayoutOrder = 1, 
                                onActivated = v60
                            }) else nil, 
                            createNewChat = if l_topBarShowCreateChatGroup_0 then v13.createElement(v12.IconButton, {
                                size = v12.Enums.InputSize.Medium, 
                                isCircular = true, 
                                icon = v12.Enums.IconName.PlusLarge, 
                                testId = if v31 then v24.chatLandingTopBarIconButton("createChat") else nil, 
                                LayoutOrder = 2, 
                                onActivated = v61
                            }) else nil, 
                            notifications = if l_topBarShowNotifications_0 then v13.createElement(l_StreamNotificationsBellIcon_0, {
                                notificationCount = l_notificationCount_0, 
                                layoutOrder = 3, 
                                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil, 
                                testId = if v31 then v24.chatLandingTopBarIconButton("notifications") else nil
                            }) else nil, 
                            snoozeChatNotifications = if l_topBarShowSnoozeNotifications_0 then v13.createElement(v9, {
                                layoutOrder = 4, 
                                size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                            }) else nil
                        });
                    else
                        return v13.createElement(v13.Fragment, nil, {
                            filter = l_topBarShowSearch_0 and if v31 then v13.createElement(v12.IconButton, {
                                size = v12.Enums.InputSize.Medium, 
                                isCircular = true, 
                                icon = v12.Enums.IconName.MagnifyingGlass, 
                                testId = v24.chatLandingTopBarIconButton("search"), 
                                LayoutOrder = 1, 
                                onActivated = v60
                            }) else v13.createElement(l_IconButton_0, {
                                size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                icon = l_Images_0["icons/common/search"], 
                                layoutOrder = 1, 
                                onActivated = v60
                            }), 
                            createNewChat = l_topBarShowCreateChatGroup_0 and if v31 then v13.createElement(v12.IconButton, {
                                size = v12.Enums.InputSize.Medium, 
                                isCircular = true, 
                                icon = v12.Enums.IconName.PlusLarge, 
                                testId = v24.chatLandingTopBarIconButton("createChat"), 
                                LayoutOrder = 2, 
                                onActivated = v61
                            }) else v13.createElement(l_IconButton_0, {
                                size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0), 
                                icon = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_Images_0["icons/common/plus"] else l_Images_0["icons/actions/compose"], 
                                layoutOrder = 2, 
                                onActivated = v61
                            }), 
                            notifications = l_topBarShowNotifications_0 and if v31 then v13.createElement(v12.View, {
                                Size = UDim2.new(0, l_v3_IconButtonWidth_0, 0, l_v3_IconButtonWidth_0), 
                                tag = "row align-x-center align-y-center radius-circle", 
                                testId = v24.chatLandingTopBarIconButton("notifications")
                            }, {
                                BellIcon = v13.createElement(l_StreamNotificationsBellIcon_0, {
                                    notificationCount = l_notificationCount_0, 
                                    compactWidth = not v49, 
                                    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                                })
                            }) else v13.createElement(l_StreamNotificationsBellIcon_0, {
                                notificationCount = l_notificationCount_0, 
                                compactWidth = not v49, 
                                layoutOrder = 3, 
                                entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then l_AppPage_0.Chat else nil
                            }), 
                            snoozeChatNotifications = if l_topBarShowSnoozeNotifications_0 then v13.createElement(v9, {
                                layoutOrder = 4, 
                                size = UDim2.new(0, l_v3_IconButtonWidth_0, 1, 0)
                            }) else nil
                        });
                    end;
                end;
            end;
        end;
        return v13.createElement(v6, {
            screenName = l_screenName_0, 
            navigation = l_navigation_0, 
            renderRight = v62, 
            renderCenter = v59
        });
    end;
end;