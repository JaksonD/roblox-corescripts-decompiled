local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_DiscoveryEventErrorLogger_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("OpenLeavingRobloxModalThrottleHundrethsPercent", 0);
local v5 = v2.strictInterface({
    assignment_id = v2.number, 
    assignment_type = v2.string, 
    social_link_type = v2.string, 
    social_link_display_type = v2.string
});
local v6 = {
    eventName = "openLeavingRobloxModal", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        25, 
        12, 
        9
    }, 
    description = "Event fired when a prompt is opened to confirm that the user wants to leave roblox"
};
return function(v7) --[[ Line: 26 ]]
    -- upvalues: v5 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_TelemetryService_0 (copy), v6 (copy)
    local v8, v9 = v5(v7);
    if not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("OpenLeavingRobloxModalInterface", v9);
    end;
    l_TelemetryService_0:LogEvent(v6, {
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v7
    });
end;