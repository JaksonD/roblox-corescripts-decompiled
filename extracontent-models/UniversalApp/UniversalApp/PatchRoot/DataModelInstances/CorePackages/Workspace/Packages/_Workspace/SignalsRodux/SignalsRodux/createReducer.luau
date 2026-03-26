local _ = require(script.Parent.types);
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: createReducer ]]
    return function(v3, v4, v5) --[[ Line: 7 ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v6 = if v3 ~= nil then v3 else v1;
        local v7 = v2[v4.type];
        if v7 then
            return v7(v6, v4, v5);
        else
            return v6;
        end;
    end;
end;