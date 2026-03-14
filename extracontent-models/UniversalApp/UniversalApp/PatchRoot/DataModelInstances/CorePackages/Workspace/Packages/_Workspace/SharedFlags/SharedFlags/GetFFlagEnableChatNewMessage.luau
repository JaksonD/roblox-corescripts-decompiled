local v0 = game:DefineFastFlag("EnableChatNewMessage", false);
local v1 = require(script.Parent.GetFFlagEnableAppChatInExperience);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0 and v1();
end;