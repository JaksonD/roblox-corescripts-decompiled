local l_AssetService_0 = game:GetService("AssetService");
local l_AvatarCreationService_0 = game:GetService("AvatarCreationService");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Thunks.OpenPublishAssetPrompt);
local v6 = require(l_Parent_0.Thunks.OpenPublishAvatarPrompt);
local v7 = require(l_Parent_0.Thunks.OpenPublishAvatarAssetPrompt);
local v8 = require(l_Parent_0.Thunks.OpenResultModal);
local v9 = require(l_Parent_0.Actions.SetHumanoidModel);
local v10 = require(l_Parent_0.Actions.SetAccessoryInstance);
local v11 = require(l_Parent_0.Actions.SetPriceInRobux);
local v12 = require(l_Parent_0.Actions.OpenValidationErrorModal);
local l_game_EngineFeature_0 = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled");
local function v20(v14) --[[ Line: 26 ]] --[[ Name: updateModelAttachmentsWithWrapDeformers ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy)
    v14.Parent = l_RobloxReplicatedStorage_0;
    for _, v16 in v14:GetChildren() do
        if v16:IsA("MeshPart") then
            local l_WrapDeformer_0 = v16:FindFirstChildWhichIsA("WrapDeformer");
            if l_WrapDeformer_0 then
                for _, v19 in v16:GetChildren() do
                    if v19:IsA("Attachment") then
                        v19.CFrame = l_WrapDeformer_0:GetDeformedCFrameAsync(v19.CFrame);
                    end;
                end;
            end;
        end;
    end;
end;
return function(v21) --[[ Line: 50 ]] --[[ Name: ConnectAssetServiceEvents ]]
    -- upvalues: l_ExperienceAuthService_0 (copy), l_game_EngineFeature_0 (copy), v5 (copy), l_AssetService_0 (copy), v6 (copy), v7 (copy), v8 (copy), l_AvatarCreationService_0 (copy), v10 (copy), v11 (copy), v20 (copy), v9 (copy), v12 (copy)
    local v22 = {};
    table.insert(v22, l_ExperienceAuthService_0.OpenAuthPrompt:Connect(function(v23, v24, v25) --[[ Line: 56 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v21 (copy), v5 (ref), l_AssetService_0 (ref), v6 (ref), v7 (ref)
        local v26 = l_game_EngineFeature_0 and v25.isVideoToAnimationFlow;
        if #v24 == 1 and v24[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not v26 then
            if v25.instanceToPublish then
                v21:dispatch(v5(v25.instanceToPublish, v25.assetType, v23, v24));
                return;
            elseif v25.serializedInstance then
                local v27 = l_AssetService_0:DeserializeInstance(v25.serializedInstance);
                v21:dispatch(v5(v27, v25.assetType, v23, v24));
                return;
            elseif v25.outfitToPublish then
                v21:dispatch(v6(v23, v24));
                return;
            elseif v25.accessoryToPublish then
                local l_accessoryType_0 = v25.accessoryType;
                v21:dispatch(v7(l_accessoryType_0, v23, v24));
            end;
        end;
    end));
    table.insert(v22, l_AssetService_0.OpenPublishResultModal:Connect(function(v29) --[[ Line: 86 ]]
        -- upvalues: v21 (copy), v8 (ref)
        v21:dispatch(v8(v29));
    end));
    local function v30() --[[ Line: 90 ]] --[[ Name: checkNewEventsExist ]]
        -- upvalues: l_AvatarCreationService_0 (ref)
        return l_AvatarCreationService_0.UgcValidationSuccess and l_AvatarCreationService_0.UgcValidationFailure;
    end;
    if pcall(v30) then
        table.insert(v22, l_AvatarCreationService_0.UgcValidationSuccess:Connect(function(v31, v32, v33) --[[ Line: 98 ]]
            -- upvalues: v21 (copy), l_AvatarCreationService_0 (ref), v10 (ref), v11 (ref), v20 (ref), v9 (ref)
            local v34 = v21:getState();
            if v34 and v34.promptRequest.promptInfo.promptType == "PublishAvatarAsset" then
                local v35 = l_AvatarCreationService_0:DeserializeAvatarModel(v32);
                v21:dispatch(v10(v35));
                if v33 then
                    v21:dispatch(v11(v33));
                end;
                return;
            else
                if v34 and v34.promptRequest.promptInfo.guid == v31 then
                    local v36 = l_AvatarCreationService_0:DeserializeAvatarModel(v32);
                    v20(v36);
                    v21:dispatch(v9(v36));
                    v21:dispatch(v11(v33));
                end;
                return;
            end;
        end));
    end;
    if pcall(v30) then
        table.insert(v22, l_AvatarCreationService_0.UgcValidationFailure:Connect(function(v37, v38) --[[ Line: 128 ]]
            -- upvalues: v21 (copy), v12 (ref)
            local v39 = v21:getState();
            if v39 and v39.promptRequest.promptInfo.guid == v37 then
                v21:dispatch(v12(v38));
            end;
        end));
    end;
    return v22;
end;