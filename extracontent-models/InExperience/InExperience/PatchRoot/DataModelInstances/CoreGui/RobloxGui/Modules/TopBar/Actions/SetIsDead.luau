local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagTopBarSignalizeHealthBar_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar;
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
if l_FFlagTopBarSignalizeHealthBar_0 then
    return nil;
else
    return (l_makeActionCreator_0(script.Name, function(v3) --[[ Line: 9 ]]
        return {
            isDead = v3
        };
    end));
end;