local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_script_FirstAncestor_0.BaseComponents.Tile);
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v8) --[[ Line: 15 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v5 (copy), v2 (copy), v6 (copy)
    local v10 = l_useAppPolicy_0(function(v9) --[[ Line: 16 ]]
        return v9.getRenameFriendsToConnections();
    end);
    local v11 = l_useLocalization_0({
        addFriendsHeading = if l_FFlagConnectionsToFriendsRename_0 then v5.LOCALIZATION.ADD_FRIENDS_HEADING else if v10 then v5.LOCALIZATION.ADD_CONNECTIONS_HEADING else v5.LOCALIZATION.ADD_FRIENDS_HEADING
    });
    return v2.createElement(v6, {
        index = v8.index, 
        itemSize = v8.itemSize, 
        onActivated = v8.onActivated, 
        title = v11.addFriendsHeading, 
        icon = "icons/common/plus_heavy", 
        selectionOrder = v8.selectionOrder, 
        badge = v8.badge
    });
end;