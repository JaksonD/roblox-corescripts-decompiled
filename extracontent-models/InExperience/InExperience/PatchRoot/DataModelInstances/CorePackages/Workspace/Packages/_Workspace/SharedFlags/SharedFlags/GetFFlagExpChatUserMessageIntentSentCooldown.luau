local v0 = require(script.Parent.GetFFlagExpChatFOMOUpsellImpressionsCountEnabled);
local v1 = game:DefineFastFlag("ExpChatUserMessageIntentSentCooldown", false);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v0 (copy)
    return v1 and v0();
end;