local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script:FindFirstAncestor("SceneManagement").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = {
    FieldOfView = 50, 
    Position = Vector3.new(0, 20, 0, 0)
};
local v4 = {
    PositionOffset = Vector3.new(0, 0, 0, 0), 
    RotationOffset = Vector3.new(0, 0, 0, 0), 
    DistanceToCamera = 60
};
local function _() --[[ Line: 34 ]] --[[ Name: getOrCreateCamera ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 == nil then
        l_CurrentCamera_0 = Instance.new("Camera");
        l_CurrentCamera_0.Parent = workspace;
    end;
    return l_CurrentCamera_0;
end;
local function v10(v7, v8) --[[ Line: 43 ]] --[[ Name: configureCamera ]]
    -- upvalues: l_Object_0 (copy), v3 (copy)
    local v9 = l_Object_0.assign({}, v3, v8 or {});
    v7.FieldOfView = v9.FieldOfView;
    v7.CFrame = CFrame.new(v9.Position);
    v7.CameraType = Enum.CameraType.Fixed;
end;
local function v12(v11) --[[ Line: 50 ]] --[[ Name: getBackgroundInstance ]]
    return (workspace:FindFirstChild(v11));
end;
local function v21(v13, v14, v15) --[[ Line: 55 ]] --[[ Name: configureBackground ]]
    -- upvalues: l_Object_0 (copy), v4 (copy)
    local v16 = l_Object_0.assign({}, v4, v15);
    local l_PositionOffset_0 = v16.PositionOffset;
    local l_RotationOffset_0 = v16.RotationOffset;
    local l_DistanceToCamera_0 = v16.DistanceToCamera;
    local v20 = v14.CFrame.Position + l_DistanceToCamera_0 * v14.CFrame.LookVector + l_PositionOffset_0;
    v13:PivotTo(CFrame.new(v20) * CFrame.Angles(math.rad(l_RotationOffset_0.X), math.rad(l_RotationOffset_0.Y), (math.rad(l_RotationOffset_0.Z))));
end;
return {
    initialize = function(v22) --[[ Line: 72 ]] --[[ Name: initBackgroundScene ]]
        -- upvalues: v10 (copy), l_ReplicatedStorage_0 (copy), v21 (copy)
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        if l_CurrentCamera_1 == nil then
            l_CurrentCamera_1 = Instance.new("Camera");
            l_CurrentCamera_1.Parent = workspace;
        end;
        local l_l_CurrentCamera_1_0 = l_CurrentCamera_1;
        v10(l_l_CurrentCamera_1_0, v22.CameraConfigs);
        l_CurrentCamera_1 = v22.BackgroundConfigs;
        local l_BackgroundModelName_0 = l_CurrentCamera_1.BackgroundModelName;
        assert(l_ReplicatedStorage_0:FindFirstChild(l_BackgroundModelName_0) ~= nil, string.format("Background Model %s is missing in ReplicatedStorage.", l_BackgroundModelName_0));
        local v26 = l_ReplicatedStorage_0:WaitForChild(l_BackgroundModelName_0);
        if v26 then
            v26.Parent = workspace;
        end;
        v21(v26, l_l_CurrentCamera_1_0, l_CurrentCamera_1);
        return v26, l_l_CurrentCamera_1_0;
    end, 
    getBackgroundInstance = v12, 
    updateXPosition = function(v27, v28) --[[ Line: 91 ]] --[[ Name: updateXPosition ]]
        local l_workspace_FirstChild_0 = workspace:FindFirstChild(v27);
        if l_workspace_FirstChild_0 then
            local l_l_workspace_FirstChild_0_Pivot_0 = l_workspace_FirstChild_0:GetPivot();
            local l_Position_0 = l_l_workspace_FirstChild_0_Pivot_0.Position;
            local v32 = l_l_workspace_FirstChild_0_Pivot_0 - l_Position_0;
            local v33 = Vector3.new(v28, l_Position_0.Y, l_Position_0.Z);
            l_workspace_FirstChild_0:PivotTo(CFrame.new(v33) * v32);
        end;
    end, 
    updateZPosition = function(v34, v35) --[[ Line: 103 ]] --[[ Name: updateZPosition ]]
        local l_workspace_FirstChild_1 = workspace:FindFirstChild(v34);
        if l_workspace_FirstChild_1 then
            local l_l_workspace_FirstChild_1_Pivot_0 = l_workspace_FirstChild_1:GetPivot();
            local l_Position_1 = l_l_workspace_FirstChild_1_Pivot_0.Position;
            local v39 = l_l_workspace_FirstChild_1_Pivot_0 - l_Position_1;
            local v40 = Vector3.new(l_Position_1.X, l_Position_1.Y, v35);
            l_workspace_FirstChild_1:PivotTo(CFrame.new(v40) * v39);
        end;
    end
};