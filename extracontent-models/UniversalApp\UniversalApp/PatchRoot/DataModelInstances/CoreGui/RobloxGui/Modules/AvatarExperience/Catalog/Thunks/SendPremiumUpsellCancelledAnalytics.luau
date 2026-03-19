return function(v0, v1, v2) --[[ Line: 1 ]]
    return function(_) --[[ Line: 2 ]]
        -- upvalues: v0 (copy), v1 (copy), v2 (copy)
        v0(v1, v2);
    end;
end;