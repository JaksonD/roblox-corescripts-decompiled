local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local _ = require(l_Parent_0.PromiseOrValue);
local l_isPromise_0 = require(l_Parent_0.isPromise).isPromise;
return {
    promiseReduce = function(v5, v6, v7) --[[ Line: 26 ]] --[[ Name: promiseReduce ]]
        -- upvalues: l_Array_0 (copy), l_isPromise_0 (copy)
        return l_Array_0.reduce(v5, function(v8, v9) --[[ Line: 31 ]]
            -- upvalues: l_isPromise_0 (ref), v6 (copy)
            if l_isPromise_0(v8) then
                return v8:andThen(function(v10) --[[ Line: 33 ]]
                    -- upvalues: v6 (ref), v9 (copy)
                    return v6(v10, v9);
                end);
            else
                return v6(v8, v9);
            end;
        end, v7);
    end
};