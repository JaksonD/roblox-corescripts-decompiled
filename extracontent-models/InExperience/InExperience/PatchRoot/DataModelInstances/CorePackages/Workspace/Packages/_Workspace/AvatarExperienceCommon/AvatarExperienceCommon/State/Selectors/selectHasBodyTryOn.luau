local v0 = require(script.Parent.selectTryOnBodyIds);
return function(v1) --[[ Line: 3 ]] --[[ Name: selectHasBodyTryOn ]]
    -- upvalues: v0 (copy)
    local v2 = true;
    if #v0(v1) <= 0 then
        v2 = false;
        if v1.AvatarExperience.AvatarScene.OutfitTryOn ~= nil then
            v2 = v1.AvatarExperience.AvatarScene.OutfitTryOn.LookId ~= nil;
        end;
    end;
    return v2;
end;