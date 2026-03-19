local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetPriceRange);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v2 (copy), v3 (copy), v4 (copy)
        v5:dispatch(v1(v2, v3));
        v4.applyPriceFilter(v2, v3);
    end;
end;