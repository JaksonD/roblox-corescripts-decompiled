local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_1.LuauPolyfill);
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(script.Parent.Parent.Parent.utilities);
v0.toPromise = function(v7) --[[ Line: 23 ]] --[[ Name: toPromise ]]
    -- upvalues: v3 (copy), l_invariant_0 (copy)
    local v8 = false;
    return v3.new(function(v9, v10) --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v8 (ref), l_invariant_0 (ref)
        v7:subscribe({
            next = function(_, v12) --[[ Line: 27 ]] --[[ Name: next ]]
                -- upvalues: v8 (ref), l_invariant_0 (ref), v9 (copy)
                if v8 then
                    l_invariant_0.warn("Promise Wrapper does not support multiple results from Observable");
                    return;
                else
                    v8 = true;
                    v9(v12);
                    return;
                end;
            end, 
            error = function(_, v14) --[[ Line: 35 ]] --[[ Name: error ]]
                -- upvalues: v10 (copy)
                v10(v14);
            end
        });
    end):andThen(function(v15) --[[ Line: 41 ]]
        -- upvalues: v3 (ref)
        return v3.delay(0):andThenReturn(v15);
    end);
end;
return v0;