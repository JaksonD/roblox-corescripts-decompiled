local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.tutils);
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local v6 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_isMakeupAssetType_0 = v10.Utils.isMakeupAssetType;
local l_setMakeupDescriptions_0 = v10.Utils.setMakeupDescriptions;
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookViewportCameraAlignment);
local v15 = game:DefineFastFlag("AXFixMySharedAvatarMutedError", false);
local l_FFlagParseHeadShapeFromAPIResponse_0 = v11.FFlagParseHeadShapeFromAPIResponse;
local l_FFlagAXCommunityAvatarsMakeupEquipping_0 = v11.FFlagAXCommunityAvatarsMakeupEquipping;
local v18 = {
    {
        id = 14461759190, 
        assetTypeId = 29
    }, 
    {
        id = 14461763778, 
        assetTypeId = 30
    }, 
    {
        id = 14461769598, 
        assetTypeId = 28
    }, 
    {
        id = 14461775685, 
        assetTypeId = 31
    }, 
    {
        id = 14461780409, 
        assetTypeId = 27
    }, 
    {
        id = 14461797943, 
        assetTypeId = 17
    }
};
local v42 = {
    createHumanoidDescriptionFromLook = function(v19) --[[ Line: 39 ]] --[[ Name: createHumanoidDescriptionFromLook ]]
        -- upvalues: v18 (copy), v8 (copy), l_FFlagAXCommunityAvatarsMakeupEquipping_0 (copy), l_isMakeupAssetType_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), l_setMakeupDescriptions_0 (copy)
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        if v19.lookType == "Outfit" then
            l_HumanoidDescription_0.HeadColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.TorsoColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightLegColor = BrickColor.new("Medium stone grey").Color;
            for _, v22 in v18 do
                l_HumanoidDescription_0[v8.AssetTypeIdStringToHumanoidDescriptionProp[tostring(v22.assetTypeId)]] = v22.id;
            end;
        end;
        local v23 = {};
        local v24 = if l_FFlagAXCommunityAvatarsMakeupEquipping_0 then {} else nil;
        if v19.lookAssetInfos then
            for _, v26 in v19.lookAssetInfos do
                local v27 = tostring(v26.assetType);
                local v28 = v8.AssetTypeIdToAccessoryTypeEnum[v27];
                if v28 then
                    table.insert(v23, {
                        AssetId = tonumber(v26.id) or 0, 
                        Order = if v26.meta then v26.meta.order else nil, 
                        AccessoryType = v28
                    });
                elseif l_FFlagAXCommunityAvatarsMakeupEquipping_0 and l_isMakeupAssetType_0(v27) then
                    if not v24[v27] then
                        v24[v27] = {};
                    end;
                    v24[v27][tostring(v26.id)] = {
                        order = if v26.meta then v26.meta.order else nil
                    };
                elseif l_FFlagAXCommunityAvatarsMakeupEquipping_0 then
                    local v29 = v8.AssetTypeIdStringToHumanoidDescriptionProp[v27];
                    if v29 then
                        l_HumanoidDescription_0[v29] = v26.id;
                    end;
                else
                    l_HumanoidDescription_0[v8.AssetTypeIdStringToHumanoidDescriptionProp[v27]] = v26.id;
                end;
            end;
        end;
        if v19.lookBundleInfos then
            for _, v31 in v19.lookBundleInfos do
                for _, v33 in v31.assetsInBundle do
                    if v33.isIncluded then
                        local v34 = tostring(v33.assetType);
                        local v35 = v8.AssetTypeIdToAccessoryTypeEnum[v34];
                        if v35 then
                            table.insert(v23, {
                                AssetId = tonumber(v33.id) or 0, 
                                Order = if v33.meta then v33.meta.order else nil, 
                                AccessoryType = v35
                            });
                        elseif l_FFlagAXCommunityAvatarsMakeupEquipping_0 and l_isMakeupAssetType_0(v34) then
                            if not v24[v34] then
                                v24[v34] = {};
                            end;
                            v24[v34][tostring(v33.id)] = {
                                order = if v33.meta then v33.meta.order else nil
                            };
                        else
                            local v36 = v8.AssetTypeIdStringToHumanoidDescriptionProp[v34];
                            if l_FFlagParseHeadShapeFromAPIResponse_0 and v8.BodyPartNameToEnum[v36] then
                                local l_BodyPartDescription_0 = Instance.new("BodyPartDescription");
                                l_BodyPartDescription_0.AssetId = v33.id;
                                l_BodyPartDescription_0.Parent = l_HumanoidDescription_0;
                                l_BodyPartDescription_0.BodyPart = v8.BodyPartNameToEnum[v36];
                                if v33.meta and v33.meta.headShape then
                                    l_BodyPartDescription_0.HeadShape = v33.meta.headShape == "Default" and "" or v33.meta.headShape;
                                end;
                            elseif l_FFlagAXCommunityAvatarsMakeupEquipping_0 then
                                if v36 then
                                    l_HumanoidDescription_0[v36] = v33.id;
                                end;
                            else
                                l_HumanoidDescription_0[v36] = v33.id;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if l_FFlagAXCommunityAvatarsMakeupEquipping_0 then
            l_setMakeupDescriptions_0(l_HumanoidDescription_0, v24);
        end;
        l_HumanoidDescription_0:SetAccessories(v23, true);
        if v19.avatarProperties and v19.avatarProperties.bodyColor3s then
            for v38, v39 in v19.avatarProperties.bodyColor3s do
                l_HumanoidDescription_0[v8.BodyPartForSkinColoringIdToHumanoidDescription[v38]] = Color3.fromHex(v39);
            end;
        else
            l_HumanoidDescription_0.HeadColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.TorsoColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightLegColor = BrickColor.new("Medium stone grey").Color;
        end;
        if v19.avatarProperties and v19.avatarProperties.scale then
            for v40, v41 in v19.avatarProperties.scale do
                l_HumanoidDescription_0[v8.HumanoidDescriptionScaleToName[v40]] = v41;
            end;
        end;
        return l_HumanoidDescription_0;
    end
};
v42.createAvatarModel = function(v43) --[[ Line: 172 ]] --[[ Name: createAvatarModel ]]
    -- upvalues: v42 (copy), l_Players_0 (copy), v14 (copy), l_EmoteUtility_0 (copy)
    local v44 = v42.createHumanoidDescriptionFromLook(v43);
    local v45 = nil;
    v45 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(v44, Enum.HumanoidRigType.R15) else l_Players_0:CreateHumanoidModelFromDescription(v44, Enum.HumanoidRigType.R15);
    v45:WaitForChild("HumanoidRootPart").Anchored = true;
    v45:PivotTo(CFrame.new(0, 1000, 0));
    v45.Parent = workspace;
    if not v14() then
        local v46 = v43.displayProperties and v43.displayProperties.emoteAssetId;
        if v46 then
            local v47 = l_EmoteUtility_0.LoadKeyframesForPose(v45, tonumber(v46), 10647852134, true, false);
            l_EmoteUtility_0.ApplyKeyframesForPose(v45, v47);
        end;
    end;
    return v45;
