local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local l_DiscoveryEventErrorLogger_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("ExpandableTextImpressionsEventHundredthsPercent", 10000);
local v5 = {
    eventName = "expandableTextImpression", 
    description = "Impressions for thresholds reached on expandable text content", 
    lastUpdated = {
        26, 
        3, 
        25
    }, 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = v4
};
local v6 = v2.strictInterface({
    impressionThreshold = v2.number, 
    isButtonExpanded = v2.optional(v2.boolean), 
    interactionUuid = v2.string, 
    contentType = v2.string, 
    pageContext = v2.string, 
    itemId = v2.number, 
    componentType = v2.string
});
return function(v7) --[[ Line: 31 ]]
    -- upvalues: v6 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_TelemetryService_0 (copy), v5 (copy)
    local v8, v9 = v6(v7);
    if not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("ExpandableTextImpressionInvalidInterface", v9);
    end;
    l_TelemetryService_0:LogEvent(v5, {
        customFields = v7, 
        standardizedFields = {
            "addSessionInfo", 
            "addOSInfo"
        }
    });
end;