return function(v0, v1) --[[ Line: 7 ]]
    return function(v2, ...) --[[ Line: 8 ]]
        -- upvalues: v1 (copy), v0 (copy)
        if v2 == v1 then
            return v0(v1, ...);
        else
            return v0(v1, v2, ...);
        end;
    end;
end;