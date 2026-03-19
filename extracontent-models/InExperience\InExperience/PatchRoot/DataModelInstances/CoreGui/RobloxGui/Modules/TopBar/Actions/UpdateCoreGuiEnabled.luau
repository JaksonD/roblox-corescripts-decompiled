local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Flags.FFlagTopBarDeprecateCoreGuiRodux);
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
if v2 then
    return nil;
else
    return (l_makeActionCreator_0(script.Name, function(v4, v5) --[[ Line: 11 ]]
        return {
            coreGuiType = v4, 
            enabled = v5
        };
    end));
end;