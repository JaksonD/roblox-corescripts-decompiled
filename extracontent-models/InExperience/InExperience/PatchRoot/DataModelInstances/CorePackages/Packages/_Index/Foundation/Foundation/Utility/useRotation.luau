local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local _ = require(l_Parent_0.React);
local l_useClock_0 = require(l_Parent_0.ReactUtils).useClock;
return function(v3) --[[ Line: 11 ]] --[[ Name: useRotation ]]
    -- upvalues: l_useClock_0 (copy)
    return l_useClock_0():map(function(v4) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        return v4 * 360 * (v3 or 1);
    end);
end;