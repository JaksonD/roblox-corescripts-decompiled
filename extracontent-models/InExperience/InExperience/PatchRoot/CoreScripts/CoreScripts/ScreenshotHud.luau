local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v10 = require(l_RobloxGui_0.Modules.CaptureMaster);
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local v13 = require(l_CorePackages_0.Packages.Promise);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
if not require(l_RobloxGui_0.Modules.Flags.GetFFlagScreenshotHudApi)() then
    return;
else
    local l_ScreenshotHud_0 = l_GuiService_0:WaitForChild("ScreenshotHud");
    local v16 = {
        Default = {
            BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
            BackgroundTransparency = 0
        }, 
        Hovered = {
            BackgroundColor3 = Color3.fromRGB(0, 232, 126), 
            BackgroundTransparency = 0
        }, 
        Pressed = {
            BackgroundColor3 = Color3.fromRGB(0, 232, 126), 
            BackgroundTransparency = 0.5
        }
    };
    local v17 = nil;
    local v18 = nil;
    local v19 = {};
    local v20 = {};
    local v21 = nil;
    local v22 = false;
    local function v28(v23, v24) --[[ Line: 72 ]] --[[ Name: createFrame ]]
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundColor3 = Color3.new(1, 1, 1);
        l_Frame_0.BackgroundTransparency = 1;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
        for v26, v27 in pairs(v23) do
            l_Frame_0[v26] = v27;
        end;
        l_Frame_0.Parent = v24;
        return l_Frame_0;
    end;
    local function v35(v29, v30, v31) --[[ Line: 89 ]] --[[ Name: createImageLabel ]]
        local l_ImageLabel_0 = Instance.new("ImageLabel");
        l_ImageLabel_0.Image = v29;
        l_ImageLabel_0.BackgroundTransparency = 1;
        l_ImageLabel_0.BorderSizePixel = 0;
        l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
        l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
        for v33, v34 in pairs(v30) do
            l_ImageLabel_0[v33] = v34;
        end;
        l_ImageLabel_0.Parent = v31;
        return l_ImageLabel_0;
    end;
    local function v42(v36, v37, v38) --[[ Line: 107 ]] --[[ Name: createImageButton ]]
        local l_ImageButton_0 = Instance.new("ImageButton");
        l_ImageButton_0.Image = v36;
        l_ImageButton_0.BackgroundTransparency = 1;
        l_ImageButton_0.BorderSizePixel = 0;
        l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
        l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
        for v40, v41 in pairs(v37) do
            l_ImageButton_0[v40] = v41;
        end;
        l_ImageButton_0.Parent = v38;
        return l_ImageButton_0;
    end;
    local function v49(v43, v44, v45) --[[ Line: 125 ]] --[[ Name: createTextLabel ]]
        -- upvalues: l_AppFonts_0 (copy)
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = v43;
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.BorderSizePixel = 0;
        l_TextLabel_0.Font = l_AppFonts_0.default:getMedium();
        l_TextLabel_0.Position = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.TextSize = 20;
        for v47, v48 in pairs(v44) do
            l_TextLabel_0[v47] = v48;
        end;
        l_TextLabel_0.Parent = v45;
        return l_TextLabel_0;
    end;
    local l_l_GuiService_0_GuiInset_0, v51 = l_GuiService_0:GetGuiInset();
    local v52 = v28({
        Name = "ScreenshotHudFrame", 
        Position = UDim2.new(0, -l_l_GuiService_0_GuiInset_0.X, 0, -l_l_GuiService_0_GuiInset_0.Y), 
        Size = UDim2.new(1, l_l_GuiService_0_GuiInset_0.X + v51.X, 1, l_l_GuiService_0_GuiInset_0.Y + v51.Y), 
        Visible = false
    }, l_RobloxGui_0);
    local v53 = v28({
        Name = "ScreenshotHudContent", 
        Position = UDim2.new(0, l_l_GuiService_0_GuiInset_0.X, 0, l_l_GuiService_0_GuiInset_0.Y), 
        Size = UDim2.new(1, -l_l_GuiService_0_GuiInset_0.X - v51.X, 1, -l_l_GuiService_0_GuiInset_0.Y - v51.Y), 
        Visible = false
    }, v52);
    local v54 = v42("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutoButtonColor = false, 
        BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
        BackgroundTransparency = 0.5, 
        Name = "CameraButton", 
        Position = UDim2.new(0.5, 0, 1, -50), 
        Size = UDim2.fromOffset(64, 64)
    }, nil);
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(0, 32);
    l_UICorner_0.Parent = v54;
    local v56 = v35("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v16.Default.BackgroundColor3, 
        BackgroundTransparency = v16.Default.BackgroundTransparency, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(52, 52)
    }, v54);
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(0, 26);
    l_UICorner_1.Parent = v56;
    local v58 = v35("rbxasset://textures/ui/ScreenshotHud/Camera.png", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(32, 32)
    }, v56);
    local v59 = v42("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(7, 7, 8), 
        BackgroundTransparency = 0, 
        Name = "CloseButton", 
        Position = UDim2.new(0.5, -66, 1, -50), 
        Size = UDim2.fromOffset(48, 48)
    }, nil);
    local l_UICorner_2 = Instance.new("UICorner");
    l_UICorner_2.CornerRadius = UDim.new(0, 24);
    l_UICorner_2.Parent = v59;
    local _ = v35("rbxasset://textures/ui/ScreenshotHud/Close.png", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(32, 32)
    }, v59);
    local v62 = v42("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
        BackgroundTransparency = 0, 
        Name = "CameraButton", 
        Position = UDim2.new(1, -94, 1, -78), 
        Size = UDim2.fromOffset(140, 36)
    }, nil);
    local l_UICorner_3 = Instance.new("UICorner");
    l_UICorner_3.CornerRadius = UDim.new(0, 18);
    l_UICorner_3.Parent = v62;
    local _ = v35("rbxasset://textures/ui/Controls/xboxY.png", {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 6, 0.5, 0), 
        Size = UDim2.fromOffset(24, 24)
    }, v62);
    local _ = v49(v11:FormatByKey("CoreScripts.ScreenshotHud.Action.TakePhoto"), {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 30, 0.5, 0), 
        Size = UDim2.new(1, -36, 0, 20), 
        TextScaled = true, 
        TextWrapped = true
    }, v62);
    local v66 = v42("", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = Color3.fromRGB(7, 7, 8), 
        BackgroundTransparency = 0, 
        Name = "CloseButton", 
        Position = UDim2.new(1, -228, 1, -78), 
        Size = UDim2.fromOffset(104, 36)
    }, nil);
    local l_UICorner_4 = Instance.new("UICorner");
    l_UICorner_4.CornerRadius = UDim.new(0, 18);
    l_UICorner_4.Parent = v66;
    local _ = v35("rbxasset://textures/ui/Controls/xboxB.png", {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 6, 0.5, 0), 
        Size = UDim2.fromOffset(24, 24)
    }, v66);
    local _ = v49(v11:FormatByKey("CoreScripts.ScreenshotHud.Action.Cancel"), {
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 30, 0.5, 0), 
        Size = UDim2.new(1, -36, 0, 20), 
        TextScaled = true, 
        TextWrapped = true
    }, v66);
    local v70 = v28({
        Active = true, 
        BackgroundTransparency = 0.5, 
        Name = "FlashOverlay", 
        Visible = false, 
        ZIndex = 3
    }, v52);
    local function v72() --[[ Line: 279 ]] --[[ Name: checkOrRequestExternalStoragePermissions ]]
        -- upvalues: l_PermissionsProtocol_0 (copy), v13 (copy)
        return l_PermissionsProtocol_0.default:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.WRITE_MEDIA_STORAGE
        }):andThen(function(v71) --[[ Line: 284 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v13 (ref)
            return v71 == l_PermissionsProtocol_0.Status.AUTHORIZED and v13.resolve() or v13.reject();
        end);
    end;
    local function v77() --[[ Line: 290 ]] --[[ Name: getEnabledPlayerScreenGuis ]]
        -- upvalues: l_Players_0 (copy)
        local l_Descendants_0 = l_Players_0.LocalPlayer.PlayerGui:GetDescendants();
        local v74 = {};
        for _, v76 in ipairs(l_Descendants_0) do
            if v76:IsA("ScreenGui") and v76.Enabled then
                table.insert(v74, v76);
            end;
        end;
        return v74;
    end;
    local function v81() --[[ Line: 301 ]] --[[ Name: getEnabledCoreGuiTypes ]]
        -- upvalues: l_StarterGui_0 (copy)
        local v78 = {};
        for _, v80 in ipairs(Enum.CoreGuiType:GetEnumItems()) do
            if l_StarterGui_0:GetCoreGuiEnabled(v80) then
                table.insert(v78, v80);
            end;
        end;
        return v78;
    end;
    local function v82() --[[ Line: 311 ]]

    end;
    local function v83() --[[ Line: 313 ]] --[[ Name: onCameraButtonActivated ]]
        -- upvalues: l_UserInputService_0 (copy), v72 (copy), v82 (ref), v10 (copy)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.Android then
            v72():andThen(v82, function() --[[ Line: 315 ]]
                -- upvalues: v10 (ref)
                v10:ShowPermissionToast();
            end);
            return;
        else
            v82();
            return;
        end;
    end;
    v82 = function() --[[ Line: 323 ]]
        -- upvalues: v10 (copy), v21 (ref), l_ScreenshotHud_0 (copy), v77 (copy), v81 (copy), l_StarterGui_0 (copy), l_ProximityPromptService_0 (copy), v53 (copy), l_Players_0 (copy), l_CoreGui_0 (copy), v70 (copy), v54 (copy), v83 (copy), l_RbxAnalyticsService_0 (copy)
        v10:DismissNotification();
        if v21 then
            v21:Disconnect();
            v21 = nil;
        end;
        local v84 = false;
        local v85 = false;
        local v86 = nil;
        if l_ScreenshotHud_0.HidePlayerGuiForCaptures then
            v86 = v77();
            for _, v88 in ipairs(v86) do
                v88.Enabled = false;
            end;
            v85 = true;
        end;
        local v89 = nil;
        if l_ScreenshotHud_0.HideCoreGuiForCaptures then
            v89 = v81();
            for _, v91 in ipairs(v89) do
                l_StarterGui_0:SetCoreGuiEnabled(v91, false);
            end;
            v84 = true;
        end;
        local l_Enabled_0 = l_ProximityPromptService_0.Enabled;
        l_ProximityPromptService_0.Enabled = false;
        v53.Visible = false;
        wait(0.2);
        local v93 = {};
        for _, v95 in pairs(l_Players_0:GetPlayers()) do
            local v96 = v95.Character and v95.Character:WaitForChild("Humanoid");
            if v96 then
                v93[v96] = v96.DisplayDistanceType;
                v96.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            end;
        end;
        l_CoreGui_0:TakeScreenshot();
        wait(0.2);
        v53.Visible = true;
        v70.Visible = true;
        wait(0.2);
        v70.Visible = false;
        if not v21 then
            v21 = v54.Activated:connect(v83);
        end;
        l_ProximityPromptService_0.Enabled = l_Enabled_0;
        for _, v98 in pairs(l_Players_0:GetPlayers()) do
            local v99 = v98.Character and v98.Character:WaitForChild("Humanoid");
            if v99 and v93[v99] then
                v99.DisplayDistanceType = v93[v99];
            end;
        end;
        if v85 then
            for _, v101 in ipairs(v86) do
                v101.Enabled = true;
            end;
        end;
        if v84 then
            for _, v103 in ipairs(v89) do
                l_StarterGui_0:SetCoreGuiEnabled(v103, true);
            end;
        end;
        if l_ScreenshotHud_0.CloseWhenScreenshotTaken then
            l_ScreenshotHud_0.Visible = false;
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "TakeScreenshot", {
            pid = tostring(game.PlaceId)
        });
    end;
    local function _(v104) --[[ Line: 424 ]] --[[ Name: isGamepad ]]
        return v104.Name:match("^Gamepad*") ~= nil;
    end;
    local function v106() --[[ Line: 428 ]] --[[ Name: updateGamepadButtons ]]
        -- upvalues: v17 (ref), v18 (ref), v22 (ref), v62 (copy), v54 (copy), v66 (copy), v59 (copy), v53 (copy), l_ScreenshotHud_0 (copy)
        if v17 then
            v17.Parent = nil;
        end;
        if v18 then
            v18.Parent = nil;
        end;
        v17 = if v22 then v62 else v54;
        v18 = if v22 then v66 else v59;
        v17.Parent = v53;
        v18.Parent = v53;
        if l_ScreenshotHud_0.CameraButtonPosition ~= UDim2.fromOffset(0, 0) then
            v17.Position = l_ScreenshotHud_0.CameraButtonPosition;
        end;
        if l_ScreenshotHud_0.CloseButtonPosition ~= UDim2.fromOffset(0, 0) then
            v18.Position = l_ScreenshotHud_0.CloseButtonPosition;
        end;
    end;
    local function v110(v107) --[[ Line: 453 ]] --[[ Name: onLastInputTypeChanged ]]
        -- upvalues: l_UserInputService_0 (copy), v22 (ref), v106 (copy)
        local _ = nil;
        local v109 = (v107 or l_UserInputService_0:GetLastInputType()).Name:match("^Gamepad*") ~= nil;
        if v22 ~= v109 then
            v22 = v109;
            v106();
        end;
    end;
    local function v123() --[[ Line: 469 ]] --[[ Name: setupConnections ]]
        -- upvalues: v54 (copy), v56 (copy), v16 (copy), v19 (ref), v21 (ref), v83 (copy), v59 (copy), l_ScreenshotHud_0 (copy), l_ContextActionService_0 (copy), v20 (ref), l_UserInputService_0 (copy), v22 (ref), v106 (copy), v110 (copy)
        local v112 = v54.InputBegan:Connect(function(v111) --[[ Line: 470 ]]
            -- upvalues: v56 (ref), v16 (ref)
            if v111.UserInputType == Enum.UserInputType.MouseMovement then
                v56.BackgroundColor3 = v16.Hovered.BackgroundColor3;
                v56.BackgroundTransparency = v16.Hovered.BackgroundTransparency;
                return;
            else
                if v111.UserInputType == Enum.UserInputType.MouseButton1 or v111.UserInputType == Enum.UserInputType.Touch then
                    v56.BackgroundColor3 = v16.Pressed.BackgroundColor3;
                    v56.BackgroundTransparency = v16.Pressed.BackgroundTransparency;
                end;
                return;
            end;
        end);
        table.insert(v19, v112);
        local v113 = v54.InputEnded:Connect(function() --[[ Line: 484 ]]
            -- upvalues: v56 (ref), v16 (ref)
            v56.BackgroundColor3 = v16.Default.BackgroundColor3;
            v56.BackgroundTransparency = v16.Default.BackgroundTransparency;
        end);
        table.insert(v19, v113);
        if v21 then
            v21:Disconnect();
            v21 = nil;
        end;
        v21 = v54.Activated:connect(v83);
        table.insert(v19, v21);
        local v114 = v59.Activated:connect(function() --[[ Line: 497 ]]
            -- upvalues: l_ScreenshotHud_0 (ref)
            l_ScreenshotHud_0.Visible = false;
        end);
        table.insert(v19, v114);
        l_ContextActionService_0:BindAction("ScreenshotHudGamepadClose", function(_, v116, v117) --[[ Line: 503 ]] --[[ Name: gamepadHandleClose ]]
            -- upvalues: l_ScreenshotHud_0 (ref)
            if v116 == Enum.UserInputState.End and v117.UserInputType.Name:match("^Gamepad*") ~= nil then
                l_ScreenshotHud_0.Visible = false;
            end;
        end, false, Enum.KeyCode.ButtonB);
        table.insert(v20, "ScreenshotHudGamepadClose");
        l_ContextActionService_0:BindAction("ScreenshotHudGamepadCamera", function(_, v119, v120) --[[ Line: 513 ]] --[[ Name: gamepadHandleCamera ]]
            -- upvalues: v83 (ref)
            if v119 == Enum.UserInputState.End and v120.UserInputType.Name:match("^Gamepad*") ~= nil then
                v83();
            end;
        end, false, Enum.KeyCode.ButtonY);
        table.insert(v20, "ScreenshotHudGamepadCamera");
        local v121 = nil;
        local v122 = l_UserInputService_0:GetLastInputType().Name:match("^Gamepad*") ~= nil;
        if v22 ~= v122 then
            v22 = v122;
            v106();
        end;
        v121 = l_UserInputService_0.LastInputTypeChanged:Connect(v110);
        table.insert(v19, v121);
    end;
    local function v128() --[[ Line: 528 ]] --[[ Name: disconnectAll ]]
        -- upvalues: v19 (ref), v20 (ref), l_ContextActionService_0 (copy)
        for _, v125 in ipairs(v19) do
            v125:Disconnect();
            v125 = nil;
        end;
        v19 = {};
        for _, v127 in ipairs(v20) do
            l_ContextActionService_0:UnbindAction(v127);
        end;
        v20 = {};
    end;
    local function v130(v129) --[[ Line: 541 ]] --[[ Name: screenshotHudEnabled ]]
        -- upvalues: v52 (copy), l_ScreenshotHud_0 (copy), v128 (copy), v53 (copy), v70 (copy), v123 (copy), v10 (copy), l_RbxAnalyticsService_0 (copy)
        v52.Visible = l_ScreenshotHud_0.Visible;
        v128();
        if l_ScreenshotHud_0.Visible then
            v53.Visible = true;
            v70.Visible = false;
            v123();
            v10:Start();
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "ScreenshotHudEnabled", {
            pid = tostring(game.PlaceId), 
            enabled = v129
        });
    end;
    l_ScreenshotHud_0:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 558 ]]
        -- upvalues: v130 (copy), l_ScreenshotHud_0 (copy)
        v130(l_ScreenshotHud_0.Visible);
    end);
    l_ScreenshotHud_0:GetPropertyChangedSignal("CameraButtonIcon"):Connect(function() --[[ Line: 562 ]]
        -- upvalues: v58 (copy), l_ScreenshotHud_0 (copy), l_RbxAnalyticsService_0 (copy)
        v58.Image = l_ScreenshotHud_0.CameraButtonIcon or "rbxasset://textures/ui/ScreenshotHud/Camera.png";
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CameraButtonIcon", {
            pid = tostring(game.PlaceId), 
            icon = l_ScreenshotHud_0.CameraButtonIcon
        });
    end);
    l_ScreenshotHud_0:GetPropertyChangedSignal("CameraButtonPosition"):Connect(function() --[[ Line: 571 ]]
        -- upvalues: v17 (ref), l_ScreenshotHud_0 (copy), l_RbxAnalyticsService_0 (copy)
        v17.Position = l_ScreenshotHud_0.CameraButtonPosition;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CameraButtonPosition", {
            pid = tostring(game.PlaceId), 
            position = tostring(l_ScreenshotHud_0.CameraButtonPosition)
        });
    end);
    l_ScreenshotHud_0:GetPropertyChangedSignal("CloseButtonPosition"):Connect(function() --[[ Line: 579 ]]
        -- upvalues: v18 (ref), l_ScreenshotHud_0 (copy), l_RbxAnalyticsService_0 (copy)
        v18.Position = l_ScreenshotHud_0.CloseButtonPosition;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "screenshotHud", "CloseButtonPosition", {
            pid = tostring(game.PlaceId), 
            position = tostring(l_ScreenshotHud_0.CloseButtonPosition)
        });
    end);
    v106();
    v130(l_ScreenshotHud_0.Visible);
    return;
end;