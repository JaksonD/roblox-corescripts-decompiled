local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
return function(v4) --[[ Line: 15 ]] --[[ Name: createLazyComponent ]]
    -- upvalues: v2 (copy)
    local v7 = v2.memo(function(v5) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v4 (copy)
        local v6 = v2.useMemo(v4, {});
        return v2.createElement(v6, v5);
    end);
    return function(v8) --[[ Line: 20 ]]
        -- upvalues: v2 (ref), v7 (copy)
        return v2.createElement(v7, v8);
    end;
end;