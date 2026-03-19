local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.NotificationsCommon);
local l_NotificationCardProvider_0 = v4.NotificationCardProvider;
local l_NotificationCard_0 = v4.NotificationCard;
local l_NotificationHelper_0 = v4.NotificationHelper;
local l_constants_0 = v4.constants;
local v9 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v9.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v9.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v9.FocusNavigationEventNameEnum;
local _ = require(l_Parent_0.ReactFocusNavigation);
local v14 = require(l_Parent_0.InputHandlers);
local l_marshalStreamNotificationData_0 = l_NotificationHelper_0.marshalStreamNotificationData;
local v16 = require(l_script_FirstAncestor_0.EnumStreamNotificationsDisplayState);
local v17 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v17.Core.Style.useStyle;
local l_IconButton_0 = v17.App.Button.IconButton;
local l_IconSize_0 = v17.App.ImageSet.Enum.IconSize;
local l_BaseMenu_0 = v17.App.Menu.BaseMenu;
local l_ImageSetLabel_0 = v17.Core.ImageSet.ImageSetLabel;
return function(v23) --[[ Line: 35 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v16 (copy), l_marshalStreamNotificationData_0 (copy), v2 (copy), l_NotificationCardProvider_0 (copy), l_NotificationCard_0 (copy), l_constants_0 (copy), l_ImageSetLabel_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_BaseMenu_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v14 (copy)
    local v24 = l_useStyle_0();
    local l_activeNotification_0 = v23.activeNotification;
    local l_displayState_0 = v23.displayState;
    local l_isSmallScreen_0 = v23.isSmallScreen;
    local l_handleActions_0 = v23.handleActions;
    local l_closeNotificationDisplay_0 = v23.closeNotificationDisplay;
    local v30 = v3.useRef(nil);
    if l_displayState_0 ~= v16.MetaActions then
        return nil;
    else
        local v31 = l_marshalStreamNotificationData_0(l_activeNotification_0);
        local v32 = {};
        if v31 then
            for _, v34 in ipairs(v31.state.visualItems.metaAction) do
                table.insert(v32, {
                    icon = v2.MetaActions.ActionIcons[v34.actionIcon] or v2.MetaActions.ActionIcons.default, 
                    text = v34.label.text, 
                    onActivated = function() --[[ Line: 57 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_handleActions_0 (copy), v34 (copy), l_activeNotification_0 (copy)
                        if l_handleActions_0 then
                            l_handleActions_0(v34, l_activeNotification_0);
                        end;
                    end
                });
            end;
        end;
        local v35 = {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = if not l_isSmallScreen_0 then UDim.new(0, v2.Modal.CornerRadius) else UDim.new(0, 0)
            }), 
            MetaActions = v3.createElement("Frame", {
                ref = v30, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v2.Modal.Padding), 
                    PaddingLeft = UDim.new(0, v2.Modal.Padding), 
                    PaddingRight = UDim.new(0, v2.Modal.Padding), 
                    PaddingBottom = UDim.new(0, v2.Modal.Padding)
                }), 
                v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v2.DefaultPadding)
                }), 
                CardAndClose = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    ActiveCard = v3.createElement(l_NotificationCardProvider_0, {
                        notificationPayload = l_activeNotification_0, 
                        state = v31 and v31.state, 
                        isCompact = false, 
                        readOnly = false, 
                        openMetaActions = nil, 
                        handleActions = l_handleActions_0
                    }, {
                        NotificationCard = v3.createElement(l_NotificationCard_0, {
                            isHover = false, 
                            layoutOrder = 1
                        })
                    }), 
                    CloseButtonFrame = v3.createElement("Frame", {
                        Size = UDim2.fromOffset(v2.MetaActions.CloseButtonFrameSize, v2.MetaActions.CloseButtonFrameSize), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.new(1, -l_constants_0.Padding.DefaultCardPadding, 0, l_constants_0.Padding.DefaultCardPadding)
                    }, {
                        CloseIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = UDim2.fromOffset(v2.MetaActions.CloseIconSize, v2.MetaActions.CloseIconSize), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Image = v2.Modal.CloseIcon, 
                            ImageColor3 = v24.Theme.UIEmphasis.Color
                        }), 
                        CloseButton = v3.createElement(l_IconButton_0, {
                            iconSize = l_IconSize_0.Small, 
                            size = UDim2.fromOffset(v2.MetaActions.CloseButtonSize, v2.MetaActions.CloseButtonSize), 
                            layoutOrder = 1, 
                            anchorPoint = Vector2.new(0.5, 0.5), 
                            position = UDim2.new(0.5, 0, 0.5, 0), 
                            onActivated = l_closeNotificationDisplay_0
                        })
                    })
                }), 
                Menu = v3.createElement(l_BaseMenu_0, {
                    buttonProps = v32, 
                    width = UDim.new(1, 0), 
                    layoutOrder = 2
                })
            })
        };
        return v3.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
            isIsolated = true, 
            frameProps = {
                ref = v30
            }, 
            customEventHandlers = {
                [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                    handler = v14.onRelease(function(v36) --[[ Line: 166 ]]
                        -- upvalues: l_closeNotificationDisplay_0 (copy)
                        l_closeNotificationDisplay_0();
                        v36:cancel();
                    end)
                }
            }
        }, v35);
    end;
end;