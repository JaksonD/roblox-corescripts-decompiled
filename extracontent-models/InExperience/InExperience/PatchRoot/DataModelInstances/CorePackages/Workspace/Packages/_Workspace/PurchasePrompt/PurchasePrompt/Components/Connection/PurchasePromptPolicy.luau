local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_PolicyProvider_0 = require(l_Parent_0.PurchasePromptDeps).PolicyProvider;
local v2 = l_PolicyProvider_0.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = l_PolicyProvider_0.withGetPolicyImplementation(v2);
v3.Mapper = function(_) --[[ Line: 9 ]]
    return {};
end;
return v3;