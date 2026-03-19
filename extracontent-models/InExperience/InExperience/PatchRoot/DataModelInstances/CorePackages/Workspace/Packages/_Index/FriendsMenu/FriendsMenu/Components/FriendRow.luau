local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableCommonFriendsMenu_0 = v9.GetFFlagEnableCommonFriendsMenu;
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = v9.GetFFlagFriendsMenuDummyLoadingFriendsFix;
local v12 = require(l_Parent_0.Foundation);
local l_useCursor_0 = v12.Hooks.useCursor;
local v14 = require(l_Components_0.FriendThumbnail);
local v15 = require(l_Components_0.FriendsMenuButton);
local v16 = require(l_Components_0.FriendInfo);
local v17 = require(l_Components_0.FriendsMenuCheckbox);
local v18 = if l_GetFFlagEnableCommonFriendsMenu_0() then require(l_Context_0.InviteCallbackContext) else require(l_Context_0.InviteFriendContext);
local v19 = require(l_Context_0.SelectedUsersContext);
local v20 = require(l_Enums_0.FriendMenuType);
local l_useStyle_0 = v6.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v24 = UDim2.new(1, 0, 0.5, 0);
local v25 = Vector2.new(1, 0.5);
local function v26() --[[ Line: 45 ]]

end;
local v27 = {
    sidePadding = 24, 
    isFullRowActivatable = false, 
    backgroundTransparency = nil
};
return function(v28) --[[ Line: 65 ]]
    -- upvalues: v7 (copy), v27 (copy), v5 (copy), l_useStyle_0 (copy), v18 (copy), v19 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useCursor_0 (copy), v12 (copy), l_dependencyArray_0 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (copy), v20 (copy), v26 (copy), v14 (copy), v16 (copy), v17 (copy), v24 (copy), v25 (copy), v15 (copy)
    local v29 = v7.Dictionary.join(v27, v28);
    local v30, v31 = v5.useState(false);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_friend_0 = v29.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v34 = v5.useContext(v18);
    local v35 = v5.useContext(v19);
    local l_sidePadding_0 = v29.sidePadding;
    local v37 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v12.Enums.CursorType.RoundedSlot) else nil;
    local v38 = v29.isFullRowActivatable and not v29.isFetchingFriends;
    local v39 = v5.useCallback(function() --[[ Line: 83 ]]
        -- upvalues: v34 (copy), l_friend_0 (copy), v29 (copy)
        if v34 and v34.inviteSingleFriend and not l_friend_0.isLoadingPlaceholder then
            v34.inviteSingleFriend(l_friend_0.id, v29.layoutOrder);
        end;
    end, l_dependencyArray_0(v34, v34.inviteSingleFriend, l_friend_0.id, l_friend_0.isLoadingPlaceholder, v29.layoutOrder));
    local v40 = v5.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v35 (copy), v29 (copy)
        if v35.isFriendSelected(v29.friend.id) then
            v35.removeFriend(v29.friend.id, v29.friend.displayName);
            return;
        else
            v35.addFriend(v29.friend.id, v29.friend.displayName);
            return;
        end;
    end, l_dependencyArray_0(v35.isFriendSelected, v35.removeFriend, v35.addFriend, v29.friend.id));
    local v41 = v5.useCallback(function() --[[ Line: 114 ]]
        -- upvalues: v38 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (ref), l_friend_0 (copy), v29 (copy), v20 (ref), v39 (copy), v40 (copy)
        if not v38 or l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder then
            return;
        elseif v29.menuType ~= v20.MultiSelect then
            v39();
            return;
        else
            v40();
            return;
        end;
    end, l_dependencyArray_0(v38, v29.menuType, v39, v40, l_friend_0.isLoadingPlaceholder));
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 72), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v30 and l_Theme_0.BackgroundOnHover.Color or l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = if v30 then l_Theme_0.BackgroundOnHover.Transparency else if v29.backgroundTransparency then v29.backgroundTransparency else l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v29.layoutOrder, 
        SelectionImageObject = if l_FFlagEnableAppChatFocusableFixes_0 and v29.isFullRowActivatable then v37 else nil, 
        [v5.Event.MouseEnter] = function() --[[ Line: 151 ]]
            -- upvalues: v29 (copy), v31 (copy)
            if not v29.isFetchingFriends then
                v31(true);
            end;
        end, 
        [v5.Event.MouseLeave] = function() --[[ Line: 156 ]]
            -- upvalues: v31 (copy)
            v31(false);
        end, 
        [v5.Event.Activated] = if not (l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder) and v38 then v41 else v26, 
        AutoButtonColor = v38
    }, {
        UIListLayout = v5.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 12)
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingRight = UDim.new(0, l_sidePadding_0), 
            PaddingLeft = UDim.new(0, l_sidePadding_0), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        ThumbnailAndPresenceWrapper = v5.createElement(v14, {
            friend = l_friend_0, 
            isHoverRow = v30, 
            size = UDim2.new(0, 56, 0, 56), 
            position = UDim2.new(0, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 0.5), 
            isFetchingFriends = v29.isFetchingFriends, 
            LayoutOrder = 1
        }), 
        UserInfo = v5.createElement(v16, {
            position = UDim2.new(0, 56, 0, 0), 
            size = UDim2.new(1, -134, 0, 0), 
            friend = l_friend_0, 
            isFetchingFriendsNames = v29.isFetchingFriendsNames, 
            LayoutOrder = 2
        }), 
        InviteButton = if v29.menuType == v20.MultiSelect then v5.createElement(v17, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v24, 
            anchorPoint = v25, 
            friend = l_friend_0, 
            isDisabled = v29.isFetchingFriends, 
            layoutOrder = 3, 
            selectable = (not l_FFlagEnableAppChatFocusableFixes_0 or not v29.isFullRowActivatable) and nil
        }) else v5.createElement(v15, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v24, 
            anchorPoint = v25, 
            friend = l_friend_0, 
            onInvite = v39, 
            isFullRowActivatable = v29.isFullRowActivatable, 
            layoutOrder = 3
        })
    });
end;