local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.dependencyArray);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function(v4, v5) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), v2 (copy)
    local v6 = v1.useRef(false);
    v1.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v5 (copy), v6 (copy), v4 (copy)
        if v5 and not v6.current then
            v4();
            v6.current = true;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v5
    } else v2(v5));
end;