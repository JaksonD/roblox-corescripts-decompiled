local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.RecommendationCreated);
local v6 = require(l_Actions_0.FriendRequestDeclined);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v8 = {};
return function(v9) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v8 (copy), v5 (copy), v3 (copy), v6 (copy)
    local l_friendsNetworking_0 = v9.friendsNetworking;
    return v2.createReducer(v8, {
        [v5.name] = function(v11, v12) --[[ Line: 20 ]]
            -- upvalues: v3 (ref)
            local l_recommendedUser_0 = v12.payload.recommendedUser;
            local v14 = tostring(l_recommendedUser_0.id);
            local v15 = l_recommendedUser_0.hasIncomingFriendRequest and true or false;
            return v3.Dictionary.join(v11, {
                [v14] = v15
            });
        end, 
        [l_friendsNetworking_0.GetFriendRecommendationsFromUserId.Succeeded.name] = function(v16, v17) --[[ Line: 32 ]]
            -- upvalues: v3 (ref)
            local v19 = v3.List.filter(v17.responseBody.data, function(v18) --[[ Line: 36 ]]
                return v18.contextType ~= "Contacts";
            end, {});
            local v22 = v3.List.reduce(v19, function(v20, v21) --[[ Line: 40 ]]
                v20[tostring(v21.id)] = v21.friendRequest and true or false;
                return v20;
            end, {});
            return v3.Dictionary.join(v16, v22);
        end, 
        [l_friendsNetworking_0.DeclineFriendRequestFromUserId.Succeeded.name] = function(v23, v24) --[[ Line: 49 ]]
            -- upvalues: v3 (ref)
            local l_ids_0 = v24.ids;
            local v28 = v3.List.reduce(l_ids_0, function(v26, v27) --[[ Line: 54 ]]
                v26[tostring(v27)] = false;
                return v26;
            end, {});
            return v3.Dictionary.join(v23, v28);
        end, 
        [v6.name] = function(v29, v30) --[[ Line: 62 ]]
            -- upvalues: v3 (ref)
            local l_ids_1 = v30.ids;
            local v34 = v3.List.reduce(l_ids_1, function(v32, v33) --[[ Line: 67 ]]
                v32[tostring(v33)] = false;
                return v32;
            end, {});
            return v3.Dictionary.join(v29, v34);
        end, 
        [l_friendsNetworking_0.DeclineAllFriendRequests.Succeeded.name] = function(_) --[[ Line: 75 ]]
            -- upvalues: v8 (ref)
            return v8;
        end
    });
end;