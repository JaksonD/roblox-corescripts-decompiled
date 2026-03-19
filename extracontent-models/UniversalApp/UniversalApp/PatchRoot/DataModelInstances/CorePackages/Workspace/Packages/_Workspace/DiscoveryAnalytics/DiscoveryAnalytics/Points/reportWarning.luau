local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v2.default;
local v4 = game:DefineFastInt("DiscoveryWarningEventHundredthsPercent", 0);
local v5 = {
    eventName = "DiscoveryWarning", 
    backends = {
        l_default_0.TelemetryBackends.Points
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        1, 
        22
    }, 
    description = "Generic warning message for Discovery surfaces", 
    links = ""
};
local v6 = {
    eventName = "DiscoveryWarningCounter", 
    backends = {
        v2.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        25, 
        1, 
        22
    }, 
    description = "Counter for the total number of warnings sent"
};
return function(v7, v8, v9, v10) --[[ Line: 31 ]] --[[ Name: reportWarning ]]
    -- upvalues: l_RunService_0 (copy), v6 (copy), v5 (copy)
    local v11 = v10 and table.clone(v10) or {};
    v11.category = v8;
    v11.extraMessage = v9;
    if l_RunService_0:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
        warn((("DiscoveryWarning: [%*] %*"):format(v8, v9)));
    end;
    v7:logRobloxTelemetryCounter(v6, 1, {
        category = v8
    });
    v7:logRobloxTelemetryEvent(v5, {
        v7.StandardizedFields.addOsInfo
    }, v11);
end;