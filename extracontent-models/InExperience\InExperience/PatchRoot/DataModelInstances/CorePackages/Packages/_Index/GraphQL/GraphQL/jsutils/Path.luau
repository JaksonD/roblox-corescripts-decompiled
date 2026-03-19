local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
return {
    addPath = function(v2, v3, v4) --[[ Line: 21 ]] --[[ Name: addPath ]]
        return {
            prev = v2, 
            key = v3, 
            typename = v4
        };
    end, 
    pathToArray = function(v5) --[[ Line: 29 ]] --[[ Name: pathToArray ]]
        -- upvalues: l_Array_0 (copy)
        local v6 = {};
        local l_v5_0 = v5;
        while l_v5_0 do
            table.insert(v6, l_v5_0.key);
            l_v5_0 = l_v5_0.prev;
        end;
        return l_Array_0.reverse(v6);
    end
};