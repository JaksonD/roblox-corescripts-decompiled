local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Result_0 = require(l_script_FirstAncestor_0.dependencies).Result;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_Result_0 (copy)
    return l_Result_0.success(v2);
end;