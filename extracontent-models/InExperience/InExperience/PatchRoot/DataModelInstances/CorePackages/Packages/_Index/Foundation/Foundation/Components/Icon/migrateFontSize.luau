local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: migrateFontSize ]]
    local l_Size_100_0 = v3.Size.Size_100;
    local l_Size_600_0 = v3.Size.Size_600;
    local l_Size_900_0 = v3.Size.Size_900;
    if l_Size_600_0 <= v2 and v2 <= l_Size_900_0 then
        v2 = l_Size_600_0;
    end;
    return math.round(v2 / l_Size_100_0) * l_Size_100_0;
end;