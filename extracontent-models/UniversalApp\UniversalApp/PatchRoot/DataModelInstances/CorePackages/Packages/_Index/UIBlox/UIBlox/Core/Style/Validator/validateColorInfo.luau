local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.t);
local v3 = require(l_Parent_0.validateBinding);
return v2.strictInterface({
    Color = v2.Color3, 
    Transparency = v2.union(v2.numberConstrained(0, 1), v3)
});