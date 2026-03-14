local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, ...) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "table", "isKeyCodePressed.pressedKeys");
    local v3 = {
        ...
    };
    for _, v5 in ipairs(v2) do
        for _, v7 in ipairs(v3) do
            if v5.KeyCode == v7 then
                return true;
            end;
        end;
    end;
    return false;
end;