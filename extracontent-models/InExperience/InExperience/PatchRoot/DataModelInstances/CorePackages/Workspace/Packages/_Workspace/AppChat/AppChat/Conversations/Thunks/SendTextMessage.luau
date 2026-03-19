local v0 = require(script.Parent.SendMessageUsingPolicy);
local v1 = require(script.Parent.SendPolicies.SendChatTextMessagePolicy);
return function(v2, v3, v4, v5) --[[ Line: 4 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v6 = v1:new(v2, v3, v4, v5);
    return v0(v6);
end;