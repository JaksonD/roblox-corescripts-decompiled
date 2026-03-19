return function(v0, v1) --[[ Line: 1 ]]
    return function(v2, v3) --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy)
        if v2 == nil then
            v2 = v0;
        end;
        local v4 = v1[v3.type];
        if v4 then
            return v4(v2, v3);
        else
            return v2;
        end;
    end;
end;