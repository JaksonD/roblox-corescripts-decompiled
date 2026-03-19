local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_Constants_0 = v2.Constants;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local l_selectCurrentAvatarEditorCategory_0 = v2.State.Selectors.selectCurrentAvatarEditorCategory;
local l_isMakeupAssetType_0 = v2.Utils.isMakeupAssetType;
local l_selectEquippedAssets_0 = v2.State.Selectors.selectEquippedAssets;
local l_AvatarEditorCategories_0 = v5.Enums.AvatarEditorCategories;
local l_FFlagAXMakeupEquipping_0 = v3.FFlagAXMakeupEquipping;
local l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0 = l_Constants_0.MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON;
local function v19(v13) --[[ Line: 20 ]] --[[ Name: getEquippedMakeupCount ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_selectEquippedAssets_0 (copy), l_isMakeupAssetType_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return 0;
    else
        local v14 = l_selectEquippedAssets_0(v13);
        if not v14 then
            return 0;
        else
            local v15 = 0;
            for v16, v17 in v14 do
                if l_isMakeupAssetType_0(v16) then
                    for _ in v17 do
                        v15 = v15 + 1;
                    end;
                end;
            end;
            return v15;
        end;
    end;
end;
return function(v20) --[[ Line: 41 ]] --[[ Name: selectIsInMakeupCategoryWithMultipleItems ]]
    -- upvalues: l_FFlagAXMakeupEquipping_0 (copy), l_selectCurrentAvatarEditorCategory_0 (copy), v6 (copy), l_AvatarEditorCategories_0 (copy), v19 (copy), l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0 (copy)
    if not l_FFlagAXMakeupEquipping_0 then
        return false;
    else
        local v21 = l_selectCurrentAvatarEditorCategory_0(v20);
        local v22 = v6()[v21];
        if not v22 or v22.Id ~= l_AvatarEditorCategories_0.Makeup then
            return false;
        else
            return v19(v20) >= l_MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON_0;
        end;
    end;
end;