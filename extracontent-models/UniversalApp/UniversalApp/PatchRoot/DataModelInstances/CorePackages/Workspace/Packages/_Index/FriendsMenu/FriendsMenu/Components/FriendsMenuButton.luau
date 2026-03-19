local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.RoactUtils);
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(l_Context_0.FriendsListContext);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v4.App.Button.Enum.StandardButtonSize;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_InviteStatus_0 = v7.InviteStatus;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local v17 = {
    inviteFriend = "Feature.SettingsHub.Action.InviteFriend", 
    [l_InviteStatus_0.Success] = "Feature.SettingsHub.Label.Invited", 
    [l_InviteStatus_0.Moderated] = "Feature.SettingsHub.Label.Moderated", 
    [l_InviteStatus_0.Pending] = "Feature.SettingsHub.Label.Sending"
};
return function(v18) --[[ Line: 39 ]]
    -- upvalues: l_useSelector_0 (copy), l_getLocalizedStrings_0 (copy), v17 (copy), v3 (copy), v8 (copy), l_useStyle_0 (copy), l_InviteStatus_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v21 = l_useSelector_0(function(v19) --[[ Line: 40 ]]
        -- upvalues: v18 (copy)
        local l_friend_0 = v18.friend;
        assert(l_friend_0, "friend should be non-nil. Silence type checker.");
        return v19.GameInvitesStatus[l_friend_0.id];
    end);
    local v22 = l_getLocalizedStrings_0(v17);
    local v23 = v3.useContext(v8);
    local v24 = l_useStyle_0();
    local v25 = v24 and v24.Theme;
    local v26 = v24 and v24.Font;
    local l_isFetchingFriends_0 = v23.isFetchingFriends;
    local v28 = v26.BaseSize * v26.CaptionHeader.RelativeSize;
    if (not v21 or v21 == l_InviteStatus_0.Failed) and not v18.isFullRowActivatable then
        return v3.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            isDisabled = l_isFetchingFriends_0, 
            isLoading = false, 
            onActivated = v18.onInvite, 
            standardSize = l_StandardButtonSize_0.XSmall, 
            fitContent = true, 
            anchorPoint = v18.anchorPoint, 
            position = v18.position, 
            text = v22.inviteFriend, 
            layoutOrder = v18.layoutOrder
        });
    else
        local v29 = v22[v21] or v22.inviteFriend;
        return v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v29, 
            TextSize = v28, 
            TextWrapped = true, 
            Size = v18.size, 
            AnchorPoint = v18.anchorPoint, 
            Position = v18.position, 
            TextColor3 = v25.TextDefault.Color, 
            Font = v26.CaptionHeader.Font, 
            LayoutOrder = v18.layoutOrder
        });
    end;
end;