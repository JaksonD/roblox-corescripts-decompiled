local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.AppliedDescriptionValueContext);
return function() --[[ Line: 7 ]] --[[ Name: useAppliedDescriptionValueContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;