local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v4 = {
    analyticsData = true, 
    ancestorAnalyticsData = true
};
return function(v5, v6) --[[ Line: 17 ]]
    -- upvalues: v4 (copy), v2 (copy)
    if v5 == v6 then
        return true;
    else
        for v7 in v4 do
            local v8 = v5[v7];
            local v9 = v6[v7];
            if typeof(v8) == "table" and typeof(v9) == "table" then
                if not v2.shallowEqual(v8, v9) then
                    return false;
                end;
            elseif v8 and not v9 or v9 and not v8 then
                return false;
            end;
        end;
        return v2.shallowEqual(v5, v6, v4);
    end;
end;