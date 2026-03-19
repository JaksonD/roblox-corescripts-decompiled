local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Rodux.Presence);
local v4 = {
    "OFFLINE", 
    "ONLINE", 
    "IN_GAME", 
    "IN_STUDIO"
};
local function v7(v5) --[[ Line: 16 ]] --[[ Name: convertFromOldPresenceModel ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v6 = v3.Models.Presence.new(v2.Dictionary.join(v5, {
        userPresenceType = (table.find(v4, v5.presence) or 1) - 1, 
        gameId = v5.gameInstanceId, 
        lastOnline = ""
    }));
    return v3.Actions.ReceivedUserPresence(v6);
end;
local v8 = v3.installReducer();
return function(v9, v10) --[[ Line: 28 ]]
    -- upvalues: v7 (copy), v8 (copy)
    if v10.type == "ReceivedUserPresence" and not v10.payload then
        v10 = v7(v10);
    end;
    return v8(v9, v10);
end;