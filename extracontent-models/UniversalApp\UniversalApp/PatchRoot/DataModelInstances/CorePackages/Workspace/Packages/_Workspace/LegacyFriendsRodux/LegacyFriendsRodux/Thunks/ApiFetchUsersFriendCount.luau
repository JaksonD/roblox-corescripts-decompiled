local l_script_FirstAncestor_0 = script:FindFirstAncestor("LegacyFriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UsersGetFriendCount_0 = require(l_script_FirstAncestor_0.Requests).UsersGetFriendCount;
local l_SetFriendCount_0 = require(l_script_FirstAncestor_0.Actions).SetFriendCount;
local l_isNewFriendsEndpointsEnabled_0 = require(l_Parent_0.SharedFlags).isNewFriendsEndpointsEnabled;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_UsersGetFriendCount_0 (copy), l_isNewFriendsEndpointsEnabled_0 (copy), l_SetFriendCount_0 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: l_UsersGetFriendCount_0 (ref), v5 (copy), l_isNewFriendsEndpointsEnabled_0 (ref), l_SetFriendCount_0 (ref)
        return l_UsersGetFriendCount_0(v5):andThen(function(v7) --[[ Line: 11 ]]
            -- upvalues: l_isNewFriendsEndpointsEnabled_0 (ref), v6 (copy), l_SetFriendCount_0 (ref)
            local l_responseBody_0 = v7.responseBody;
            if l_isNewFriendsEndpointsEnabled_0() then
                if l_responseBody_0.count then
                    v6:dispatch(l_SetFriendCount_0(l_responseBody_0.count));
                end;
            elseif l_responseBody_0.success and l_responseBody_0.count then
                v6:dispatch(l_SetFriendCount_0(l_responseBody_0.count));
            end;
            return l_responseBody_0.count;
        end);
    end;
end;