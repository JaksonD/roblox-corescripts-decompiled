return function() --[[ Line: 1 ]] --[[ Name: createRequestQueue ]]
    local v0 = {};
    local v1 = 1;
    local function v3(v2) --[[ Line: 8 ]] --[[ Name: push ]]
        -- upvalues: v0 (copy), v1 (ref)
        if v0[v2] == nil then
            v0[v2] = v1;
            v1 = v1 + 1;
        end;
    end;
    local function v13(v4) --[[ Line: 15 ]] --[[ Name: pop ]]
        -- upvalues: v0 (copy)
        local v5 = {};
        for v6, _ in v0 do
            table.insert(v5, v6);
        end;
        table.sort(v5, function(v8, v9) --[[ Line: 20 ]]
            -- upvalues: v0 (ref)
            return v0[v8] < v0[v9];
        end);
        if v4 < #v5 then
            local v10 = {};
            for v11 = 1, v4 do
                local v12 = v5[v11];
                table.insert(v10, v12);
                v0[v12] = nil;
            end;
            return v10;
        else
            table.clear(v0);
            return v5;
        end;
    end;
    local function v16() --[[ Line: 38 ]] --[[ Name: isEmpty ]]
        -- upvalues: v0 (copy)
        for _, _ in v0 do
            return false;
        end;
        return true;
    end;
    local function v18(v17) --[[ Line: 45 ]] --[[ Name: hasItem ]]
        -- upvalues: v0 (copy)
        return v0[v17] ~= nil;
    end;
    local function v19() --[[ Line: 49 ]] --[[ Name: clear ]]
        -- upvalues: v0 (copy), v1 (ref)
        table.clear(v0);
        v1 = 1;
    end;
    return {
        push = v3, 
        pop = v13, 
        isEmpty = v16, 
        hasItem = v18, 
        clear = v19
    };
end;