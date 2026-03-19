local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local _ = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
return l_makeActionCreator_0(script.Name, function(v3, v4) --[[ Line: 5 ]]
    return {
        searchUuid = v3, 
        sorts = v4
    };
end);