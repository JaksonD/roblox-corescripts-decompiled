local v0 = require(script.Parent.join);
local function v1(v2) --[[ Line: 4 ]] --[[ Name: flatten ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v3 = type(v2);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = {};
    for v5, v6 in pairs(v2) do
        if type(v6) == "table" then
            v4 = v0(v1(v6), v4);
        else
            v4[v5] = v6;
        end;
    end;
    return v4;
end;
return v1;