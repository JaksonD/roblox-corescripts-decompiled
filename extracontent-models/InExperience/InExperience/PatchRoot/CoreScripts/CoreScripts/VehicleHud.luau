local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CorePackages");
while not l_Players_0.LocalPlayer do
    wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local v8 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v9 = v8 and 100 or 70;
local function _(v10, v11, v12, v13, v14) --[[ Line: 34 ]] --[[ Name: createImageLabel ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = v10;
    l_ImageLabel_0.Size = v11;
    l_ImageLabel_0.Position = v12;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = v13;
    l_ImageLabel_0.Parent = v14;
    return l_ImageLabel_0;
end;
local function v22(v17, v18, v19, v20) --[[ Line: 46 ]] --[[ Name: createTextLabel ]]
    -- upvalues: v8 (copy)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v17;
    l_TextLabel_0.Size = UDim2.new(1, -4, 0, v8 and 50 or 20);
    l_TextLabel_0.Position = UDim2.new(0, 2, 0, v8 and -50 or -20);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextXAlignment = v18;
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.FontSize = v8 and Enum.FontSize.Size48 or Enum.FontSize.Size18;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0.5;
    l_TextLabel_0.TextStrokeColor3 = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
    l_TextLabel_0.Text = v19;
    l_TextLabel_0.Parent = v20;
    return l_TextLabel_0;
end;
local l_Frame_0 = Instance.new("Frame");
l_Frame_0.Name = "VehicleHudFrame";
l_Frame_0.Size = UDim2.new(0, v8 and 316 or 158, 0, v8 and 50 or 14);
l_Frame_0.Position = UDim2.new(0.5, -(l_Frame_0.Size.X.Offset / 2), 1, -v9 - l_Frame_0.Size.Y.Offset);
l_Frame_0.BackgroundTransparency = 1;
l_Frame_0.Visible = false;
l_Frame_0.Parent = l_RobloxGui_0;
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "SpeedBarClippingFrame";
l_Frame_1.Size = UDim2.new(0, 0, 0, v8 and 24 or 4);
l_Frame_1.Position = UDim2.new(0.5, v8 and -142 or -71, 0.5, v8 and -13 or -2);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.ClipsDescendants = true;
l_Frame_1.ZIndex = 2;
l_Frame_1.Parent = l_Frame_0;
local v25 = UDim2.new(1, 0, 1, 0);
local v26 = UDim2.new(0, 0, 0, 1);
local l_ImageLabel_1 = Instance.new("ImageLabel");
l_ImageLabel_1.Name = "HudBG";
l_ImageLabel_1.Size = v25;
l_ImageLabel_1.Position = v26;
l_ImageLabel_1.BackgroundTransparency = 1;
l_ImageLabel_1.Image = "rbxasset://textures/ui/Vehicle/SpeedBarBKG.png";
l_ImageLabel_1.Parent = l_Frame_0;
v26 = UDim2.new(0, v8 and 284 or 142, 0, v8 and 24 or 4);
l_ImageLabel_1 = UDim2.new(0.5, v8 and -142 or -71, 0.5, v8 and -13 or -2);
local l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.Name = "SpeedBG";
l_ImageLabel_2.Size = v26;
l_ImageLabel_2.Position = l_ImageLabel_1;
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Image = "rbxasset://textures/ui/Vehicle/SpeedBarEmpty.png";
l_ImageLabel_2.Parent = l_Frame_0;
v25 = l_ImageLabel_2;
v26 = UDim2.new(0, v8 and 284 or 142, 1, 0);
l_ImageLabel_1 = UDim2.new(0, 0, 0, 0);
l_ImageLabel_2 = Instance.new("ImageLabel");
l_ImageLabel_2.Name = "SpeedBarImage";
l_ImageLabel_2.Size = v26;
l_ImageLabel_2.Position = l_ImageLabel_1;
l_ImageLabel_2.BackgroundTransparency = 1;
l_ImageLabel_2.Image = "rbxasset://textures/ui/Vehicle/SpeedBar.png";
l_ImageLabel_2.Parent = l_Frame_1;
v22("SpeedLabel", Enum.TextXAlignment.Left, "Speed", l_Frame_0);
v26 = v22("SpeedText", Enum.TextXAlignment.Right, "0", l_Frame_0);
l_ImageLabel_1 = function() --[[ Line: 89 ]] --[[ Name: getHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v29 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v29 then
        for _, v31 in pairs(v29:GetChildren()) do
            if v31:IsA("Humanoid") then
                return v31;
            end;
        end;
    end;
end;
l_ImageLabel_2 = function() --[[ Line: 100 ]] --[[ Name: onHeartbeat ]]
    -- upvalues: v4 (ref), v26 (copy), v25 (copy), l_Frame_1 (copy), v8 (copy)
    if v4 then
        local l_magnitude_0 = v4.Velocity.magnitude;
        v26.Text = tostring((math.min(math.floor(l_magnitude_0), 9999)));
        local v33 = math.min(math.floor(l_magnitude_0 / v4.MaxSpeed * v25.Size.X.Offset), v25.Size.X.Offset);
        l_Frame_1.Size = UDim2.new(0, v33, 0, v8 and 24 or 4);
    end;
end;
local function v35(v34) --[[ Line: 110 ]] --[[ Name: onVehicleSeatChanged ]]
    -- upvalues: l_Frame_0 (copy)
    if v34 == "HeadsUpDisplay" then
        l_Frame_0.Visible = not l_Frame_0.Visible;
    end;
end;
local function v38(v36, v37) --[[ Line: 116 ]] --[[ Name: onSeated ]]
    -- upvalues: v4 (ref), l_Frame_0 (copy), v5 (ref), l_RunService_0 (copy), l_ImageLabel_2 (copy), v6 (ref), v35 (copy)
    if v36 then
        if v37 and v37:IsA("VehicleSeat") then
            v4 = v37;
            l_Frame_0.Visible = v4.HeadsUpDisplay;
            v5 = l_RunService_0.Heartbeat:connect(l_ImageLabel_2);
            v6 = v4.Changed:connect(v35);
            return;
        end;
    elseif v4 then
        l_Frame_0.Visible = false;
        v4 = nil;
        if v5 then
            v5:disconnect();
            v5 = nil;
        end;
        if v6 then
            v6:disconnect();
            v6 = nil;
        end;
    end;
end;
local v39 = nil;
local v40 = nil;
local function _() --[[ Line: 143 ]] --[[ Name: disconnectSeatedConnection ]]
    -- upvalues: v39 (ref)
    if v39 then
        v39:Disconnect();
        v39 = nil;
    end;
end;
local function _() --[[ Line: 150 ]] --[[ Name: disconnectChildAddedConnection ]]
    -- upvalues: v40 (ref)
    if v40 then
        v40:Disconnect();
        v40 = nil;
    end;
end;
local function v46(v43) --[[ Line: 157 ]] --[[ Name: characterAdded ]]
    -- upvalues: v39 (ref), v40 (ref), v38 (copy)
    if v39 then
        v39:Disconnect();
        v39 = nil;
    end;
    if v40 then
        v40:Disconnect();
        v40 = nil;
    end;
    local l_Humanoid_0 = v43:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v39 = l_Humanoid_0.Seated:connect(v38);
        return;
    else
        v40 = v43.ChildAdded:Connect(function(v45) --[[ Line: 167 ]]
            -- upvalues: v39 (ref), v40 (ref), v38 (ref)
            if v45:IsA("Humanoid") then
                if v39 then
                    v39:Disconnect();
                    v39 = nil;
                end;
                if v40 then
                    v40:Disconnect();
                    v40 = nil;
                end;
                v39 = v45.Seated:connect(v38);
            end;
        end);
        return;
    end;
end;
if l_LocalPlayer_0.Character then
    v46(l_LocalPlayer_0.Character);
end;
l_LocalPlayer_0.CharacterAdded:connect(function(v47) --[[ Line: 178 ]]
    -- upvalues: v38 (copy), v46 (copy)
    v38(false);
    v46(v47);
end);