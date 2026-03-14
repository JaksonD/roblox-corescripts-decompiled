local v0 = require(script.Parent.Parent.equalObjects);
local function v1(v2, v3) --[[ Line: 4 ]] --[[ Name: equalsDeepOneWay ]]
    -- upvalues: v1 (copy)
    if type(v2) == "table" and type(v3) == "table" then
        for v4 = 1, #v2 do
            if not v1(v2[v4], v3[v4]) then
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
        local v5 = select("#", ...);
        for v6 = 1, v5 do
            local v7 = select(v6, ...);
            for v8 = 1, v5 do
                if v8 ~= v6 then
                    local v9 = select(v8, ...);
                    if not v1(v7, v9) then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;