local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Rodux_0 = require(l_script_FirstAncestor_0.dependencies).Rodux;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_Rodux_0 (copy)
    local v5 = v3 or function(v4) --[[ Line: 7 ]]
        return v4;
    end;
    return l_Rodux_0.Store.new(v5, v2 or {}, {
        l_Rodux_0.thunkMiddleware
    });
end;