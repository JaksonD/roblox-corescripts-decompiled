local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Components.Text.FontScales);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v2 <= 0 or v3 <= 0 then
        return 0;
    else
        if v4 <= 1 then
            v4 = 1;
        end;
        v2 = math.floor(v2);
        local v5 = 0;
        local v6 = v1[Font.fromEnum(Enum.Font.BuilderSans).Family];
        if v6 ~= nil then
            v5 = (v2 / v6 * (v4 * v6) - v2) / 2;
        end;
        local v7 = math.ceil((v3 - 1) * v4 * v2);
        local v8 = if v5 >= 1 then math.ceil(v5) else math.floor(v5);
        return v7 + v2 + v8;
    end;
end;