local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperience");
local l_Cryo_0 = require(l_script_FirstAncestor_0.dependencies).Cryo;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_Cryo_0 (copy)
    local v3 = {};
    if v2 ~= nil then
        local v4 = l_Cryo_0.Dictionary.keys(v2);
        for _, v6 in ipairs(v4) do
            local v7 = tonumber(v6);
            if v7 then
                v3[v7] = v2[v6];
            end;
        end;
    end;
    return v3;
end;