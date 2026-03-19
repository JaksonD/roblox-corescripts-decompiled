local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_ReportToDiagByCountryCode_0 = require(l_Parent_0.Analytics).ReportToDiagByCountryCode;
local v2 = tonumber(settings():GetFVariable("PercentReportingByCountryCode")) or 0;
return function(v3, v4, v5) --[[ Line: 8 ]]
    -- upvalues: l_ReportToDiagByCountryCode_0 (copy), v2 (copy)
    l_ReportToDiagByCountryCode_0(v3, v4, v5 * 1000, v2);
end;