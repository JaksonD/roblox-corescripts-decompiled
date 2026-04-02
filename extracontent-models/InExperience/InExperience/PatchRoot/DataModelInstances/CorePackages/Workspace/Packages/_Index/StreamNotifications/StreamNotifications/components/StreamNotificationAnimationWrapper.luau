local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.constants);
local v4 = require(l_Parent_0.ReactOtter);
local v5 = require(l_Parent_0.SharedFlags);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_DarkTheme_0 = v6.App.Style.Themes.DarkTheme;
local v9 = require(l_script_FirstAncestor_0.StreamNotificationDropdownExperimentation);
local v10 = require(l_Parent_0.NotificationsCommon);
local l_NotificationCard_0 = v10.NotificationCard;
local l_NotificationHelper_0 = v10.NotificationHelper;
local l_NotificationCardProvider_0 = v10.NotificationCardProvider;
local l_marshalStreamNotificationData_0 = l_NotificationHelper_0.marshalStreamNotificationData;
local l_useImpressionsTagger_0 = require(l_Parent_0.Impressions).useImpressionsTagger;
local l_FFlagStreamNotificationImpressionLogging_0 = v5.FFlagStreamNotificationImpressionLogging;
local v17 = {
    stiffness = 207, 
    damping = 24, 
    mass = 1
};
return function(v18) --[[ Line: 51 ]]
    -- upvalues: l_useStyle_0 (copy), v9 (copy), l_marshalStreamNotificationData_0 (copy), v2 (copy), v4 (copy), v17 (copy), v3 (copy), l_FFlagStreamNotificationImpressionLogging_0 (copy), l_useImpressionsTagger_0 (copy), l_DarkTheme_0 (copy), l_NotificationCardProvider_0 (copy), l_NotificationCard_0 (copy)
    local v19 = l_useStyle_0();
    local v20 = v9.getDropdownEnabled();
    local v21 = l_marshalStreamNotificationData_0(v18.notification);
    local v22 = v2.useRef(nil);
    local v23, v24 = v2.useState(0);
    local v25, v26 = v4.useAnimatedBinding({
        dismissHeight = 1, 
        transparency = 1, 
        collapsedHeight = v18.collapsed and 0 or 1, 
        collapsedWidth = v18.collapsed and 1 or 0
    }, function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy)
        if v18.notification.dismiss then
            v18.finishDismissNotification(v18.notification.id);
        end;
    end);
    v2.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v26 (copy), v4 (ref), v18 (copy), v17 (ref)
        v26({
            dismissHeight = v4.spring(v18.notification.dismiss and 0 or 1, v17), 
            transparency = v4.spring(v18.notification.dismiss and 0 or 1, v17), 
            collapsedHeight = v4.spring(v18.collapsed and 0 or 1, v17), 
            collapsedWidth = v4.spring(v18.collapsed and 1 or 0, v17)
        });
    end, {
        v18.notification.dismiss, 
        v18.collapsed
    });
    local function v28(v27) --[[ Line: 79 ]]
        -- upvalues: v18 (copy)
        if v18.onHeightChange then
            v18.onHeightChange(v18.layoutOrder, v27.AbsoluteSize.Y);
        end;
    end;
    local function v31(v29) --[[ Line: 85 ]]
        -- upvalues: v18 (copy), v20 (copy), v3 (ref), v24 (copy)
        if v18.notification.dismiss ~= true then
            local v30 = v29.AbsoluteSize.Y + (v20 and 0 or v3.DefaultPadding);
            v24(v30);
        end;
    end;
    local v32 = 0;
    local v33 = 0;
    if not v20 then
        v32 = v3.DefaultPadding * 2;
        if v18.layoutOrder == 2 then
            v33 = v3.DefaultPadding * 2;
        elseif v18.layoutOrder == 3 then
            v33 = v3.DefaultPadding * 4;
        elseif v18.layoutOrder >= 4 then
            v33 = v3.DefaultPadding * 6;
        end;
    end;
    if l_FFlagStreamNotificationImpressionLogging_0 then
        l_useImpressionsTagger_0(v22, v18.impressionsTag, v18.impressionIndex);
    end;
    return v2.createElement("Frame", {
        ref = v22, 
        Size = v25:map(function(v34) --[[ Line: 114 ]]
            -- upvalues: v18 (copy), v32 (ref), v33 (ref), v23 (copy), v20 (copy), v3 (ref)
            if v18.layoutOrder == 1 and v18.collapsed then
                return UDim2.new(1, -(v32 + v33 * v34.collapsedWidth), 0, v34.collapsedHeight * v34.dismissHeight * v23 + (v20 and 0 or v3.DefaultPadding));
            else
                return UDim2.new(1, -(v32 + v33 * v34.collapsedWidth), 0, v34.collapsedHeight * v34.dismissHeight * v23);
            end;
        end), 
        BackgroundTransparency = 1, 
        ClipsDescendants = v18.layoutOrder ~= 1 and (v18.collapsed and true or false), 
        LayoutOrder = v18.layoutOrder or 1, 
        ZIndex = if v18.layoutOrder then -v18.layoutOrder else 1
    }, {
        DismissFrame = v2.createElement("Frame", {
            Size = v25:map(function(v35) --[[ Line: 138 ]]
                -- upvalues: v23 (copy)
                return UDim2.new(1, 0, 0, v35.dismissHeight * v23);
            end), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            LayoutOrder = v18.layoutOrder, 
            [v2.Change.AbsoluteSize] = v28
        }, {
            FadeFrame = v2.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = if v19.theme == l_DarkTheme_0 then v19.Theme.Overlay.Color else v19.Theme.BackgroundMuted.Color, 
                BackgroundTransparency = v25:map(function(v36) --[[ Line: 152 ]]
                    return v36.transparency;
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
                [v2.Change.AbsoluteSize] = v31
            }, {
                v2.createElement(l_NotificationCardProvider_0, {
                    notificationPayload = v18.notification, 
                    state = v21.state, 
                    isCompact = false, 
                    readOnly = v18.collapsed and true or false, 
                    handleActions = v18.handleActions, 
                    openMetaActions = v18.openMetaActions
                }, {
                    NotificationCard = v2.createElement(l_NotificationCard_0, {
                        isHover = false, 
                        layoutOrder = v18.layoutOrder
                    })
                })
            })
        })
    });
end;