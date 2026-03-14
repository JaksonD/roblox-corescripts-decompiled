local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_llama_0 (copy)
    local v3 = {};
    local v4 = {};
    local v5 = {};
    local v6 = {};
    for v7, v8 in pairs(v2.responseBody.data) do
        table.insert(v3, table.concat(l_llama_0.List.map(v8.mutualFriendsList, function(v9) --[[ Line: 14 ]]
            return v9;
        end), ","));
        table.insert(v4, if v8.friendRequest.sourceUniverseId then v8.friendRequest.sourceUniverseId else 0);
        table.insert(v5, v8.friendRequest.senderId);
        table.insert(v6, v7);
    end;
    return {
        page = "friendRequests", 
        requestingUserId = table.concat(v5, ","), 
        gamesContext = table.concat(v4, ","), 
        absPosition = table.concat(v6, ","), 
        mutualFriendsContext = table.concat(v3, ";")
    };
end;