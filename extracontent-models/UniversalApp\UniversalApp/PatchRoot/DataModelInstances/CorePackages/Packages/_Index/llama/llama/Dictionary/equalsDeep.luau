local v0 = require(script.Parent.Parent.equalObjects);
local function v1(v2, v3) --[[ Line: 4 ]] --[[ Name: equalsDeepOneWay ]]
    -- upvalues: v1 (copy)
    if type(v2) == "table" and type(v3) == "table" then
        for v4, v5 in pairs(v2) do
            if not v1(v5, v3[v4]) then
                return false;
            end;
        end;
    elseif v2 ~= v3 then
        return false;
    end;
    return true;
end;
return function(...) --[[ Line: 20 ]] --[[ Name: equalsDeep ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0(...) then
        return true;
    else
        local v6 = select("#", ...);
        for v7 = 1, v6 do
            local v8 = select(v7, ...);
            for v9 = 1, v6 do
                if v9 ~= v7 then
                    local v10 = select(v9, ...);
                    if not v1(v8, v10) then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;