local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
return v1.strictInterface({
    targetValue = v1.number, 
    springParams = v1.optional(v1.strictInterface({
        frequency = v1.number, 
        dampingRatio = v1.number
    }))
});