local v0 = require(script.Parent.Parent.equalObjects);
local function v4(v1, v2) --[[ Line: 3 ]] --[[ Name: compare ]]
    if type(v1) ~= "table" or type(v2) ~= "table" then
        return v1 == v2;
    elseif #v1 ~= #v2 then
        return false;
    else
        for v3 = 1, #v1 do
            if v1[v3] ~= v2[v3] then
                return false;
            end;
        end;
        return true;
    end;
end;
return function(...) --[[ Line: 21 ]] --[[ Name: equals ]]
    -- upvalues: v0 (copy), v4 (copy)
    if v0(...) then
        return true;
    else
        local v5 = select("#", ...);
        local v6 = select(1, ...);
        for v7 = 2, v5 do
            local v8 = select(v7, ...);
            if not v4(v6, v8) then
                return false;
            end;
        end;
        return true;
    end;
end;