local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    local l_friendsNetworking_0 = v4.friendsNetworking;
    return v2.createReducer(nil, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(_, v7) --[[ Line: 12 ]]
            return v7.responseBody.nextPageCursor;
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(_, _) --[[ Line: 21 ]]
            return nil;
        end
    });
end;