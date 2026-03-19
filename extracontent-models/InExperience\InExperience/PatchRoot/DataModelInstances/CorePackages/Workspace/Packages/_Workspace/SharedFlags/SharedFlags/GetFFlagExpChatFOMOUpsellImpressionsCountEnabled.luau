local v0 = game:DefineFastFlag("ExpChatFOMOUpsellImpressionsCountEnabled", false);
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    return v0 and game:GetEngineFeature("ExpChatFOMOUpsellImpressionsCountStorageKey");
end;