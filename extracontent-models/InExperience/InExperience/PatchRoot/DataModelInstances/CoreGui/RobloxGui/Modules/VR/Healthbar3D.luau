local v0 = Color3.new(0.8941176470588236, 0.9254901960784314, 0.9647058823529412);
local v1 = Color3.new(1, 0.10980392156862745, 0);
local v2 = Color3.new(0.9803921568627451, 0.9215686274509803, 0);
local v3 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549);
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "HealthbarContainer";
l_Frame_0.BackgroundTransparency = 1;
l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.ImageColor3 = v0;
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_0.SliceCenter = Rect.new(10, 10, 10, 10);
l_ImageLabel_0.Name = "HealthbarBack";
l_ImageLabel_0.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png";
l_ImageLabel_0.Size = UDim2.new(1, 0, 0.3, 0);
l_ImageLabel_0.Position = UDim2.new(0, 0, 0.7, 0);
l_ImageLabel_0.Parent = l_Frame_0;
local l_ImageLabel_1 = Instance.new("ImageLabel");
l_ImageLabel_1.ImageColor3 = v3;
l_ImageLabel_1.BackgroundTransparency = 1;
l_ImageLabel_1.ScaleType = Enum.ScaleType.Slice;
l_ImageLabel_1.SliceCenter = Rect.new(10, 10, 10, 10);
l_ImageLabel_1.Size = UDim2.new(1, 0, 1, 0);
l_ImageLabel_1.Position = UDim2.new(0, 0, 0, 0);
l_ImageLabel_1.Name = "HealthbarFill";
l_ImageLabel_1.Image = "rbxasset://textures/ui/VR/rectBackgroundWhite.png";
l_ImageLabel_1.Parent = l_ImageLabel_0;
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "PlayerName";
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
l_TextLabel_0.Text = "";
l_TextLabel_0.Font = Enum.Font.SourceSansBold;
l_TextLabel_0.FontSize = Enum.FontSize.Size24;
l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
l_TextLabel_0.Size = UDim2.new(1, 0, 0, 14);
l_TextLabel_0.Parent = l_Frame_0;
local function _(v14) --[[ Line: 67 ]] --[[ Name: Color3ToVec3 ]]
    return (Vector3.new(v14.r, v14.g, v14.b));
end;
local function v20(v16, v17) --[[ Line: 71 ]] --[[ Name: FindChildOfType ]]
    for _, v19 in pairs(v16:GetChildren()) do
        if v19:IsA(v17) then
            return v19;
        end;
    end;
end;
local v21 = {
    [Vector3.new(v1.r, v1.g, v1.b)] = 0.1, 
    [Vector3.new(v2.r, v2.g, v2.b)] = 0.5, 
    [Vector3.new(v3.r, v3.g, v3.b)] = 0.8
};
local function v30(v22) --[[ Line: 87 ]] --[[ Name: HealthbarColorTransferFunction ]]
    -- upvalues: v1 (copy), v3 (copy), v21 (copy)
    if v22 <= 0.1 then
        return v1;
    elseif v22 >= 0.8 then
        return v3;
    else
        local v23 = Vector3.new(0, 0, 0, 0);
        local v24 = 0;
        for v25, v26 in pairs(v21) do
            local v27 = v22 - v26;
            if v27 == 0 then
                return Color3.new(v25.x, v25.y, v25.z);
            else
                local v28 = 1 / (v27 * v27);
                v23 = v23 + v28 * v25;
                v24 = v24 + v28;
            end;
        end;
        local v29 = v23 / v24;
        return Color3.new(v29.x, v29.y, v29.z);
    end;
end;
local function _(v31) --[[ Line: 113 ]] --[[ Name: UpdateHealth ]]
    -- upvalues: l_ImageLabel_1 (copy), v30 (copy)
    local v32 = v31.Health / v31.MaxHealth;
    if v32 ~= v32 then
        v32 = 1;
    end;
    l_ImageLabel_1.ImageColor3 = v30(v32);
    l_ImageLabel_1.Size = UDim2.new(v32, 0, 1, 0);
