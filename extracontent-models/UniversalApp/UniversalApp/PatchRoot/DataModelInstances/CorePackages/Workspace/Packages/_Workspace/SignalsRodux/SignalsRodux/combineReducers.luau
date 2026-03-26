local _ = require(script.Parent.types);
return function(v1) --[[ Line: 6 ]] --[[ Name: combineReducers ]]
    return function(v2, v3, v4) --[[ Line: 7 ]]
        -- upvalues: v1 (copy)
        local v5 = if v2 == nil then {} else v2;
        local v6 = {};
        local v7 = false;
        for v8, v9 in v1 do
            local v10 = v5[v8];
            local v11 = v9(v10, v3, v4);
            v6[v8] = v11;
            if v11 ~= v10 then
                v7 = true;
            end;
        end;
        if v7 then
            return v6;
        else
            return v5;
        end;
    end;
end;