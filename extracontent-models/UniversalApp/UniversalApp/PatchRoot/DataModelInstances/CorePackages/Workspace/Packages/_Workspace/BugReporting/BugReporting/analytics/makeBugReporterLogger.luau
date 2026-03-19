local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local v1 = require(l_Parent_0.Dash);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.LoggingProtocol);
local v4 = require(l_Parent_0.tutils);
local _ = require(script.Parent.Parent.BugReporterTypes);
local v6 = game:DefineFastInt("BugReporterMilestoneHundredthsPercent", 0);
local v7 = game:DefineFastInt("BugReporterErrorHundredthsPercent", 0);
local v8 = {
    eventName = "BugReporter_MilestoneDetails", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v6, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Milestone events related to in-app bug reporting", 
    links = ""
};
local v9 = {
    eventName = "BugReporter_ErrorDetails", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v7, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Error details related to in-app bug reporting", 
    links = ""
};
local v10 = {
    eventName = "BugReporter_ErrorCounter", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Error related to in-app bug reporting"
};
local v11 = {
    eventName = "BugReporter_Counter_ReportInitiated", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when the in-app bug reporting flow has be initiated"
};
local v12 = {
    eventName = "BugReporter_Counter_ReportOpened", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when the in-app bug reporting UI has opened"
};
local v13 = {
    eventName = "BugReporter_Counter_ReportSubmitted", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when a in-app bug report has been submitted"
};
local v14 = {
    eventName = "BugReporter_Counter_ReportSucceeded", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when a in-app bug report has been sent successfully"
};
local v15 = {
    eventName = "BugReporter_Counter_ReportAbandoned", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when the in-app bug report flow has been abandoned before completion"
};
local v16 = {
    eventName = "BugReporter_Counter_ScreenshotCaptured", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when a screenshot has been captured for an in-app bug report"
};
local v17 = {
    eventName = "BugReporter_Counter_ScreenshotUploaded", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        2, 
        18
    }, 
    description = "Counter tracking when a screenshot has been uploaded for an in-app bug report"
};
local v18 = {
    ReportInitiated = v11, 
    ReportOpened = v12, 
    ReportSubmitted = v13, 
    ReportSucceeded = v14, 
    ReportAbandoned = v15, 
    ScreenshotCaptured = v16, 
    ScreenshotUploaded = v17
};
return function(v19, v20) --[[ Line: 134 ]] --[[ Name: makeBugReporterLogger ]]
    -- upvalues: v10 (copy), v9 (copy), v1 (copy), v4 (copy), v8 (copy), v18 (copy), l_mutedError_0 (copy)
    assert(v19, "loggingProtocol must exist");
    assert(v20, "trigger must exist");
    return {
        reportError = function(v21, v22) --[[ Line: 139 ]] --[[ Name: reportError ]]
            -- upvalues: v19 (copy), v10 (ref), v20 (copy), v9 (ref), v1 (ref), v4 (ref)
            v19:logRobloxTelemetryCounter(v10, 1, {
                errorType = v21, 
                trigger = v20
            });
            v19:logRobloxTelemetryEvent(v9, {
                "addOSInfo", 
                "addSessionId", 
                "addSessionInfo"
            }, v1.assign({
                errorType = v21, 
                trigger = v20
            }, v22 or {}));
            if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
                warn((("Bug reporter ui error: %* %*\n%*"):format(v20, v21, (v4.toString(v22)))));
            end;
        end, 
        reportMilestone = function(v23, v24) --[[ Line: 166 ]] --[[ Name: reportMilestone ]]
            -- upvalues: v19 (copy), v8 (ref), v1 (ref), v20 (copy)
            v19:logRobloxTelemetryEvent(v8, {
                "addOSInfo", 
                "addSessionId", 
                "addSessionInfo"
            }, v1.assign({
                trigger = v20, 
                milestone = v23
            }, v24 or {}));
        end, 
        reportCounter = function(v25, v26) --[[ Line: 182 ]] --[[ Name: reportCounter ]]
            -- upvalues: v18 (ref), l_mutedError_0 (ref), v19 (copy), v1 (ref), v20 (copy)
            local v27 = v18[v25];
            if v27 == nil then
                l_mutedError_0((("Bug reporter logging error: No counter config found for %*"):format(v25)));
                return;
            else
                v19:logRobloxTelemetryCounter(v27, 1, v1.assign({
                    trigger = v20
                }, v26 or {}));
                return;
            end;
        end
    };
end;