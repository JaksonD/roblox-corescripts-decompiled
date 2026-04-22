local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local l_sendOpenLeavingRobloxModalEvent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.sendOpenLeavingRobloxModalEvent;
local v2 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrorType_0 = v2.SduiErrors.SduiErrorType;
local l_getActionTelemetryFieldValue_0 = v2.getActionTelemetryFieldValue;
local v5 = {
    "assignmentId", 
    "assignmentType", 
    "socialLinkType", 
    "socialLinkDisplayType"
};
return function(v6, v7, v8) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), l_getActionTelemetryFieldValue_0 (copy), l_SduiErrorType_0 (copy), l_sendOpenLeavingRobloxModalEvent_0 (copy)
    local v9 = {};
    for _, v11 in v5 do
        if l_getActionTelemetryFieldValue_0(v6, v7, v11) == nil then
            table.insert(v9, v11);
        end;
    end;
    if #v9 > 0 then
        v8.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = "LeavingRobloxTelemetryHandler", 
            message = ("Missing telemetry fields: %*"):format((table.concat(v9, ", ")))
        }, v8.appPage);
    end;
    l_sendOpenLeavingRobloxModalEvent_0({
        assignment_id = tonumber(l_getActionTelemetryFieldValue_0(v6, v7, "assignmentId", 0)) or 0, 
        assignment_type = l_getActionTelemetryFieldValue_0(v6, v7, "assignmentType", ""), 
        social_link_type = l_getActionTelemetryFieldValue_0(v6, v7, "socialLinkType", ""), 
        social_link_display_type = l_getActionTelemetryFieldValue_0(v6, v7, "socialLinkDisplayType", "")
    });
end;