local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_CorePackages_0.Packages.Rodux).makeActionCreator(script.Name, function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v1.isType(v2, "table", "marketplaceFeeInfo");
    return {
        marketplaceFeeInfo = v2
    };
end);