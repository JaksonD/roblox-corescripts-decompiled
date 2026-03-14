local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local _ = require(l_script_FirstAncestor_0.roduxFriendsTypes);
local v5 = require(l_Actions_0.RequestReceivedCountUpdated);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v5 (copy)
    local l_friendsNetworking_0 = v6.friendsNetworking;
    return v2.createReducer(0, {
        [v5.name] = function(_, v9) --[[ Line: 14 ]]
            assert(type(v9.payload.count) == "number", "Expected count to be a number");
            return v9.payload.count;
        end, 
        [l_friendsNetworking_0.GetFriendRequestsCount.Succeeded.name] = function(_, v11) --[[ Line: 20 ]]
            return v11.responseBody.count;
        end
    });
end;