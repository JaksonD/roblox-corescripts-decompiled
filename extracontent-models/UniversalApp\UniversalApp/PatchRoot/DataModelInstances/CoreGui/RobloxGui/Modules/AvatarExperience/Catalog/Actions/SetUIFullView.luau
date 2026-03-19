local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return v1.makeActionCreator("Catalog-" .. script.Name, function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "boolean", "isUIFullView");
    return {
        isUIFullView = v3
    };
end);