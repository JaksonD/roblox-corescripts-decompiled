local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
return {
    compose = function(v4, v5) --[[ Line: 22 ]] --[[ Name: compose ]]
        if v4 ~= nil and v5 ~= nil then
            return {
                v4, 
                v5
            };
        elseif v4 ~= nil then
            return v4;
        else
            return v5;
        end;
    end, 
    create = function(v6) --[[ Line: 31 ]] --[[ Name: create ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
        if _G.__DEV__ then
            l_Array_0.forEach(l_Object_0.keys(v6), function(v7) --[[ Line: 36 ]]
                -- upvalues: v6 (copy), l_Object_0 (ref)
                if v6[v7] then
                    l_Object_0.freeze(v6[v7]);
                end;
            end);
        end;
        return v6;
    end
};