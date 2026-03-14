local l_Players_0 = game:GetService("Players");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v3 = {};
local v4 = game:DefineFastString("AvatarSwitcherEmoteIds", "3344650532,3344585679,5911729486");
local l_FFlagAvatarSwitcherAccurateAvatarWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning;
v3.buildOutfitModel = function(v6, v7) --[[ Line: 16 ]] --[[ Name: buildOutfitModel ]]
    -- upvalues: l_Players_0 (copy), l_AvatarEditorService_0 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        local l_l_Players_0_HumanoidDescriptionFromOutfitIdAsync_0 = l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v6);
        local v9 = l_AvatarEditorService_0:ConformToAvatarRulesAsync(l_l_Players_0_HumanoidDescriptionFromOutfitIdAsync_0);
        local l_l_Players_0_HumanoidModelFromDescriptionAsync_0 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(v9, v7);
        if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
            return l_l_Players_0_HumanoidModelFromDescriptionAsync_0, v9;
        else
            return l_l_Players_0_HumanoidModelFromDescriptionAsync_0;
        end;
    else
        local l_l_Players_0_HumanoidDescriptionFromOutfitId_0 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v6);
        local v12 = l_AvatarEditorService_0:ConformToAvatarRules(l_l_Players_0_HumanoidDescriptionFromOutfitId_0);
        local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(v12, v7);
        if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then
            return l_l_Players_0_HumanoidModelFromDescription_0, v12;
        else
            return l_l_Players_0_HumanoidModelFromDescription_0;
        end;
    end;
end;
v3.getCameraDistance = function(v14, v15) --[[ Line: 39 ]] --[[ Name: getCameraDistance ]]
    local _, v17 = v14:GetBoundingBox();
    return (v17 / 2).Magnitude / math.sin((math.rad(v15 / 2)));
end;
v3.loadIdleAnimationForAvatar = function(v18) --[[ Line: 47 ]] --[[ Name: loadIdleAnimationForAvatar ]]
    local l_Humanoid_0 = v18:FindFirstChildOfClass("Humanoid");
    local v20 = l_Humanoid_0 and l_Humanoid_0:FindFirstChildOfClass("Animator");
    if not v20 then
        return nil;
    else
        local l_Animate_0 = v18:FindFirstChild("Animate");
        if not l_Animate_0 then
            return nil;
        else
            local l_idle_0 = l_Animate_0:FindFirstChild("idle");
            if not l_idle_0 then
                return nil;
            else
                local l_Animation_0 = l_idle_0:FindFirstChildOfClass("Animation");
                if not l_Animation_0 then
                    return nil;
                else
                    local v24 = v20:LoadAnimation(l_Animation_0);
                    v24.Looped = true;
                    return v24;
                end;
            end;
        end;
    end;
end;
v3.loadAnimationTrackForAvatar = function(v25, v26) --[[ Line: 75 ]] --[[ Name: loadAnimationTrackForAvatar ]]
    local l_Humanoid_1 = v26:FindFirstChildOfClass("Humanoid");
    local v28 = l_Humanoid_1 and l_Humanoid_1:FindFirstChildOfClass("Animator");
    if not v28 then
        return nil;
    else
        local l_Animation_1 = Instance.new("Animation");
        l_Animation_1.AnimationId = "rbxassetid://" .. v25;
        return (v28:LoadAnimation(l_Animation_1));
    end;
end;
local v30 = nil;
v3.playRandomEmote = function(v31) --[[ Line: 90 ]] --[[ Name: playRandomEmote ]]
    -- upvalues: v4 (copy), v30 (ref), v3 (copy)
    local l_Humanoid_2 = v31:FindFirstChildOfClass("Humanoid");
    local v33 = l_Humanoid_2 and l_Humanoid_2.RigType == Enum.HumanoidRigType.R15;
    local v34 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 95 ]]
        -- upvalues: v4 (ref)
        return string.split(v4);
    end);
    if v33 and l_status_0 and #l_result_0 > 0 then
        local v37 = nil;
        repeat
            v37 = l_result_0[math.random(#l_result_0)];
        until v37 ~= v30 or #l_result_0 == 1;
        v34 = v3.loadAnimationTrackForAvatar(v37, v31);
        v30 = v37;
    end;
    task.spawn(function() --[[ Line: 110 ]]
        -- upvalues: v34 (ref), v31 (copy), v3 (ref)
        if v34 then
            v34.Looped = false;
            v34:Play();
            v34.Stopped:Wait();
        end;
        if v31.Parent == nil then
            return;
        else
            local v38 = v3.loadIdleAnimationForAvatar(v31);
            if v38 then
                v38.Looped = true;
                v38:Play();
            end;
            return;
        end;
    end);
end;
v3.hasMissingAccessoriesInHumanoid = function(v39, v40) --[[ Line: 134 ]] --[[ Name: hasMissingAccessoriesInHumanoid ]]
    local l_v40_Accessories_0 = v40:GetAccessories(true);
    local l_v39_Accessories_0 = v39:GetAccessories();
    return #l_v40_Accessories_0 > #l_v39_Accessories_0;
end;
local function v47(v43) --[[ Line: 146 ]] --[[ Name: getAssetIdsInHumanoidDescription ]]
    local v44 = {};
    for _, v46 in v43:GetAccessories(true) do
        v44[v46.AssetId] = true;
    end;
    v44[v43.Face] = true;
    v44[v43.Head] = true;
    v44[v43.Torso] = true;
    v44[v43.LeftArm] = true;
    v44[v43.RightArm] = true;
    v44[v43.LeftLeg] = true;
    v44[v43.RightLeg] = true;
    v44[v43.GraphicTShirt] = true;
    v44[v43.Pants] = true;
    v44[v43.Shirt] = true;
    v44[v43.ClimbAnimation] = true;
    v44[v43.FallAnimation] = true;
    v44[v43.IdleAnimation] = true;
    v44[v43.JumpAnimation] = true;
    v44[v43.MoodAnimation] = true;
    v44[v43.RunAnimation] = true;
    v44[v43.SwimAnimation] = true;
    v44[v43.WalkAnimation] = true;
    return v44;
end;
v3.hasMissingAssetsInDescription = function(v48, v49) --[[ Line: 179 ]] --[[ Name: hasMissingAssetsInDescription ]]
    -- upvalues: v47 (copy)
    local v50 = v47(v48);
    for _, v52 in v49 do
        if not v50[v52] then
            return true;
        end;
    end;
    return false;
end;
return v3;