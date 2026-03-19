local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v4 = require(l_Actions_0.RequestReceivedCountUpdated);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_friendsNetworking_0 = v5.friendsNetworking;
    return v2.createReducer(0, {
        [v4.name] = function(_, v8) --[[ Line: 13 ]]
            assert(type(v8.payload.count) == "number", "Expected count to be a number");
            return v8.payload.count;
        end, 
        [l_friendsNetworking_0.GetFriendRequestsCount.Succeeded.name] = function(_, v10) --[[ Line: 19 ]]
            return v10.responseBody.count;
        end
    });
end;