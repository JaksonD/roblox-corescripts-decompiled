local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v3 = require(l_Parent_0.Foundation);
local l_IconName_0 = v3.Enums.IconName;
local l_IconVariant_0 = v3.Enums.IconVariant;
local l_FFlagAddFriendsUserListEnabled_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsUserListEnabled;
return function() --[[ Line: 14 ]] --[[ Name: useControlIgnoreAllMenu ]]
    -- upvalues: v1 (copy), l_FFlagAddFriendsUserListEnabled_0 (copy), l_IconName_0 (copy), l_IconVariant_0 (copy), l_Images_0 (copy)
    local v7, v8 = v1.useState(false);
    local v10 = v1.useCallback(function() --[[ Line: 17 ]]
        -- upvalues: v8 (copy)
        v8(function(v9) --[[ Line: 18 ]]
            return not v9;
        end);
    end, {});
    local v11 = v1.useCallback(function() --[[ Line: 23 ]]
        -- upvalues: v8 (copy)
        v8(false);
    end, {});
    local v12 = if l_FFlagAddFriendsUserListEnabled_0 then {
        name = l_IconName_0.ThreeDotsHorizontal, 
        variant = if v7 then l_IconVariant_0.Filled else l_IconVariant_0.Regular
    } else if v7 then l_Images_0["icons/menu/more_on"] else l_Images_0["icons/menu/more_off"];
    return {
        isMenuOpen = v7, 
        menuIcon = v12, 
        onIconClick = v10, 
        closeMenu = v11
    };
end;