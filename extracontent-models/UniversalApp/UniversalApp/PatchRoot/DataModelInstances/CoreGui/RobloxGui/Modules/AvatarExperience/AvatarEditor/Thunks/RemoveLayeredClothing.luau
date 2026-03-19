local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.hasLayeredHair);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveLayeredClothing);
return function() --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v3) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref)
        local v4 = v1(v3:getState());
        v3:dispatch(v2(v4));
    end;
end;