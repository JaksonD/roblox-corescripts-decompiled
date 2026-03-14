return function(v0) --[[ Line: 1 ]] --[[ Name: selectDefaultTryOnBodyColorsToggled ]]
    local l_OutfitTryOn_0 = v0.AvatarExperience.AvatarScene.OutfitTryOn;
    if l_OutfitTryOn_0 then
        return l_OutfitTryOn_0.DefaultTryOnBodyColorsToggled;
    else
        return false;
    end;
end;