local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.OverlayFocusHandler);
return function(v4) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy)
    return function(v5) --[[ Line: 16 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (copy)
        return v2.createElement(v3, {
            overlayComponent = v4, 
            arguments = v5
        });
    end;
end;