local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v3 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local l_Logging_0 = v1.Logging;
local l_Parent_1 = l_Parent_0.Parent;
local v6 = require(l_Parent_1.SharedFlags);
local v7 = require(l_Parent_0.Constants.EventStreamConstants);
local l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 = v6.FFlagEnableAuthAnalyticsPrintDebuggingDev;
local l_FFlagIncludeAuthEventLocalTimestamp_0 = v6.FFlagIncludeAuthEventLocalTimestamp;
return function(v10, v11, v12) --[[ Line: 12 ]]
    -- upvalues: l_FFlagIncludeAuthEventLocalTimestamp_0 (copy), v7 (copy), l_Logging_0 (copy), l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 (copy), v3 (copy)
    local v13 = {};
    if l_FFlagIncludeAuthEventLocalTimestamp_0 then
        v12[v7.EventTimingKeys.OsClock] = tostring(os.clock());
        v12[v7.EventTimingKeys.OsTime] = tostring(os.time());
    end;
    for v14, v15 in pairs(v12) do
        if type(v14) == "string" then
            v13[v14] = v15;
        else
            l_Logging_0.warn("Failure logging " .. v11 .. ": Expected " .. v14 .. " to be a string key but got " .. type(v14));
            return;
        end;
    end;
    if l_FFlagEnableAuthAnalyticsPrintDebuggingDev_0 then
        local v16 = "";
        for v17, v18 in pairs(v13) do
            v16 = v16 .. v17 .. ": " .. tostring(v18) .. ", ";
        end;
        v16 = string.sub(v16, 1, -3);
        print("Emitting EventIngest " .. v11 .. ", context " .. v10 .. " with args: " .. v16);
    end;
    v3:sendEventDeferred(v10, v11, v13);
end;