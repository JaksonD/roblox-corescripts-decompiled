local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_Modules_0.Settings.Theme);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v7 = require(l_ShareGame_0.Components.ConversationDetails);
local v8 = require(l_ShareGame_0.Components.ConversationThumbnail);
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v10 = require(l_ShareGame_0.Components.InviteButton);
local l_InviteStatus_0 = require(l_ShareGame_0.Constants).InviteStatus;
local v12 = v4.PureComponent:extend("ConversationEntry");
v12.init = function(v13) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), l_InviteStatus_0 (copy), l_Players_0 (copy)
    v13.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
    v13.onInvite = function() --[[ Line: 33 ]]
        -- upvalues: v13 (copy), l_InviteStatus_0 (ref), l_Players_0 (ref)
        local l_inviteStatus_0 = v13.props.inviteStatus;
        if l_inviteStatus_0 and l_inviteStatus_0 ~= l_InviteStatus_0.Failed then
            return;
        else
            local l_analytics_0 = v13.props.analytics;
            local l_users_0 = v13.props.users;
            local l_inviteUser_0 = v13.props.inviteUser;
            if #l_users_0 == 1 then
                local function v23(v18) --[[ Line: 45 ]]
                    -- upvalues: l_users_0 (copy), l_Players_0 (ref), l_analytics_0 (copy)
                    if not v18 then
                        return;
                    else
                        local v19 = {};
                        for _, v21 in pairs(l_users_0) do
                            table.insert(v19, v21.id);
                        end;
                        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                        l_analytics_0:onActivatedInviteSent(l_LocalPlayer_0.UserId, v18.conversationId, v19);
                        return;
                    end;
                end;
                l_inviteUser_0(l_users_0[1].id):andThen(v23, function() --[[ Line: 60 ]]

                end);
            end;
            return;
        end;
    end;
end;
v12.render = function(v24) --[[ Line: 66 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), v7 (copy), v10 (copy)
    local l_visible_0 = v24.props.visible;
    local l_layoutOrder_0 = v24.props.layoutOrder;
    local l_zIndex_0 = v24.props.zIndex;
    local l_size_0 = v24.props.size;
    local l_subtitle_0 = v24.props.subtitle;
    local l_title_0 = v24.props.title;
    local l_users_1 = v24.props.users;
    local l_inviteStatus_1 = v24.props.inviteStatus;
    local l_presence_0 = v24.props.presence;
    return v4.createElement("ImageButton", {
        Visible = l_visible_0, 
        Selectable = true, 
        BackgroundColor3 = v5.color("PlayerRowFrame"), 
        BackgroundTransparency = v5.transparency("PlayerRowFrame", 1), 
        ImageTransparency = 0, 
        ScaleType = Enum.ScaleType.Stretch, 
        SliceCenter = Rect.new(), 
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0, 
        [v4.Event.Activated] = v24.onInvite
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = v5.MenuContainerCornerRadius
        }) or nil, 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12), 
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12)
        }), 
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 12)
        }), 
        Thumbnail = v4.createElement(v8, {
            users = l_users_1, 
            size = UDim2.new(0, 32, 0, 32), 
            layoutOrder = 0, 
            zIndex = l_zIndex_0
        }), 
        Details = v4.createElement(v7, {
            title = l_title_0, 
            subtitle = l_subtitle_0, 
            presence = l_presence_0, 
            size = UDim2.new(1, -125, 1, 0), 
            layoutOrder = 1, 
            zIndex = l_zIndex_0
        }), 
        InviteButton = v4.createElement(v10, {
            size = UDim2.new(0, 69, 1, 0), 
            layoutOrder = 2, 
            zIndex = l_zIndex_0, 
            onInvite = v24.onInvite, 
            inviteStatus = l_inviteStatus_1
        })
    });
end;
return v12;