local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_NotificationTypeEnum_0 = require(l_Parent_0.type).NotificationTypeEnum;
local l_ShowNotificationSnoozeMenuSignal_0 = require(l_Parent_0.Signals).ShowNotificationSnoozeMenuSignal;
local l_DismissNotificationSnoozeMenuSignal_0 = require(l_Parent_0.Signals).DismissNotificationSnoozeMenuSignal;
local l_NotificationSnoozeMenuVisibleSignal_0 = require(l_Parent_0.Signals).NotificationSnoozeMenuVisibleSignal;
local l_default_0 = require(l_Parent_0.ToastNotificationSnoozeManager).default;
local l_useTokens_0 = require(l_Parent_1.Foundation).Hooks.useTokens;
local l_Cryo_0 = v2.Cryo;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_Localization_0 = v2.Localization;
local l_React_0 = v2.React;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_useLocalization_0 = l_Localization_0.Hooks.useLocalization;
local l_Colors_0 = l_UIBlox_0.App.Style.Colors;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_useCursor_0 = l_UIBlox_0.App.SelectionCursor.useCursor;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v20 = require(l_Parent_1.FocusNavigationUtils);
local l_FocusNavigableSurfaceIdentifierEnum_0 = v20.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v20.FocusNavigationEventNameEnum;
local l_FocusRoot_0 = v20.FocusRoot;
local v24 = require(l_Parent_1.InputHandlers);
local _ = require(l_Parent_1.ReactFocusNavigation);
local l_FFlagEnableAppChatSnoozeMenuFocus_0 = require(l_Parent_1.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus;
local l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 = require(l_Parent_1.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_1.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_1.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagUseNotificationGroupsConfig_0 = require(l_Parent_1.SharedFlags).FFlagUseNotificationGroupsConfig;
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_1.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v32 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local v33 = {
    [l_NotificationTypeEnum_0.ChatNewMessage] = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Squads.Label.Party" or "Feature.Chat.Action.StartChatWithFriends"
};
local v34 = nil;
v34 = {
    [1] = {
        textKey = "fifteenMinutes", 
        durationMinutes = 15
    }, 
    [2] = {
        textKey = "fourHours", 
        durationMinutes = 240
    }, 
    [3] = {
        textKey = "oneDay", 
        durationMinutes = 1440
    }, 
    [4] = {
        textKey = "untilITurnItBackOn", 
        durationMinutes = -1
    }
};
return function() --[[ Line: 79 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagEnableAppChatSnoozeMenuFocus_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_Cryo_0 (copy), v33 (copy), l_React_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_ShowNotificationSnoozeMenuSignal_0 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (copy), l_DismissNotificationSnoozeMenuSignal_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v24 (copy), l_NotificationSnoozeMenuVisibleSignal_0 (copy), l_useCursor_0 (copy), v34 (ref), l_Colors_0 (copy), l_FFlagUseNotificationGroupsConfig_0 (copy), l_default_0 (copy), l_Interactable_0 (copy), l_FocusRoot_0 (copy), v32 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_Roact_0 (copy)
    local v35 = l_useStyle_0();
    local v36 = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then l_useTokens_0() else nil;
    local v37 = l_useLocalization_0((l_Cryo_0.Dictionary.union(v33, {
        fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes", 
        fourHours = "Feature.Notifications.Action.SnoozeFourHours", 
        oneDay = "Feature.Notifications.Action.SnoozeOneDay", 
        oneHour = "Feature.Notifications.Action.SnoozeOneHour", 
        untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn", 
        snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
    })));
    local v38, v39 = l_React_0.useState(false);
    local v40, v41 = l_React_0.useState({});
    local v42 = l_React_0.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v39 (copy)
        v39(false);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v39
    } else l_dependencyArray_0(v39));
    l_React_0.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: l_ShowNotificationSnoozeMenuSignal_0 (ref), v41 (copy), v39 (copy), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (ref), l_DismissNotificationSnoozeMenuSignal_0 (ref), v42 (copy)
        local v43 = nil;
        v43 = l_ShowNotificationSnoozeMenuSignal_0:connect(function(v44) --[[ Line: 100 ]]
            -- upvalues: v41 (ref), v39 (ref)
            v41(v44);
            v39(true);
        end);
        local v45 = nil;
        if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
            v45 = l_DismissNotificationSnoozeMenuSignal_0:connect(function() --[[ Line: 112 ]]
                -- upvalues: v42 (ref)
                v42();
            end);
        end;
        return function() --[[ Line: 117 ]]
            -- upvalues: v43 (ref), l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0 (ref), v45 (ref)
            v43:disconnect();
            if l_GetFFlagAppChatInExpToastSnoozeMenuDismissFix_0() then
                v45:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v39
    } else l_dependencyArray_0(v39));
    local v46 = nil;
    if l_FFlagEnableAppChatSnoozeMenuFocus_0 then
        v46 = l_React_0.useMemo(function() --[[ Line: 127 ]]
            -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v24 (ref), v42 (copy)
            return {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v24.onRelease(function(v47) --[[ Line: 130 ]]
                        -- upvalues: v42 (ref)
                        v42();
                        v47:cancel();
                    end)
                }
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v42
        } else l_dependencyArray_0(v42));
        l_React_0.useEffect(function() --[[ Line: 138 ]]
            -- upvalues: l_NotificationSnoozeMenuVisibleSignal_0 (ref), v38 (copy)
            l_NotificationSnoozeMenuVisibleSignal_0:fire({
                visible = v38
            });
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v38
        } else l_dependencyArray_0(v38));
    end;
    local v48 = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then l_useCursor_0() else nil;
    local v53 = l_React_0.useMemo(function() --[[ Line: 145 ]]
        -- upvalues: v34 (ref), l_React_0 (ref), l_FFlagEnableAppChatSnoozeMenuFocus_0 (ref), v36 (copy), v35 (copy), v48 (copy), v37 (copy), l_Colors_0 (ref), v40 (copy), l_FFlagUseNotificationGroupsConfig_0 (ref), l_default_0 (ref), v39 (copy)
        local v49 = {};
        for v50, v51 in ipairs(v34) do
            table.insert(v49, l_React_0.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, if l_FFlagEnableAppChatSnoozeMenuFocus_0 then v36.Size.Size_1400 else 56), 
                BackgroundTransparency = 1, 
                Font = v35.Font.Header2.Font, 
                LayoutOrder = v50, 
                SelectionImageObject = v48, 
                Text = v37[v51.textKey], 
                TextSize = v35.Font.Header2.RelativeSize * v35.Font.BaseSize, 
                TextColor3 = l_Colors_0.White, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [l_React_0.Event.Activated] = function() --[[ Line: 167 ]]
                    -- upvalues: v40 (ref), l_FFlagUseNotificationGroupsConfig_0 (ref), l_default_0 (ref), v51 (copy), v37 (ref), v39 (ref)
                    if v40.notificationType then
                        local l_notificationType_0 = v40.notificationType;
                        if l_FFlagUseNotificationGroupsConfig_0 and type(v40.notificationType) == "table" then
                            l_notificationType_0 = v40.notificationType[1];
                        end;
                        l_default_0:snoozeNotification({
                            context = v40.context, 
                            notificationType = v40.notificationType, 
                            durationMinutes = v51.durationMinutes, 
                            modalMessage = v37.snoozeFeedback:gsub("{title}", v37[if l_FFlagUseNotificationGroupsConfig_0 then l_notificationType_0 else v40.notificationType] or ""):gsub("{duration}", v37[v51.textKey])
                        });
                    end;
                    v39(false);
                end
            }, {
                UIPadding = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then l_React_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v36.Padding.XXLarge), 
                    PaddingRight = UDim.new(0, v36.Padding.XXLarge)
                }) else nil, 
                Border = l_React_0.createElement("Frame", {
                    Size = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then UDim2.new(1, v36.Padding.XXLarge, 0, 1) else UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 0.8, 
                    BackgroundColor3 = l_Colors_0.White, 
                    LayoutOrder = v50
                })
            }));
            v50 = v50 + 1;
        end;
        return v49;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v40
    } else l_dependencyArray_0(v40));
    if v38 then
        return (l_React_0.createElement(l_Interactable_0, {
            Size = UDim2.fromScale(1, 1), 
            AutoButtonColor = false, 
            BackgroundColor3 = l_Colors_0.Black, 
            BackgroundTransparency = 0.6, 
            onStateChanged = function() --[[ Line: 224 ]] --[[ Name: onStateChanged ]]

            end, 
            [l_React_0.Event.Activated] = v42
        }, {
            SnoozeMenu = l_React_0.createElement(if l_FFlagEnableAppChatSnoozeMenuFocus_0 then l_FocusRoot_0 else l_Interactable_0, if l_FFlagEnableAppChatSnoozeMenuFocus_0 then {
                eventHandlers = v46, 
                eventMap = v32, 
                frameProps = {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v35.Theme.BackgroundDefault.Transparency, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.new(1, -v36.Padding.Small * 2, 0, 0)
                }, 
                isAutoFocusRoot = true, 
                isIsolated = true, 
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp
            } else {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -16, 0, 0), 
                AutoButtonColor = false, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v35.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v35.Theme.BackgroundDefault.Transparency, 
                onStateChanged = function() --[[ Line: 253 ]] --[[ Name: onStateChanged ]]

                end
            }, {
                UICorner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v35.Tokens.Semantic.Radius.XLarge)
                }), 
                UIListLayout = l_React_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UIPadding = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then nil else l_React_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24)
                }), 
                UISizeConstraint = l_React_0.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(400, 1e999)
                }), 
                TitleContainer = l_React_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    UIPadding = l_React_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, if l_FFlagEnableAppChatSnoozeMenuFocus_0 then v36.Padding.XLarge else 20), 
                        PaddingRight = UDim.new(0, if l_FFlagEnableAppChatSnoozeMenuFocus_0 then v36.Padding.XXLarge else 24), 
                        PaddingTop = UDim.new(0, if l_FFlagEnableAppChatSnoozeMenuFocus_0 then v36.Padding.XLarge else 20), 
                        PaddingLeft = if l_FFlagEnableAppChatSnoozeMenuFocus_0 then UDim.new(0, v36.Padding.XXLarge) else nil
                    }), 
                    Title = l_React_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = v35.Font.Body.Font, 
                        LayoutOrder = 1, 
                        Text = v40.title or "", 
                        TextSize = v35.Font.Body.RelativeSize * v35.Font.BaseSize, 
                        TextColor3 = l_Colors_0.White, 
                        TextWrapped = true
                    }), 
                    Description = if v40 and v40.description and v40.description ~= "" then l_React_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = v35.Font.CaptionBody.Font, 
                        LayoutOrder = 2, 
                        Text = v40.description or "", 
                        TextSize = v35.Font.CaptionBody.RelativeSize * v35.Font.BaseSize, 
                        TextColor3 = v35.Theme.TextDefault.Color
                    }) else nil
                }), 
                SnoozeOptions = l_React_0.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    UIListLayout = l_React_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    SnoozeOptions = l_Roact_0.createFragment(v53)
                })
            })
        }));
    else
        return nil;
    end;
end;