local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local v4 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v5 = require(l_Modules_0.AvatarExperience.Common.Selectors.SelectIsToolEquipped);
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationManagerTypes);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId);
local v11 = require(l_Modules_0.AvatarExperience.Common.Managers.AnimationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v13 = {};
local function _(v14) --[[ Line: 32 ]] --[[ Name: avatarIsHoldingTool ]]
    if v14 then
        return v14:getEquippedToolModel() ~= nil;
    else
        return false;
    end;
end;
v13.getDidSomethingRequiringPPEPoseAdjustment = function(v16, v17, v18) --[[ Line: 46 ]]
    -- upvalues: v4 (copy), v5 (copy)
    if v16.AvatarExperience.AvatarScene.Character.CharacterModelVersion ~= v17.AvatarExperience.AvatarScene.Character.CharacterModelVersion then
        return true;
    else
        local l_finalPageViewMode_0 = v16.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
        local l_finalPageViewMode_1 = v17.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode;
        if l_finalPageViewMode_0 ~= l_finalPageViewMode_1 then
            if l_finalPageViewMode_0 == v4.Closeup and l_finalPageViewMode_1 == v4.FullBody then
                if v5(v17) and not if v18 then v18:getEquippedToolModel() ~= nil else false then
                    return false;
                else
                    return true;
                end;
            elseif l_finalPageViewMode_0 == v4.FullBody and l_finalPageViewMode_1 == v4.Closeup then
                if v5(v17) and if v18 then v18:getEquippedToolModel() ~= nil else false then
                    return false;
                else
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
v13.getAssetIdsToLoad = function(v21, v22) --[[ Line: 100 ]]
    -- upvalues: v6 (copy)
    local v23 = {
        ppeEmoteAssetId = v6.getAssetIdForPPEPose(v21)
    };
    if v22 then
        v23.moodAssetId = v6.getEquippedMoodAssetId(v21);
    end;
    return v23;
end;
local v24 = false;
v13.makeLoadedAssets = function(v25, v26, v27) --[[ Line: 117 ]]
    -- upvalues: v24 (ref), v9 (copy), l_EmoteUtility_0 (copy), v8 (copy)
    local v28 = {};
    local l_CurrentCharacter_0 = v25:getState().AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return v28;
    elseif not l_CurrentCharacter_0:FindFirstChildOfClass("Humanoid") then
        return v28;
    else
        assert(v24 == false, "promiseHasOutstandingPPELoading should be false");
        v25:dispatch(v9());
        v24 = true;
        local v30 = nil;
        local v31 = nil;
        if v27.ppeEmoteAssetId then
            v30 = tonumber(v27.ppeEmoteAssetId);
        end;
        if v27.moodAssetId then
            v31 = tonumber(v27.moodAssetId);
        end;
        local v32 = not v26.ppeFinalPageFullView;
        v28.keyframesForPose = l_EmoteUtility_0.LoadKeyframesForPose(l_CurrentCharacter_0, v30, v31, true, v32);
        v25:dispatch(v8());
        v24 = false;
        return v28;
    end;
end;
v13.maybeNoteLoadingFinished = function(v33) --[[ Line: 182 ]]
    -- upvalues: v24 (ref), v8 (copy)
    if v24 then
        v33:dispatch(v8());
    end;
    v24 = false;
end;
v13.applyNewProfilePictureEditorPose = function(v34, v35, v36, v37) --[[ Line: 189 ]]
    -- upvalues: l_EmoteUtility_0 (copy), v11 (copy), v10 (copy)
    assert(v35, "currentCharacter is non-nil.");
    assert(v36, "humanoid is non-nil..");
    if not v37 then
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(v35);
        if Enum.HumanoidRigType.R6 == v36.RigType then
            l_EmoteUtility_0.AdjustArmOnR6ForTool(v35);
        end;
    else
        l_EmoteUtility_0.ApplyKeyframesForPose(v35, v37);
    end;
    local v38 = nil;
    if v37 then
        v38 = v37.finalAnimationAssetIdOrUrl;
        if v38 then
            v38 = tostring(v38);
        end;
    end;
    v11.waitForAnimationAndPosingToResolve(function() --[[ Line: 218 ]]
        -- upvalues: v34 (copy), v10 (ref), v38 (ref)
        v34:dispatch(v10(v38));
    end);
end;
v13.undoOldProfilePictureEditorPose = function(v39, v40, v41) --[[ Line: 223 ]]
    -- upvalues: l_EmoteUtility_0 (copy), v10 (copy)
    if v41 and v40 then
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(v40);
        v39:dispatch(v10(nil));
    end;
end;
return v13;