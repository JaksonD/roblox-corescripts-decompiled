local v0 = require(script.Parent.ReportToDiagByCountryCode);
local v1 = {};
v1.__index = v1;
v1.new = function(v2, v3) --[[ Line: 6 ]] --[[ Name: new ]]
    assert(v3, "metricName is required");
    return (setmetatable({
        metricName = v3, 
        startTime = tick()
    }, v2));
end;
v1.report = function(v4) --[[ Line: 14 ]] --[[ Name: report ]]
    -- upvalues: v0 (copy)
    local v5 = tick() - v4.startTime;
    v0(v4.metricName, "RoundTripTime", v5, 100);
end;
return v1;