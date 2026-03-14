game:DefineFastFlag("AuthIntentLoggingForGameJoinEnabledV2", false);
return function() --[[ Line: 3 ]]
    return game:GetEngineFeature("HasReportPendingJoinToLua") and game:GetFastFlag("AuthIntentLoggingForGameJoinEnabledV2");
end;