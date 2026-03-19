local l_abs_0 = math.abs;
local l_clamp_0 = math.clamp;
local l_exp_0 = math.exp;
local l_rad_0 = math.rad;
local l_sign_0 = math.sign;
local l_sqrt_0 = math.sqrt;
local l_tan_0 = math.tan;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Lighting_0 = game:GetService("Lighting");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v16 = nil;
local v17 = nil;
local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
l_Workspace_0:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 67 ]]
    -- upvalues: l_Workspace_0 (copy), l_CurrentCamera_0 (ref)
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if l_CurrentCamera_1 then
        l_CurrentCamera_0 = l_CurrentCamera_1;
    end;
end);
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 80 ]]
    return UserSettings():IsUserFeatureEnabled("UserExitFreecamBreaksWithShiftlock");
end);
v23 = l_status_0 and l_result_0;
l_status_0 = nil;
local v26;
l_result_0, v26 = pcall(function() --[[ Line: 88 ]]
    return UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles");
end);
l_status_0 = l_result_0 and v26;
l_result_0 = nil;
local v27;
v26, v27 = pcall(function() --[[ Line: 96 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixFreecamDeltaTimeCalculation");
end);
l_result_0 = v26 and v27;
v26 = nil;
local v28;
v27, v28 = pcall(function() --[[ Line: 104 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixFreecamGuiChangeVisibility2");
end);
v26 = v27 and v28;
v27 = nil;
local v29;
v28, v29 = pcall(function() --[[ Line: 112 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamControlSpeed");
end);
v27 = v28 and v29;
v28 = nil;
local v30;
v29, v30 = pcall(function() --[[ Line: 120 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamTiltControl");
end);
v28 = v29 and v30;
v29 = nil;
local v31;
v30, v31 = pcall(function() --[[ Line: 128 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamSmoothnessControl");
end);
v29 = v30 and v31;
v30 = nil;
local v32;
v31, v32 = pcall(function() --[[ Line: 136 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamGuiDestabilization");
end);
v30 = v31 and v32;
v31 = nil;
local v33;
v32, v33 = pcall(function() --[[ Line: 144 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamDepthOfFieldEffect3");
end);
v31 = v32 and v33;
v32 = nil;
local v34;
v33, v34 = pcall(function() --[[ Line: 152 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLock2");
end);
v32 = v33 and v34;
v33 = nil;
local v35;
v34, v35 = pcall(function() --[[ Line: 160 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamPlayerLockResetHeight");
end);
v33 = v34 and v35;
v34 = nil;
local v36;
v35, v36 = pcall(function() --[[ Line: 168 ]]
    return UserSettings():IsUserFeatureEnabled("UserFreecamCustomGui");
end);
v34 = v35 and v36;
v35 = Enum.ContextActionPriority.Low.Value;
v36 = Enum.ContextActionPriority.High.Value;
local v37 = {
    Enum.KeyCode.LeftShift, 
    Enum.KeyCode.P
};
local v38 = {
    [Enum.KeyCode.Z] = true, 
    [Enum.KeyCode.C] = true
};
local v39 = {
    [Enum.KeyCode.ButtonL1] = true, 
    [Enum.KeyCode.ButtonR1] = true
};
local v40 = {
    [Enum.KeyCode.BackSlash] = true
};
local v41 = {
    [Enum.KeyCode.Slash] = true
};
local v42 = {
    [Enum.KeyCode.R] = true, 
    [Enum.KeyCode.T] = true
};
local v43 = {
    [Enum.KeyCode.G] = true
};
local v44 = {
    [Enum.KeyCode.X] = true
};
local v45 = {
    [Enum.KeyCode.L] = true
};
local v46 = Vector2.new(0.75, 1) * 8;
local v47 = 1.5;
local v48 = 1;
local v49 = 4;
local v50 = 1;
local v51 = {};
local v52 = 0;
local v53 = {};
local v54 = nil;
local v55 = nil;
local v56 = nil;
local v57 = nil;
local v58 = nil;
local v59 = false;
local v60 = 20;
local v61 = 0;
local v62 = {};
local v63 = 1;
local v64 = nil;
local v65 = false;
local v66 = false;
local v67 = {};
v67.__index = v67;
v67.new = function(v68, v69) --[[ Line: 267 ]] --[[ Name: new ]]
    -- upvalues: v67 (copy)
    local v70 = setmetatable({}, v67);
    v70.f = v68;
    v70.p = v69;
    v70.v = v69 * 0;
    return v70;
end;
v67.Update = function(v71, v72, v73) --[[ Line: 275 ]] --[[ Name: Update ]]
    -- upvalues: l_exp_0 (copy)
    local v74 = v71.f * 2 * 3.141592653589793;
    local l_p_0 = v71.p;
    local l_v_0 = v71.v;
    local v77 = v73 - l_p_0;
    local v78 = l_exp_0(-v74 * v72);
    local v79 = v73 + (l_v_0 * v72 - v77 * (v74 * v72 + 1)) * v78;
    local v80 = (v74 * v72 * (v77 * v74 - l_v_0) + l_v_0) * v78;
    v71.p = v79;
    v71.v = v80;
    return v79;
end;
v67.SetFreq = function(v81, v82) --[[ Line: 292 ]] --[[ Name: SetFreq ]]
    v81.f = v82;
end;
v67.Reset = function(v83, v84) --[[ Line: 296 ]] --[[ Name: Reset ]]
    v83.p = v84;
    v83.v = v84 * 0;
end;
local v85 = Vector3.new();
local v86 = nil;
v86 = if v28 then Vector3.new() else Vector2.new();
local v87 = 0;
local v88 = v67.new(v47, (Vector3.new()));
local v89 = v67.new(v48, Vector2.new());
local v90 = v67.new(v49, 0);
local v91 = v67.new(v50, 0);
local v92 = {};
local v93 = nil;
local function v95(v94) --[[ Line: 325 ]] --[[ Name: fCurve ]]
    -- upvalues: l_exp_0 (copy)
    return (l_exp_0(2 * v94) - 1) / 6.38905609893065;
end;
local function v97(v96) --[[ Line: 329 ]] --[[ Name: fDeadzone ]]
    -- upvalues: l_exp_0 (copy)
    return (l_exp_0(2 * ((v96 - 0.15) / 0.85)) - 1) / 6.38905609893065;
end;
v93 = function(v98) --[[ Line: 333 ]] --[[ Name: thumbstickCurve ]]
    -- upvalues: l_sign_0 (copy), l_abs_0 (copy), l_exp_0 (copy), l_clamp_0 (copy)
    return l_sign_0(v98) * l_clamp_0((l_exp_0(2 * ((l_abs_0(v98) - 0.15) / 0.85)) - 1) / 6.38905609893065, 0, 1);
end;
v95 = {
    ButtonX = 0, 
    ButtonY = 0, 
    DPadDown = 0, 
    DPadUp = 0, 
    DPadLeft = 0, 
    DPadRight = 0, 
    ButtonL2 = 0, 
    ButtonR2 = 0, 
    ButtonL1 = 0, 
    ButtonR1 = 0, 
    Thumbstick1 = Vector2.new(), 
    Thumbstick2 = Vector2.new()
};
v97 = {
    W = 0, 
    A = 0, 
    S = 0, 
    D = 0, 
    E = 0, 
    Q = 0, 
    U = 0, 
    H = 0, 
    J = 0, 
    K = 0, 
    I = 0, 
    Y = 0, 
    Up = 0, 
    Down = 0, 
    Left = 0, 
    Right = 0, 
    LeftShift = 0, 
    RightShift = 0, 
    Z = 0, 
    C = 0, 
    Comma = 0, 
    Period = 0, 
    LeftBracket = 0, 
    RightBracket = 0, 
    Semicolon = 0, 
    Quote = 0, 
    V = 0, 
    B = 0, 
    N = 0, 
    M = 0, 
    BackSlash = 0, 
    Minus = 0, 
    Equals = 0, 
    Slash = 0, 
    R = 0, 
    T = 0, 
    G = 0, 
    X = 0, 
    L = 0
};
local v99 = {
    Delta = Vector2.new(), 
    MouseWheel = 0
};
local v100 = Vector2.new(1, 1) * 0.04908738521234052;
local v101 = v100 / 60;
local v102 = Vector2.new(1, 1) * 0.39269908169872414;
local v103 = {
    FarIntensity = {
        ADJ = 0.1, 
        MIN = 0, 
        MAX = 1
    }, 
    NearIntensity = {
        ADJ = 0.1, 
        MIN = 0, 
        MAX = 1
    }, 
    FocusDistance = {
        ADJ = 20, 
        MIN = 0, 
        MAX = 200
    }, 
    FocusRadius = {
        ADJ = 5, 
        MIN = 0, 
        MAX = 50
    }
};
local v104 = 1;
local v105 = 1;
local v106 = 1;
local l_v97_0 = v97 --[[ copy: 78 -> 97 ]];
local l_v95_0 = v95 --[[ copy: 77 -> 98 ]];
do
    local l_v93_0, l_v104_0, l_v105_0, l_v106_0 = v93, v104, v105, v106;
    v92.Vel = function(v113) --[[ Line: 448 ]] --[[ Name: Vel ]]
        -- upvalues: v27 (ref), l_v104_0 (ref), l_v97_0 (copy), l_v95_0 (copy), l_clamp_0 (copy), l_v93_0 (ref), l_UserInputService_0 (copy)
        if v27 then
            l_v104_0 = l_clamp_0(l_v104_0 + v113 * (l_v97_0.Up - l_v97_0.Down + l_v95_0.DPadUp - l_v95_0.DPadDown) * 0.75, 0.01, 4);
        else
            l_v104_0 = l_clamp_0(l_v104_0 + v113 * (l_v97_0.Up - l_v97_0.Down) * 0.75, 0.01, 4);
        end;
        local v114 = Vector3.new(l_v93_0(l_v95_0.Thumbstick1.X), l_v93_0(l_v95_0.ButtonR2) - l_v93_0(l_v95_0.ButtonL2), l_v93_0(-l_v95_0.Thumbstick1.Y)) * Vector3.new(1, 1, 1, 0);
        local v115 = Vector3.new(l_v97_0.D - l_v97_0.A + l_v97_0.K - l_v97_0.H, l_v97_0.E - l_v97_0.Q + l_v97_0.I - l_v97_0.Y, l_v97_0.S - l_v97_0.W + l_v97_0.J - l_v97_0.U) * Vector3.new(1, 1, 1, 0);
        local v116 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
        return (v114 + v115) * (l_v104_0 * (v116 and 0.25 or 1));
    end;
    local l_v102_0 = v102 --[[ copy: 82 -> 99 ]];
    local l_v99_0 = v99 --[[ copy: 79 -> 100 ]];
    local l_v100_0 = v100 --[[ copy: 80 -> 101 ]];
    local l_v101_0 = v101 --[[ copy: 81 -> 102 ]];
    v92.Pan = function(v121) --[[ Line: 471 ]] --[[ Name: Pan ]]
        -- upvalues: l_v93_0 (ref), l_v95_0 (copy), l_v102_0 (copy), l_v99_0 (copy), l_v100_0 (copy), l_result_0 (ref), l_v101_0 (copy)
        local v122 = Vector2.new(l_v93_0(l_v95_0.Thumbstick2.Y), l_v93_0(-l_v95_0.Thumbstick2.X)) * l_v102_0;
        local v123 = l_v99_0.Delta * l_v100_0;
        if l_result_0 and v121 > 0 then
            v123 = l_v99_0.Delta / v121 * l_v101_0;
        end;
        l_v99_0.Delta = Vector2.new();
        return v122 + v123;
    end;
    v92.Fov = function(v124) --[[ Line: 486 ]] --[[ Name: Fov ]]
        -- upvalues: v27 (ref), l_v106_0 (ref), l_v97_0 (copy), l_v95_0 (copy), l_clamp_0 (copy), l_v99_0 (copy), l_result_0 (ref)
        if v27 then
            l_v106_0 = l_clamp_0(l_v106_0 + v124 * (l_v97_0.Right - l_v97_0.Left + l_v95_0.DPadRight - l_v95_0.DPadLeft) * 0.75, 0.01, 4);
        end;
        local v125 = (l_v95_0.ButtonX - l_v95_0.ButtonY) * 0.25;
        local v126 = l_v99_0.MouseWheel * 1;
        if l_result_0 and v124 > 0 then
            v126 = l_v99_0.MouseWheel / v124 * 0.016666666666666666;
        end;
        l_v99_0.MouseWheel = 0;
        if v27 then
            return (v125 + v126) * l_v106_0;
        else
            return v125 + v126;
        end;
    end;
    v92.Roll = function(v127) --[[ Line: 505 ]] --[[ Name: Roll ]]
        -- upvalues: l_v105_0 (ref), l_v97_0 (copy), l_clamp_0 (copy), l_v95_0 (copy)
        l_v105_0 = l_clamp_0(l_v105_0 + v127 * (l_v97_0.Period - l_v97_0.Comma) * 0.75, 0.01, 4);
        return ((l_v95_0.ButtonR1 - l_v95_0.ButtonL1) * 1 + (l_v97_0.C - l_v97_0.Z) * 1) * l_v105_0;
    end;
    v92.SpringControl = function(v128) --[[ Line: 514 ]] --[[ Name: SpringControl ]]
        -- upvalues: v31 (ref), l_UserInputService_0 (copy), v47 (ref), l_v97_0 (copy), l_clamp_0 (copy), v88 (copy), v48 (ref), v89 (copy), v49 (ref), v90 (copy), v50 (ref), v91 (copy)
        if v31 then
            local v129 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
            local v130 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl);
            if v129 or v130 then
                return;
            end;
        end;
        v47 = l_clamp_0(v47 + v128 * (l_v97_0.RightBracket - l_v97_0.LeftBracket) * 0.75, 0.01, 10);
        v88:SetFreq(v47);
        v48 = l_clamp_0(v48 + v128 * (l_v97_0.Quote - l_v97_0.Semicolon) * 0.75, 0.01, 10);
        v89:SetFreq(v48);
        v49 = l_clamp_0(v49 + v128 * (l_v97_0.B - l_v97_0.V) * 0.75, 0.01, 10);
        v90:SetFreq(v49);
        v50 = l_clamp_0(v50 + v128 * (l_v97_0.M - l_v97_0.N) * 0.75, 0.01, 10);
        v91:SetFreq(v50);
    end;
    local l_v103_0 = v103 --[[ copy: 83 -> 103 ]];
    v92.DoF = function(v132) --[[ Line: 537 ]] --[[ Name: DoF ]]
        -- upvalues: l_UserInputService_0 (copy), v20 (ref), l_v97_0 (copy), l_v103_0 (copy), l_clamp_0 (copy)
        local v133 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift);
        local v134 = l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl);
        if v133 then
            v20.FarIntensity = l_clamp_0(v20.FarIntensity + v132 * (l_v97_0.RightBracket - l_v97_0.LeftBracket) * l_v103_0.FarIntensity.ADJ, l_v103_0.FarIntensity.MIN, l_v103_0.FarIntensity.MAX);
            v20.InFocusRadius = l_clamp_0(v20.InFocusRadius + v132 * (l_v97_0.Equals - l_v97_0.Minus) * l_v103_0.FocusRadius.ADJ, l_v103_0.FocusRadius.MIN, l_v103_0.FocusRadius.MAX);
            return;
        elseif v134 then
            v20.NearIntensity = l_clamp_0(v20.NearIntensity + v132 * (l_v97_0.RightBracket - l_v97_0.LeftBracket) * l_v103_0.NearIntensity.ADJ, l_v103_0.NearIntensity.MIN, l_v103_0.NearIntensity.MAX);
            return;
        else
            v20.FocusDistance = l_clamp_0(v20.FocusDistance + v132 * (l_v97_0.Equals - l_v97_0.Minus) * l_v103_0.FocusDistance.ADJ, l_v103_0.FocusDistance.MIN, l_v103_0.FocusDistance.MAX);
            return;
        end;
    end;
    local _ = function(v135, v136) --[[ Line: 568 ]] --[[ Name: resetKeys ]]
        for v137, _ in pairs(v135) do
            if v136[v137.Name] then
                v136[v137.Name] = 0;
            end;
        end;
    end;
    local function v150(v140) --[[ Line: 576 ]] --[[ Name: handleDoubleTapReset ]]
        -- upvalues: v51 (copy), v52 (ref), v86 (ref), v91 (copy), v31 (ref), v39 (copy), l_v95_0 (copy), v38 (copy), l_v97_0 (copy)
        local v141 = os.clock();
        local v142 = v51[v140];
        local v143 = v142 and v141 - v142 or -1;
        if v142 and v143 <= 0.25 and v141 - v52 >= 0.1 then
            v86 = Vector3.new(v86.x, v86.y, 0);
            v91:Reset(0);
            if v31 then
                local l_v39_0 = v39;
                local l_l_v95_0_0 = l_v95_0;
                for v146, _ in pairs(l_v39_0) do
                    if l_l_v95_0_0[v146.Name] then
                        l_l_v95_0_0[v146.Name] = 0;
                    end;
                end;
                l_v39_0 = v38;
                l_l_v95_0_0 = l_v97_0;
                for v148, _ in pairs(l_v39_0) do
                    if l_l_v95_0_0[v148.Name] then
                        l_l_v95_0_0[v148.Name] = 0;
                    end;
                end;
            else
                l_v95_0.ButtonL1 = 0;
                l_v95_0.ButtonR1 = 0;
                l_v97_0.C = 0;
                l_v97_0.Z = 0;
            end;
            v52 = v141;
        end;
        v51[v140] = v141;
    end;
    local function v156(v151) --[[ Line: 601 ]] --[[ Name: findPlayerLockRootPart ]]
        -- upvalues: v62 (ref), v63 (ref), v59 (ref)
        if not v62 or #v62 < 1 then
            return nil;
        else
            for _ = 1, #v62 do
                v63 = (v63 - 1 + v151) % #v62 + 1;
                local v153 = v62[v63];
                local v154 = v153 and v153.Character;
                if v154 then
                    local l_Humanoid_0 = v154:FindFirstChildOfClass("Humanoid");
                    if l_Humanoid_0 and l_Humanoid_0.RootPart then
                        return l_Humanoid_0.RootPart;
                    end;
                end;
                if v151 == 0 then
                    v151 = 1;
                end;
            end;
            v59 = false;
            return nil;
        end;
    end;
    local function v196(_, v158, v159) --[[ Line: 628 ]] --[[ Name: Keypress ]]
        -- upvalues: l_v97_0 (copy), v28 (ref), v38 (copy), v150 (copy), v31 (ref), v40 (copy), v20 (ref), v53 (ref), l_CurrentCamera_0 (ref), l_Lighting_0 (copy), v55 (ref), v56 (ref), v32 (ref), v41 (copy), v59 (ref), v60 (ref), v33 (ref), v61 (ref), v64 (ref), v156 (copy), v42 (copy), v62 (ref), v34 (ref), v43 (copy), v17 (ref), v44 (copy), v65 (ref), v22 (ref), v45 (copy), v66 (ref), l_StarterGui_0 (copy)
        l_v97_0[v159.KeyCode.Name] = v158 == Enum.UserInputState.Begin and 1 or 0;
        if v28 and v38[v159.KeyCode] and v159.UserInputState == Enum.UserInputState.Begin then
            v150(v159.KeyCode);
        end;
        if v31 and v40[v159.KeyCode] and v159.UserInputState == Enum.UserInputState.Begin then
            if not v20.Enabled then
                v53 = {};
                for _, v161 in ipairs(l_CurrentCamera_0:GetChildren()) do
                    if v161:IsA("DepthOfFieldEffect") and v161.Enabled then
                        v53[#v53 + 1] = v161;
                        v161.Enabled = false;
                    end;
                end;
                for _, v163 in ipairs(l_Lighting_0:GetChildren()) do
                    if v163:IsA("DepthOfFieldEffect") and v163.Enabled then
                        v53[#v53 + 1] = v163;
                        v163.Enabled = false;
                    end;
                end;
                v55 = l_CurrentCamera_0.ChildAdded:Connect(function(v164) --[[ Line: 654 ]]
                    -- upvalues: v53 (ref)
                    if v164:IsA("DepthOfFieldEffect") and v164.Enabled then
                        v53[#v53 + 1] = v164;
                        v164.Enabled = false;
                    end;
                end);
                v56 = l_Lighting_0.ChildAdded:Connect(function(v165) --[[ Line: 660 ]]
                    -- upvalues: v53 (ref)
                    if v165:IsA("DepthOfFieldEffect") and v165.Enabled then
                        v53[#v53 + 1] = v165;
                        v165.Enabled = false;
                    end;
                end);
            else
                for _, v167 in ipairs(v53) do
                    if v167.Parent then
                        v167.Enabled = true;
                    end;
                end;
                if v55 then
                    v55:Disconnect();
                    v55 = nil;
                end;
                if v56 then
                    v56:Disconnect();
                    v56 = nil;
                end;
                v53 = {};
            end;
            v20.Enabled = not v20.Enabled;
            local l_v40_0 = v40;
            local l_l_v97_0_0 = l_v97_0;
            for v170, _ in pairs(l_v40_0) do
                if l_l_v97_0_0[v170.Name] then
                    l_l_v97_0_0[v170.Name] = 0;
                end;
            end;
        end;
        if v32 then
            if v41[v159.KeyCode] and v159.UserInputState == Enum.UserInputState.Begin then
                v59 = not v59;
                if v59 then
                    v60 = 20;
                    if v33 then
                        v61 = 0;
                    end;
                    v64 = v156(0);
                end;
                local l_v41_0 = v41;
                local l_l_v97_0_1 = l_v97_0;
                for v174, _ in pairs(l_v41_0) do
                    if l_l_v97_0_1[v174.Name] then
                        l_l_v97_0_1[v174.Name] = 0;
                    end;
                end;
            end;
            if v42[v159.KeyCode] and v159.UserInputState == Enum.UserInputState.Begin then
                if v59 and #v62 > 0 then
                    local v176 = l_v97_0.T - l_v97_0.R;
                    v64 = v156(v176);
                end;
                local l_v42_0 = v42;
                local l_l_v97_0_2 = l_v97_0;
                for v179, _ in pairs(l_v42_0) do
                    if l_l_v97_0_2[v179.Name] then
                        l_l_v97_0_2[v179.Name] = 0;
                    end;
                end;
            end;
        end;
        if v34 then
            if v43[v159.keyCode] and v159.UserInputState == Enum.UserInputState.Begin then
                if v17 and v17.Parent then
                    v17.Enabled = not v17.Enabled;
                end;
                local l_v43_0 = v43;
                local l_l_v97_0_3 = l_v97_0;
                for v183, _ in pairs(l_v43_0) do
                    if l_l_v97_0_3[v183.Name] then
                        l_l_v97_0_3[v183.Name] = 0;
                    end;
                end;
            end;
            if v44[v159.keyCode] and v159.UserInputState == Enum.UserInputState.Begin then
                v65 = not v65;
                if v22 then
                    local v185 = v22.getScreenGuis();
                    for _, v187 in pairs(v185) do
                        if v187.Parent and v187 ~= v17 then
                            v187.Enabled = v65;
                        end;
                    end;
                end;
                local l_v44_0 = v44;
                local l_l_v97_0_4 = l_v97_0;
                for v190, _ in pairs(l_v44_0) do
                    if l_l_v97_0_4[v190.Name] then
                        l_l_v97_0_4[v190.Name] = 0;
                    end;
                end;
            end;
            if v45[v159.keyCode] and v159.UserInputState == Enum.UserInputState.Begin then
                v66 = not v66;
                l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, v66);
                local l_v45_0 = v45;
                local l_l_v97_0_5 = l_v97_0;
                for v194, _ in pairs(l_v45_0) do
                    if l_l_v97_0_5[v194.Name] then
                        l_l_v97_0_5[v194.Name] = 0;
                    end;
                end;
            end;
        end;
        return Enum.ContextActionResult.Sink;
    end;
    local function v200(_, v198, v199) --[[ Line: 741 ]] --[[ Name: GpButton ]]
        -- upvalues: l_v95_0 (copy), v28 (ref), v39 (copy), v150 (copy)
        l_v95_0[v199.KeyCode.Name] = v198 == Enum.UserInputState.Begin and 1 or 0;
        if v28 and v39[v199.KeyCode] and v199.UserInputState == Enum.UserInputState.Begin then
            v150(v199.KeyCode);
        end;
        return Enum.ContextActionResult.Sink;
    end;
    local function v205(_, _, v203) --[[ Line: 753 ]] --[[ Name: MousePan ]]
        -- upvalues: l_v99_0 (copy)
        local l_Delta_0 = v203.Delta;
        l_v99_0.Delta = Vector2.new(-l_Delta_0.y, -l_Delta_0.x);
        return Enum.ContextActionResult.Sink;
    end;
    local function v209(_, _, v208) --[[ Line: 759 ]] --[[ Name: Thumb ]]
        -- upvalues: l_v95_0 (copy)
        l_v95_0[v208.KeyCode.Name] = v208.Position;
        return Enum.ContextActionResult.Sink;
    end;
    local function v213(_, _, v212) --[[ Line: 764 ]] --[[ Name: Trigger ]]
        -- upvalues: l_v95_0 (copy)
        l_v95_0[v212.KeyCode.Name] = v212.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function v217(_, _, v216) --[[ Line: 769 ]] --[[ Name: MouseWheel ]]
        -- upvalues: l_v99_0 (copy)
        l_v99_0[v216.UserInputType.Name] = -v216.Position.z;
        return Enum.ContextActionResult.Sink;
    end;
    local function _(v218) --[[ Line: 774 ]] --[[ Name: Zero ]]
        for v219, v220 in pairs(v218) do
            v218[v219] = v220 * 0;
        end;
    end;
    v92.StartCapture = function() --[[ Line: 780 ]] --[[ Name: StartCapture ]]
        -- upvalues: v27 (ref), l_ContextActionService_0 (copy), v196 (copy), v36 (copy), v200 (copy), v28 (ref), v29 (ref), v31 (ref), v32 (ref), v34 (ref), v205 (copy), v217 (copy), v213 (copy), v209 (copy)
        if v27 then
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboard", v196, false, v36, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardControlSpeed", v196, false, v36, Enum.KeyCode.Up, Enum.KeyCode.Down, Enum.KeyCode.Left, Enum.KeyCode.Right);
            l_ContextActionService_0:BindActionAtPriority("FreecamGamepadControlSpeed", v200, false, v36, Enum.KeyCode.DPadUp, Enum.KeyCode.DPadDown, Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight);
        else
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboard", v196, false, v36, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
        end;
        if v28 then
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardTiltControl", v196, false, v36, Enum.KeyCode.Z, Enum.KeyCode.C);
            l_ContextActionService_0:BindActionAtPriority("FreecamGamepadTiltControl", v200, false, v36, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardTiltControlSpeed", v196, false, v36, Enum.KeyCode.Comma, Enum.KeyCode.Period);
            if v29 then
                l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardSmoothnessControl", v196, false, v36, Enum.KeyCode.LeftBracket, Enum.KeyCode.RightBracket, Enum.KeyCode.Semicolon, Enum.KeyCode.Quote, Enum.KeyCode.V, Enum.KeyCode.B, Enum.KeyCode.N, Enum.KeyCode.M);
            end;
        end;
        if v31 then
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardDoFToggle", v196, false, v36, Enum.KeyCode.BackSlash);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardDoFControls", v196, false, v36, Enum.KeyCode.Minus, Enum.KeyCode.Equals);
        end;
        if v32 then
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardPlayerLockToggle", v196, false, v36, Enum.KeyCode.Slash);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardPlayerLockSwitch", v196, false, v36, Enum.KeyCode.R, Enum.KeyCode.T);
        end;
        if v34 then
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardCustomGuiToggle", v196, false, v36, Enum.KeyCode.G);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardPlayerGuiToggle", v196, false, v36, Enum.KeyCode.X);
            l_ContextActionService_0:BindActionAtPriority("FreecamKeyboardLeaderboardToggle", v196, false, v36, Enum.KeyCode.L);
        end;
        l_ContextActionService_0:BindActionAtPriority("FreecamMousePan", v205, false, v36, Enum.UserInputType.MouseMovement);
        l_ContextActionService_0:BindActionAtPriority("FreecamMouseWheel", v217, false, v36, Enum.UserInputType.MouseWheel);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadButton", v200, false, v36, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadTrigger", v213, false, v36, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
        l_ContextActionService_0:BindActionAtPriority("FreecamGamepadThumbstick", v209, false, v36, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
    end;
    v92.StopCapture = function() --[[ Line: 860 ]] --[[ Name: StopCapture ]]
        -- upvalues: v34 (ref), l_v104_0 (ref), v27 (ref), l_v106_0 (ref), v28 (ref), l_v105_0 (ref), l_v95_0 (copy), l_v97_0 (copy), l_v99_0 (copy), l_ContextActionService_0 (copy), v29 (ref), v31 (ref), v32 (ref)
        if not v34 then
            l_v104_0 = 1;
            if v27 then
                l_v106_0 = 1;
            end;
            if v28 then
                l_v105_0 = 1;
            end;
        end;
        local l_l_v95_0_1 = l_v95_0;
        for v223, v224 in pairs(l_l_v95_0_1) do
            l_l_v95_0_1[v223] = v224 * 0;
        end;
        l_l_v95_0_1 = l_v97_0;
        for v225, v226 in pairs(l_l_v95_0_1) do
            l_l_v95_0_1[v225] = v226 * 0;
        end;
        l_l_v95_0_1 = l_v99_0;
        for v227, v228 in pairs(l_l_v95_0_1) do
            l_l_v95_0_1[v227] = v228 * 0;
        end;
        l_ContextActionService_0:UnbindAction("FreecamKeyboard");
        if v27 then
            l_ContextActionService_0:UnbindAction("FreecamKeyboardControlSpeed");
            l_ContextActionService_0:UnbindAction("FreecamGamepadControlSpeed");
        end;
        if v28 then
            l_ContextActionService_0:UnbindAction("FreecamKeyboardTiltControl");
            l_ContextActionService_0:UnbindAction("FreecamGamepadTiltControl");
            l_ContextActionService_0:UnbindAction("FreecamKeyboardTiltControlSpeed");
            if v29 then
                l_ContextActionService_0:UnbindAction("FreecamKeyboardSmoothnessControl");
            end;
        end;
        if v31 then
            l_ContextActionService_0:UnbindAction("FreecamKeyboardDoFToggle");
            l_ContextActionService_0:UnbindAction("FreecamKeyboardDoFControls");
        end;
        if v32 then
            l_ContextActionService_0:UnbindAction("FreecamKeyboardPlayerLockToggle");
            l_ContextActionService_0:UnbindAction("FreecamKeyboardPlayerLockSwitch");
        end;
        if v34 then
            l_ContextActionService_0:UnbindAction("FreecamKeyboardCustomGuiToggle");
            l_ContextActionService_0:UnbindAction("FreecamKeyboardPlayerGuiToggle");
            l_ContextActionService_0:UnbindAction("FreecamKeyboardLeaderboardToggle");
        end;
        l_ContextActionService_0:UnbindAction("FreecamMousePan");
        l_ContextActionService_0:UnbindAction("FreecamMouseWheel");
        l_ContextActionService_0:UnbindAction("FreecamGamepadButton");
        l_ContextActionService_0:UnbindAction("FreecamGamepadTrigger");
        l_ContextActionService_0:UnbindAction("FreecamGamepadThumbstick");
    end;
    v92.getNavSpeed = function() --[[ Line: 906 ]] --[[ Name: getNavSpeed ]]
        -- upvalues: l_v104_0 (ref)
        return l_v104_0;
    end;
    v92.getFovSpeed = function() --[[ Line: 910 ]] --[[ Name: getFovSpeed ]]
        -- upvalues: l_v106_0 (ref)
        return l_v106_0;
    end;
    v92.getRollSpeed = function() --[[ Line: 914 ]] --[[ Name: getRollSpeed ]]
        -- upvalues: l_v105_0 (ref)
        return l_v105_0;
    end;
end;
v93 = function(v229) --[[ Line: 922 ]] --[[ Name: StepFreecam ]]
    -- upvalues: v29 (ref), v92 (copy), v31 (ref), v20 (ref), v88 (copy), v89 (copy), v90 (copy), v28 (ref), v91 (copy), v87 (ref), l_rad_0 (copy), l_tan_0 (copy), l_sqrt_0 (copy), l_clamp_0 (copy), v46 (copy), v86 (ref), v85 (ref), v32 (ref), v59 (ref), v64 (ref), v60 (ref), v61 (ref), v34 (ref), v21 (ref), v17 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v27 (ref), v62 (ref), v63 (ref), l_CurrentCamera_0 (ref)
    if v29 then
        v92.SpringControl(v229);
    end;
    if v31 and v20 and v20.Parent then
        v92.DoF(v229);
    end;
    local v230 = v88:Update(v229, v92.Vel(v229));
    local v231 = v89:Update(v229, v92.Pan(v229));
    local v232 = v90:Update(v229, v92.Fov(v229));
    local v233 = nil;
    if v28 then
        v233 = v91:Update(v229, v92.Roll(v229));
    end;
    local v234 = l_sqrt_0(0.7002075382097097 / l_tan_0((l_rad_0(v87 / 2))));
    v87 = l_clamp_0(v87 + v232 * 300 * (v229 / v234), 1, 120);
    local v235 = nil;
    if v28 then
        local v236 = v231 * v46 * (v229 / v234);
        v86 = v86 + Vector3.new(v236.X, v236.Y, v233 * -1.5707963267948966 * (v229 / v234));
        if v29 then
            v86 = Vector3.new(v86.x % 6.283185307179586, v86.y % 6.283185307179586, v86.z % 6.283185307179586);
        else
            v86 = Vector3.new(l_clamp_0(v86.x, -1.5707963267948966, 1.5707963267948966), v86.y % 6.283185307179586, v86.z);
        end;
        v235 = CFrame.new(v85) * CFrame.fromOrientation(v86.x, v86.y, v86.z) * CFrame.new(v230 * Vector3.new(64, 64, 64, 0) * v229);
    else
        v86 = v86 + v231 * v46 * (v229 / v234);
        v86 = Vector2.new(l_clamp_0(v86.x, -1.5707963267948966, 1.5707963267948966), v86.y % 6.283185307179586);
        v235 = CFrame.new(v85) * CFrame.fromOrientation(v86.x, v86.y, 0) * CFrame.new(v230 * Vector3.new(64, 64, 64, 0) * v229);
    end;
    if v32 and v59 and v64 then
        local v237 = v230.Z * Vector3.new(64, 64, 64, 0).Z * v229;
        local v238 = v230.Y * Vector3.new(64, 64, 64, 0).Y * v229;
        v60 = l_clamp_0(v60 + v237, 5, 50);
        v61 = l_clamp_0(v61 + v238, -10, 10);
        local v239 = CFrame.new(v64.Position + Vector3.new(0, v61, 0));
        local _ = nil;
        v235 = v239 * (if v28 then CFrame.fromOrientation(v86.x, v86.y, v86.z) else CFrame.fromOrientation(v86.x, v86.y, 0)) * CFrame.new(0, 0, v60);
    end;
    if v34 and v21 and v21.Parent and v17 and v17.Parent and v17.Enabled then
        local v241 = "";
        if v229 > 0 then
            local v242 = (v235.p - v85) / v229;
            v241 = v241 .. string.format("Velocity: (%.1f, %.1f, %.1f)\n", v242.X, v242.Y, v242.Z);
        end;
        v241 = v241 .. string.format("FOV: %.1f\n", v87);
        if v28 then
            v241 = v241 .. string.format("Tilt: %.1f\194\176\n", (math.deg(v86.z)));
        end;
        if v29 then
            v241 = (((v241 .. string.format("Stiffness (Vel): %.1f\n", v47)) .. string.format("Stiffness (Pan): %.1f\n", v48)) .. string.format("Stiffness (FOV): %.1f\n", v49)) .. string.format("Stiffness (Roll): %.1f\n", v50);
        end;
        if v27 then
            v241 = ((v241 .. string.format("Movement Speed: %.1f\n", v92.getNavSpeed())) .. string.format("Zoom Speed: %.1f\n", v92.getFovSpeed())) .. string.format("Tilt Speed: %.1f\n", v92.getRollSpeed());
        end;
        if v31 then
            v241 = if v20 and v20.Parent and v20.Enabled then ((((v241 .. string.format("Custom Depth Of Field: On\n")) .. string.format("Custom Depth Of Field Near Intensity: %.1f\n", v20.NearIntensity)) .. string.format("Custom Depth Of Field Far Intensity: %.1f\n", v20.FarIntensity)) .. string.format("Custom Depth Of Field Focus Distance: %.1f\n", v20.FocusDistance)) .. string.format("Custom Depth Of Field Focus Radius: %.1f\n", v20.InFocusRadius) else v241 .. string.format("Custom Depth Of Field: Off\n");
        end;
        if v32 then
            v241 = if v59 and #v62 > 0 then v241 .. string.format("Player Lock: %s\n", v62[v63].Name) else v241 .. string.format("Player Lock: Off\n");
        end;
        v21.Text = v241;
    end;
    v85 = v235.p;
    l_CurrentCamera_0.CFrame = v235;
    l_CurrentCamera_0.Focus = v235;
    l_CurrentCamera_0.FieldOfView = v87;
end;
v95 = function() --[[ Line: 1038 ]] --[[ Name: CheckMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v244 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v245 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v246 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    return l_DevEnableMouseLock_0 and v245 and not v246 and not v244;
end;
v22 = {};
v97 = nil;
v99 = nil;
v100 = nil;
v101 = nil;
v102 = nil;
v103 = nil;
v104 = {};
v105 = {
    Backpack = true, 
    Chat = true, 
    Health = true, 
    PlayerList = true
};
v106 = {
    BadgesNotificationsActive = true, 
    PointsNotificationsActive = true
};
do
    local l_v97_1, l_v99_1, l_v100_1, l_v101_1, l_v102_1, l_v103_1, l_v104_1 = v97, v99, v100, v101, v102, v103, v104;
    v22.Push = function() --[[ Line: 1071 ]] --[[ Name: Push ]]
        -- upvalues: v105 (copy), l_StarterGui_0 (copy), v106 (copy), l_LocalPlayer_0 (ref), l_v104_1 (ref), v26 (ref), v54 (ref), v34 (ref), v65 (ref), l_v103_1 (ref), l_CurrentCamera_0 (ref), l_v100_1 (ref), l_v102_1 (ref), l_v101_1 (ref), l_v99_1 (ref), l_UserInputService_0 (copy), v23 (ref), l_Players_0 (copy), l_GameSettings_0 (copy), l_v97_1 (ref)
        local v254 = false;
        for v255 in pairs(v105) do
            v105[v255] = l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType[v255]);
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v255], false);
        end;
        for v256 in pairs(v106) do
            v106[v256] = l_StarterGui_0:GetCore(v256);
            l_StarterGui_0:SetCore(v256, false);
        end;
        local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
        if l_PlayerGui_0 then
            for _, v259 in pairs(l_PlayerGui_0:GetChildren()) do
                if v259:IsA("ScreenGui") and v259.Enabled then
                    l_v104_1[#l_v104_1 + 1] = v259;
                    v259.Enabled = false;
                end;
            end;
            if v26 then
                v54 = l_PlayerGui_0.ChildAdded:Connect(function(v260) --[[ Line: 1089 ]]
                    -- upvalues: l_v104_1 (ref), v34 (ref), v65 (ref)
                    if v260:IsA("ScreenGui") and v260.Enabled then
                        l_v104_1[#l_v104_1 + 1] = v260;
                        if v34 then
                            v260.Enabled = v65;
                            return;
                        else
                            v260.Enabled = false;
                        end;
                    end;
                end);
            end;
        end;
        l_v103_1 = l_CurrentCamera_0.FieldOfView;
        l_CurrentCamera_0.FieldOfView = 70;
        l_v100_1 = l_CurrentCamera_0.CameraType;
        l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
        l_v102_1 = l_CurrentCamera_0.CFrame;
        l_v101_1 = l_CurrentCamera_0.Focus;
        l_v99_1 = l_UserInputService_0.MouseIconEnabled;
        l_UserInputService_0.MouseIconEnabled = false;
        if v23 then
            local l_DevEnableMouseLock_1 = l_Players_0.LocalPlayer.DevEnableMouseLock;
            local v262 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
            local v263 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
            local v264 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
            if l_DevEnableMouseLock_1 and v263 and not v264 and not v262 then
                l_v97_1 = Enum.MouseBehavior.Default;
                v254 = true;
            end;
        end;
        if not v254 then
            l_v97_1 = l_UserInputService_0.MouseBehavior;
        end;
        v254 = false;
        l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
    end;
    v22.Pop = function() --[[ Line: 1123 ]] --[[ Name: Pop ]]
        -- upvalues: v105 (copy), l_StarterGui_0 (copy), v106 (copy), l_v104_1 (ref), v34 (ref), v17 (ref), v26 (ref), v54 (ref), l_CurrentCamera_0 (ref), l_v103_1 (ref), l_v100_1 (ref), l_v102_1 (ref), l_v101_1 (ref), l_UserInputService_0 (copy), l_v99_1 (ref), l_v97_1 (ref)
        for v265, v266 in pairs(v105) do
            l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType[v265], v266);
        end;
        for v267, v268 in pairs(v106) do
            l_StarterGui_0:SetCore(v267, v268);
        end;
        for _, v270 in pairs(l_v104_1) do
            if v34 then
                if v270.Parent and v270 ~= v17 then
                    v270.Enabled = true;
                end;
            elseif v270.Parent then
                v270.Enabled = true;
            end;
        end;
        if v26 then
            if v54 then
                v54:Disconnect();
                v54 = nil;
            end;
            l_v104_1 = {};
        end;
        l_CurrentCamera_0.FieldOfView = l_v103_1;
        l_v103_1 = nil;
        l_CurrentCamera_0.CameraType = l_v100_1;
        l_v100_1 = nil;
        l_CurrentCamera_0.CFrame = l_v102_1;
        l_v102_1 = nil;
        l_CurrentCamera_0.Focus = l_v101_1;
        l_v101_1 = nil;
        l_UserInputService_0.MouseIconEnabled = l_v99_1;
        l_v99_1 = nil;
        l_UserInputService_0.MouseBehavior = l_v97_1;
        l_v97_1 = nil;
    end;
    v22.getScreenGuis = function() --[[ Line: 1169 ]] --[[ Name: getScreenGuis ]]
        -- upvalues: l_v104_1 (ref)
        return l_v104_1;
    end;
end;
v97 = function(v271) --[[ Line: 1174 ]] --[[ Name: removePlayerFromList ]]
    -- upvalues: v62 (ref), v63 (ref), v59 (ref)
    for v272, v273 in ipairs(v62) do
        if v273 == v271 then
            table.remove(v62, v272);
            if v63 == v272 and v59 then
                v59 = false;
                v63 = 1;
            end;
            if v272 < v63 then
                v63 = v63 - 1;
            end;
            if v63 > #v62 or v63 < 1 then
                v63 = 1;
                return;
            else
                break;
            end;
        end;
    end;
end;
v99 = function() --[[ Line: 1198 ]] --[[ Name: initializePlayerList ]]
    -- upvalues: v62 (ref), l_Players_0 (copy), l_LocalPlayer_0 (ref), v63 (ref), v57 (ref), v58 (ref), v97 (copy)
    v62 = l_Players_0:GetPlayers();
    for v274, v275 in ipairs(v62) do
        if v275 == l_LocalPlayer_0 then
            v63 = v274;
            break;
        end;
    end;
    v57 = l_Players_0.PlayerAdded:Connect(function(v276) --[[ Line: 1208 ]]
        -- upvalues: v62 (ref)
        table.insert(v62, v276);
    end);
    v58 = l_Players_0.PlayerRemoving:Connect(v97);
end;
v100 = function() --[[ Line: 1215 ]] --[[ Name: StartFreecam ]]
    -- upvalues: v32 (ref), v99 (copy), v30 (ref), l_status_0 (ref), l_CurrentCamera_0 (ref), v28 (ref), v86 (ref), v85 (ref), v87 (ref), v88 (copy), v89 (copy), v90 (copy), v91 (copy), v34 (ref), v29 (ref), v47 (ref), v48 (ref), v49 (ref), v50 (ref), v16 (ref), l_LocalPlayer_0 (ref), v17 (ref), v21 (ref), v22 (ref), v31 (ref), v20 (ref), l_RunService_0 (copy), v93 (copy), v92 (copy)
    if v32 then
        v99();
    end;
    if not v30 and l_status_0 then
        script:SetAttribute("FreecamEnabled", true);
    end;
    local l_CFrame_0 = l_CurrentCamera_0.CFrame;
    if v28 then
        v86 = Vector3.new(l_CFrame_0:toEulerAnglesYXZ());
    else
        v86 = Vector2.new(l_CFrame_0:toEulerAnglesYXZ());
    end;
    v85 = l_CFrame_0.p;
    v87 = l_CurrentCamera_0.FieldOfView;
    v88:Reset((Vector3.new()));
    v89:Reset(Vector2.new());
    v90:Reset(0);
    if v28 then
        v91:Reset(0);
    end;
    if not v34 and v29 then
        v47 = 1.5;
        v48 = 1;
        v49 = 4;
        v50 = 1;
    end;
    if v34 then
        v16 = l_LocalPlayer_0:WaitForChild("PlayerGui");
        v17 = v16:WaitForChild("Freecam");
        if not v21 or not v21.Parent then
            v21 = Instance.new("TextLabel");
            v21.Name = "FreecamCustomGui";
            v21.TextColor3 = Color3.new(1, 1, 1);
            v21.Font = Enum.Font.SourceSansBold;
            v21.TextSize = 20;
            v21.TextStrokeTransparency = 0;
            v21.BackgroundTransparency = 1;
            v21.TextWrapped = true;
            v21.TextXAlignment = Enum.TextXAlignment.Right;
            v21.AutomaticSize = Enum.AutomaticSize.Y;
            v21.AnchorPoint = Vector2.new(1, 1);
            v21.Position = UDim2.new(1, -10, 1, -10);
            v21.Size = UDim2.new(0, 400, 0, 0);
            v21.Parent = v17;
        end;
    end;
    v22.Push();
    if v31 and (not v20 or not v20.Parent) then
        v20 = Instance.new("DepthOfFieldEffect");
        v20.Enabled = false;
        v20.Name = "FreecamDepthOfField";
        v20.Parent = l_CurrentCamera_0;
    end;
    l_RunService_0:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v93);
    v92.StartCapture();
end;
v101 = function() --[[ Line: 1287 ]] --[[ Name: StopFreecam ]]
    -- upvalues: v30 (ref), l_status_0 (ref), v32 (ref), v57 (ref), v58 (ref), v59 (ref), v63 (ref), v62 (ref), v31 (ref), v20 (ref), v53 (ref), v55 (ref), v56 (ref), v34 (ref), v17 (ref), v65 (ref), v66 (ref), v92 (copy), l_RunService_0 (copy), v22 (ref)
    if not v30 and l_status_0 then
        script:SetAttribute("FreecamEnabled", false);
    end;
    if v32 then
        if v57 then
            v57:Disconnect();
            v57 = nil;
        end;
        if v58 then
            v58:Disconnect();
            v58 = nil;
        end;
        v59 = false;
        v63 = 1;
        v62 = {};
    end;
    if v31 and v20 and v20.Parent then
        if v20.Enabled then
            for _, v279 in ipairs(v53) do
                if v279.Parent then
                    v279.Enabled = true;
                end;
            end;
            if v55 then
                v55:Disconnect();
                v55 = nil;
            end;
            if v56 then
                v56:Disconnect();
                v56 = nil;
            end;
            v53 = {};
        end;
        v20.Enabled = false;
    end;
    if v34 then
        if v17 and v17.Parent then
            v17.Enabled = false;
        end;
        v65 = false;
        v66 = false;
    end;
    v92.StopCapture();
    l_RunService_0:UnbindFromRenderStep("Freecam");
    v22.Pop();
end;
v102 = false;
do
    local l_v102_2 = v102;
    v103 = function() --[[ Line: 1348 ]] --[[ Name: ToggleFreecam ]]
        -- upvalues: l_v102_2 (ref), v101 (copy), v100 (copy), v30 (ref)
        if l_v102_2 then
            v101();
        else
            v100();
        end;
        l_v102_2 = not l_v102_2;
        if v30 then
            script:SetAttribute("FreecamEnabled", l_v102_2);
        end;
    end;
    v104 = function(v281) --[[ Line: 1360 ]] --[[ Name: CheckMacro ]]
        -- upvalues: l_UserInputService_0 (copy), l_v102_2 (ref), v101 (copy), v100 (copy), v30 (ref)
        for v282 = 1, #v281 - 1 do
            if not l_UserInputService_0:IsKeyDown(v281[v282]) then
                return;
            end;
        end;
        if l_v102_2 then
            v101();
        else
            v100();
        end;
        l_v102_2 = not l_v102_2;
        if v30 then
            script:SetAttribute("FreecamEnabled", l_v102_2);
        end;
    end;
    l_ContextActionService_0:BindActionAtPriority("FreecamToggle", function(_, v284, v285) --[[ Line: 1369 ]] --[[ Name: HandleActivationInput ]]
        -- upvalues: v37 (copy), v104 (copy)
        if v284 == Enum.UserInputState.Begin and v285.KeyCode == v37[#v37] then
            v104(v37);
        end;
        return Enum.ContextActionResult.Pass;
    end, false, v35, v37[#v37]);
    if v30 or l_status_0 then
        script:SetAttribute("FreecamEnabled", l_v102_2);
        script:GetAttributeChangedSignal("FreecamEnabled"):Connect(function() --[[ Line: 1382 ]]
            -- upvalues: l_v102_2 (ref), v100 (copy), v101 (copy)
            local l_script_Attribute_0 = script:GetAttribute("FreecamEnabled");
            if typeof(l_script_Attribute_0) ~= "boolean" then
                script:SetAttribute("FreecamEnabled", l_v102_2);
                return;
            else
                if l_script_Attribute_0 ~= l_v102_2 then
                    if l_script_Attribute_0 then
                        v100();
                        l_v102_2 = true;
                        return;
                    else
                        v101();
                        l_v102_2 = false;
                    end;
                end;
                return;
            end;
        end);
    end;
end;
return {};