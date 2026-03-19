local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_RoduxPresence_0 = v1.RoduxPresence;
local v4 = {
    "OFFLINE", 
    "ONLINE", 
    "IN_GAME", 
    "IN_STUDIO"
};
local function v7(v5) --[[ Line: 28 ]] --[[ Name: convertFromOldPresenceModel ]]
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
return {
    ReceivedUserPresence = function(v8) --[[ Line: 45 ]] --[[ Name: ReceivedUserPresence ]]
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