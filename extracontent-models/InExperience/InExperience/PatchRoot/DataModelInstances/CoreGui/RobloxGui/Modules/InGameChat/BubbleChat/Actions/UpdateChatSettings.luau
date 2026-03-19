local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(script.Parent.Parent.Helpers.maybeAssert);
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3(v2.table(v4));
    return {
        settings = v4
    };
end);