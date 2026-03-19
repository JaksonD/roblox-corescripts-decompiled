local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Players_0 = v1.Players;
local l_llama_0 = v1.llama;
local l_RoduxFriends_0 = v1.RoduxFriends;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_RoduxFriends_0 (copy), l_Players_0 (copy), l_llama_0 (copy)
    local function v7(v6) --[[ Line: 10 ]] --[[ Name: friendshipCreatedWithUser ]]
        -- upvalues: l_RoduxFriends_0 (ref), v5 (copy), l_Players_0 (ref)
        return l_RoduxFriends_0.Actions.FriendshipCreated(v6.id, v5 or tostring(l_Players_0.LocalPlayer.UserId));
    end;
    return {
        AddUser = function(v8) --[[ Line: 15 ]] --[[ Name: AddUser ]]
            -- upvalues: v7 (copy)
            if v8.user.isFriend then
                return {
                    v7(v8.user)
                };
            else
                return {
                    v8
                };
            end;
        end, 
        AddUsers = function(v9) --[[ Line: 23 ]] --[[ Name: AddUsers ]]
            -- upvalues: l_llama_0 (ref), v7 (copy)
            return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v9.users, function(v10, _) --[[ Line: 24 ]]
                -- upvalues: v7 (ref)
                if v10.isFriend then
                    return v7(v10);
                else
                    return nil;
                end;
            end));
        end, 
        SetFriendRequestsCount = function(v12) --[[ Line: 33 ]] --[[ Name: SetFriendRequestsCount ]]
            -- upvalues: l_RoduxFriends_0 (ref)
            return {
                l_RoduxFriends_0.Actions.RequestReceivedCountUpdated(v12.count)
            };
        end
    };
end;