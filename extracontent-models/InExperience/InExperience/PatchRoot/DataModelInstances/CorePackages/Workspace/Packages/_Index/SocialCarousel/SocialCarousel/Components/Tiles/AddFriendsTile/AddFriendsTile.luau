local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_script_FirstAncestor_0.BaseComponents.Tile);
return function(v7) --[[ Line: 13 ]] --[[ Name: AddFriendsTile ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useLocalization_0 (copy), v5 (copy), v2 (copy), v6 (copy)
    local v9 = l_useAppPolicy_0(function(v8) --[[ Line: 14 ]]
        return v8.getRenameFriendsToConnections();
    end);
    local v10 = l_useLocalization_0({
        addFriendsHeading = if v9 then v5.LOCALIZATION.ADD_CONNECTIONS_HEADING else v5.LOCALIZATION.ADD_FRIENDS_HEADING
    });
    return v2.createElement(v6, {
        index = v7.index, 
        itemSize = v7.itemSize, 
        onActivated = v7.onActivated, 
        title = v10.addFriendsHeading, 
        icon = "icons/common/plus_heavy", 
        selectionOrder = v7.selectionOrder, 
        badge = v7.badge
    });
end;