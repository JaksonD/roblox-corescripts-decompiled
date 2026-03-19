local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator(script.Name, function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "table", "SetBundleInfoFromSortResults expects sortResults");
    return {
        sortResults = v3
    };
end);