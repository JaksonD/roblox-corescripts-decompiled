local l_Parent_0 = script:FindFirstAncestor("FriendsRodux").Parent;
local v1 = require(l_Parent_0.Rodux);
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_1.getDeepValue);
local v4 = require(l_Parent_0.llama);
local v5 = {};
return function(v6) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy), v3 (copy)
    local l_friendsNetworking_0 = v6.friendsNetworking;
    return v1.createReducer(v5, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(_, v9) --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v3 (ref)
            local l_data_0 = v9.responseBody.data;
            return (v4.Dictionary.map(l_data_0, function(v11) --[[ Line: 17 ]]
                -- upvalues: v3 (ref)
                return v3(v11, "friendRequest.originSourceType"), (tostring(v11.id));
            end));
        end
    });
end;