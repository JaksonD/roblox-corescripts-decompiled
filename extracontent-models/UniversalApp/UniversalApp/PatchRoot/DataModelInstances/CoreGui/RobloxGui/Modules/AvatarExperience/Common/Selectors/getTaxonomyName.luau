local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v2) --[[ Line: 8 ]] --[[ Name: getTaxonomyName ]]
    if v2 and #v2 > 0 then
        return v2[1].taxonomyName;
    else
        return nil;
    end;
end;