local _ = require(script.Parent.Parent.Types);
return function(v1, v2) --[[ Line: 3 ]]
    return function(v3) --[[ Line: 4 ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1 then
            v1:info(v2(v3));
        end;
        return v3;
    end;
end;