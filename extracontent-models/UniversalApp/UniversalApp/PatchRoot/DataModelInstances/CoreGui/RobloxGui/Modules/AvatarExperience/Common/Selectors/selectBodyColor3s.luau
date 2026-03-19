local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
return function(v2) --[[ Line: 4 ]] --[[ Name: selectBodyColor3s ]]
    -- upvalues: v1 (copy)
    return v1.Dictionary.values(v2.AvatarExperience.AvatarEditor.Character.BodyColor3s);
end;