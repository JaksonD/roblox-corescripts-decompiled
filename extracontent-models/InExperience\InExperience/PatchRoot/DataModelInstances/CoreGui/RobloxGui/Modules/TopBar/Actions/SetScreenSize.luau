local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
if require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize then
    return nil;
else
    return (l_makeActionCreator_0(script.Name, function(v2) --[[ Line: 11 ]]
        return {
            screenSize = v2
        };
    end));
end;