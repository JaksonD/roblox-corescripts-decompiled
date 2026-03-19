local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.Utility.Flags);
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: getKnobSize ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = (if v3.FoundationToggleVisualUpdate then {
        [v1.XSmall] = v4.Size.Size_300, 
        [v1.Small] = v4.Size.Size_400, 
        [v1.Medium] = v4.Size.Size_500, 
        [v1.Large] = v4.Size.Size_600
    } else {
        [v1.XSmall] = v4.Size.Size_200, 
        [v1.Small] = v4.Size.Size_300, 
        [v1.Medium] = v4.Size.Size_400, 
        [v1.Large] = v4.Size.Size_700
    })[v5];
    return UDim2.fromOffset(v6, v6);
end;