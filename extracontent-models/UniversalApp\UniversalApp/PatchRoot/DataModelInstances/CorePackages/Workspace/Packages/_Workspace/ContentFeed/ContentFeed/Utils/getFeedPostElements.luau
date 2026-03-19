local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getIsPlaceholder);
return function(v2) --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    local v3 = {};
    if v2.current then
        for _, v5 in pairs(v2.current:GetChildren()) do
            local l_Name_0 = v5.Name;
            local v7 = v1(l_Name_0);
            if string.match(l_Name_0, "[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+") or v7 then
                table.insert(v3, v5);
            end;
        end;
    end;
    return v3;
end;