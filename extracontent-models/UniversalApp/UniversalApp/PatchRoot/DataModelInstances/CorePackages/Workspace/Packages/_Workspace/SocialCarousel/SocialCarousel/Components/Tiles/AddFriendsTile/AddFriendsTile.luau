local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_script_FirstAncestor_0.BaseComponents.Tile);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v8 = game:DefineFastFlag("UpdateSocialCarouselAddFriendsIcon", false) and "icons/actions/friend_sort/add_friends" or "icons/common/plus_heavy";
return function(v9) --[[ Line: 18 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v5 (copy), v2 (copy), v6 (copy), v8 (copy)
    local v11 = l_useAppPolicy_0(function(v10) --[[ Line: 19 ]]
        return v10.getRenameFriendsToConnections();
    end);
    local v12 = l_useLocalization_0({
        addFriendsHeading = if l_FFlagConnectionsToFriendsRename_0 then v5.LOCALIZATION.ADD_FRIENDS_HEADING else if v11 then v5.LOCALIZATION.ADD_CONNECTIONS_HEADING else v5.LOCALIZATION.ADD_FRIENDS_HEADING
    });
    return v2.createElement(v6, {
        index = v9.index, 
        itemSize = v9.itemSize, 
        onActivated = v9.onActivated, 
        title = v12.addFriendsHeading, 
        icon = v8, 
        selectionOrder = v9.selectionOrder, 
        badge = v9.badge
    });
end;