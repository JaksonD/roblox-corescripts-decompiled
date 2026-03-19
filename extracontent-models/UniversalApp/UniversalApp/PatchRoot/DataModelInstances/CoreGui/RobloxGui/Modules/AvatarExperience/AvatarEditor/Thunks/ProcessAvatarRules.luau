local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: v4 (copy), v1 (ref), v2 (ref), v3 (ref)
        local l_minimumDeltaEBodyColorDifference_0 = v4.minimumDeltaEBodyColorDifference;
        local l_scales_0 = v4.scales;
        local l_accessoryRefinementTypes_0 = v4.accessoryRefinementTypes;
        local l_accessoryRefinementLowerBounds_0 = v4.accessoryRefinementLowerBounds;
        local l_accessoryRefinementUpperBounds_0 = v4.accessoryRefinementUpperBounds;
        v5:dispatch(v1(l_minimumDeltaEBodyColorDifference_0, l_scales_0, l_accessoryRefinementTypes_0, l_accessoryRefinementLowerBounds_0, l_accessoryRefinementUpperBounds_0));
        v5:dispatch(v2(v3.DefaultBodyColorRanges));
    end;
end;