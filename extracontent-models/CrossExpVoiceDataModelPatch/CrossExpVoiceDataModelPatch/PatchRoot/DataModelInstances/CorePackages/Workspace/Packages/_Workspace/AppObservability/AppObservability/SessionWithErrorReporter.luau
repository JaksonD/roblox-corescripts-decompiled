local l_TelemetryService_0 = game:GetService("TelemetryService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 43 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v4 = setmetatable({
        _eventConfig = v2, 
        _lastReportedTimestampBySeverity = {}, 
        _reportingInterval = v3 or 300, 
        _lastReportedEventBySeverity = {}
    }, v1);
    v4._lastReportedTimestampBySeverity.NO_SEVERITY = nil;
    v4._lastReportedEventBySeverity.NO_SEVERITY = nil;
    return v4;
end;
v1.getCurrentTimeStamp = function(_) --[[ Line: 67 ]] --[[ Name: getCurrentTimeStamp ]]
    return os.time();
end;
v1.reportEvent = function(v6, v7, v8, v9) --[[ Line: 80 ]] --[[ Name: reportEvent ]]
    -- upvalues: l_TelemetryService_0 (copy)
    local v10 = false;
    local v11 = v6:getCurrentTimeStamp();
    local v12 = v9 or "NO_SEVERITY";
    local v13 = v6._lastReportedTimestampBySeverity[v12];
    if v13 == nil or v11 - v13 >= v6._reportingInterval then
        v10 = true;
    end;
    if v10 then
        if v9 ~= nil then
            if v8 == nil then
                v8 = {
                    tag_severity = v9
                };
            elseif type(v8) == "table" then
                v8.tag_severity = v9;
            end;
        end;
        l_TelemetryService_0:LogCounter(v6._eventConfig, {
            customFields = v8
        }, v7 or 1);
        v6._lastReportedTimestampBySeverity[v12] = v11;
        v6._lastReportedEventBySeverity[v12] = {
            count = v7, 
            customFields = v8
        };
    end;
end;
return v1;