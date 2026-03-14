game:DefineFastFlag("EnableHandleEngineSessionCheckAtStartup", false);
return function() --[[ Line: 3 ]]
    return game:GetFastFlag("EnableHandleEngineSessionCheckAtStartup") and game:GetEngineFeature("SessionCheckInEngineEnabled");
end;