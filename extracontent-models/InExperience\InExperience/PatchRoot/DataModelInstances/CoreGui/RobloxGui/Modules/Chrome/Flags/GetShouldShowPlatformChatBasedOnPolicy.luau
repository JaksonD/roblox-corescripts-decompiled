local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return (v1.getAppFeaturePolicies().getCanSeeChatTab());
end;