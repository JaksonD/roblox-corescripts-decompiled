local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PolicyProvider);
local v2 = require(script.Parent.UniversalAppGetPolicy);
return (v1.withGetPolicyImplementation(v2));