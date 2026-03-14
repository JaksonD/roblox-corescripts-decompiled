local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
return function(v2) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    local v3 = v1.useRef(false);
    local v4 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy)
        if not v3.current then
            v3.current = true;
            return;
        else
            if not v4.current then
                v4.current = true;
            end;
            if v2 then
                v2();
            end;
            return;
        end;
    end);
    return v4;
end;