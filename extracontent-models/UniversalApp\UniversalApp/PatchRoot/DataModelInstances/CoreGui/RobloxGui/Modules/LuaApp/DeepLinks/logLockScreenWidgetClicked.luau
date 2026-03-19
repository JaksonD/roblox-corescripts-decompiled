local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
return function(v3) --[[ Line: 6 ]] --[[ Name: logLockScreenWidgetClicked ]]
    -- upvalues: l_EventIngest_0 (copy), l_EventIngestService_0 (copy)
    l_EventIngest_0.new(l_EventIngestService_0):sendEventDeferred("lockScreenWidgetClicked", "lockScreenWidgetClicked", {
        page = v3
    });
end;