local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Constants);
local v2 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Enum.AxisType);
local v3 = {};
local v4 = {
    [v2.X] = true, 
    [v2.Y] = true, 
    [v2.Z] = true
};
v3.setPositionAdornee = function(v5, v6, v7) --[[ Line: 18 ]]
    -- upvalues: v4 (copy)
    for _, v9 in v5:GetChildren() do
        if v9.Name == "Line" then
            v9:FindFirstChild("Weld").Part1 = v7;
        elseif v9:IsA("BillboardGui") and v4[v9.Name] then
            v9.Adornee = v7;
        elseif v9:IsA("BillboardGui") and v9.Name == "Selection" then
            v9.Adornee = v6;
        end;
    end;
end;
v3.setRotationAdornee = function(v10, v11) --[[ Line: 31 ]]
    for _, v13 in v10:GetChildren() do
        if v13:IsA("MeshPart") then
            v13:FindFirstChild("Weld").Part1 = v11;
        elseif v13:IsA("BillboardGui") then
            v13.Adornee = v11;
        elseif v13:IsA("LineHandleAdornment") then
            v13.Adornee = v11;
        end;
    end;
end;
v3.setScaleAdornee = function(v14, v15) --[[ Line: 44 ]]
    for _, v17 in v14:GetChildren() do
        if v17:IsA("BillboardGui") then
            v17.Adornee = v15;
        end;
    end;
end;
local function v26(v18, v19, v20, v21, v22, v23) --[[ Line: 52 ]] --[[ Name: makeAxisLabel ]]
    -- upvalues: v1 (copy)
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Size = UDim2.new(0, v23, 0, v23);
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.StudsOffsetWorldSpace = v19;
    l_BillboardGui_0.SizeOffset = v20;
    l_BillboardGui_0.Name = v18;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v18;
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.Text = v18;
    l_TextLabel_0.TextColor3 = v21;
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Parent = l_BillboardGui_0;
    l_TextLabel_0.FontFace = v1.FontFace;
    l_BillboardGui_0.Parent = v22;
end;
v3.getAxisPositionLabelOffset = function(v27, v28) --[[ Line: 79 ]]
    -- upvalues: v2 (copy)
    if v27 == v2.X then
        return (Vector3.new(-v28, 0, 0));
    elseif v27 == v2.Y then
        return (Vector3.new(0, v28, 0));
    else
        return (Vector3.new(0, 0, -v28));
    end;
end;
v3.createPositionAxis = function(v29, v30, v31, v32, v33) --[[ Line: 89 ]]
    -- upvalues: v1 (copy), v26 (copy), v2 (copy), v3 (copy)
    local v34 = v31 / 2;
    for _, v36 in v1.LineHandleData do
        local l_v34_0 = v34;
        l_v34_0 = if v36.Direction > 0 then l_v34_0 + math.abs(v33[v36.LimitKey]) else l_v34_0 + math.abs(v32[v36.LimitKey]);
        local l_Part_0 = Instance.new("Part");
        l_Part_0.Shape = Enum.PartType.Cylinder;
        l_Part_0.Name = "Line";
        l_Part_0.Color = v36.Color3;
        l_Part_0.CFrame = v36.Orientation;
        l_Part_0.Transparency = 0.15;
        l_Part_0.Size = Vector3.new(l_v34_0, v1.LineDiameter, v1.LineDiameter);
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = l_Part_0;
        l_Weld_0.C0 = CFrame.new((Vector3.new(-l_v34_0 / 2, 0, 0))) * v36.Orientation;
        l_Weld_0.Parent = l_Part_0;
        l_Part_0.Parent = v29;
    end;
    local v40 = Vector2.new(0, 0.5);
    v26(v2.X, v3.getAxisPositionLabelOffset(v2.X, v34 + v33.xPosition), v40, v1.XAxisColor, v29, v30);
    v26(v2.Y, v3.getAxisPositionLabelOffset(v2.Y, v34 + v33.yPosition), Vector2.new(0, 0.5), v1.YAxisColor, v29, v30);
    v26(v2.Z, v3.getAxisPositionLabelOffset(v2.Z, v34 + v33.zPosition), v40, v1.ZAxisColor, v29, v30);
end;
v3.getLargestAxisSize = function(v41) --[[ Line: 148 ]]
    local v42 = math.abs(v41.X);
    local v43 = math.abs(v41.Y);
    local v44 = math.abs(v41.Z);
    if v43 <= v42 and v44 <= v42 then
        return v42;
    elseif v42 <= v43 and v44 <= v43 then
        return v43;
    else
        return v44;
    end;
