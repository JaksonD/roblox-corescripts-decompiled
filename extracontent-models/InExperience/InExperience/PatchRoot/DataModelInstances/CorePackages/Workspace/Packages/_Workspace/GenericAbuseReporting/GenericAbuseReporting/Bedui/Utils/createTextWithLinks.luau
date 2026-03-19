local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local _ = require(l_script_FirstAncestor_0.Bedui.Provider.AbuseReportBeduiTypes);
return function(v2, v3) --[[ Line: 20 ]]
    if v3 == nil then
        return v2;
    else
        local l_v2_0 = v2;
        for v5 in string.gmatch(v2, "{%S+}") do
            local v6 = string.sub(v5, 2, #v5 - 1);
            if v3[v6] then
                l_v2_0 = string.gsub(l_v2_0, v5, v3[v6].label);
            end;
        end;
        return l_v2_0;
    end;
end;