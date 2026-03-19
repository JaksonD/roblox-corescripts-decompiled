local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v3 = require(l_script_FirstAncestor_0.Events.UnifiedPurchaseTelemetry);
sendUnifiedPurchaseEventLog = function(v4) --[[ Line: 7 ]] --[[ Name: sendUnifiedPurchaseEventLog ]]
    -- upvalues: l_default_0 (copy), v3 (copy)
    l_default_0:logRobloxTelemetryEvent(v3.UnifiedProductPurchaseFlowEvent, {
        l_default_0.StandardizedFields.addOsInfo, 
        l_default_0.StandardizedFields.addSessionId, 
        "addSessionInfo"
    }, v4);
end;
return sendUnifiedPurchaseEventLog;