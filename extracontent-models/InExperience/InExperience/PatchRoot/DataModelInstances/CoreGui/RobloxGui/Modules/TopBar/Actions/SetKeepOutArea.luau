local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
if require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeKeepOutAreas then
    return nil;
else
    return (l_makeActionCreator_0(script.Name, function(v2, v3, v4) --[[ Line: 11 ]]
        return {
            id = v2, 
            position = v3, 
            size = v4
        };
    end));
end;