local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v5 = require(l_ShareGame_0.Constants);
local v6 = require(l_ShareGame_0.Components.RectangleButton);
local v7 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v8 = v7.font(Enum.Font.SourceSansSemibold, "Semibold");
local v9 = v7.textSize(19);
local l_InviteStatus_0 = v5.InviteStatus;
local v11 = {
    [l_InviteStatus_0.Success] = "Feature.SettingsHub.Label.Invited", 
    [l_InviteStatus_0.Moderated] = "Feature.SettingsHub.Label.Moderated", 
    [l_InviteStatus_0.Pending] = "Feature.SettingsHub.Label.Sending"
};
local v12 = require(l_ShareGame_0.getTranslator)();
local v13 = v2.PureComponent:extend("InviteButton");
v13.render = function(v14) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: l_InviteStatus_0 (copy), l_Immutable_0 (copy), v2 (copy), v6 (copy), v8 (copy), v12 (copy), v9 (copy), v5 (copy), v11 (copy)
    local l_anchorPoint_0 = v14.props.anchorPoint;
    local l_position_0 = v14.props.position;
    local l_size_0 = v14.props.size;
    local l_layoutOrder_0 = v14.props.layoutOrder;
    local l_zIndex_0 = v14.props.zIndex;
    local l_onInvite_0 = v14.props.onInvite;
    local l_inviteStatus_0 = v14.props.inviteStatus;
    if not l_inviteStatus_0 or l_inviteStatus_0 == l_InviteStatus_0.Failed then
        local v22 = l_Immutable_0.Set(v14.props, "onClick", function() --[[ Line: 41 ]]
            -- upvalues: l_onInvite_0 (copy)
            l_onInvite_0();
        end);
        return v2.createElement(v6, v22, {
            InviteText = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Font = v8, 
                Text = v12:FormatByKey("Feature.SettingsHub.Action.InviteFriend"), 
                TextSize = v9, 
                TextColor3 = v5.Color.WHITE, 
                ZIndex = l_zIndex_0
            })
        });
    else
        local v23 = v11[l_inviteStatus_0] or "Feature.SettingsHub.Label.Moderated";
        return v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            Size = l_size_0, 
            Font = v8, 
            Text = v12:FormatByKey(v23), 
            TextSize = v9, 
            TextColor3 = v5.Color.WHITE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = l_layoutOrder_0, 
            ZIndex = l_zIndex_0
        });
    end;
end;
return v13;