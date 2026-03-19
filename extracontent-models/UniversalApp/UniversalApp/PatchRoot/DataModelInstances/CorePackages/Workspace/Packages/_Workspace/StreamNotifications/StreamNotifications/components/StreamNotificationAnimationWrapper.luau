local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.constants);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_DarkTheme_0 = v5.App.Style.Themes.DarkTheme;
local v8 = require(l_Parent_0.NotificationsCommon);
local l_NotificationCard_0 = v8.NotificationCard;
local l_NotificationHelper_0 = v8.NotificationHelper;
local l_NotificationCardProvider_0 = v8.NotificationCardProvider;
local l_marshalStreamNotificationData_0 = l_NotificationHelper_0.marshalStreamNotificationData;
local v13 = {
    stiffness = 207, 
    damping = 24, 
    mass = 1
};
return function(v14) --[[ Line: 40 ]]
    -- upvalues: l_useStyle_0 (copy), l_marshalStreamNotificationData_0 (copy), v2 (copy), v4 (copy), v13 (copy), v3 (copy), l_DarkTheme_0 (copy), l_NotificationCardProvider_0 (copy), l_NotificationCard_0 (copy)
    local v15 = l_useStyle_0();
    local v16 = l_marshalStreamNotificationData_0(v14.notification);
    local v17, v18 = v2.useState(0);
    local v19, v20 = v4.useAnimatedBinding({
        dismissHeight = 1, 
        transparency = 1, 
        collapsedHeight = v14.collapsed and 0 or 1, 
        collapsedWidth = v14.collapsed and 1 or 0
    }, function() --[[ Line: 50 ]]
        -- upvalues: v14 (copy)
        if v14.notification.dismiss then
            v14.finishDismissNotification(v14.notification.id);
        end;
    end);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v20 (copy), v4 (ref), v14 (copy), v13 (ref)
        v20({
            dismissHeight = v4.spring(v14.notification.dismiss and 0 or 1, v13), 
            transparency = v4.spring(v14.notification.dismiss and 0 or 1, v13), 
            collapsedHeight = v4.spring(v14.collapsed and 0 or 1, v13), 
            collapsedWidth = v4.spring(v14.collapsed and 1 or 0, v13)
        });
    end, {
        v14.notification.dismiss, 
        v14.collapsed
    });
    local function v22(v21) --[[ Line: 66 ]]
        -- upvalues: v14 (copy)
        if v14.onHeightChange then
            v14.onHeightChange(v14.layoutOrder, v21.AbsoluteSize.Y);
        end;
    end;
    local function v25(v23) --[[ Line: 72 ]]
        -- upvalues: v14 (copy), v3 (ref), v18 (copy)
        if v14.notification.dismiss ~= true then
            local v24 = v23.AbsoluteSize.Y + v3.DefaultPadding;
            v18(v24);
        end;
    end;
    local v26 = 0;
    if v14.layoutOrder == 2 then
        v26 = v3.DefaultPadding * 2;
    elseif v14.layoutOrder == 3 then
        v26 = v3.DefaultPadding * 4;
    elseif v14.layoutOrder >= 4 then
        v26 = v3.DefaultPadding * 6;
    end;
    return v2.createElement("Frame", {
        Size = v19:map(function(v27) --[[ Line: 89 ]]
            -- upvalues: v14 (copy), v3 (ref), v26 (ref), v17 (copy)
            if v14.layoutOrder == 1 and v14.collapsed then
                return UDim2.new(1, -(v3.DefaultPadding * 2 + v26 * v27.collapsedWidth), 0, v27.collapsedHeight * v27.dismissHeight * v17 + v3.DefaultPadding);
            else
                return UDim2.new(1, -(v3.DefaultPadding * 2 + v26 * v27.collapsedWidth), 0, v27.collapsedHeight * v27.dismissHeight * v17);
            end;
        end), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v14.layoutOrder ~= 1 and (v14.collapsed and true or false), 
        LayoutOrder = v14.layoutOrder or 1, 
        ZIndex = if v14.layoutOrder then -v14.layoutOrder else 1
    }, {
        DismissFrame = v2.createElement("Frame", {
            Size = v19:map(function(v28) --[[ Line: 112 ]]
                -- upvalues: v17 (copy)
                return UDim2.new(1, 0, 0, v28.dismissHeight * v17);
            end), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = v14.layoutOrder, 
            [v2.Change.AbsoluteSize] = v22
        }, {
            FadeFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if v15.theme == l_DarkTheme_0 then v15.Theme.Overlay.Color else v15.Theme.BackgroundMuted.Color, 
                BackgroundTransparency = v19:map(function(v29) --[[ Line: 126 ]]
                    return v29.transparency;
                end), 
                ZIndex = 2, 
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {}), 
            InnerFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 1, 
                Position = UDim2.fromScale(0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                [v2.Change.AbsoluteSize] = v25
            }, {
                v2.createElement(l_NotificationCardProvider_0, {
                    notificationPayload = v14.notification, 
                    state = v16.state, 
                    isCompact = false, 
                    readOnly = v14.collapsed and true or false, 
                    handleActions = v14.handleActions, 
                    openMetaActions = v14.openMetaActions
                }, {
                    NotificationCard = v2.createElement(l_NotificationCard_0, {
                        isHover = false, 
                        layoutOrder = v14.layoutOrder
                    })
                })
            })
        })
    });
end;