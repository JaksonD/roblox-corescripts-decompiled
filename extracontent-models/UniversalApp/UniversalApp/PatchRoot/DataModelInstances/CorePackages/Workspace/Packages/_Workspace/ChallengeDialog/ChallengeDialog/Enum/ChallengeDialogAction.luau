local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.enumerate);
local v3 = require(l_script_FirstAncestor_0.Enum.addRawValueMethodToEnum);
local v4 = {
    Approve = 1, 
    Deny = 2
};
local v5 = v2(script.Name, v4);
v3(v5, v4);
return v5;