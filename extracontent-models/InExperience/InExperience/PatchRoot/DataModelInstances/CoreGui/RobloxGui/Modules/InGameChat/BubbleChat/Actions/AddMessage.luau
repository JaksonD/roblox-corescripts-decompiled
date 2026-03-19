local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local v2 = require(script.Parent.Parent.Helpers.maybeAssert);
local v3 = require(script.Parent.Parent.Types);
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2(v3.IMessage(v4));
    return {
        message = v4
    };
end);