return function(v0) --[[ Line: 2 ]] --[[ Name: createShallowEqualAndTables ]]
    local v1 = {};
    for _, v3 in v0 do
        v1[v3] = true;
    end;
    return function(v4, v5) --[[ Line: 8 ]]
        -- upvalues: v1 (copy)
        for v6, v7 in v4 do
            local v8 = v5[v6];
            if v1[v6] then
                if typeof(v7) ~= "table" or typeof(v8) ~= "table" then
                    return false;
                else
                    for v9, v10 in v7 do
                        if v10 ~= v8[v9] then
                            return false;
                        end;
                    end;
                    for v11, _ in v8 do
                        if v7[v11] == nil then
                            return false;
                        end;
                    end;
                end;
            elseif v7 ~= v8 then
                return false;
            end;
        end;
        for v13, _ in v5 do
            if v4[v13] == nil then
                return false;
            end;
        end;
        return true;
    end;
end;