local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.dependencyArray);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy)
        if v4 and not v5.current then
            v3();
            v5.current = true;
        end;
    end, v2(v4));
end;