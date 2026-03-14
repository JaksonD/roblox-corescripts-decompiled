local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_VRService_0 = game:GetService("VRService");
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v8 = require(l_script_FirstAncestor_0.VRUtil);
require(l_script_FirstAncestor_0.Panel3D);
local v9 = game:DefineFastFlag("EnableUserInputCFrameLogging", false);
local v10 = game:DefineFastFlag("VRLaserPointerRaycastChange", false);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.Changed:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local function _(v12) --[[ Line: 32 ]] --[[ Name: fromLinearRGB ]]
    return Color3.new(v12.r ^ 2.2, v12.g ^ 2.2, v12.b ^ 2.2);
end;
local function v20(...) --[[ Line: 36 ]] --[[ Name: addPartsToGame ]]
    -- upvalues: l_GuiService_0 (copy)
    local v14 = {
        ...
    };
    local l_CoreEffectFolder_0 = l_GuiService_0.CoreEffectFolder;
    if not l_CoreEffectFolder_0 then
        coroutine.wrap(function() --[[ Line: 42 ]]
            -- upvalues: l_GuiService_0 (ref), v14 (copy), l_CoreEffectFolder_0 (copy)
            while l_GuiService_0.Changed:wait() ~= "CoreEffectFolder" and l_GuiService_0.CoreEffectFolder == nil do

            end;
            for _, v17 in pairs(v14) do
                v17.Parent = l_CoreEffectFolder_0;
                v17.CanTouch = false;
                v17.CanCollide = false;
                v17.CanQuery = false;
            end;
        end)();
        return;
    else
        for _, v19 in pairs(v14) do
            v19.Parent = l_CoreEffectFolder_0;
            v19.CanTouch = false;
            v19.CanCollide = false;
            v19.CanQuery = false;
        end;
        return;
    end;
end;
local function v23(...) --[[ Line: 64 ]] --[[ Name: removePartsFromGame ]]
    for _, v22 in pairs({
        ...
    }) do
        v22.Parent = nil;
    end;
