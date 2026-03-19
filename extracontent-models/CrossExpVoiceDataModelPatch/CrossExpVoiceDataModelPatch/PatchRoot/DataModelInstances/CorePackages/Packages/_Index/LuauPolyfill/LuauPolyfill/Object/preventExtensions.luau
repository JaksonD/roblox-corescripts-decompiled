local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.types);
return function(v2) --[[ Line: 10 ]] --[[ Name: preventExtensions ]]
    local v3 = tostring(v2);
    return (setmetatable(v2, {
        __newindex = function(_, v5, _) --[[ Line: 15 ]] --[[ Name: __newindex ]]
            -- upvalues: v3 (copy)
            local v7 = ("%q (%s) is not a valid member of %s"):format(tostring(v5), typeof(v5), v3);
            error(v7, 2);
        end, 
        __metatable = false
    }));
end;