local v0 = newproxy(false);
return function(v1) --[[ Line: 23 ]]
    -- upvalues: v0 (copy)
    local function v8(v2, v3, ...) --[[ Line: 24 ]] --[[ Name: setInterval ]]
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
        local v7 = nil;
        v7 = function() --[[ Line: 38 ]]
            -- upvalues: v1 (ref), v6 (copy), v5 (copy), v0 (ref), v2 (copy), v4 (copy), v7 (ref)
            v1(v6, function() --[[ Line: 39 ]]
                -- upvalues: v5 (ref), v0 (ref), v2 (ref), v4 (ref), v7 (ref)
                if v5[v0] == 1 then
                    v2(unpack(v4));
                    v7();
                end;
            end);
        end;
        v7();
        return v5;
    end;
    local function v10(v9) --[[ Line: 52 ]] --[[ Name: clearInterval ]]
        -- upvalues: v0 (ref)
        if v9 == nil then
            return;
        else
            if v9[v0] == 1 then
                v9[v0] = 3;
            end;
            return;
        end;
    end;
    return {
        setInterval = v8, 
        clearInterval = v10
    };
end;