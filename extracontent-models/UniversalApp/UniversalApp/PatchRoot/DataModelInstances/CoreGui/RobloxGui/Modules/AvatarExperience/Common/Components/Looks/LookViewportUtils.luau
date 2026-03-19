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
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookViewportCameraAlignment);
local v12 = game:DefineFastFlag("AXFixMySharedAvatarMutedError", false);
local l_FFlagParseHeadShapeFromAPIResponse_0 = v10.FFlagParseHeadShapeFromAPIResponse;
local v14 = {
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
local v36 = {
    createHumanoidDescriptionFromLook = function(v15) --[[ Line: 35 ]] --[[ Name: createHumanoidDescriptionFromLook ]]
        -- upvalues: v14 (copy), v8 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy)
        local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
        if v15.lookType == "Outfit" then
            l_HumanoidDescription_0.HeadColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.TorsoColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightLegColor = BrickColor.new("Medium stone grey").Color;
            for _, v18 in v14 do
                l_HumanoidDescription_0[v8.AssetTypeIdStringToHumanoidDescriptionProp[tostring(v18.assetTypeId)]] = v18.id;
            end;
        end;
        local v19 = {};
        if v15.lookAssetInfos then
            for _, v21 in v15.lookAssetInfos do
                local v22 = tostring(v21.assetType);
                local v23 = v8.AssetTypeIdToAccessoryTypeEnum[v22];
                if v23 then
                    table.insert(v19, {
                        AssetId = tonumber(v21.id) or 0, 
                        Order = if v21.meta then v21.meta.order else nil, 
                        AccessoryType = v23
                    });
                else
                    l_HumanoidDescription_0[v8.AssetTypeIdStringToHumanoidDescriptionProp[v22]] = v21.id;
                end;
            end;
        end;
        if v15.lookBundleInfos then
            for _, v25 in v15.lookBundleInfos do
                for _, v27 in v25.assetsInBundle do
                    if v27.isIncluded then
                        local v28 = tostring(v27.assetType);
                        local v29 = v8.AssetTypeIdToAccessoryTypeEnum[v28];
                        if v29 then
                            table.insert(v19, {
                                AssetId = tonumber(v27.id) or 0, 
                                Order = if v27.meta then v27.meta.order else nil, 
                                AccessoryType = v29
                            });
                        else
                            local v30 = v8.AssetTypeIdStringToHumanoidDescriptionProp[v28];
                            if l_FFlagParseHeadShapeFromAPIResponse_0 and v8.BodyPartNameToEnum[v30] then
                                local l_BodyPartDescription_0 = Instance.new("BodyPartDescription");
                                l_BodyPartDescription_0.AssetId = v27.id;
                                l_BodyPartDescription_0.Parent = l_HumanoidDescription_0;
                                l_BodyPartDescription_0.BodyPart = v8.BodyPartNameToEnum[v30];
                                if v27.meta and v27.meta.headShape then
                                    l_BodyPartDescription_0.HeadShape = v27.meta.headShape == "Default" and "" or v27.meta.headShape;
                                end;
                            else
                                l_HumanoidDescription_0[v30] = v27.id;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        l_HumanoidDescription_0:SetAccessories(v19, true);
        if v15.avatarProperties and v15.avatarProperties.bodyColor3s then
            for v32, v33 in v15.avatarProperties.bodyColor3s do
                l_HumanoidDescription_0[v8.BodyPartForSkinColoringIdToHumanoidDescription[v32]] = Color3.fromHex(v33);
            end;
        else
            l_HumanoidDescription_0.HeadColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightArmColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.TorsoColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.LeftLegColor = BrickColor.new("Medium stone grey").Color;
            l_HumanoidDescription_0.RightLegColor = BrickColor.new("Medium stone grey").Color;
        end;
        if v15.avatarProperties and v15.avatarProperties.scale then
            for v34, v35 in v15.avatarProperties.scale do
                l_HumanoidDescription_0[v8.HumanoidDescriptionScaleToName[v34]] = v35;
            end;
        end;
        return l_HumanoidDescription_0;
    end
};
v36.createAvatarModel = function(v37) --[[ Line: 136 ]] --[[ Name: createAvatarModel ]]
    -- upvalues: v36 (copy), l_Players_0 (copy), v11 (copy), l_EmoteUtility_0 (copy)
    local v38 = v36.createHumanoidDescriptionFromLook(v37);
    local v39 = nil;
    v39 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(v38, Enum.HumanoidRigType.R15) else l_Players_0:CreateHumanoidModelFromDescription(v38, Enum.HumanoidRigType.R15);
    v39:WaitForChild("HumanoidRootPart").Anchored = true;
    v39:PivotTo(CFrame.new(0, 1000, 0));
    v39.Parent = workspace;
    if not v11() then
        local v40 = v37.displayProperties and v37.displayProperties.emoteAssetId;
        if v40 then
            local v41 = l_EmoteUtility_0.LoadKeyframesForPose(v39, tonumber(v40), 10647852134, true, false);
            l_EmoteUtility_0.ApplyKeyframesForPose(v39, v41);
        end;
    end;
    return v39;
