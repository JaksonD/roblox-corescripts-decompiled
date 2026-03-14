local v0 = require(script.Parent.getPresenceTextFromUser);
local v1 = require(script.Parent.presenceImageByPresence);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return {
        text = v0(v2), 
        image = v1[v2.presence]
    };
end;