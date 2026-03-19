local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
local l_useClock_0 = require(l_Parent_0.ReactUtils).useClock;
local v3 = NumberRange.new(0, 1);
return function(v4, v5) --[[ Line: 15 ]] --[[ Name: usePulseBinding ]]
    -- upvalues: l_useClock_0 (copy), v3 (copy), v1 (copy)
    local v6 = l_useClock_0();
    local v7 = v4 or 1;
    local v8 = v5 or v3;
    return v1.useMemo(function() --[[ Line: 21 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy)
        return v6:map(function(v9) --[[ Line: 22 ]]
            -- upvalues: v7 (ref), v8 (ref)
            return math.map(math.sin(v9 * 3.141592653589793 / v7) ^ 2, 0, 1, v8.Min, v8.Max);
        end);
    end, {
        v4, 
        v5
    });
end;