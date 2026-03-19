local v0 = game:DefineFastFlag("EnableInAppBugReporting", false);
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return v0 and game:GetEngineFeature("BugReporterProtocol");
end;