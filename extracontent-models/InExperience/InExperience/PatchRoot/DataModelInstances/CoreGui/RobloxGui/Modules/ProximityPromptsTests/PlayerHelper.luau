local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = {
    initStarted = false, 
    TestModel = nil, 
    hrp = nil, 
    humanoid = nil, 
    player = nil
};
v3.Init = function() --[[ Line: 15 ]] --[[ Name: Init ]]
    -- upvalues: v3 (copy), l_Players_0 (copy), l_RunService_0 (copy)
    if v3.initStarted then
        return;
    else
        v3.initStarted = true;
        local v4 = v3.WaitForExpression(function() --[[ Line: 23 ]]
            -- upvalues: l_Players_0 (ref)
            return l_Players_0.LocalPlayer;
        end, 10, "Players.LocalPlayer not found");
        v3.player = v4;
        if v4.Character == nil and l_RunService_0:IsServer() then
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                v4:LoadCharacterAsync();
            else
                v4:LoadCharacter();
            end;
        end;
        v3.WaitForExpression(function() --[[ Line: 37 ]]
            -- upvalues: v4 (copy)
            return v4.Character;
        end, 10, "LocalPlayer.Character not found");
        v3.hrp = v4.Character:WaitForChild("HumanoidRootPart");
        v3.humanoid = v4.Character:WaitForChild("Humanoid");
        if v3.TestModel == nil then
            v3.TestModel = Instance.new("Model");
            v3.TestModel.Name = "_TestContainer";
            v3.TestModel.Parent = workspace;
        end;
        v3.PlayerGui = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
        return;
    end;
end;
v3.AddInstance = function(v5) --[[ Line: 54 ]] --[[ Name: AddInstance ]]
    -- upvalues: v3 (copy)
    local v6 = Instance.new(v5);
    v6.Parent = v3.TestModel;
    return v6;
end;
v3.CleanUpAfterTest = function() --[[ Line: 61 ]] --[[ Name: CleanUpAfterTest ]]
    -- upvalues: v3 (copy)
    v3.TestModel:ClearAllChildren();
end;
v3.SetCameraFOV = function(v7) --[[ Line: 65 ]] --[[ Name: SetCameraFOV ]]
    workspace.CurrentCamera.FieldOfView = v7;
end;
v3.IsPartOnscreen = function(v8) --[[ Line: 69 ]] --[[ Name: IsPartOnscreen ]]
    local _, v10 = workspace.CurrentCamera:WorldToViewportPoint(v8.Position);
    return v10;
end;
v3.GetPartViewportPixelPosition = function(v11) --[[ Line: 75 ]] --[[ Name: GetPartViewportPixelPosition ]]
    local v12, _ = workspace.CurrentCamera:WorldToViewportPoint(v11.Position);
    return Vector2.new(v12.x, v12.y);
end;
v3.MovePlayerToPosition = function(v14) --[[ Line: 82 ]] --[[ Name: MovePlayerToPosition ]]
    -- upvalues: v3 (copy)
    if v3.hrp ~= nil then
        local v15 = CFrame.new() + v14 + Vector3.new(0, 1 + v3.humanoid.HipHeight, 0);
        v3.hrp.CFrame = v15;
    end;
end;
v3.SetPlayerCamera = function(v16, v17) --[[ Line: 91 ]] --[[ Name: SetPlayerCamera ]]
    -- upvalues: v3 (copy)
    local v18 = v3.player.Character:WaitForChild("Head", 10);
    local v19 = CFrame.new(Vector3.new(), v16) + v18.Position - v17 * v16.Unit;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
    l_CurrentCamera_0.CFrame = v19;
end;
v3.WaitNFrames = function(v21) --[[ Line: 102 ]] --[[ Name: WaitNFrames ]]
    -- upvalues: l_RunService_0 (copy)
    for _ = 1, v21 do
        l_RunService_0.RenderStepped:Wait();
    end;
end;
v3.WaitWallTime = function(v23) --[[ Line: 111 ]] --[[ Name: WaitWallTime ]]
    -- upvalues: v3 (copy)
    local v24 = tick();
    if v23 > 2 then
        warn("Requested wait time too long, waiting 2s");
        v23 = 2;
    end;
    while v23 >= tick() - v24 do
        v3.WaitNFrames(1);
    end;
end;
v3.WaitGameTime = function(v25) --[[ Line: 129 ]] --[[ Name: WaitGameTime ]]
    -- upvalues: l_RunService_0 (copy)
    local v26, v27 = l_RunService_0.Stepped:Wait();
    local l_v26_0 = v26;
    while l_v26_0 - v26 < v25 do
        local v29, v30 = l_RunService_0.Stepped:Wait();
        l_v26_0 = v29;
        v27 = v30;
    end;
end;
v3.WaitForExpression = function(v31, v32, v33) --[[ Line: 138 ]] --[[ Name: WaitForExpression ]]
    -- upvalues: v3 (copy)
    local v34 = tick();
    local v35 = v31();
    while not v35 and tick() - v34 < v32 do
        v3.WaitNFrames(1);
        v35 = v31();
    end;
    if not v35 then
        error(v33);
    end;
    return v35;
end;
v3.GetCornersOfBillboardGui = function(v36) --[[ Line: 156 ]] --[[ Name: GetCornersOfBillboardGui ]]
    -- upvalues: v3 (copy), l_GuiService_0 (copy)
    local v37 = v3.GetPartViewportPixelPosition(v36.Adornee);
    local v38 = Vector2.new(v36.SizeOffset.x * v36.AbsoluteSize.x, v36.SizeOffset.y * v36.AbsoluteSize.y);
    local v39 = v37 - l_GuiService_0:GetGuiInset() + v38;
    local l_AbsoluteSize_0 = v36.AbsoluteSize;
    local v41 = v39 - l_AbsoluteSize_0 / 2 + Vector2.new(1, 1);
    local v42 = v39 + Vector2.new(l_AbsoluteSize_0.x / 2 - 1, -l_AbsoluteSize_0.y / 2 + 1);
    local v43 = v39 + Vector2.new(l_AbsoluteSize_0.x / 2 - 1, l_AbsoluteSize_0.y / 2 - 1);
    local v44 = v39 + Vector2.new(-l_AbsoluteSize_0.x / 2 + 1, l_AbsoluteSize_0.y / 2 - 1);
    return {
        center = v39, 
        topLeft = v41, 
        topRight = v42, 
        bottomRight = v43, 
        bottomLeft = v44
    };
end;
return v3;