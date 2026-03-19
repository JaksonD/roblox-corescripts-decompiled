local v0 = require(script.Parent.Parent.equalObjects);
local function v7(v1, v2) --[[ Line: 3 ]] --[[ Name: compare ]]
    if type(v1) ~= "table" or type(v2) ~= "table" then
        return v1 == v2;
    else
        for v3, v4 in v1 do
            if v2[v3] ~= v4 then
                return false;
            end;
        end;
        for v5, v6 in v2 do
            if v1[v5] ~= v6 then
                return false;
            end;
        end;
        return true;
    end;
end;
return function(...) --[[ Line: 23 ]] --[[ Name: equals ]]
    -- upvalues: v0 (copy), v7 (copy)
    if v0(...) then
        return true;
    else
        local v8 = select("#", ...);
        local v9 = select(1, ...);
        for v10 = 2, v8 do
            local v11 = select(v10, ...);
            if not v7(v9, v11) then
                return false;
            end;
        end;
        return true;
    end;
end;