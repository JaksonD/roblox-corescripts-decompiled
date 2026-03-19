local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local _ = require(script.Parent.ObjMap);
return {
    promiseForObject = function(v6) --[[ Line: 19 ]] --[[ Name: promiseForObject ]]
        -- upvalues: l_Object_0 (copy), l_Array_0 (copy), v1 (copy)
        local v7 = l_Object_0.keys(v6);
        local v10 = l_Array_0.map(v7, function(v8) --[[ Line: 21 ]]
            -- upvalues: v6 (copy), v1 (ref)
            local v9 = v6[v8];
            if v1.is(v9) then
                return v9;
            else
                return v1.resolve(v9);
            end;
        end);
        return v1.all(v10):andThen(function(v11) --[[ Line: 31 ]]
            -- upvalues: l_Array_0 (ref), v7 (copy)
            return l_Array_0.reduce(v11, function(v12, v13, v14) --[[ Line: 32 ]]
                -- upvalues: v7 (ref)
                v12[v7[v14]] = v13;
                return v12;
            end, {});
        end);
    end
};