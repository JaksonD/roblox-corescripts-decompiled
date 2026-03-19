local v0 = require(script.Parent.None);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v3, v4, v5, v6, ...) --[[ Line: 14 ]]
    -- upvalues: v0 (copy)
    if v4 ~= nil and typeof(v4) == "table" then
        for v7, v8 in pairs(v4) do
            if v8 == v0 then
                v3[v7] = nil;
            else
                v3[v7] = v8;
            end;
        end;
    end;
    if v5 ~= nil and typeof(v5) == "table" then
        for v9, v10 in pairs(v5) do
            if v10 == v0 then
                v3[v9] = nil;
            else
                v3[v9] = v10;
            end;
        end;
    end;
    if v6 ~= nil and typeof(v6) == "table" then
        for v11, v12 in pairs(v6) do
            if v12 == v0 then
                v3[v11] = nil;
            else
                v3[v11] = v12;
            end;
        end;
    end;
    for v13 = 1, select("#", ...) do
        local v14 = select(v13, ...);
        if v14 ~= nil and typeof(v14) == "table" then
            for v15, v16 in pairs(v14) do
                if v16 == v0 then
                    v3[v15] = nil;
                else
                    v3[v15] = v16;
                end;
            end;
        end;
    end;
    return v3;
end;