local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v2 = require(l_script_FirstAncestor_0.Enums.InputLabelSize);
local v3 = {
    [v1.Large] = v2.Large, 
    [v1.Medium] = v2.Medium, 
    [v1.Small] = v2.Small, 
    [v1.XSmall] = v2.Small
};
return function(v4) --[[ Line: 19 ]] --[[ Name: getInputTextSize ]]
    -- upvalues: v3 (copy)
    return v3[v4];
end;