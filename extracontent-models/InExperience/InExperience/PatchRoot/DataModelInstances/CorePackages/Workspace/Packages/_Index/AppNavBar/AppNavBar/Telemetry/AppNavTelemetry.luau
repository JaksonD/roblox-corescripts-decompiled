local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_TelemetryService_0 = require(l_Parent_1.MockableProxyServices).TelemetryService;
local _ = require(l_Parent_0.Enum.Placement);
local v4 = {
    "addOSInfo", 
    "addSessionId", 
    "addSessionInfo"
};
local v5 = {
    eventName = "AppNav_SwitchTab", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        3, 
        12
    }, 
    description = "App Nav switch tab", 
    links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
};
local v6 = {
    eventName = "AppNav_SwitchTab", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        3, 
        12
    }, 
    description = "App Nav switch tab", 
    links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
};
local v7 = {
    eventName = "AppNav_IsVisibleChanged", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        26, 
        3, 
        17
    }, 
    description = "App Nav isVisible prop changed", 
    links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
};
local v8 = {
    eventName = "AppNav_IsVisibleChanged", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        26, 
        3, 
        17
    }, 
    description = "App Nav isVisible prop changed", 
    links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
};
local v9 = {
    eventName = "AppNav_PlacementChanged", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        26, 
        3, 
        17
    }, 
    description = "App Nav placement prop changed", 
    links = "https://roblox.atlassian.net/wiki/x/1ACaAQE"
};
local v10 = nil;
local function v13(v11, v12) --[[ Line: 69 ]] --[[ Name: logSwitchTabStart ]]
    -- upvalues: v10 (ref)
    v10 = {
        previousPage = v11, 
        nextPage = v12, 
        startTime = os.clock()
    };
end;
local function v17(v14, v15, v16) --[[ Line: 77 ]] --[[ Name: reportSwitchTab ]]
    -- upvalues: l_TelemetryService_0 (copy), v5 (copy), v6 (copy), v4 (copy)
    l_TelemetryService_0:LogStat(v5, {
        customFields = {
            previous_page = v14, 
            current_page = v15
        }
    }, v16);
    l_TelemetryService_0:LogEvent(v6, {
        customFields = {
            previous_page = v14, 
            current_page = v15, 
            duration = v16
        }, 
        standardizedFields = v4
    });
end;
local function v21(v18) --[[ Line: 94 ]] --[[ Name: logSwitchTabEnd ]]
    -- upvalues: v10 (ref), v17 (copy)
    if not v10 then
        return;
    elseif v18 ~= v10.nextPage then
        v10 = nil;
        return;
    else
        local l_previousPage_0 = v10.previousPage;
        local v20 = (os.clock() - v10.startTime) * 1000;
        v10 = nil;
        v17(l_previousPage_0, v18, v20);
        return;
    end;
end;
local v22 = nil;
local function v24(v23) --[[ Line: 113 ]] --[[ Name: logVisibilityStart ]]
    -- upvalues: v22 (ref)
    v22 = {
        nextValue = v23, 
        startTime = os.clock()
    };
end;
local function v27(v25, v26) --[[ Line: 120 ]] --[[ Name: reportVisibility ]]
    -- upvalues: l_TelemetryService_0 (copy), v7 (copy), v8 (copy), v4 (copy)
    l_TelemetryService_0:LogStat(v7, {
        customFields = {
            is_visible = v25
        }
    }, v26);
    l_TelemetryService_0:LogEvent(v8, {
        customFields = {
            is_visible = v25, 
            duration = v26
        }, 
        standardizedFields = v4
    });
end;
local function v30(v28) --[[ Line: 135 ]] --[[ Name: logVisibilityEnd ]]
    -- upvalues: v22 (ref), v27 (copy)
    if not v22 then
        return;
    elseif v28 ~= v22.nextValue then
        v22 = nil;
        return;
    else
        local v29 = (os.clock() - v22.startTime) * 1000;
        v22 = nil;
        v27(v28, v29);
        return;
    end;
end;
local v31 = nil;
local function v33(v32) --[[ Line: 153 ]] --[[ Name: logPlacement ]]
    -- upvalues: v31 (ref), l_TelemetryService_0 (copy), v9 (copy)
    if v32 == v31 then
        return;
    else
        l_TelemetryService_0:LogCounter(v9, {
            customFields = {
                previous_placement = v31, 
                current_placement = v32
            }
        });
        v31 = v32;
        return;
    end;
end;
local function v34() --[[ Line: 168 ]] --[[ Name: reset ]]
    -- upvalues: v10 (ref), v22 (ref), v31 (ref)
    v10 = nil;
    v22 = nil;
    v31 = nil;
end;
return {
    logSwitchTabStart = v13, 
    logSwitchTabEnd = v21, 
    logVisibilityStart = v24, 
    logVisibilityEnd = v30, 
    logPlacement = v33, 
    reset = v34
};