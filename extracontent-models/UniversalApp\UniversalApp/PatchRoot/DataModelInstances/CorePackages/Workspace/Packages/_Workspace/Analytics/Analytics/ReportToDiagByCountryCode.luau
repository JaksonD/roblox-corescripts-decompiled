local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
math.randomseed(tick());
return function(v1, v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    if v4 < 100 * math.random() then
        return;
    else
        l_RbxAnalyticsService_0:ReportToDiagByCountryCode(v1, v2, v3);
        return;
    end;
end;