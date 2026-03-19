local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(script.Parent.selectHasBodyTryOn);
return function(v3) --[[ Line: 6 ]] --[[ Name: selectAvatarPreviewColors ]]
    -- upvalues: v2 (copy), v1 (copy)
    local l_OutfitTryOn_0 = v3.AvatarExperience.AvatarScene.OutfitTryOn;
    local l_AvatarEditor_0 = v3.AvatarExperience.AvatarEditor;
    local v6 = v2(v3);
    local l_BodyColor3s_0 = l_AvatarEditor_0.Character.BodyColor3s;
    local v8 = if not l_OutfitTryOn_0.DefaultTryOnBodyColorsToggled then l_OutfitTryOn_0.BodyColor3s else nil;
    if v6 and l_BodyColor3s_0 and v8 then
        return (v1.Dictionary.join(l_BodyColor3s_0, v8));
    else
        return l_BodyColor3s_0;
    end;
end;