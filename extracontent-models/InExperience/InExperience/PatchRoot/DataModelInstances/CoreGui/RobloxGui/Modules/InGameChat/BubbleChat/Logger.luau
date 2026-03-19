local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new("BubbleChatLogger");
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return v1:new(v2);
end;