end;
v42.applyPose = function(v48, v49) --[[ Line: 200 ]] --[[ Name: applyPose ]]
    -- upvalues: l_EmoteUtility_0 (copy)
    local v50 = l_EmoteUtility_0.LoadKeyframesForPose(v49, tonumber(v48), 10647852134, true, false);
    l_EmoteUtility_0.ApplyKeyframesForPose(v49, v50);
    task.wait();
end;
v42.loadAnimationTrackForAvatar = function(v51, v52) --[[ Line: 207 ]] --[[ Name: loadAnimationTrackForAvatar ]]
    local l_Humanoid_0 = v52:FindFirstChildOfClass("Humanoid");
    local v54 = l_Humanoid_0 and l_Humanoid_0:FindFirstChildOfClass("Animator");
    if not v54 or #v54:GetPlayingAnimationTracks() > 0 then
        return nil;
    else
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.AnimationId = "rbxassetid://" .. v51;
        local v56 = v54:LoadAnimation(l_Animation_0);
        v56.Looped = false;
        return v56;
    end;
end;
v42.areLooksDifferent = function(v57, v58) --[[ Line: 223 ]] --[[ Name: areLooksDifferent ]]
    -- upvalues: v4 (copy)
    if v57 == v58 then
        return false;
    elseif not v57 or not v58 then
        return true;
    else
        local v59 = not v4.deepEqual(v57.lookAssetInfos, v58.lookAssetInfos);
        local v60 = not v4.deepEqual(v57.lookBundleInfos, v58.lookBundleInfos);
        local v61 = (v57.displayProperties and v57.displayProperties.emoteAssetId) ~= (v58.displayProperties and v58.displayProperties.emoteAssetId);
        local v62 = not v4.deepEqual(v57.avatarProperties, v58.avatarProperties);
        return v59 or v60 or v61 or v62;
    end;
end;
v42.hydratedLookToLookDetails = function(v63) --[[ Line: 243 ]] --[[ Name: hydratedLookToLookDetails ]]
    -- upvalues: v6 (copy), v15 (copy), v9 (copy)
    local v64 = {
        totalPrice = 0, 
        totalPremiumPrice = 0, 
        lookAssetInfos = {}, 
        lookBundleInfos = {}
    };
    local v65 = if v63.assetsIncludingBundleParts then v6.List.join(v63.assets, v63.assetsIncludingBundleParts) else v63.assets;
    if v65 then
        for _, v67 in v65 do
            if not v15 or v67.assetType then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 260 ]]
                    -- upvalues: v67 (copy)
                    return Enum.AssetType[v67.assetType].Value;
                end);
                if l_status_0 then
                    v64.lookAssetInfos[tostring(v67.id)] = {
                        id = tostring(v67.id), 
                        itemType = v67.type, 
                        assetType = l_result_0, 
                        meta = if v67.order then {
                            order = v67.order
                        } else nil, 
                        quantityOwned = 0
                    };
                else
                    v9((("Incorrect asseType received from hydrated look: \"%*\" does not map to an Enum.AssetType (%*)"):format(v67.assetType, l_result_0)));
                end;
            end;
        end;
    end;
    local l_avatarProperties_0 = v63.avatarProperties;
    if l_avatarProperties_0 then
        v64.avatarProperties = {
            bodyColor3s = l_avatarProperties_0.bodyColors, 
            playerAvatarType = l_avatarProperties_0.playerAvatarType, 
            scale = l_avatarProperties_0.scales
        };
    end;
    return v64;
end;
return v42;