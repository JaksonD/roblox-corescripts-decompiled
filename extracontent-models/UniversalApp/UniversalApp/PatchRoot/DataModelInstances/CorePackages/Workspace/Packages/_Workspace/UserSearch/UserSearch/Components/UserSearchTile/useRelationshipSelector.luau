local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_RODUX_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
return function(v5) --[[ Line: 16 ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_RODUX_KEY_0 (copy)
    return l_useSelector_0(function(v6) --[[ Line: 17 ]]
        -- upvalues: l_getDeepValue_0 (ref), l_RODUX_KEY_0 (ref), v5 (copy)
        local v7 = l_getDeepValue_0(v6, string.format("%s.Friends.friendshipStatus.%s", l_RODUX_KEY_0, v5));
        local v8 = l_getDeepValue_0(v6, string.format("%s.Friends.followings.followingStatuses.%s", l_RODUX_KEY_0, v5)) or {};
        return {
            status = v7, 
            following = v8.isFollowing or false, 
            isMyself = v6.LocalUserId == v5
        };
    end);
end;