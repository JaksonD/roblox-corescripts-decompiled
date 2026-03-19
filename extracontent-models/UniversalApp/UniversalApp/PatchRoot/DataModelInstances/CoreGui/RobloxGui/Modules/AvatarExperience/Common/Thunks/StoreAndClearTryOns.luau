local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearTryOns);
local v2 = require(l_Modules_0.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit);
return function() --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v3) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v1 (ref)
        local l_OutfitTryOn_0 = v3:getState().AvatarExperience.AvatarScene.OutfitTryOn;
        v3:dispatch(v2(l_OutfitTryOn_0));
        v3:dispatch(v1());
    end;
end;