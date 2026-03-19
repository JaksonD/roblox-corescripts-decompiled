local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(script.Parent.Parent.Models.CollectibleInstance);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2, v3) --[[ Line: 8 ]]
    return {
        collectibleItemId = v2, 
        collectibleItemInstances = v3
    };
end);