end;
local v34 = nil;
local v35 = nil;
local function v36(v37) --[[ Line: 124 ]] --[[ Name: RegisterHumanoid ]]
    -- upvalues: v35 (ref), v34 (ref), l_Players_0 (copy), v36 (copy), l_ImageLabel_1 (copy), v30 (copy)
    if v35 then
        v35:disconnect();
        v35 = nil;
    end;
    if v34 then
        v34:disconnect();
        v34 = nil;
    end;
    if v37 then
        v35 = v37.AncestryChanged:connect(function(v38, v39) --[[ Line: 135 ]]
            -- upvalues: l_Players_0 (ref), v37 (copy), v36 (ref)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if v38 == v37 and (not l_LocalPlayer_0 or v39 ~= l_LocalPlayer_0.Character) then
                v36(nil);
            end;
        end);
        v34 = v37.HealthChanged:connect(function() --[[ Line: 141 ]]
            -- upvalues: v37 (copy), l_ImageLabel_1 (ref), v30 (ref)
            local l_v37_0 = v37;
            local v42 = l_v37_0.Health / l_v37_0.MaxHealth;
            if v42 ~= v42 then
                v42 = 1;
            end;
            l_ImageLabel_1.ImageColor3 = v30(v42);
            l_ImageLabel_1.Size = UDim2.new(v42, 0, 1, 0);
        end);
        local v43 = v37.Health / v37.MaxHealth;
        if v43 ~= v43 then
            v43 = 1;
        end;
        l_ImageLabel_1.ImageColor3 = v30(v43);
        l_ImageLabel_1.Size = UDim2.new(v43, 0, 1, 0);
    end;
end;
local function v46(v44) --[[ Line: 146 ]] --[[ Name: OnCharacterChildAdded ]]
    -- upvalues: l_Players_0 (copy), v36 (copy)
    local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_1 and v44.Parent == l_LocalPlayer_1.Character and v44:IsA("Humanoid") then
        v36(v44);
    end;
