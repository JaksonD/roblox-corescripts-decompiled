local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialReducerAdaptors");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Players_0 = v1.Players;
local l_llama_0 = v1.llama;
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_llama_0 (copy)
    local function v7(v6) --[[ Line: 14 ]] --[[ Name: friendshipCreatedWithUser ]]
        -- upvalues: v4 (copy), v5 (copy), l_Players_0 (ref)
        return v4.Actions.FriendshipCreated(v6.id, v5 or tostring(l_Players_0.LocalPlayer.UserId));
    end;
    return {
        AddUser = function(v8) --[[ Line: 19 ]] --[[ Name: AddUser ]]
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
        AddUsers = function(v9) --[[ Line: 27 ]] --[[ Name: AddUsers ]]
            -- upvalues: l_llama_0 (ref), v7 (copy)
            return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v9.users, function(v10, _) --[[ Line: 28 ]]
                -- upvalues: v7 (ref)
                if v10.isFriend then
                    return v7(v10);
                else
                    return nil;
                end;
            end));
        end, 
        SetFriendRequestsCount = function(v12) --[[ Line: 37 ]] --[[ Name: SetFriendRequestsCount ]]
            -- upvalues: v4 (copy)
            return {
                v4.Actions.RequestReceivedCountUpdated(v12.count)
            };
        end
    };
end;