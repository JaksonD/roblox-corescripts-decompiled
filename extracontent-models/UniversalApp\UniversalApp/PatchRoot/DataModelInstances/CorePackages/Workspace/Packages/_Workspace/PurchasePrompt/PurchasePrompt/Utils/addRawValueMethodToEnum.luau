return function(v0, v1) --[[ Line: 7 ]]
    local v2 = {};
    for v3, v4 in pairs(v1) do
        v2[v0[v3]] = v4;
    end;
    local v5 = getmetatable(v0);
    local l___index_0 = v5.__index;
    v5.__index = function(_, v8) --[[ Line: 15 ]]
        -- upvalues: v2 (copy), l___index_0 (copy)
        if v8 == "toRawValue" then
            return function(v9) --[[ Line: 17 ]]
                -- upvalues: v2 (ref)
                return v2[v9];
            end;
        else
            return l___index_0[v8];
        end;
    end;
end;