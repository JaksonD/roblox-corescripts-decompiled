local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v6 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v5.State.Selectors.selectAvatarPreviewColors else require(l_Modules_0.AvatarExperience.Common.Selectors.selectAvatarPreviewColors);
local l_selectHasBodyTryOn_0 = v5.State.Selectors.selectHasBodyTryOn;
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
return function(v10) --[[ Line: 29 ]] --[[ Name: selectRangeIdForSelectedBodyParts ]]
    -- upvalues: v9 (copy), l_selectHasBodyTryOn_0 (copy), v8 (copy), v6 (copy)
    local l_AvatarExperience_0 = v10.AvatarExperience;
    local l_selectedBodyPartIndex_0 = l_AvatarExperience_0.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
    local l_bodyPartForSkinColoringIds_0 = v9.BodyPartButtonData[l_selectedBodyPartIndex_0].bodyPartForSkinColoringIds;
    if l_bodyPartForSkinColoringIds_0 == nil or #l_bodyPartForSkinColoringIds_0 == 0 then
        return nil;
    else
        local l_BodyPartColorRangeIds_0 = l_AvatarExperience_0.AvatarScene.OutfitTryOn.BodyPartColorRangeIds;
        local v15 = l_selectHasBodyTryOn_0(v10) and l_BodyPartColorRangeIds_0 or l_AvatarExperience_0.AvatarEditor.Character.BodyPartRangeIds;
        local v16 = v8.getRangeIdSharedByBodyParts(l_bodyPartForSkinColoringIds_0, v15);
        if v16 == nil then
            return nil;
        else
            local v17 = v6(v10);
            if v8.getColor3SharedByBodyParts(l_bodyPartForSkinColoringIds_0, v17) == nil then
                return nil;
            else
                return v16;
            end;
        end;
    end;
end;