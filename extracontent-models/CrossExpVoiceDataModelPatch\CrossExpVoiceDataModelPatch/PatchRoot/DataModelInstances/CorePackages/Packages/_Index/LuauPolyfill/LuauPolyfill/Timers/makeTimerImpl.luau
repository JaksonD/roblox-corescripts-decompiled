local v0 = newproxy(false);
return function(v1) --[[ Line: 10 ]]
    -- upvalues: v0 (copy)
    local function v7(v2, v3, ...) --[[ Line: 11 ]] --[[ Name: setTimeout ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v4 = {
            ...
        };
        local v5 = {
            [v0] = 1
        };
        if v3 == nil then
            v3 = 0;
        end;
        local v6 = v3 / 1000;
        v1(v6, function() --[[ Line: 24 ]]
            -- upvalues: v5 (copy), v0 (ref), v2 (copy), v4 (copy)
            if v5[v0] == 1 then
                v2(unpack(v4));
                v5[v0] = 2;
            end;
        end);
        return v5;
    end;
    local function v9(v8) --[[ Line: 34 ]] --[[ Name: clearTimeout ]]
        -- upvalues: v0 (ref)
        if v8 == nil then
            return;
        else
            if v8[v0] == 1 then
                v8[v0] = 3;
            end;
            return;
        end;
    end;
    return {
        setTimeout = v7, 
        clearTimeout = v9
    };
end;