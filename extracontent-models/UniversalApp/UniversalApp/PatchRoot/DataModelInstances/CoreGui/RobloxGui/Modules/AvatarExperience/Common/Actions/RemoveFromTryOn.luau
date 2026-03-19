local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
if require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then
    return v1.makeActionCreator(script.Name, function(v2, v3) --[[ Line: 12 ]]
        return {
            itemId = v2, 
            itemType = v3
        };
    end);
else
    return v1.makeActionCreator(script.Name, function(v4) --[[ Line: 20 ]]
        return {
            itemId = v4
        };
    end);
end;