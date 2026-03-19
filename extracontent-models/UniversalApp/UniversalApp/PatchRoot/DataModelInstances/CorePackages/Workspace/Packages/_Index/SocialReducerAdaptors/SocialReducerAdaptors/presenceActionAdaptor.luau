local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialReducerAdaptors");
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
return function(v2) --[[ Line: 17 ]]
    -- upvalues: l_llama_0 (copy)
    local function v5(v3) --[[ Line: 18 ]]
        -- upvalues: v2 (copy), l_llama_0 (ref)
        local v4 = v2.Models.Presence.new(l_llama_0.Dictionary.join(v3, {
            presence = l_llama_0.None, 
            userPresenceType = (table.find({
                "OFFLINE", 
                "ONLINE", 
                "IN_GAME", 
                "IN_STUDIO"
            }, v3.presence) or 1) - 1, 
            gameInstanceId = l_llama_0.None, 
            gameId = v3.gameInstanceId, 
            lastOnline = DateTime.now() and DateTime.fromUnixTimestamp(v3.lastOnline or 0):ToIsoDate() or "1970-01-01T00:00:00Z", 
            type = l_llama_0.None
        }));
        return v2.Actions.ReceivedUserPresence(v4);
    end;
    return {
        ReceivedUserPresence = function(v6) --[[ Line: 45 ]] --[[ Name: ReceivedUserPresence ]]
            -- upvalues: v5 (copy)
            if v6.payload then
                return {
                    v6
                };
            else
                return {
                    v5(v6)
                };
            end;
        end
    };
end;