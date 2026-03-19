local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.useStore);
return function() --[[ Line: 10 ]] --[[ Name: useDispatch ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3 = v2();
    return (v1.useCallback(function(...) --[[ Line: 13 ]]
        -- upvalues: v3 (copy)
        return v3:dispatch(...);
    end, {
        v3
    }));
end;