end;
local function v27() --[[ Line: 71 ]] --[[ Name: getLocalHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        for _, v26 in pairs(l_Character_0:GetChildren()) do
            if v26:IsA("Humanoid") then
                return v26;
            end;
        end;
        return;
    end;
end;
local function _(v28, v29) --[[ Line: 85 ]] --[[ Name: applyExpCurve ]]
    local v30 = v28 ^ v29;
    if v30 ~= v30 then
        v30 = math.abs(v28) ^ v29;
    end;
    return v30;
end;
local v32 = {
    Disabled = 0, 
    Pointer = 1, 
    Navigation = 2, 
    Hidden = 3, 
    DualPointer = 4
};
local v33 = {
    Right = 0, 
    Left = 1
};
local v34 = {
    MODE_ENABLED = true
};
local v35 = Color3.fromRGB(0, 162, 255);
v34.ARC_COLOR_GOOD = Color3.new(v35.r ^ 2.2, v35.g ^ 2.2, v35.b ^ 2.2);
v35 = Color3.fromRGB(253, 68, 72);
v34.ARC_COLOR_BAD = Color3.new(v35.r ^ 2.2, v35.g ^ 2.2, v35.b ^ 2.2);
v34.ARC_THICKNESS = 0.0125;
v34.PLOP_GOOD = "rbxasset://textures/ui/VR/VRPointerDiscBlue.png";
v34.PLOP_BAD = "rbxasset://textures/ui/VR/VRPointerDiscRed.png";
v34.PLOP_BALL_COLOR_GOOD = BrickColor.new("Bright green");
v34.PLOP_BALL_COLOR_BAD = BrickColor.new("Bright red");
v34.PLOP_BALL_SIZE = 0.5;
v34.PLOP_SIZE = 2;
v34.PLOP_PULSE_MIN_SIZE = 0;
v34.PLOP_PULSE_MAX_SIZE = 2;
v34.MAX_VALID_DISTANCE = 100;
v34.BUTTON_DOWN_THRESHOLD = 0.95;
v34.BUTTON_UP_THRESHOLD = 0.5;
v34.MIN_VELOCITY = 10;
v34.RANGE_T_EXP = 2;
v34.G = 10;
v34.PULSE_DURATION = 0.8;
v34.PULSE_PERIOD = 1;
v34.PULSE_EXP = 2;
v34.PULSE_SIZE_0 = 0.25;
v34.PULSE_SIZE_1 = 2;
v34.BALL_WAVE_PERIOD = 2;
v34.BALL_WAVE_AMPLITUDE = 0.5;
v34.BALL_WAVE_START = 0.25;
v34.BALL_WAVE_EXP = 0.8;
v34.FLOOR_OFFSET = 4.5;
v34.FADE_OUT_DURATION = 0.125;
v34.FADE_IN_DURATION = 0.125;
v34.TRANSITION_DURATION = 0.25;
local v36 = {
    MODE_ENABLED = true, 
    ARC_COLOR_GOOD = v34.ARC_COLOR_GOOD, 
    ARC_COLOR_BAD = v34.ARC_COLOR_BAD
};
local v37 = Color3.fromRGB(0, 255, 162);
v36.ARC_COLOR_HIT = Color3.new(v37.r ^ 2.2, v37.g ^ 2.2, v37.b ^ 2.2);
v36.ARC_THICKNESS = 0.01;
v36.MAX_DISTANCE = 50;
v36.G = 0;
v36.SWITCH_AIM_THRESHOLD = 0.2617993877991494;
v36.TRANSITION_DURATION = 0.075;
v35 = Vector2.new(0, 0);
v37 = Vector2.new(1, 1);
local v38 = {};
v38.__index = v38;
v38.Mode = v32;
v38.new = function(_) --[[ Line: 184 ]] --[[ Name: new ]]
    -- upvalues: v38 (copy), l_VRService_0 (copy), v33 (copy), l_Create_0 (copy), l_CoreGui_0 (copy), v34 (copy), v37 (copy), v35 (copy), l_GuiService_0 (copy)
    local v40 = setmetatable({}, v38);
    v40.laserMaxDistance = l_VRService_0.LaserDistance;
    v40.laserHand = v33.Right;
    v40.inputUserCFrame = Enum.UserCFrame.RightHand;
    v40.equippedTool = false;
    v40.lastLaserModeHit = tick();
    v40.guiMenuIsOpen = false;
    v40.externalForcePointer = false;
    v40.forceDotActive = true;
    v40.navHitPoint = Vector3.new(0, 0, 0, 0);
    v40.navHitNormal = Vector3.new(0, 1, 0, 0);
    v40.navHitPart = nil;
    v40.navigationIsValid = false;
    v40.lastNavigationValidityChangeTime = tick();
    v40.plopBallBounceStart = tick();
    v40.buttonPressStart = 0;
    v40.showPlopBallOnPointer = false;
    v40.parabola = l_Create_0("ParabolaAdornment")({
        Name = "LaserPointerParabola", 
        Parent = l_CoreGui_0, 
        A = -1, 
        B = 2, 
        C = 0, 
        Color3 = nil, 
        Thickness = v34.ARC_THICKNESS, 
        Visible = false
    });
    v40.originPart = l_Create_0("Part")({
        Name = "LaserPointerOrigin", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v40.parabola.Adornee = v40.originPart;
    v40.parabolaOffhand = l_Create_0("ParabolaAdornment")({
        Name = "LaserPointerparabolaOffhand", 
        Parent = l_CoreGui_0, 
        A = 0, 
        B = 1.0E-6, 
        C = 0, 
        Color3 = Color3.new(1, 1, 1), 
        Transparency = 0.5, 
        Thickness = v34.ARC_THICKNESS, 
        Visible = false
    });
    v40.originPartOffhand = l_Create_0("Part")({
        Name = "LaserPointerOriginOffhand", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.SmoothPlastic, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v40.parabolaOffhand.Adornee = v40.originPartOffhand;
    v40.plopPart = l_Create_0("Part")({
        Name = "LaserPointerTeleportPlop", 
        Anchored = true, 
        CanCollide = false, 
        Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0), 
        Transparency = 1
    });
    v40.plopBall = l_Create_0("Part")({
        Name = "LaserPointerTeleportPlopBall", 
        Anchored = true, 
        CanCollide = false, 
        TopSurface = Enum.SurfaceType.SmoothNoOutlines, 
        BottomSurface = Enum.SurfaceType.SmoothNoOutlines, 
        Material = Enum.Material.Neon, 
        BrickColor = v34.PLOP_BALL_COLOR_GOOD, 
        Shape = Enum.PartType.Ball, 
        Size = Vector3.new(1, 1, 1, 0) * v34.PLOP_BALL_SIZE
    });
    v40.plopAdorn = l_Create_0("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdorn", 
        Parent = v40.plopPart, 
        Adornee = v40.plopPart, 
        Size = v37 * v34.PLOP_SIZE, 
        Image = v34.PLOP_GOOD
    });
    v40.plopAdornPulse = l_Create_0("ImageHandleAdornment")({
        Name = "LaserPointerTeleportPlopAdornPulse", 
        Parent = v40.plopPart, 
        Adornee = v40.plopPart, 
        Size = v35, 
        Image = v34.PLOP_GOOD, 
        Transparency = 0.5
    });
    v40.cursorPart = l_Create_0("Part")({
        Name = "Cursor", 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false, 
        Anchored = true, 
        Transparency = 1
    });
    v40.cursorSurfaceGui = l_Create_0("SurfaceGui")({
        Name = "CursorSurfaceGui", 
        Active = false, 
        AlwaysOnTop = true, 
        Enabled = false, 
        ZOffset = 10, 
        Parent = v40.cursorPart
    });
    v40.cursorImage = l_Create_0("ImageLabel")({
        Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
        ImageColor3 = Color3.new(0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v40.cursorSurfaceGui, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    });
    v40.connections = {};
    table.insert(v40.connections, l_VRService_0:GetPropertyChangedSignal("LaserPointer"):Connect(function() --[[ Line: 322 ]]
        -- upvalues: v40 (copy)
        v40:onModeChanged();
    end));
    v40:onModeChanged();
    l_GuiService_0.MenuOpened:connect(function() --[[ Line: 329 ]]
        -- upvalues: v40 (copy)
        v40.guiMenuIsOpen = true;
    end);
    l_GuiService_0.MenuClosed:connect(function() --[[ Line: 332 ]]
        -- upvalues: v40 (copy)
        v40.guiMenuIsOpen = false;
    end);
    v40.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
    l_VRService_0.Changed:connect(function(v41) --[[ Line: 337 ]]
        -- upvalues: v40 (copy), l_VRService_0 (ref)
        if v41 == "GuiInputUserCFrame" then
            v40.inputUserCFrame = l_VRService_0.GuiInputUserCFrame;
            return;
        elseif v41 == "PointerHitCFrame" or v41 == "DidPointerHit" then
            v40:cursorInputsChanged();
            return;
        else
            if v41 == "VRSessionState" and l_VRService_0.VRSessionState == Enum.VRSessionState.Focused then
                v40:updateInputUserCFrame();
            end;
            return;
        end;
    end);
    l_VRService_0.LaserPointerTriggered:connect(function(v42) --[[ Line: 347 ]]
        -- upvalues: v40 (copy), v33 (ref)
        if game:GetEngineFeature("ImprovedTriggerFire") and v42.UserInputState ~= Enum.UserInputState.End then
            return;
        elseif (v42.KeyCode == Enum.KeyCode.ButtonR1 or v42.KeyCode == Enum.KeyCode.ButtonR2 or v42.KeyCode == Enum.KeyCode.ButtonR3 or v42.KeyCode == Enum.KeyCode.ButtonA or v42.KeyCode == Enum.KeyCode.ButtonB) and v40.laserHand ~= v33.Right then
            v40.laserHand = v33.Right;
            v40:updateInputUserCFrame();
            return;
        else
            if (v42.KeyCode == Enum.KeyCode.ButtonL1 or v42.KeyCode == Enum.KeyCode.ButtonL2 or v42.KeyCode == Enum.KeyCode.ButtonL3 or v42.KeyCode == Enum.KeyCode.ButtonX or v42.KeyCode == Enum.KeyCode.ButtonY) and v40.laserHand ~= v33.Left then
                v40.laserHand = v33.Left;
                v40:updateInputUserCFrame();
            end;
            return;
        end;
    end);
    l_VRService_0.UserCFrameEnabled:Connect(function(_, _) --[[ Line: 376 ]]
        -- upvalues: v40 (copy)
        v40:updateInputUserCFrame();
    end);
    v40:updateInputUserCFrame();
    return v40;
end;
v38.hasAnyHandController = function() --[[ Line: 385 ]] --[[ Name: hasAnyHandController ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand);
end;
v38.getModeName = function(v45) --[[ Line: 390 ]] --[[ Name: getModeName ]]
    -- upvalues: v32 (copy)
    for v46, v47 in pairs(v32) do
        if v45 == v47 then
            return v46;
        end;
    end;
    return "unknown";
end;
v38.updateInputUserCFrame = function(v48) --[[ Line: 400 ]] --[[ Name: updateInputUserCFrame ]]
    -- upvalues: v9 (copy), l_VRService_0 (copy), v33 (copy)
    local v49 = nil;
    if v9 then
        v49 = l_VRService_0.GuiInputUserCFrame;
    end;
    if l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and v48.laserHand == v33.Right then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) and v48.laserHand == v33.Left then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.RightHand;
    elseif l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.LeftHand;
    else
        l_VRService_0.GuiInputUserCFrame = Enum.UserCFrame.Head;
    end;
    if v9 and v49 ~= l_VRService_0.GuiInputUserCFrame then
        print("Updated GuiInputUserCFrame is: " .. tostring(l_VRService_0.GuiInputUserCFrame));
    end;
end;
v38.onModeChanged = function(v50, _) --[[ Line: 421 ]] --[[ Name: onModeChanged ]]
    -- upvalues: l_VRService_0 (copy), v20 (copy), v23 (copy)
    v50:updateInputUserCFrame();
    if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Disabled then
        v20(v50.originPart, v50.cursorPart);
        v23(v50.plopPart, v50.plopBall, v50.originPartOffhand);
        v50.forceDotActive = true;
        v50.parabola.Visible = false;
        v50.parabolaOffhand.Visible = false;
        v50:setNavigationActionEnabled(false);
        return;
    elseif l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Pointer then
        v20(v50.originPart, v50.cursorPart);
        v23(v50.plopPart, v50.plopBall, v50.originPartOffhand);
        v50.parabola.Visible = true;
        v50.parabolaOffhand.Visible = false;
        v50:setNavigationActionEnabled(false);
        v50.forceDotActive = false;
        return;
    else
        if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
            v20(v50.originPart, v50.originPartOffhand, v50.cursorPart);
            v23(v50.plopPart, v50.plopBall);
            v50.parabola.Visible = true;
            v50.parabolaOffhand.Visible = true;
            v50:setNavigationActionEnabled(false);
            v50.forceDotActive = false;
        end;
        return;
    end;
end;
v38.setMode = function(_, v53) --[[ Line: 455 ]] --[[ Name: setMode ]]
    -- upvalues: v32 (copy), l_VRService_0 (copy)
    if v53 == v32.Disabled or v53 == v32.Hidden then
        l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.Disabled;
        return;
    elseif v53 == v32.Pointer or v53 == v32.Navigation then
        l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.Pointer;
        return;
    else
        if v53 == v32.DualPointer then
            l_VRService_0.LaserPointer = Enum.VRLaserPointerMode.DualPointer;
        end;
        return;
    end;
end;
v38.setEnableAmbidexterousPointer = function(_, _) --[[ Line: 465 ]] --[[ Name: setEnableAmbidexterousPointer ]]

end;
v38.calculateLaunchVelocity = function(_, v57, v58, v59) --[[ Line: 469 ]] --[[ Name: calculateLaunchVelocity ]]
    return -(math.sqrt(v57 / 0.7071067811865476) * v58) / math.sqrt(2 * v59 * 0.7071067811865476 + 2 * v58 * 0.7071067811865476);
end;
v38.isHeadMounted = function(_) --[[ Line: 478 ]] --[[ Name: isHeadMounted ]]
    -- upvalues: l_VRService_0 (copy)
    return l_VRService_0.GuiInputUserCFrame == Enum.UserCFrame.Head;
end;
v38.shouldForcePointer = function(v61) --[[ Line: 482 ]] --[[ Name: shouldForcePointer ]]
    return v61.externalForcePointer or v61.guiMenuIsOpen;
end;
v38.setForcePointer = function(v62, v63) --[[ Line: 486 ]] --[[ Name: setForcePointer ]]
    v62.externalForcePointer = v63;
end;
v38.getNavigationOrigin = function(_) --[[ Line: 490 ]] --[[ Name: getNavigationOrigin ]]
    -- upvalues: v27 (copy)
    local v65 = v27();
    if not v65 then
        return;
    else
        local l_Torso_0 = v65.Torso;
        if not l_Torso_0 then
            return;
        else
            local l_HipHeight_0 = v65.HipHeight;
            if v65.RigType == Enum.HumanoidRigType.R6 then
                l_HipHeight_0 = 2;
            end;
            local v68 = l_Torso_0.Size.Y / 2;
            return l_Torso_0.Position + Vector3.new(0, -v68 - l_HipHeight_0, 0);
        end;
    end;
end;
v38.horzDistanceFromCharacter = function(_, v70) --[[ Line: 509 ]] --[[ Name: horzDistanceFromCharacter ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_1 = l_LocalPlayer_0.Character;
    if not l_Character_1 then
        return 1e999;
    else
        local l_HumanoidRootPart_0 = l_Character_1:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return 1e999;
        else
            return ((l_HumanoidRootPart_0:GetRenderCFrame().p - v70) * Vector3.new(1, 0, 1, 0)).magnitude;
        end;
    end;
end;
v38.onNavigateAction = function(v73, _, v75, _) --[[ Line: 522 ]] --[[ Name: onNavigateAction ]]
    -- upvalues: l_VRService_0 (copy)
    if v75 == Enum.UserInputState.Begin then
        l_VRService_0:RequestNavigation(CFrame.new(v73.navHitPoint, v73.navHitPoint + v73.navHitNormal) * CFrame.Angles(1.5707963267948966, 0, 0), v73.inputUserCFrame);
    end;
end;
v38.setNavigationActionEnabled = function(v77, v78) --[[ Line: 531 ]] --[[ Name: setNavigationActionEnabled ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v78 then
        l_ContextActionService_0:BindCoreAction("LaserPointerNavigate", function(...) --[[ Line: 533 ]]
            -- upvalues: v77 (copy)
            v77:onNavigateAction(...);
        end, false, Enum.KeyCode.ButtonA);
        return;
    else
        l_ContextActionService_0:UnbindCoreAction("LaserPointerNavigate");
        return;
    end;
end;
v38.setArcLaunchParams = function(v79, v80, v81, v82, v83) --[[ Line: 541 ]] --[[ Name: setArcLaunchParams ]]
    local v84 = math.cos(v80) * v81;
    local v85 = math.sin(v80) * v81;
    if v84 == 0 then
        v84 = 1.0E-6;
    end;
    v79.parabola.A = -(0.5 * v82) * (1 / v84 ^ 2);
    v79.parabola.B = v85 / v84;
    v79.parabola.C = 0;
    v79.parabola.Range = v83 * 1.5;
end;
v38.renderAsParabola = function(v86, v87, v88) --[[ Line: 556 ]] --[[ Name: renderAsParabola ]]
    local v89 = v88 * Vector3.new(1, 0, 1, 0);
    v86.originPart.CFrame = CFrame.new(v87, v87 + v89) * CFrame.Angles(0, 1.5707963267948966, 0);
end;
v38.renderAsLaser = function(v90, v91, v92) --[[ Line: 561 ]] --[[ Name: renderAsLaser ]]
    v90.originPart.CFrame = CFrame.new(v91, v92) * CFrame.Angles(0, 1.5707963267948966, 0);
    v90.parabola.A = 0;
    v90.parabola.B = 1.0E-6;
    v90.parabola.C = 0;
    v90.parabola.Range = (v92 - v91).magnitude;
end;
v38.renderOffhandLaser = function(v93, v94, v95) --[[ Line: 569 ]] --[[ Name: renderOffhandLaser ]]
    v93.originPartOffhand.CFrame = CFrame.new(v94, v95) * CFrame.Angles(0, 1.5707963267948966, 0);
    v93.parabolaOffhand.Range = (v95 - v94).magnitude;
end;
if not v10 then
    v38.getLaserHit = function(v96, v97, v98, v99) --[[ Line: 575 ]] --[[ Name: getLaserHit ]]
        local v100 = Ray.new(v97, v98 * v96.laserMaxDistance);
        local l_workspace_PartOnRayWithIgnoreList_0, v102, v103, _ = workspace:FindPartOnRayWithIgnoreList(v100, v99);
        return l_workspace_PartOnRayWithIgnoreList_0, v102, v103, (v102 - v97).magnitude / math.max(v96.laserMaxDistance, 0.1);
    end;
end;
v38.canNavigateTo = function(_, v106, _, v108) --[[ Line: 584 ]] --[[ Name: canNavigateTo ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_2 = l_LocalPlayer_0.Character;
    if not l_Character_2 then
        return false;
    elseif not l_Character_2:FindFirstChild("HumanoidRootPart") then
        return false;
    elseif not v106 then
        return false;
    elseif v108.Y < -1.0E-6 then
        return false;
    else
        return true;
    end;
end;
v38.checkHeadMountedMode = function(v110, v111) --[[ Line: 607 ]] --[[ Name: checkHeadMountedMode ]]
    -- upvalues: v32 (copy), l_GuiService_0 (copy)
    if v110:shouldForcePointer() then
        v110:setMode(v32.Pointer);
        return;
    else
        local l_CoreGuiFolder_0 = l_GuiService_0.CoreGuiFolder;
        if v111 and v111:IsDescendantOf(l_CoreGuiFolder_0) then
            v110:setMode(v32.Pointer);
            return;
        else
            v110:setMode(v32.Navigation);
            return;
        end;
    end;
end;
v38.setNavigationValidState = function(v113, v114) --[[ Line: 621 ]] --[[ Name: setNavigationValidState ]]
    -- upvalues: v34 (copy)
    if v114 == v113.navigationIsValid then
        return;
    else
        v113.navigationIsValid = v114;
        v113.lastNavigationValidityChangeTime = tick();
        if v114 then
            v113.plopBallBounceStart = tick();
            v113.parabola.Color3 = v34.ARC_COLOR_GOOD;
            v113.plopAdorn.Visible = true;
            v113.plopAdorn.Image = v34.PLOP_GOOD;
            v113.plopAdornPulse.Visible = true;
            v113.plopAdornPulse.Image = v34.PLOP_GOOD;
            v113.plopBall.BrickColor = v34.PLOP_BALL_COLOR_GOOD;
            return;
        else
            v113.parabola.Color3 = v34.ARC_COLOR_BAD;
            v113.plopAdorn.Visible = false;
            v113.plopAdorn.Image = v34.PLOP_BAD;
            v113.plopAdornPulse.Visible = false;
            v113.plopAdornPulse.Image = v34.PLOP_BAD;
            v113.plopBall.BrickColor = v34.PLOP_BALL_COLOR_BAD;
            return;
        end;
    end;
end;
v38.updateNavPlop = function(v115, v116, v117) --[[ Line: 646 ]] --[[ Name: updateNavPlop ]]
    -- upvalues: v34 (copy), v37 (copy), v35 (copy)
    local v118 = tick() - v115.plopBallBounceStart;
    local v119 = CFrame.new(v116, v116 + v117);
    local v120 = 0;
    if v115.navigationIsValid then
        local v121 = math.sin(v118 * 2 * 3.141592653589793 / v34.BALL_WAVE_PERIOD);
        local l_BALL_WAVE_EXP_0 = v34.BALL_WAVE_EXP;
        local v123 = v121 ^ l_BALL_WAVE_EXP_0;
        if v123 ~= v123 then
            v123 = math.abs(v121) ^ l_BALL_WAVE_EXP_0;
        end;
        v120 = v34.BALL_WAVE_START + v123 * v34.BALL_WAVE_AMPLITUDE;
    end;
    v115.plopPart.CFrame = v119;
    v115.plopBall.CFrame = v119 * CFrame.new(0, 0, -v120);
    local v124 = v118 % v34.PULSE_PERIOD;
    if v124 > 0 then
        local v125 = v124 / v34.PULSE_DURATION;
        if v125 < 1 then
            v115.plopAdornPulse.Visible = true;
            local l_plopAdornPulse_0 = v115.plopAdornPulse;
            local l_v37_0 = v37;
            local l_PULSE_SIZE_0_0 = v34.PULSE_SIZE_0;
            local l_PULSE_EXP_0 = v34.PULSE_EXP;
            local v130 = v125 ^ l_PULSE_EXP_0;
            if v130 ~= v130 then
                v130 = math.abs(v125) ^ l_PULSE_EXP_0;
            end;
            l_plopAdornPulse_0.Size = l_v37_0 * (l_PULSE_SIZE_0_0 + v130 * (v34.PULSE_SIZE_1 - v34.PULSE_SIZE_0));
            v115.plopAdornPulse.Transparency = 0.5 + v125 * 0.5;
            return;
        else
            v115.plopAdornPulse.Visible = false;
            v115.plopAdornPulse.Size = v35;
            v115.pulseStartTime = tick() + v34.PULSE_PERIOD;
        end;
    end;
end;
v38.updateNavigationMode = function(v131, v132, v133, v134) --[[ Line: 684 ]] --[[ Name: updateNavigationMode ]]
    v131.navHitPoint = v132;
    v131.navHitNormal = v133;
    v131.navHitPart = v134;
    v131:updateNavPlop(v132, v133);
    v131:setNavigationValidState(v131:canNavigateTo(v131.navHitPart, v131.navHitPoint, v131.navHitNormal));
end;
v38.showHitBallOnLaserPointer = function(v135, v136) --[[ Line: 693 ]] --[[ Name: showHitBallOnLaserPointer ]]
    -- upvalues: v20 (copy), v23 (copy)
    if v136 then
        if not v135.showPlopBallOnPointer then
            v135.showPlopBallOnPointer = true;
            v20(v135.plopBall);
            return;
        end;
    elseif v135.showPlopBallOnPointer then
        v23(v135.plopBall);
        v135.showPlopBallOnPointer = false;
    end;
end;
v38.cursorInputsChanged = function(v137) --[[ Line: 707 ]] --[[ Name: cursorInputsChanged ]]
    -- upvalues: l_VRService_0 (copy), v8 (copy)
    local l_DidPointerHit_0 = l_VRService_0.DidPointerHit;
    v137.cursorSurfaceGui.Enabled = l_DidPointerHit_0;
    if l_DidPointerHit_0 then
        local l_PointerHitCFrame_0 = l_VRService_0.PointerHitCFrame;
        local l_magnitude_0 = (v8.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).Position - l_PointerHitCFrame_0.Position).magnitude;
        local v141 = 1;
        local v142 = l_magnitude_0 * 0.01;
        if v142 < 0.05 then
            v141 = v142 / 0.05;
            v142 = 0.05;
        end;
        v137.cursorPart.Size = Vector3.new(v142, v142, v142);
        local v143 = CFrame.new(0, 0, v142 * 0.5);
        v137.cursorPart.CFrame = l_PointerHitCFrame_0 * v143;
        v137.cursorImage.Size = UDim2.new(v141, 0, v141, 0);
    end;
end;
v38.updateCursor_DEPRECATED = function(v144) --[[ Line: 732 ]] --[[ Name: updateCursor_DEPRECATED ]]
    -- upvalues: l_VRService_0 (copy), v8 (copy)
    if l_VRService_0.DidPointerHit then
        local l_PointerHitCFrame_1 = l_VRService_0.PointerHitCFrame;
        local v146 = v8.GetUserCFrameWorldSpace(v144.inputUserCFrame);
        if v144:isHeadMounted() then
            v146 = v8.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
        end;
        local l_p_0 = v146.p;
        local l_lookVector_0 = v146.lookVector;
        local l_Position_0 = l_PointerHitCFrame_1.Position;
        local l_lookVector_1 = l_PointerHitCFrame_1.lookVector;
        local v151 = l_lookVector_1:Dot(l_lookVector_0);
        if math.abs(v151) > 0.001 then
            l_Position_0 = l_p_0 + (l_Position_0 - l_p_0):Dot(l_lookVector_1) / v151 * l_lookVector_0;
            l_PointerHitCFrame_1 = l_PointerHitCFrame_1.Rotation + l_Position_0;
        end;
        local l_magnitude_1 = (workspace.CurrentCamera.CFrame.Position - l_PointerHitCFrame_1.Position).magnitude;
        local v153 = 1;
        local v154 = l_magnitude_1 * 0.01;
        if v154 < 0.05 then
            v153 = v154 / 0.05;
            v154 = 0.05;
        end;
        v144.cursorPart.Size = Vector3.new(v154, v154, v154);
        local v155 = CFrame.new(0, 0, v154 * 0.5);
        v144.cursorPart.CFrame = l_PointerHitCFrame_1 * v155;
        v144.cursorImage.Size = UDim2.new(v153, 0, v153, 0);
    end;
    v144.cursorSurfaceGui.Enabled = l_VRService_0.DidPointerHit;
end;
v38.disableComponent = function(v156) --[[ Line: 774 ]] --[[ Name: disableComponent ]]
    -- upvalues: v23 (copy)
    v23(v156.parabola, v156.parabolaOffhand, v156.originPart, v156.originPartOffhand, v156.plopPart, v156.plopBall, v156.cursorPart);
    v156:setNavigationActionEnabled(false);
    for _, v158 in pairs(v156.connections) do
        v158:Disconnect();
    end;
    v156.connections = {};
end;
v38.update = function(v159, _) --[[ Line: 791 ]] --[[ Name: update ]]
    -- upvalues: l_VRService_0 (copy), v36 (copy), l_LocalPlayer_0 (ref), v8 (copy)
    if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.Disabled then
        return;
    else
        v159.parabola.Thickness = v36.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
        v159.parabolaOffhand.Thickness = v36.ARC_THICKNESS * workspace.CurrentCamera.HeadScale;
        if l_LocalPlayer_0 and l_LocalPlayer_0.Character and l_LocalPlayer_0.Character:FindFirstChildOfClass("Tool") then
            v159.parabola.Color3 = v36.ARC_COLOR_BAD;
        else
            v159.parabola.Color3 = l_VRService_0.DidPointerHit and v36.ARC_COLOR_HIT or v36.ARC_COLOR_GOOD;
        end;
        local v161 = v8.GetUserCFrameWorldSpace(v159.inputUserCFrame);
        local l_p_1 = v161.p;
        local l_lookVector_2 = v161.lookVector;
        local v164 = nil;
        v164 = if l_VRService_0.DidPointerHit then l_p_1 + l_lookVector_2 * (l_VRService_0.PointerHitCFrame.Position - l_p_1).magnitude else l_p_1 + l_lookVector_2 * v159.laserMaxDistance;
        if v159:isHeadMounted() then
            v159.parabola.Visible = false;
        else
            v159.parabola.Visible = true;
            v159:renderAsLaser(l_p_1, v164);
        end;
        if l_VRService_0.LaserPointer == Enum.VRLaserPointerMode.DualPointer then
            if v159:isHeadMounted() then
                v159.parabolaOffhand.Visible = false;
                return;
            else
                v159.parabolaOffhand.Visible = true;
                local v165 = if v159.inputUserCFrame == Enum.UserCFrame.RightHand then Enum.UserCFrame.LeftHand else Enum.UserCFrame.RightHand;
                local v166 = v8.GetUserCFrameWorldSpace(v165);
                local l_p_2 = v166.p;
                v159:renderOffhandLaser(l_p_2, l_p_2 + v166.lookVector * 3);
            end;
        end;
        return;
    end;
end;
return v38;