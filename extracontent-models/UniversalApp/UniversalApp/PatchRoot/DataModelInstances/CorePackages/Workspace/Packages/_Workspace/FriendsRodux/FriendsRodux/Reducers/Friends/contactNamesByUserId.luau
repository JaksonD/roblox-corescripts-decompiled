local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local _ = require(l_Parent_0.roduxFriendsTypes);
local l_Actions_0 = l_Parent_0.Actions;
local v6 = require(l_Actions_0.FriendRequestCreated);
local v7 = {};
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v7 (copy), v3 (copy), v6 (copy)
    local l_friendsNetworking_0 = v8.friendsNetworking;
    return v2.createReducer(v7, {
        [l_friendsNetworking_0.GetFriendRequests.Succeeded.name] = function(v10, v11) --[[ Line: 19 ]]
            -- upvalues: v3 (ref)
            local l_data_0 = v11.responseBody.data;
            local v13 = {};
            for _, v15 in pairs(l_data_0) do
                v13[tostring(v15.id)] = v15.friendRequest.contactName;
            end;
            return v3.Dictionary.join(v10, v13);
        end, 
        [v6.name] = function(v16, v17) --[[ Line: 33 ]]
            -- upvalues: v3 (ref)
            local v18 = tostring(v17.requesteeId);
            local l_contactName_0 = v17.contactName;
            return v3.Dictionary.join(v16, {
                [v18] = l_contactName_0
            });
        end
    });
end;