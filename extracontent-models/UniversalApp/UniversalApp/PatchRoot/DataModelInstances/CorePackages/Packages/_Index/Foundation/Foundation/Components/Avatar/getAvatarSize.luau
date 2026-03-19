local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.InputSize);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
return function(v3, v4, v5) --[[ Line: 9 ]] --[[ Name: getAvatarSize ]]
    -- upvalues: v1 (copy)
    if v5 then
        return ({
            [v1.XSmall] = v3.Size.Size_300, 
            [v1.Small] = v3.Size.Size_400, 
            [v1.Medium] = v3.Size.Size_500, 
            [v1.Large] = v3.Size.Size_600
        })[v4];
    else
        return ({
            [v1.XSmall] = v3.Size.Size_600, 
            [v1.Small] = v3.Size.Size_800, 
            [v1.Medium] = v3.Size.Size_1000, 
            [v1.Large] = v3.Size.Size_1200
        })[v4];
    end;
end;