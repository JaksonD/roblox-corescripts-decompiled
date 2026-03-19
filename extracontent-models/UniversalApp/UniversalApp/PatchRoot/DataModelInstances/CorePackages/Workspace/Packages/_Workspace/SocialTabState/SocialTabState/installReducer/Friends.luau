local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxFriends_0 = v1.RoduxFriends;
local function v5(v4) --[[ Line: 8 ]] --[[ Name: friendshipCreatedWithUser ]]
    -- upvalues: l_RoduxFriends_0 (copy)
    return l_RoduxFriends_0.Actions.FriendshipCreated(v4.id, "localUserId");
end;
local v11 = {
    AddUser = function(v6) --[[ Line: 13 ]] --[[ Name: AddUser ]]
        -- upvalues: v5 (copy)
        if v6.user.isFriend then
            return {
                v5(v6.user)
            };
        else
            return {
                v6
            };
        end;
    end, 
    AddUsers = function(v7) --[[ Line: 21 ]] --[[ Name: AddUsers ]]
        -- upvalues: l_llama_0 (copy), v5 (copy)
        return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v7.users, function(v8, _) --[[ Line: 22 ]]
            -- upvalues: v5 (ref)
            if v8.isFriend then
                return v5(v8);
            else
                return nil;
            end;
        end));
    end, 
    SetFriendRequestsCount = function(v10) --[[ Line: 31 ]] --[[ Name: SetFriendRequestsCount ]]
        -- upvalues: l_RoduxFriends_0 (copy)
        return {
            l_RoduxFriends_0.Actions.RequestReceivedCountUpdated(v10.count)
        };
    end
};
local v12 = l_RoduxFriends_0.installReducer();
return function(v13, v14) --[[ Line: 38 ]]
    -- upvalues: v11 (copy), l_llama_0 (copy), v12 (copy)
    v13 = v13 or {
        countsByUserId = {}, 
        byUserId = {}, 
        requests = {
            receivedCount = 0
        }
    };
    local v15 = {
        v14
    };
    local v16 = v11[v14.type];
    if v16 then
        v15 = v16(v14);
    end;
    return l_llama_0.List.reduce(v15, v12, v13);
end;