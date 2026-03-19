local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v2, v3, v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    if v4 == v1.ItemType.Asset then
        return v2.AssetInfos[v3];
    elseif v4 == v1.ItemType.Bundle then
        return v2.BundleInfos[v3];
    else
        return nil;
    end;
end;