end;
v36.applyPose = function(v42, v43) --[[ Line: 164 ]] --[[ Name: applyPose ]]
    -- upvalues: l_EmoteUtility_0 (copy)
    local v44 = l_EmoteUtility_0.LoadKeyframesForPose(v43, tonumber(v42), 10647852134, true, false);
    l_EmoteUtility_0.ApplyKeyframesForPose(v43, v44);
    task.wait();
end;
v36.loadAnimationTrackForAvatar = function(v45, v46) --[[ Line: 171 ]] --[[ Name: loadAnimationTrackForAvatar ]]
    local l_Humanoid_0 = v46:FindFirstChildOfClass("Humanoid");
    local v48 = l_Humanoid_0 and l_Humanoid_0:FindFirstChildOfClass("Animator");
    if not v48 or #v48:GetPlayingAnimationTracks() > 0 then
        return nil;
    else
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.AnimationId = "rbxassetid://" .. v45;
        local v50 = v48:LoadAnimation(l_Animation_0);
        v50.Looped = false;
        return v50;
    end;
end;
v36.areLooksDifferent = function(v51, v52) --[[ Line: 187 ]] --[[ Name: areLooksDifferent ]]
    -- upvalues: v4 (copy)
    if v51 == v52 then
        return false;
    elseif not v51 or not v52 then
        return true;
    else
        local v53 = not v4.deepEqual(v51.lookAssetInfos, v52.lookAssetInfos);
        local v54 = not v4.deepEqual(v51.lookBundleInfos, v52.lookBundleInfos);
        local v55 = (v51.displayProperties and v51.displayProperties.emoteAssetId) ~= (v52.displayProperties and v52.displayProperties.emoteAssetId);
        local v56 = not v4.deepEqual(v51.avatarProperties, v52.avatarProperties);
        return v53 or v54 or v55 or v56;
    end;
end;
v36.hydratedLookToLookDetails = function(v57) --[[ Line: 207 ]] --[[ Name: hydratedLookToLookDetails ]]
    -- upvalues: v6 (copy), v12 (copy), v9 (copy)
    local v58 = {
        totalPrice = 0, 
        totalPremiumPrice = 0, 
        lookAssetInfos = {}, 
        lookBundleInfos = {}
    };
    local v59 = if v57.assetsIncludingBundleParts then v6.List.join(v57.assets, v57.assetsIncludingBundleParts) else v57.assets;
    if v59 then
        for _, v61 in v59 do
            if not v12 or v61.assetType then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 224 ]]
                    -- upvalues: v61 (copy)
                    return Enum.AssetType[v61.assetType].Value;
                end);
                if l_status_0 then
                    v58.lookAssetInfos[tostring(v61.id)] = {
                        id = tostring(v61.id), 
                        itemType = v61.type, 
                        assetType = l_result_0, 
                        meta = if v61.order then {
                            order = v61.order
                        } else nil, 
                        quantityOwned = 0
                    };
                else
                    v9((("Incorrect asseType received from hydrated look: \"%*\" does not map to an Enum.AssetType (%*)"):format(v61.assetType, l_result_0)));
                end;
            end;
        end;
    end;
    local l_avatarProperties_0 = v57.avatarProperties;
    if l_avatarProperties_0 then
        v58.avatarProperties = {
            bodyColor3s = l_avatarProperties_0.bodyColors, 
            playerAvatarType = l_avatarProperties_0.playerAvatarType, 
            scale = l_avatarProperties_0.scales
        };
    end;
    return v58;
end;
return v36;