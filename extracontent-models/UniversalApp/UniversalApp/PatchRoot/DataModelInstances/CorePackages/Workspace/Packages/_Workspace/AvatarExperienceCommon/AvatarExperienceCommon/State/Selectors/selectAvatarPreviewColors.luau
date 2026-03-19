local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_join_0 = require(l_Parent_0.Dash).join;
local v2 = require(script.Parent.selectHasBodyTryOn);
local v3 = require(script.Parent.selectDefaultTryOnBodyColors);
return function(v4) --[[ Line: 9 ]] --[[ Name: selectAvatarPreviewColors ]]
    -- upvalues: v2 (copy), v3 (copy), l_join_0 (copy)
    local l_OutfitTryOn_0 = v4.AvatarExperience.AvatarScene.OutfitTryOn;
    local l_AvatarEditor_0 = v4.AvatarExperience.AvatarEditor;
    local v7 = v2(v4);
    local l_BodyColor3s_0 = l_AvatarEditor_0.Character.BodyColor3s;
    local v9 = if l_OutfitTryOn_0.DefaultTryOnBodyColorsToggled then v3(v4) else l_OutfitTryOn_0.BodyColor3s;
    if v7 and l_BodyColor3s_0 and v9 then
        return (l_join_0(l_BodyColor3s_0, v9));
    else
        return l_BodyColor3s_0;
    end;
end;