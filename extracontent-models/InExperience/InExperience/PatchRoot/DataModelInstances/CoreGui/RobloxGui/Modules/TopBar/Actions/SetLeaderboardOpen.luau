local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Flags.FFlagTopBarDeprecateMoreMenuRodux);
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
if v2 then
    return nil;
else
    return (l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 11 ]]
        return {
            open = v4
        };
    end));
end;