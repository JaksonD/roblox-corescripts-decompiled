local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v2 = require(script.Parent.selectAvatarPreviewColors);
return function(v3) --[[ Line: 8 ]] --[[ Name: selectColorAdjustmentButtonColor ]]
    -- upvalues: l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 (copy), v2 (copy)
    local v4 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v2(v3) else v3.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    if v4 then
        local l_headColor3_0 = v4.headColor3;
        local l_torsoColor3_0 = v4.torsoColor3;
        return l_headColor3_0 or l_torsoColor3_0 or Color3.new();
    else
        return Color3.new();
    end;
end;