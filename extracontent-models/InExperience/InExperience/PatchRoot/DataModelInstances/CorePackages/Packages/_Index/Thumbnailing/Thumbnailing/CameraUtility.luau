local v0 = {};
local v1 = require(script.Parent.CFrameUtility);
local v2 = require(script.Parent.VectorUtility);
local v3 = require(script.Parent.CharacterUtility);
v0.DefaultHeadMarginScale = 1.1;
v0.DefaultBodyMarginScale = 1.1;
v0.DefaultBodyPartMarginScale = 1.2;
v0.XRotForFullBody = 15;
v0.XRotForCloseup = 0;
v0.DistanceScaleForFullBody = 1;
local v4 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0.3490658503988659, 0);
local v5 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, -0.3490658503988659, 0);
local v6 = CFrame.Angles(0.4363323129985824, 0.4363323129985824, 0);
local v7 = CFrame.Angles(0, 1.5707963267948966, 0);
local v8 = CFrame.Angles(0, -1.5707963267948966, 0);
v0.GetCameraCFrame = function(v9, v10) --[[ Line: 59 ]]
    local v11 = v9 * v10;
    return CFrame.lookAt(v11, v9.Position);
end;
v0.CreateThumbnailCamera = function() --[[ Line: 71 ]]
    local l_Camera_0 = Instance.new("Camera");
    l_Camera_0.Name = "ThumbnailCamera";
    l_Camera_0.CameraType = Enum.CameraType.Scriptable;
    l_Camera_0.Parent = workspace:GetChildren()[1];
    return l_Camera_0;
end;
v0.CalculateBaseDistanceToCamera = function(v13, v14, v15, v16) --[[ Line: 87 ]]
    local v17 = math.max((v15.X - v14.X) / 2, (v15.Y - v14.Y) / 2);
    local v18 = math.tan(v13 / 2);
    return v17 * v16 / v18;
end;
v0.SetupCamera = function(v19, v20) --[[ Line: 118 ]]
    -- upvalues: v0 (copy), v1 (copy), v2 (copy)
    if v20.optFieldOfView then
        v19.FieldOfView = v20.optFieldOfView;
    end;
    local v21 = v20.optFieldOfViewForDistanceScale or v19.FieldOfView;
    local v22 = v0.CalculateBaseDistanceToCamera(math.rad(v21), v20.minExtent, v20.maxExtent, v20.extentScale);
    if v20.optCameraDistanceScale then
        v22 = v22 * v20.optCameraDistanceScale;
    end;
    local v23 = v1.AdjustTargetCFrameWithExtents(v20.targetCFrame, v20.minExtent, v20.maxExtent);
    local v24 = v20.optCameraXRot or 0;
    local v25 = v20.optCameraYRot or 0;
    local v26 = v2.Vector3FromXYRotPlusDistance(v24, v25, v22);
    v19.CFrame = v0.GetCameraCFrame(v23, v26);
