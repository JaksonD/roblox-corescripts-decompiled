local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local l_CharacterHistoryStateChangeButtonActivated_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v9 = {
    AnimationPreview = nil, 
    AnimationPreviewAssetTypeIdString = nil
};
return v3.createReducer(v9, {
    [v5.name] = function(v10, _) --[[ Line: 31 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v10, {
            AnimationPreview = v4.None, 
            AnimationPreviewAssetTypeIdString = v4.None
        });
    end, 
    [v6.name] = function(v12, v13) --[[ Line: 38 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v12, {
            AnimationPreview = v13.assetId, 
            AnimationPreviewAssetTypeIdString = v13.assetTypeIdString
        });
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v14, v15) --[[ Line: 45 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v15.tryOn and v15.tryOn.TryOn then
            return table.clone(v15.tryOn.TryOn);
        else
            return v14;
        end;
    end
});