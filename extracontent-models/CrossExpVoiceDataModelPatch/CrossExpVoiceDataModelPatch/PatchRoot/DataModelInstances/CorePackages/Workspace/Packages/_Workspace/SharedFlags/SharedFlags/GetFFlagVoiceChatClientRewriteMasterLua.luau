game:DefineFastFlag("VoiceChatClientRewriteMasterLua2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("VoiceChatClientRewrite_OneFlagToRuleThemAll_Client") and game:GetFastFlag("VoiceChatClientRewriteMasterLua2");
end;