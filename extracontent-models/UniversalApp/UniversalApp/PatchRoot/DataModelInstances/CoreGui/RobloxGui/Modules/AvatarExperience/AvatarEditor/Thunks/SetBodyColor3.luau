local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v5.State.Selectors.selectHasBodyTryOn else require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasBodyTryOn);
local v8 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v5.State.Selectors.selectAvatarPreviewColors else require(l_Modules_0.AvatarExperience.Common.Selectors.selectAvatarPreviewColors);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColor3s);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnColorUpdated);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRangeIdToBodyPartsToSliderAndColor3Values);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
return function(v15, v16, v17, v18) --[[ Line: 40 ]]
    -- upvalues: v9 (copy), v8 (copy), v7 (copy), v12 (copy), v11 (copy), v10 (copy), v13 (copy), v14 (copy)
    return function(v19) --[[ Line: 41 ]]
        -- upvalues: v9 (ref), v8 (ref), v15 (copy), v16 (copy), v7 (ref), v12 (ref), v11 (ref), v10 (ref), v13 (ref), v17 (copy), v14 (ref), v18 (copy)
        local v20 = v19:getState();
        local l_AvatarEditor_0 = v20.AvatarExperience.AvatarEditor;
        local l_selectedBodyPartIndex_0 = l_AvatarEditor_0.BodyColorPickerSettings.selectedBodyPartIndex;
        local l_bodyPartForSkinColoringIds_0 = v9.BodyPartButtonData[l_selectedBodyPartIndex_0].bodyPartForSkinColoringIds;
        local v24 = v8(v20);
        local l_BodyPartRangeIds_0 = l_AvatarEditor_0.Character.BodyPartRangeIds;
        local v26 = {};
        local v27 = {};
        if l_bodyPartForSkinColoringIds_0 and #l_bodyPartForSkinColoringIds_0 > 0 then
            v26 = table.clone(v24);
            v27 = table.clone(l_BodyPartRangeIds_0);
            for _, v29 in l_bodyPartForSkinColoringIds_0 do
                v26[v29] = v15;
                v27[v29] = v16;
            end;
        else
            for _, v31 in v9.allBodyPartForSkinColoringIds do
                v26[v31] = v15;
                v27[v31] = v16;
            end;
        end;
        if v7(v20) then
            v19:dispatch(v12(v26, v27));
        else
            v19:dispatch(v11(v26));
            v19:dispatch(v10(v27));
        end;
        for _, v33 in l_bodyPartForSkinColoringIds_0 do
            v19:dispatch(v13(v16, v33, v17, v15));
        end;
        v19:dispatch(v14(v18.setBodyColor3s, v26));
    end;
end;