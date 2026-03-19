local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabState");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxPresence_0 = v1.RoduxPresence;
local v4 = {
    "OFFLINE", 
    "ONLINE", 
    "IN_GAME", 
    "IN_STUDIO"
};
local function v7(v5) --[[ Line: 17 ]] --[[ Name: convertFromOldPresenceModel ]]
    -- upvalues: l_RoduxPresence_0 (copy), l_llama_0 (copy), v4 (copy)
    local v6 = l_RoduxPresence_0.Models.Presence.new(l_llama_0.Dictionary.join(v5, {
        presence = l_llama_0.None, 
        userPresenceType = (table.find(v4, v5.presence) or 1) - 1, 
        gameInstanceId = l_llama_0.None, 
        gameId = v5.gameInstanceId, 
        lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(v5.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z"
    }));
    return l_RoduxPresence_0.Actions.ReceivedUserPresence(v6);
end;
local v9 = {
    ReceivedUserPresence = function(v8) --[[ Line: 34 ]] --[[ Name: ReceivedUserPresence ]]
        -- upvalues: v7 (copy)
        if v8.payload then
            return v8;
        else
            return {
                v7(v8)
            };
        end;
    end
};
local v10 = l_RoduxPresence_0.installReducer();
return function(v11, v12) --[[ Line: 45 ]]
    -- upvalues: v9 (copy), l_llama_0 (copy), v10 (copy)
    v11 = v11 or {
        byUserId = {}, 
        byGameId = {}, 
        byGameInstanceId = {}, 
        byPlaceId = {}
    };
    local v13 = {
        v12
    };
    local v14 = v9[v12.type];
    if v14 then
        v13 = v14(v12);
    end;
    return l_llama_0.List.reduce(v13, v10, v11);
end;