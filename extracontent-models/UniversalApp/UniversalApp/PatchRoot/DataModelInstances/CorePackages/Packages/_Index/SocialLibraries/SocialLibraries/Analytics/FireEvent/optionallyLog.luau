local _ = require(script.Parent.Types);
return function(v1, v2) --[[ Line: 4 ]]
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v1 (copy), v2 (copy)
        if v1 then
            v1:info(v2(v3));
        end;
        return v3;
    end;
end;