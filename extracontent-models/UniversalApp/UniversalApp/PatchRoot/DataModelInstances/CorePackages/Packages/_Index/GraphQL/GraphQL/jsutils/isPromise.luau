local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
return {
    isPromise = function(v2) --[[ Line: 17 ]] --[[ Name: isPromise ]]
        -- upvalues: v1 (copy)
        return v1.is(v2);
    end
};