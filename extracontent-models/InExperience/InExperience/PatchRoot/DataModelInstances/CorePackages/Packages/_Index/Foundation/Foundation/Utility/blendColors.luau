local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v2, v3) --[[ Line: 14 ]] --[[ Name: blendColors ]]
    local v4 = 1 - (v3.Transparency or 0);
    local v5 = 1 - (v2.Transparency or 0);
    if v4 == 1 or v5 == 0 or v2.Color3 == nil then
        return v3;
    elseif v4 == 0 then
        return v2;
    else
        local v6 = 1 - v4;
        local v7 = v4 + v5 * v6;
        local v8 = v7 > 0 and 1 / v7 or 0;
        local v9 = (v3.Color3.R * v4 + v2.Color3.R * (v5 * v6)) * v8;
        local v10 = (v3.Color3.G * v4 + v2.Color3.G * (v5 * v6)) * v8;
        local v11 = (v3.Color3.B * v4 + v2.Color3.B * (v5 * v6)) * v8;
        return {
            Color3 = Color3.new(v9, v10, v11), 
            Transparency = 1 - v7
        };
    end;
end;