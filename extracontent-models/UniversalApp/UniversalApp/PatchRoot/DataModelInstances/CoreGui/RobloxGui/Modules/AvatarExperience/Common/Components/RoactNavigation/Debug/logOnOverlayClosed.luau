local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.overlay");
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1:info("onOverlayClosed {}, captureFocus: {}", v2, v3);
end;