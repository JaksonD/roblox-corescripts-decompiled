local l_Parent_0 = script.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Enums.RequestType);
return function(v3) --[[ Line: 11 ]] --[[ Name: isMockingPurchases ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy)
    return l_RunService_0:IsStudio() and v3 ~= v2.AvatarCreationFee;
end;