end;
local v47 = nil;
local function v50(v48) --[[ Line: 154 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: v20 (copy), v36 (copy), v47 (ref), v46 (copy)
    local v49 = v20(v48, "Humanoid");
    if v49 then
        v36(v49);
    end;
    if v47 then
        v47:disconnect();
        v47 = nil;
    end;
    v47 = v48.ChildAdded:connect(v46);
end;
local function _(v51) --[[ Line: 167 ]] --[[ Name: OnPlayerAdded ]]
    -- upvalues: l_TextLabel_0 (copy), v50 (copy), v20 (copy), v36 (copy), v47 (ref), v46 (copy)
    l_TextLabel_0.Text = v51.Name;
    v51.CharacterAdded:connect(v50);
    if v51.Character then
        local l_Character_0 = v51.Character;
        local v53 = v20(l_Character_0, "Humanoid");
        if v53 then
            v36(v53);
        end;
        if v47 then
            v47:disconnect();
            v47 = nil;
        end;
        v47 = l_Character_0.ChildAdded:connect(v46);
    end;
end;
if l_Players_0.LocalPlayer then
    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
    l_TextLabel_0.Text = l_LocalPlayer_2.Name;
    l_LocalPlayer_2.CharacterAdded:connect(v50);
    if l_LocalPlayer_2.Character then
        local l_Character_1 = l_LocalPlayer_2.Character;
        local v57 = v20(l_Character_1, "Humanoid");
        if v57 then
            v36(v57);
        end;
        if v47 then
            v47:disconnect();
            v47 = nil;
        end;
        v47 = l_Character_1.ChildAdded:connect(v46);
    end;
else
    spawn(function() --[[ Line: 179 ]]
        -- upvalues: l_Players_0 (copy), l_TextLabel_0 (copy), v50 (copy), v20 (copy), v36 (copy), v47 (ref), v46 (copy)
        while not l_Players_0.LocalPlayer do
            l_Players_0.ChildAdded:wait();
        end;
        local l_LocalPlayer_3 = l_Players_0.LocalPlayer;
        l_TextLabel_0.Text = l_LocalPlayer_3.Name;
        l_LocalPlayer_3.CharacterAdded:connect(v50);
        if l_LocalPlayer_3.Character then
            local l_Character_2 = l_LocalPlayer_3.Character;
            local v60 = v20(l_Character_2, "Humanoid");
            if v60 then
                v36(v60);
            end;
            if v47 then
                v47:disconnect();
                v47 = nil;
            end;
            v47 = l_Character_2.ChildAdded:connect(v46);
        end;
    end);
end;
local v61 = {
    ModuleName = "Healthbar", 
    KeepVRTopbarOpen = false, 
    VRIsExclusive = false, 
    VRClosesNonExclusive = false
};
local v62 = nil;
local v63 = nil;
local v64 = nil;
local function v96(v65) --[[ Line: 195 ]] --[[ Name: OnVREnabled ]]
    -- upvalues: l_UserInputService_0 (copy), l_CorePackages_0 (copy), l_ImageLabel_0 (copy), l_ImageLabel_1 (copy), l_TextLabel_0 (copy), l_StarterGui_0 (copy), v62 (ref), v63 (ref), v64 (ref), l_Frame_0 (copy), v61 (copy)
    local v66 = false;
    if v65 == "VREnabled" then
        if l_UserInputService_0.VREnabled then
            local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
            local l_Panel3D_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).Panel3D;
            local v69 = l_Panel3D_0.Get("Healthbar");
            v69:ResizeStuds(1.5, 0.25, 128);
            v69:SetType(l_Panel3D_0.Type.Fixed, {
                CFrame = CFrame.new(0, 0, -5)
            });
            v69:SetVisible(true);
            v69.PreUpdate = function(v70, _, _, _, _) --[[ Line: 207 ]] --[[ Name: PreUpdate ]]
                -- upvalues: l_Panel3D_0 (copy), v69 (copy)
                local v75 = l_Panel3D_0.Get("Backpack") or l_Panel3D_0.Get("Topbar3D");
                local v76 = l_Panel3D_0.Get("Topbar3D");
                if v75 and v76 then
                    v70.localCF = (v75.localCF or CFrame.new()) * CFrame.new(math.max(v76.width, v75.width) / 2 - v69.width / 2 - 0.11, 0.25, 0.1);
                end;
            end;
            v69.CalculateTransparency = function(_) --[[ Line: 217 ]] --[[ Name: CalculateTransparency ]]
                -- upvalues: l_Panel3D_0 (copy), l_ImageLabel_0 (ref), l_ImageLabel_1 (ref), l_TextLabel_0 (ref)
                local v78 = l_Panel3D_0.Get("Backpack");
                local v79 = l_Panel3D_0.Get("Topbar3D");
                local v80 = math.min(v78 and v78:IsVisible() and v78:CalculateTransparency() or 1, v79 and v79:IsVisible() and v79:CalculateTransparency() or 1);
                l_ImageLabel_0.ImageTransparency = v80;
                l_ImageLabel_1.ImageTransparency = v80;
                l_TextLabel_0.TextTransparency = v80;
                return v80;
            end;
            local v81 = false;
            local _ = function() --[[ Line: 232 ]] --[[ Name: UpdateExclusivePanelOpen ]]
                -- upvalues: l_VRHub_0 (copy), v81 (ref)
                for _, v83 in pairs(l_VRHub_0:GetOpenedModules()) do
                    if v83.VRIsExclusive then
                        v81 = true;
                        return;
                    end;
                end;
                v81 = false;
            end;
            local function _() --[[ Line: 242 ]] --[[ Name: CalculateVisibility ]]
                -- upvalues: l_StarterGui_0 (ref), v81 (ref)
                return l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v81;
            end;
            v62 = l_StarterGui_0.CoreGuiChangedSignal:connect(function() --[[ Line: 248 ]]
                -- upvalues: v69 (copy), l_StarterGui_0 (ref), v81 (ref)
                v69:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v81);
            end);
            v63 = l_VRHub_0.ModuleOpened.Event:connect(function(_) --[[ Line: 252 ]]
                -- upvalues: l_VRHub_0 (copy), v81 (ref), v69 (copy), l_StarterGui_0 (ref)
                local v87 = false;
                for _, v89 in pairs(l_VRHub_0:GetOpenedModules()) do
                    if v89.VRIsExclusive then
                        v81 = true;
                        v87 = true;
                    end;
                    if v87 then
                        break;
                    end;
                end;
                if not v87 then
                    v81 = false;
                end;
                v87 = false;
                v69:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v81);
            end);
            v64 = l_VRHub_0.ModuleClosed.Event:connect(function(_) --[[ Line: 256 ]]
                -- upvalues: l_VRHub_0 (copy), v81 (ref), v69 (copy), l_StarterGui_0 (ref)
                local v91 = false;
                for _, v93 in pairs(l_VRHub_0:GetOpenedModules()) do
                    if v93.VRIsExclusive then
                        v81 = true;
                        v91 = true;
                    end;
                    if v91 then
                        break;
                    end;
                end;
                if not v91 then
                    v81 = false;
                end;
                v91 = false;
                v69:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v81);
            end);
            for _, v95 in pairs(l_VRHub_0:GetOpenedModules()) do
                if v95.VRIsExclusive then
                    v81 = true;
                    v66 = true;
                end;
                if v66 then
                    break;
                end;
            end;
            if not v66 then
                v81 = false;
            end;
            v66 = false;
            v69:SetVisible(l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.Health) and not v81);
            l_Frame_0.Parent = v69:GetGUI();
            l_VRHub_0:RegisterModule(v61);
            return;
        else
            if v62 then
                v62:disconnect();
                v62 = nil;
            end;
            if v63 then
                v63:disconnect();
                v63 = nil;
            end;
            if v64 then
                v64:disconnect();
                v64 = nil;
            end;
            l_Frame_0.Parent = nil;
        end;
    end;
end;
l_UserInputService_0.Changed:connect(v96);
if l_UserInputService_0.VREnabled then
    v96("VREnabled");
end;
return v61;