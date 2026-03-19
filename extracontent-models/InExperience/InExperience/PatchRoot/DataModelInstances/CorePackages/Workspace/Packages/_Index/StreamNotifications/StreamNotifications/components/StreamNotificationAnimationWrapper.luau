local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.constants);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_DarkTheme_0 = v5.App.Style.Themes.DarkTheme;
local v8 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
local v9 = require(l_Parent_0.NotificationsCommon);
local l_NotificationCard_0 = v9.NotificationCard;
local l_NotificationHelper_0 = v9.NotificationHelper;
local l_NotificationCardProvider_0 = v9.NotificationCardProvider;
local l_marshalStreamNotificationData_0 = l_NotificationHelper_0.marshalStreamNotificationData;
local v14 = {
    stiffness = 207, 
    damping = 24, 
    mass = 1
};
return function(v15) --[[ Line: 41 ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), l_marshalStreamNotificationData_0 (copy), v2 (copy), v4 (copy), v14 (copy), v3 (copy), l_DarkTheme_0 (copy), l_NotificationCardProvider_0 (copy), l_NotificationCard_0 (copy)
    local v16 = l_useStyle_0();
    local v17 = v8.getDropdownEnabled();
    local v18 = l_marshalStreamNotificationData_0(v15.notification);
    local v19, v20 = v2.useState(0);
    local v21, v22 = v4.useAnimatedBinding({
        dismissHeight = 1, 
        transparency = 1, 
        collapsedHeight = v15.collapsed and 0 or 1, 
        collapsedWidth = v15.collapsed and 1 or 0
    }, function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy)
        if v15.notification.dismiss then
            v15.finishDismissNotification(v15.notification.id);
        end;
    end);
    v2.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v22 (copy), v4 (ref), v15 (copy), v14 (ref)
        v22({
            dismissHeight = v4.spring(v15.notification.dismiss and 0 or 1, v14), 
            transparency = v4.spring(v15.notification.dismiss and 0 or 1, v14), 
            collapsedHeight = v4.spring(v15.collapsed and 0 or 1, v14), 
            collapsedWidth = v4.spring(v15.collapsed and 1 or 0, v14)
        });
    end, {
        v15.notification.dismiss, 
        v15.collapsed
    });
    local function v24(v23) --[[ Line: 68 ]]
        -- upvalues: v15 (copy)
        if v15.onHeightChange then
            v15.onHeightChange(v15.layoutOrder, v23.AbsoluteSize.Y);
        end;
    end;
    local function v27(v25) --[[ Line: 74 ]]
        -- upvalues: v15 (copy), v17 (copy), v3 (ref), v20 (copy)
        if v15.notification.dismiss ~= true then
            local v26 = v25.AbsoluteSize.Y + (v17 and 0 or v3.DefaultPadding);
            v20(v26);
        end;
    end;
    local v28 = 0;
    local v29 = 0;
    if not v17 then
        v28 = v3.DefaultPadding * 2;
        if v15.layoutOrder == 2 then
            v29 = v3.DefaultPadding * 2;
        elseif v15.layoutOrder == 3 then
            v29 = v3.DefaultPadding * 4;
        elseif v15.layoutOrder >= 4 then
            v29 = v3.DefaultPadding * 6;
        end;
    end;
    return v2.createElement("Frame", {
        Size = v21:map(function(v30) --[[ Line: 98 ]]
            -- upvalues: v15 (copy), v28 (ref), v29 (ref), v19 (copy), v17 (copy), v3 (ref)
            if v15.layoutOrder == 1 and v15.collapsed then
                return UDim2.new(1, -(v28 + v29 * v30.collapsedWidth), 0, v30.collapsedHeight * v30.dismissHeight * v19 + (v17 and 0 or v3.DefaultPadding));
            else
                return UDim2.new(1, -(v28 + v29 * v30.collapsedWidth), 0, v30.collapsedHeight * v30.dismissHeight * v19);
            end;
        end), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v15.layoutOrder ~= 1 and (v15.collapsed and true or false), 
        LayoutOrder = v15.layoutOrder or 1, 
        ZIndex = if v15.layoutOrder then -v15.layoutOrder else 1
    }, {
        DismissFrame = v2.createElement("Frame", {
            Size = v21:map(function(v31) --[[ Line: 122 ]]
                -- upvalues: v19 (copy)
                return UDim2.new(1, 0, 0, v31.dismissHeight * v19);
            end), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = v15.layoutOrder, 
            [v2.Change.AbsoluteSize] = v24
        }, {
            FadeFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if v16.theme == l_DarkTheme_0 then v16.Theme.Overlay.Color else v16.Theme.BackgroundMuted.Color, 
                BackgroundTransparency = v21:map(function(v32) --[[ Line: 136 ]]
                    return v32.transparency;
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
                [v2.Change.AbsoluteSize] = v27
            }, {
                v2.createElement(l_NotificationCardProvider_0, {
                    notificationPayload = v15.notification, 
                    state = v18.state, 
                    isCompact = false, 
                    readOnly = v15.collapsed and true or false, 
                    handleActions = v15.handleActions, 
                    openMetaActions = v15.openMetaActions
                }, {
                    NotificationCard = v2.createElement(l_NotificationCard_0, {
                        isHover = false, 
                        layoutOrder = v15.layoutOrder
                    })
                })
            })
        })
    });
end;