local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_LOOK_TYPE_0 = require(l_script_FirstAncestor_0.Constants).LOOK_TYPE;
local l_FFlagAXMISEnableMultiShopping_0 = v2.FFlagAXMISEnableMultiShopping;
return function(v5) --[[ Line: 14 ]] --[[ Name: selectTryOnsLookId ]]
    -- upvalues: l_FFlagAXMISEnableMultiShopping_0 (copy), l_LOOK_TYPE_0 (copy)
    local v6 = if l_FFlagAXMISEnableMultiShopping_0 then v5.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledLookType else nil;
    if l_FFlagAXMISEnableMultiShopping_0 and v6 == l_LOOK_TYPE_0.Makeup then
        return v5.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId;
    else
        return v5.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
    end;
end;