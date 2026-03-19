local v0 = require(script.Presence.byUserId);
local v1 = require(script.Presence.byGameId);
local v2 = require(script.Presence.byGameInstanceId);
local v3 = require(script.Presence.byPlaceId);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy), v3 (copy)
    return function(v5, v6) --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v4 (copy), v2 (ref), v1 (ref), v3 (ref)
        local v7 = v5 or {
            byUserId = {}, 
            byGameInstanceId = {}, 
            byGameId = {}, 
            byPlaceId = {}
        };
        return {
            byUserId = v0(v4)(v7.byUserId, v6), 
            byGameInstanceId = v2(v4)(v7, v6), 
            byGameId = v1(v4)(v7, v6), 
            byPlaceId = v3(v4)(v7, v6)
        };
    end;
end;