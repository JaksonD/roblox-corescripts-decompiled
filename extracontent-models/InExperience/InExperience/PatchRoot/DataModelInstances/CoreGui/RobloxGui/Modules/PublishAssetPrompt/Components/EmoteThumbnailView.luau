local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_EmoteUtility_0 = require(l_CorePackages_0.Packages.Thumbnailing).EmoteUtility;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(script.Parent.EmoteThumbnailParameters);
local v7 = v4.PureComponent:extend("EmoteThumbnailView");
v7.validateProps = v5.strictInterface({
    animationClip = v5.instanceIsA("AnimationClip"), 
    thumbnailParameters = v6.validate, 
    position = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    size = v5.optional(v5.UDim2)
});
v7.updateCameraAndCharacterPose = function(v8) --[[ Line: 32 ]] --[[ Name: updateCameraAndCharacterPose ]]
    -- upvalues: l_EmoteUtility_0 (copy), l_RunService_0 (copy)
    if v8.character == nil then
        return;
    else
        local l_props_0 = v8.props;
        local l_character_0 = v8.character;
        local l_animationClip_0 = l_props_0.animationClip;
        local l_thumbnailParameters_0 = l_props_0.thumbnailParameters;
        local l_thumbnailTime_0 = l_thumbnailParameters_0.thumbnailTime;
        local l_thumbnailKeyframe_0 = l_thumbnailParameters_0.thumbnailKeyframe;
        local l_thumbnailCharacterRotation_0 = l_thumbnailParameters_0.thumbnailCharacterRotation;
        local v16 = nil;
        if l_animationClip_0:IsA("CurveAnimation") then
            v16 = l_EmoteUtility_0.GetThumbnailKeyframeFromCurve(l_thumbnailTime_0, l_animationClip_0, l_thumbnailCharacterRotation_0);
        elseif l_animationClip_0:IsA("KeyframeSequence") then
            v16 = l_EmoteUtility_0.GetThumbnailKeyframe(l_thumbnailKeyframe_0, l_animationClip_0, l_thumbnailCharacterRotation_0);
        else
            error("Unsupported Animation data:", l_animationClip_0.ClassName);
        end;
        l_EmoteUtility_0.SetPlayerCharacterNeutralPose(l_character_0);
        l_EmoteUtility_0.ApplyKeyframe(l_character_0, v16);
        task.spawn(function() --[[ Line: 64 ]]
            -- upvalues: l_RunService_0 (ref), l_character_0 (copy), l_EmoteUtility_0 (ref), l_thumbnailParameters_0 (copy), v8 (copy)
            l_RunService_0.PreAnimation:Wait();
            l_RunService_0.PostSimulation:Wait();
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = l_character_0;
            l_Folder_0:Destroy();
            local l_l_character_0_ModelCFrame_0 = l_character_0:GetModelCFrame();
            local v19 = l_EmoteUtility_0.ThumbnailZoomExtents(l_character_0, 20, l_thumbnailParameters_0.thumbnailHorizontalOffset, l_thumbnailParameters_0.thumbnailVerticalOffset, l_thumbnailParameters_0.thumbnailZoom);
            v8.updateCameraCFrameBinding(v19);
            v8.updateCameraFocusBinding(l_l_character_0_ModelCFrame_0);
        end);
        return;
    end;
end;
v7.addCharacterToViewportIfNeeded = function(v20) --[[ Line: 90 ]] --[[ Name: addCharacterToViewportIfNeeded ]]
    if v20.character ~= nil and v20.character.Parent ~= nil then
        return;
    else
        if v20.worldModelRef:getValue() and v20.character ~= nil then
            v20.character.Parent = v20.worldModelRef:getValue();
            v20:updateCameraAndCharacterPose();
        end;
        return;
    end;
end;
v7.init = function(v21) --[[ Line: 101 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    v21.cameraRef = v4.createRef();
    v21.worldModelRef = v4.createRef();
    local v22, v23 = v4.createBinding(CFrame.new());
    v21.cameraCFrameBinding = v22;
    v21.updateCameraCFrameBinding = v23;
    v22, v23 = v4.createBinding(CFrame.new());
    v21.cameraFocusBinding = v22;
    v21.updateCameraFocusBinding = v23;
    task.spawn(function() --[[ Line: 108 ]]
        -- upvalues: l_Players_0 (ref), v21 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 110 ]]
            -- upvalues: l_Players_0 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return (l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(1342485078));
            else
                return (l_Players_0:GetHumanoidDescriptionFromOutfitId(1342485078));
            end;
        end);
        if not l_status_0 then
            l_result_0 = Instance.new("HumanoidDescription");
        end;
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v21.character = l_Players_0:CreateHumanoidModelFromDescriptionAsync(l_result_0, Enum.HumanoidRigType.R15);
        else
            v21.character = l_Players_0:CreateHumanoidModelFromDescription(l_result_0, Enum.HumanoidRigType.R15);
        end;
        v21:addCharacterToViewportIfNeeded();
    end);
end;
v7.render = function(v26) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy)
    return v4.createElement("Frame", {
        BackgroundTransparency = 0, 
        Position = v26.props.position or UDim2.fromScale(0, 0), 
        AnchorPoint = v26.props.anchorPoint or Vector2.new(0, 0), 
        Size = v26.props.size or UDim2.fromScale(1, 1), 
        BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        AspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1, 
            AspectType = Enum.AspectType.FitWithinMaxSize, 
            DominantAxis = Enum.DominantAxis.Width
        }), 
        ViewportFrame = v4.createElement("ViewportFrame", {
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageColor3 = Color3.new(0, 0, 0), 
            ImageTransparency = 0, 
            BackgroundTransparency = 1, 
            CurrentCamera = v26.cameraRef
        }, {
            Camera = v4.createElement("Camera", {
                CameraType = Enum.CameraType.Scriptable, 
                FieldOfView = 20, 
                CFrame = v26.cameraCFrameBinding, 
                Focus = v26.cameraFocusBinding, 
                [v4.Ref] = v26.cameraRef
            }), 
            WorldModel = v4.createElement("WorldModel", {
                [v4.Ref] = v26.worldModelRef
            })
        })
    });
end;
v7.didMount = function(v27) --[[ Line: 185 ]] --[[ Name: didMount ]]
    v27:addCharacterToViewportIfNeeded();
end;
v7.didUpdate = function(v28, _) --[[ Line: 189 ]] --[[ Name: didUpdate ]]
    v28:updateCameraAndCharacterPose();
end;
return v7;