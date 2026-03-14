local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = game:DefineFastInt("EdpStoreClicksDetectorThrottlingHundredthsPercent", 0);
local v2 = {};
local function v5(v3) --[[ Line: 8 ]] --[[ Name: sendLogEvent ]]
    -- upvalues: v1 (copy), l_TelemetryService_0 (copy)
    local v4 = {
        eventName = "experienceStoreProducts", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v1, 
        lastUpdated = {
            25, 
            10, 
            23
        }, 
        description = "Event fired from the lua app for click events on the EDP store"
    };
    l_TelemetryService_0:LogEvent(v4, {
        customFields = v3
    });
end;
v2.logEvent = function(v6, v7, v8, v9, v10, v11, _) --[[ Line: 23 ]] --[[ Name: logEvent ]]
    -- upvalues: v5 (copy)
    local v13 = {
        actionType = v6, 
        productType = v7, 
        locationType = v8, 
        universeId = v9, 
        productId = v10, 
        itemId = v11
    };
    v5(v13);
end;
return v2;