end;
v0.SetupBodyPartCamera = function(v27, v28, v29, v30) --[[ Line: 157 ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), v0 (copy)
    local v31 = {};
    if #v29 > 0 then
        for _, v33 in pairs(v29) do
            local l_v27_FirstChild_0 = v27:FindFirstChild(v33, true);
            if l_v27_FirstChild_0 then
                table.insert(v31, l_v27_FirstChild_0);
            end;
        end;
    end;
    local l_CFrame_0 = v27:FindFirstChild("HumanoidRootPart").CFrame;
    l_CFrame_0 = (if v28 then v5 else v4) * l_CFrame_0;
    local v36, v37 = v3.CalculateBodyPartsExtents(l_CFrame_0, v31);
    local v38 = {
        optFieldOfView = 30, 
        targetCFrame = l_CFrame_0, 
        minExtent = v36, 
        maxExtent = v37, 
        extentScale = v0.DefaultBodyPartMarginScale
    };
    v0.SetupCamera(v30, v38);
end;
v0.SetupHeadCamera = function(v39, v40) --[[ Line: 195 ]]
    -- upvalues: v1 (copy), v3 (copy), v0 (copy)
    local l_Head_0 = v39:FindFirstChild("Head");
    local v42 = v1.CalculateTargetCFrame(l_Head_0.CFrame);
    v42 = CFrame.fromEulerAnglesYXZ(0.2617993877991494, 0.5235987755982988, 0) * v42;
    local v43, v44 = v3.CalculateHeadExtents(v39, v42);
    local v45 = {
        optFieldOfView = 30, 
        targetCFrame = v42, 
        minExtent = v43, 
        maxExtent = v44, 
        extentScale = 1.1
    };
    v0.SetupCamera(v40, v45);
end;
local function _(v46) --[[ Line: 224 ]] --[[ Name: isLeftShoe ]]
    local l_MeshPart_0 = v46:FindFirstChildWhichIsA("MeshPart");
    if not l_MeshPart_0 then
        return false;
    else
        assert(l_MeshPart_0, "Assert handle is not nil to silence type checker");
        return l_MeshPart_0:FindFirstChild("LeftFootAttachment") ~= nil;
    end;
end;
local function _(v49) --[[ Line: 233 ]] --[[ Name: isRightShoe ]]
    local l_MeshPart_1 = v49:FindFirstChildWhichIsA("MeshPart");
    if not l_MeshPart_1 then
        return false;
    else
        assert(l_MeshPart_1, "Assert handle is not nil to silence type checker");
        return l_MeshPart_1:FindFirstChild("RightFootAttachment") ~= nil;
    end;
end;
local function _(v52) --[[ Line: 242 ]] --[[ Name: getAccessoryAngle ]]
    -- upvalues: v7 (copy), v8 (copy), v6 (copy)
    local l_MeshPart_2 = v52:FindFirstChildWhichIsA("MeshPart");
    local v54;
    if not l_MeshPart_2 then
        v54 = false;
    else
        assert(l_MeshPart_2, "Assert handle is not nil to silence type checker");
        v54 = l_MeshPart_2:FindFirstChild("LeftFootAttachment") ~= nil;
    end;
    if v54 then
        return v7;
    else
        l_MeshPart_2 = v52:FindFirstChildWhichIsA("MeshPart");
        if not l_MeshPart_2 then
            v54 = false;
        else
            assert(l_MeshPart_2, "Assert handle is not nil to silence type checker");
            v54 = l_MeshPart_2:FindFirstChild("RightFootAttachment") ~= nil;
        end;
        if v54 then
            return v8;
        else
            return v6;
        end;
    end;
end;
v0.SetupAccessoryCamera = function(v56, v57) --[[ Line: 251 ]]
    -- upvalues: v7 (copy), v8 (copy), v6 (copy), v3 (copy), v0 (copy)
    local l_v56_Children_0 = v56:GetChildren();
    assert(#l_v56_Children_0 == 1, "Assert SetupMeshPartAccessoryCamera accessoryModel only has accessory as a child.");
    local v59 = l_v56_Children_0[1];
    local l_Handle_0 = v59:FindFirstChild("Handle");
    assert(l_Handle_0, "Assert Accessory has handle for camera setup.");
    l_Handle_0.CFrame = CFrame.new();
    local l_CFrame_1 = l_Handle_0.CFrame;
    local l_MeshPart_3 = v59:FindFirstChildWhichIsA("MeshPart");
    local v63;
    if not l_MeshPart_3 then
        v63 = false;
    else
        assert(l_MeshPart_3, "Assert handle is not nil to silence type checker");
        v63 = l_MeshPart_3:FindFirstChild("LeftFootAttachment") ~= nil;
    end;
    local v64;
    if v63 then
        v64 = v7;
    else
        l_MeshPart_3 = v59:FindFirstChildWhichIsA("MeshPart");
        if not l_MeshPart_3 then
            v63 = false;
        else
            assert(l_MeshPart_3, "Assert handle is not nil to silence type checker");
            v63 = l_MeshPart_3:FindFirstChild("RightFootAttachment") ~= nil;
        end;
        v64 = if v63 then v8 else v6;
    end;
    local v65 = l_CFrame_1 * v64;
    l_CFrame_1, v64 = v3.CalculateModelExtents(v56, v65);
    v63 = {
        optFieldOfView = 20, 
        targetCFrame = v65, 
        minExtent = l_CFrame_1, 
        maxExtent = v64, 
        extentScale = 1.1
    };
    v0.SetupCamera(v57, v63);
end;
return v0;