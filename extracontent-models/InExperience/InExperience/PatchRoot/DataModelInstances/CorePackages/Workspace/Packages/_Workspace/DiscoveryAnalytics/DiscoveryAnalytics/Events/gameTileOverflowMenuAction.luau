local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryAnalytics").Parent;
local v2 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v4 = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0);
local l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry;
local v6 = v2.strictInterface({
    ctx = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then nil else v2.string, 
    universeId = v2.string, 
    sortId = v2.optional(v2.string), 
    actionType = v2.string, 
    menuItem = v2.optional(v2.string), 
    availableMenuItems = v2.optional(v2.string)
});
return function(v7, v8) --[[ Line: 22 ]]
    -- upvalues: l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v6 (copy), v4 (copy), l_TelemetryService_0 (copy)
    if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 and not v8 then
        l_DiscoveryEventErrorLogger_0.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context");
    end;
    local v9, v10 = v6(v7);
    if not v9 then
        l_DiscoveryEventErrorLogger_0.reportError("GameTileOverflowMenuActionInvalidInterface", v10);
    end;
    local v11 = {
        eventName = "gameTileOverflowMenuAction", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v4, 
        lastUpdated = {
            25, 
            10, 
            15
        }, 
        description = "User has taken an action with the Game Tile Overflow Menu"
    };
    l_TelemetryService_0:LogEvent(v11, {
        eventContext = if l_FFlagLuaAppFixExplicitFeedbackTelemetry_0 then v8 else nil, 
        standardizedFields = {
            "addSessionInfo"
        }, 
        customFields = v7
    });
end;