end;
v3.getScreenDiameter = function(v45) --[[ Line: 161 ]]
    -- upvalues: v3 (copy)
    local v46 = v3.getLargestAxisSize(v45.Size);
    local l_Position_0 = v45.Position;
    local v48 = v46 / 2;
    local v49 = l_Position_0 + Vector3.new(0, v48, 0);
    local v50 = l_Position_0 - Vector3.new(0, v48, 0);
    local l_Camera_0 = workspace:FindFirstChild("Camera");
    assert(l_Camera_0, "Assert camera not nil");
    return (l_Camera_0:WorldToScreenPoint(v49) - l_Camera_0:WorldToScreenPoint(v50)).magnitude + 20;
end;
v3.createBillboardRing = function(v52, v53, v54, v55) --[[ Line: 175 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_BillboardGui_1 = Instance.new("BillboardGui");
    local v57 = v3.getScreenDiameter(v52);
    l_BillboardGui_1.Size = UDim2.new(0, v57, 0, v57);
    l_BillboardGui_1.AlwaysOnTop = true;
    l_BillboardGui_1.Name = v55;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Image = v54;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = l_BillboardGui_1;
    l_ImageLabel_0.ImageColor3 = v1.ZAxisColor;
    l_BillboardGui_1.Parent = v53;
end;
v3.createSelectionDot = function(v59, v60, v61) --[[ Line: 191 ]]
    local l_BillboardGui_2 = Instance.new("BillboardGui");
    l_BillboardGui_2.Size = UDim2.new(0, 10, 0, 10);
    l_BillboardGui_2.AlwaysOnTop = true;
    l_BillboardGui_2.Name = v61;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_1.Image = v60;
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Parent = l_BillboardGui_2;
    l_ImageLabel_1.ImageColor3 = Color3.new(1, 1, 1);
    l_BillboardGui_2.Parent = v59;
end;
v3.getAxisRotationLabelOffset = function(v64, v65) --[[ Line: 207 ]]
    -- upvalues: v2 (copy)
    local v66 = v65 + 0.2;
    if v64 == v2.X then
        return (Vector3.new(0, v66, 0));
    elseif v64 == v2.Y then
        return (Vector3.new(v66, 0, 0));
    else
        local v67 = v66 / 1.4142135623730951;
        return (Vector3.new(v67, v67, 0));
    end;
end;
v3.createRotationAxis = function(v68, v69, v70, v71) --[[ Line: 218 ]]
    -- upvalues: v1 (copy), v26 (copy), v2 (copy), v3 (copy)
    v69 = v69 + 0.25;
    for _, v73 in v1.RingData do
        local v74 = v71:Clone();
        v74.Name = "RotationAxis";
        v74.Color = v73.Color3;
        local l_Weld_1 = Instance.new("Weld");
        l_Weld_1.Part0 = v74;
        l_Weld_1.C0 = v73.Orientation;
        local l_CFrameValue_0 = Instance.new("CFrameValue");
        l_CFrameValue_0.Value = v73.Orientation;
        l_CFrameValue_0.Name = "OriginalOrientation";
        l_CFrameValue_0.Parent = v74;
        l_Weld_1.Parent = v74;
        v74.Size = Vector3.new(v69, v69 * 0.02040816326530612, v69);
        v74.Parent = v68;
    end;
    local v77 = v69 / 2;
    v26(v2.X, v3.getAxisRotationLabelOffset(v2.X, v77), Vector2.new(), v1.XAxisColor, v68, v70);
    v26(v2.Y, v3.getAxisRotationLabelOffset(v2.Y, v77), Vector2.new(), v1.YAxisColor, v68, v70);
    v26(v2.Z, v3.getAxisRotationLabelOffset(v2.Z, v77), Vector2.new(), v1.ZAxisColor, v68, v70);
end;
v3.setUpCameraConnection = function(v78, v79) --[[ Line: 262 ]]
    -- upvalues: v3 (copy)
    local l_Camera_1 = workspace:FindFirstChild("Camera");
    assert(l_Camera_1, "Assert camera not nil");
    return l_Camera_1:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 265 ]]
        -- upvalues: v3 (ref), v78 (copy), v79 (copy)
        local v81 = v3.getScreenDiameter(v78);
        for _, v83 in v79:GetChildren() do
            if v83.Name == "Selection" or v83.Name == "Scale" then
                v83.Size = UDim2.fromOffset(v81, v81);
            end;
        end;
    end);
end;
v3.setUpSizeConnection = function(v84, v85) --[[ Line: 275 ]]
    -- upvalues: v3 (copy)
    return v84:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 276 ]]
        -- upvalues: v85 (copy), v3 (ref), v84 (copy)
        for _, v87 in v85:GetChildren() do
            local v88 = v3.getScreenDiameter(v84);
            if v87.Name == "Scale" then
                v87.Size = UDim2.fromOffset(v88, v88);
            end;
        end;
    end);
end;
return v3;