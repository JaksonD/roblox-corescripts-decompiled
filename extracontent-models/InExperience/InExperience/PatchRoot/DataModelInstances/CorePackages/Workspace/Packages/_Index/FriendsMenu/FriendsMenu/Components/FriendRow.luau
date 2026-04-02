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
local l_FFlagRemoveDependencyArrayAntipattern_0 = v9.FFlagRemoveDependencyArrayAntipattern;
local v25 = UDim2.new(1, 0, 0.5, 0);
local v26 = Vector2.new(1, 0.5);
local function v27() --[[ Line: 47 ]]

end;
local v28 = {
    sidePadding = 24, 
    isFullRowActivatable = false, 
    backgroundTransparency = nil
};
return function(v29) --[[ Line: 67 ]]
    -- upvalues: v7 (copy), v28 (copy), v5 (copy), l_useStyle_0 (copy), v18 (copy), v19 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_useCursor_0 (copy), v12 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (copy), v20 (copy), v27 (copy), v14 (copy), v16 (copy), v17 (copy), v25 (copy), v26 (copy), v15 (copy)
    local v30 = v7.Dictionary.join(v28, v29);
    local v31, v32 = v5.useState(false);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_friend_0 = v30.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v35 = v5.useContext(v18);
    local v36 = v5.useContext(v19);
    local l_sidePadding_0 = v30.sidePadding;
    local v38 = if l_FFlagEnableAppChatFocusableFixes_0 then l_useCursor_0(v12.Enums.CursorType.RoundedSlot) else nil;
    local v39 = v30.isFullRowActivatable and not v30.isFetchingFriends;
    local v40 = v5.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v35 (copy), l_friend_0 (copy), v30 (copy)
        if v35 and v35.inviteSingleFriend and not l_friend_0.isLoadingPlaceholder then
            v35.inviteSingleFriend(l_friend_0.id, v30.layoutOrder);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35, 
        v35.inviteSingleFriend, 
        l_friend_0.id, 
        l_friend_0.isLoadingPlaceholder, 
        v30.layoutOrder
    } else l_dependencyArray_0(v35, v35.inviteSingleFriend, l_friend_0.id, l_friend_0.isLoadingPlaceholder, v30.layoutOrder));
    local v41 = v5.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v36 (copy), v30 (copy)
        if v36.isFriendSelected(v30.friend.id) then
            v36.removeFriend(v30.friend.id, v30.friend.displayName);
            return;
        else
            v36.addFriend(v30.friend.id, v30.friend.displayName);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36.isFriendSelected, 
        v36.removeFriend, 
        v36.addFriend, 
        v30.friend.id
    } else l_dependencyArray_0(v36.isFriendSelected, v36.removeFriend, v36.addFriend, v30.friend.id));
    local v42 = v5.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v39 (copy), l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 (ref), l_friend_0 (copy), v30 (copy), v20 (ref), v40 (copy), v41 (copy)
        if not v39 or l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder then
            return;
        elseif v30.menuType ~= v20.MultiSelect then
            v40();
            return;
        else
            v41();
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v39, 
        v30.menuType, 
        v40, 
        v41, 
        l_friend_0.isLoadingPlaceholder
    } else l_dependencyArray_0(v39, v30.menuType, v40, v41, l_friend_0.isLoadingPlaceholder));
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 72), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v31 and l_Theme_0.BackgroundOnHover.Color or l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = if v31 then l_Theme_0.BackgroundOnHover.Transparency else if v30.backgroundTransparency then v30.backgroundTransparency else l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v30.layoutOrder, 
        SelectionImageObject = if l_FFlagEnableAppChatFocusableFixes_0 and v30.isFullRowActivatable then v38 else nil, 
        [v5.Event.MouseEnter] = function() --[[ Line: 176 ]]
            -- upvalues: v30 (copy), v32 (copy)
            if not v30.isFetchingFriends then
                v32(true);
            end;
        end, 
        [v5.Event.MouseLeave] = function() --[[ Line: 181 ]]
            -- upvalues: v32 (copy)
            v32(false);
        end, 
        [v5.Event.Activated] = if not (l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder) and v39 then v42 else v27, 
        AutoButtonColor = v39
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
            isHoverRow = v31, 
            size = UDim2.new(0, 56, 0, 56), 
            position = UDim2.new(0, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 0.5), 
            isFetchingFriends = v30.isFetchingFriends, 
            LayoutOrder = 1
        }), 
        UserInfo = v5.createElement(v16, {
            position = UDim2.new(0, 56, 0, 0), 
            size = UDim2.new(1, -134, 0, 0), 
            friend = l_friend_0, 
            isFetchingFriendsNames = v30.isFetchingFriendsNames, 
            LayoutOrder = 2
        }), 
        InviteButton = if v30.menuType == v20.MultiSelect then v5.createElement(v17, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v25, 
            anchorPoint = v26, 
            friend = l_friend_0, 
            isDisabled = v30.isFetchingFriends, 
            layoutOrder = 3, 
            selectable = (not l_FFlagEnableAppChatFocusableFixes_0 or not v30.isFullRowActivatable) and nil
        }) else v5.createElement(v15, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v25, 
            anchorPoint = v26, 
            friend = l_friend_0, 
            onInvite = v40, 
            isFullRowActivatable = v30.isFullRowActivatable, 
            layoutOrder = 3
        })
    });
end;