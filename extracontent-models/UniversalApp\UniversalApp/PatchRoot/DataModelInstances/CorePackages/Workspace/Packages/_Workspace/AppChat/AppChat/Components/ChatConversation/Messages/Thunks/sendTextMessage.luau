local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Conversations.Thunks.SendTextMessage);
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(...) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    v2:info("Sending text message");
    return v1(...);
end;