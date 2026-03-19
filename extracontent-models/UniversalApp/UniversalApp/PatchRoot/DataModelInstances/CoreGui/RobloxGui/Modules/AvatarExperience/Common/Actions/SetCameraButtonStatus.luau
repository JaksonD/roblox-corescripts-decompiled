local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "boolean", "Actions.SetCameraButton.status");
    return {
        status = v2
    };
end);