local l_CorePackages_0 = game:GetService("CorePackages");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return function(v2, _) --[[ Line: 4 ]]
    -- upvalues: l_FormFactor_0 (copy)
    local v4 = v2.Navigation.history[#v2.Navigation.history];
    return {
        currentAppPage = v4[#v4].name, 
        wideMode = v2.FormFactor == l_FormFactor_0.WIDE
    };
end;