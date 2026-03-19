local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local v3 = require(l_Parent_1.Promise);
local _ = require(l_Parent_0.jsutils.PromiseOrValue);
return {
    coerceToPromise = function(v5) --[[ Line: 10 ]] --[[ Name: coerceToPromise ]]
        -- upvalues: v3 (copy)
        if v3.is(v5) then
            return v5;
        else
            return (v3.resolve(v5));
        end;
    end
};