local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Context.AdaptiveScrollingContext);
return function() --[[ Line: 16 ]] --[[ Name: useAdaptiveScrolling ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.useContext(v3);
end;