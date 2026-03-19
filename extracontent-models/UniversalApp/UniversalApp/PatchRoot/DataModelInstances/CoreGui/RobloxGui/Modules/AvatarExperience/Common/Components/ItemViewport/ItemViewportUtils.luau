local l_InsertService_0 = game:GetService("InsertService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v6 = game:DefineFastFlag("AXSupportPBRInItemViewport", false);
local v7 = game:DefineFastInt("ItemViewportFallbackCameraMaxDistance", 10000);
local v8 = game:DefineFastInt("ItemViewportFallbackCameraZoomOutFactor", 1100);
local v9 = v7 / 1000;
local v10 = v8 / 1000;
local v11 = {};
local function v15(v12, v13) --[[ Line: 24 ]] --[[ Name: waitForChildOfClass ]]
    local l_v12_FirstChildOfClass_0 = v12:FindFirstChildOfClass(v13);
    while not l_v12_FirstChildOfClass_0 do
        v12.ChildAdded:Wait();
        l_v12_FirstChildOfClass_0 = v12:FindFirstChildOfClass(v13);
    end;
    return l_v12_FirstChildOfClass_0;
end;
v11.getAssetModel = function(v16) --[[ Line: 34 ]] --[[ Name: getAssetModel ]]
    -- upvalues: v6 (copy), l_UGCValidationService_0 (copy), l_InsertService_0 (copy), v5 (copy), v15 (copy)
    local v17 = nil;
    if v6 then
        v17 = Instance.new("Model");
        l_UGCValidationService_0:FetchAssetWithFormat(("https://assetgame.roblox.com/asset/?id=%*"):format(v16), "rbx-format/avatar_meshpart_accessory")[1].Parent = v17;
    else
        v17 = l_InsertService_0:LoadAsset((tonumber(v16)));
    end;
    local v18 = nil;
    if v5() then
        v18 = v15(v17, "Accessory");
    else
        v18 = v17:FindFirstChildOfClass("Accessory");
        while not v18 do
            v17.ChildAdded:Wait();
            v18 = v17:FindFirstChildOfClass("Accessory");
        end;
    end;
    local v19 = v18.AttachmentPoint:Inverse();
    v17:PivotTo(v19 - v19.Position);
    return v17;
end;
v11.getShoesModel = function(v20) --[[ Line: 69 ]] --[[ Name: getShoesModel ]]
    -- upvalues: v4 (copy), l_InsertService_0 (copy), v15 (copy)
    local l_Model_0 = Instance.new("Model");
    for _, v23 in v20 do
        if v23.type == v4.ItemType.Asset then
            local v24 = l_InsertService_0:LoadAsset((tonumber(v23.id)));
            local v25 = v15(v24, "Accessory");
            local v26 = v15(v25, "MeshPart");
            v26.Parent = l_Model_0;
            local v27 = v26:FindFirstChild("LeftFootAttachment") ~= nil;
            local v28 = v26:FindFirstChild("RightFootAttachment") ~= nil;
            assert(v27 or v28, "Couldn't distinguish between left and right shoe because no foot attachment was found");
            local v29 = 0.05 + v26.Size.X / 2;
            v26.CFrame = CFrame.new(if v27 then -v29 else v29, 0, 0);
            v24:Destroy();
        end;
    end;
    return l_Model_0;
end;
v11.getAvatarModel = function(v30, v31) --[[ Line: 100 ]] --[[ Name: getAvatarModel ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    local v32 = nil;
    for _, v34 in v30 do
        if v34.type == v4.ItemType.Outfit then
            v32 = tonumber(v34.id);
            break;
        end;
    end;
    assert(v32, "No outfit ID found in bundle items");
    local v35 = nil;
    local v36 = nil;
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        v35 = l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v32);
        v36 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(v35, Enum.HumanoidRigType.R15);
    else
        v35 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v32);
        v36 = l_Players_0:CreateHumanoidModelFromDescription(v35, Enum.HumanoidRigType.R15);
    end;
    if v31 then
        local l_Humanoid_0 = v36:FindFirstChildOfClass("Humanoid");
        for _, v39 in v36:GetChildren() do
            if v39 ~= l_Humanoid_0 and l_Humanoid_0 and l_Humanoid_0:GetLimb(v39) ~= Enum.Limb.Head then
                v39:Destroy();
            end;
        end;
    end;
    v36.Parent = workspace;
    local v40 = v36:GetBoundingBox().Position - v36:GetPivot().Position;
    v36.Parent = nil;
    v36:PivotTo(CFrame.new(-v40));
    return v36;
end;
v11.getBundleModel = function(v41, v42) --[[ Line: 143 ]] --[[ Name: getBundleModel ]]
    -- upvalues: l_Players_0 (copy), v4 (copy)
    local v43 = nil;
    local v44 = nil;
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        v43 = l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v42);
        v44 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(v43, Enum.HumanoidRigType.R15);
    else
        v43 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v42);
        v44 = l_Players_0:CreateHumanoidModelFromDescription(v43, Enum.HumanoidRigType.R15);
    end;
    if v41 == v4.BundleTypeIdStrings.DynamicHead then
        local l_Humanoid_1 = v44:FindFirstChildOfClass("Humanoid");
        for _, v47 in v44:GetChildren() do
            if v47 ~= l_Humanoid_1 and l_Humanoid_1 and l_Humanoid_1:GetLimb(v47) ~= Enum.Limb.Head then
                v47:Destroy();
            end;
        end;
    end;
    v44.Parent = workspace;
    local v48 = v44:GetBoundingBox().Position - v44:GetPivot().Position;
    v44.Parent = nil;
    v44:PivotTo(CFrame.new(-v48));
    return v44;
end;
v11.getCameraDistance = function(v49, v50) --[[ Line: 174 ]] --[[ Name: getCameraDistance ]]
    -- upvalues: v5 (copy), v10 (copy), v9 (copy)
    local l_Accessory_0 = v49:FindFirstChildOfClass("Accessory");
    local v52 = l_Accessory_0 and l_Accessory_0:FindFirstChildOfClass("MeshPart") ~= nil;
    local l_Humanoid_2 = v49:FindFirstChildOfClass("Humanoid");
    local v54 = v5() and v49:FindFirstChild("LeftFootAttachment", true) ~= nil and v49:FindFirstChild("RightFootAttachment", true) ~= nil;
    local v55 = l_Accessory_0 and l_Accessory_0:FindFirstChild("ThumbnailConfiguration");
    local v56 = 1 / math.sin((math.rad(v50 / 2))) * v10;
    if v52 or l_Humanoid_2 or v5() and v54 then
        if l_Humanoid_2 then
            v49.Parent = workspace;
        end;
        local _, v58 = v49:GetBoundingBox();
        if l_Humanoid_2 then
            v49.Parent = nil;
        end;
        return (v58 / 2).Magnitude / math.sin((math.rad(v50 / 2)));
    elseif v55 then
        local l_ThumbnailCameraValue_0 = v55:FindFirstChild("ThumbnailCameraValue");
        local v60 = l_ThumbnailCameraValue_0 and l_ThumbnailCameraValue_0.Value;
        local v61 = v60 and v60.Position.Magnitude;
        if v61 and v61 < v9 then
            return v61 * v10;
        else
            return v56;
        end;
    else
        return v56;
    end;
end;
return v11;