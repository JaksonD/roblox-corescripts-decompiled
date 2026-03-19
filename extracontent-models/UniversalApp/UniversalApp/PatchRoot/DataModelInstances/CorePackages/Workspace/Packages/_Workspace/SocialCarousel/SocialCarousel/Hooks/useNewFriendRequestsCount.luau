local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactAppExperiment);
local v3 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FStringNewFriendRequestsBadgeLayer_0 = require(l_Parent_0.SharedFlags).FStringNewFriendRequestsBadgeLayer;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll);
return function() --[[ Line: 11 ]]
    -- upvalues: v6 (copy), v2 (copy), l_FStringNewFriendRequestsBadgeLayer_0 (copy), l_useSelector_0 (copy), v3 (copy)
    local v7 = nil;
    v7 = v6 and true or v2.useUserExperiment({
        l_FStringNewFriendRequestsBadgeLayer_0
    }, function(v8) --[[ Line: 19 ]]
        -- upvalues: l_FStringNewFriendRequestsBadgeLayer_0 (ref)
        return (v8[l_FStringNewFriendRequestsBadgeLayer_0] or {}).showNewFriendRequestsBadge;
    end);
    local v10 = l_useSelector_0(function(v9) --[[ Line: 25 ]]
        -- upvalues: v3 (ref)
        return v3(v9, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0;
    end);
    local v11 = v10 > 0;
    local v12 = tostring(v10);
    if v7 and v11 then
        return v12;
    else
        return nil;
    end;
end;