local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
return function(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: findAnalyticsFieldInAncestors ]]
    if not v3 then
        return nil;
    else
        assert(v3, "analyticsContext must exist");
        if v3.analyticsData and v3.analyticsData[v2] ~= nil then
            return v3.analyticsData[v2];
        elseif v3.ancestorAnalyticsData and v3.ancestorAnalyticsData[v2] ~= nil then
            return v3.ancestorAnalyticsData[v2];
        elseif v4 ~= nil then
            return v4;
        else
            return nil;
        end;
    end;
end;