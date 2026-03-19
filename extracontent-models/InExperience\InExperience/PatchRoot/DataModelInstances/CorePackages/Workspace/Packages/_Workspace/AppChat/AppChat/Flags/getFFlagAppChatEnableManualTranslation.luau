local v0 = require(script.Parent.FFlagAppChatEnableAutotranslation);
local v1 = require(script.Parent.getFFlagAppChatEnableRepliesUI);
game:DefineFastFlag("AppChatEnableManualTranslation", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (copy), v1 (copy)
    return game:GetFastFlag("AppChatEnableManualTranslation") and v0 and v1();
end;