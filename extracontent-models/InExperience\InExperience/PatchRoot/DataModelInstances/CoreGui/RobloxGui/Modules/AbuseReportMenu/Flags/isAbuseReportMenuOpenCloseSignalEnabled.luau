game:DefineFastFlag("AbuseReportMenuOpenCloseSignal", false);
return function() --[[ Line: 3 ]]
    if not game:GetEngineFeature("AbuseReportMenuOpenCloseSignal") then
        return false;
    else
        return game:GetFastFlag("AbuseReportMenuOpenCloseSignal");
    end;
end;