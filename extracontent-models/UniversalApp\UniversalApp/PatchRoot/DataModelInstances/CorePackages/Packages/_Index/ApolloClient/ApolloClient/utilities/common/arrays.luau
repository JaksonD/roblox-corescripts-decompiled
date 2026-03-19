local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
v0.isNonEmptyArray = function(v3) --[[ Line: 14 ]] --[[ Name: isNonEmptyArray ]]
    -- upvalues: l_Array_0 (copy)
    return (function() --[[ Line: 15 ]]
        -- upvalues: l_Array_0 (ref), v3 (copy)
        if l_Array_0.isArray(v3) then
            return #v3 > 0;
        else
            return l_Array_0.isArray(v3);
        end;
    end)();
end;
return v0;