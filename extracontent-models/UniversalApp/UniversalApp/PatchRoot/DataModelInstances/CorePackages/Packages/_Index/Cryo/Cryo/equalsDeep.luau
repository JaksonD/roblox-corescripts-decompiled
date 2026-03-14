local v0 = require(script.Parent.equalObjects);
local function v1(v2, v3) --[[ Line: 4 ]] --[[ Name: compareDeep ]]
    -- upvalues: v1 (copy)
    if type(v2) ~= "table" or type(v3) ~= "table" then
        return v2 == v3;
    else
        for v4, v5 in v2 do
            if not v1(v3[v4], v5) then
                return false;
            end;
        end;
        for v6, v7 in v3 do
            if not v1(v2[v6], v7) then
                return false;
            end;
        end;
        return true;
    end;
end;
return function(...) --[[ Line: 24 ]] --[[ Name: equalsDeep ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0(...) then
        return true;
    else
        local v8 = select("#", ...);
        local v9 = select(1, ...);
        for v10 = 2, v8 do
            local v11 = select(v10, ...);
            if not v1(v9, v11) then
                return false;
            end;
        end;
        return true;
    end;
end;