local v0 = require(script.Parent.GetFFlagVoiceChatClientRewriteMasterLua);
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return game:GetEngineFeature("VoiceChatClientRewrite_OneFlagToRuleThemAll_Client") and v0();
end;