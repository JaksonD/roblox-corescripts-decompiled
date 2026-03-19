local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.CreateTemporaryOverlay);
local v5 = nil;
local v6 = nil;
local v7 = 0;
local v8 = {};
local v9 = 1;
local v10 = nil;
local v11 = 50;
local v12 = Vector3.new(0, 0, 0, 0);
local v13 = nil;
return {
    createSpectatorCamera = function(v14) --[[ Line: 41 ]] --[[ Name: createSpectatorCamera ]]
        -- upvalues: v11 (ref), v8 (ref), v9 (ref), l_UserInputService_0 (copy), v6 (ref), v12 (ref), v13 (ref), l_Workspace_0 (copy), l_RunService_0 (copy), v5 (ref), v4 (copy), v10 (ref), v7 (ref)
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Name = "InputFrame";
        l_Frame_0.Size = UDim2.new(0.4, 0, 0.15, 0);
        l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
        l_Frame_0.Position = UDim2.new(0.5, 0, 0.5, 0);
        l_Frame_0.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
        l_Frame_0.BackgroundTransparency = 0.4;
        l_Frame_0.BorderSizePixel = 0;
        l_Frame_0.Visible = false;
        l_Frame_0.Parent = v14.screenGui;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 5);
        l_UIListLayout_0.Parent = l_Frame_0;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Name = "SpeedLabel";
        l_TextLabel_0.Size = UDim2.new(0.9, 0, 0.3, 0);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
        l_TextLabel_0.Font = Enum.Font.SourceSans;
        l_TextLabel_0.TextScaled = true;
        l_TextLabel_0.Text = "Free Cam Speed (Current: " .. math.floor(v11) .. ") Between 10 And 20000";
        l_TextLabel_0.Parent = l_Frame_0;
        local l_TextBox_0 = Instance.new("TextBox");
        l_TextBox_0.Name = "SpeedTextBox";
        l_TextBox_0.Size = UDim2.new(0.9, 0, 0.25, 0);
        l_TextBox_0.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
        l_TextBox_0.BackgroundTransparency = 0;
        l_TextBox_0.Text = tostring((math.floor(v11)));
        l_TextBox_0.TextColor3 = Color3.fromRGB(255, 255, 255);
        l_TextBox_0.TextScaled = true;
        l_TextBox_0.Font = Enum.Font.SourceSans;
        l_TextBox_0.ClearTextOnFocus = true;
        l_TextBox_0.TextXAlignment = Enum.TextXAlignment.Center;
        l_TextBox_0.Parent = l_Frame_0;
        local l_TextButton_0 = Instance.new("TextButton");
        l_TextButton_0.Name = "ApplyButton";
        l_TextButton_0.Size = UDim2.new(0.9, 0, 0.25, 0);
        l_TextButton_0.BackgroundColor3 = Color3.fromRGB(70, 130, 180);
        l_TextButton_0.TextColor3 = Color3.fromRGB(255, 255, 255);
        l_TextButton_0.Text = "Apply Speed";
        l_TextButton_0.Font = Enum.Font.SourceSansBold;
        l_TextButton_0.TextScaled = true;
        l_TextButton_0.Parent = l_Frame_0;
        l_TextButton_0.MouseButton1Click:Connect(function() --[[ Line: 106 ]]
            -- upvalues: l_TextBox_0 (copy), v11 (ref), l_TextLabel_0 (copy)
            local l_status_0, l_result_0 = pcall(tonumber, l_TextBox_0.Text);
            if l_status_0 and type(l_result_0) == "number" and l_result_0 >= 10 and l_result_0 <= 20000 then
                v11 = l_result_0;
                l_TextLabel_0.Text = "Free Cam Speed (Current: " .. math.floor(v11) .. ") Between 10 And 20000";
                return;
            else
                warn("Invalid speed input: " .. l_TextBox_0.Text .. ". Please enter a number between 10 and 20000.");
                l_TextBox_0.Text = tostring((math.floor(v11)));
                return;
            end;
        end);
        local v22 = false;
        local function v25() --[[ Line: 126 ]] --[[ Name: updateHumanoidList ]]
            -- upvalues: v8 (ref)
            v8 = {};
            for _, v24 in ipairs(workspace:GetDescendants()) do
                if v24:IsA("Humanoid") then
                    table.insert(v8, v24);
                end;
            end;
        end;
        local function _() --[[ Line: 138 ]] --[[ Name: getCurrentHumanoid ]]
            -- upvalues: v25 (copy), v8 (ref), v9 (ref)
            v25();
            if #v8 == 0 then
                return nil;
            else
                return v8[v9];
            end;
        end;
        local function _() --[[ Line: 147 ]] --[[ Name: getNextHumanoid ]]
            -- upvalues: v25 (copy), v8 (ref), v9 (ref)
            v25();
            if #v8 == 0 then
                return nil;
            else
                v9 = v9 % #v8 + 1;
                return v8[v9];
            end;
        end;
        local _ = function(v28) --[[ Line: 159 ]] --[[ Name: getHumanoidWithName ]]
            -- upvalues: v25 (copy), v8 (ref)
            v25();
            if #v8 == 0 then
                return nil;
            else
                for _, v30 in ipairs(v8) do
                    if v30.DisplayName == v28 then
                        return v30;
                    end;
                end;
                return nil;
            end;
        end;
        local function v44(v32) --[[ Line: 177 ]] --[[ Name: StepFreecam ]]
            -- upvalues: v11 (ref), l_UserInputService_0 (ref), v6 (ref), v12 (ref), v13 (ref), l_Workspace_0 (ref)
            local l_v11_0 = v11;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) then
                l_v11_0 = v11 * 3;
            end;
            local v34 = Vector3.new(0, 0, 0, 0);
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.W) then
                v34 = v34 + v6.LookVector;
            end;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.S) then
                v34 = v34 - v6.LookVector;
            end;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.D) then
                v34 = v34 + v6.RightVector;
            end;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.A) then
                v34 = v34 - v6.RightVector;
            end;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.E) then
                v34 = v34 + Vector3.new(0, 1, 0, 0);
            end;
            if l_UserInputService_0:IsKeyDown(Enum.KeyCode.Q) then
                v34 = v34 - Vector3.new(0, 1, 0, 0);
            end;
            if v34.Magnitude > 0 then
                v34 = v34.Unit;
            end;
            local v35 = v34 * l_v11_0;
            local v36 = 1 - math.exp(-10 * v32);
            v12 = v12:Lerp(v35, v36);
            if v35.Magnitude == 0 and v12.Magnitude < 0.1 then
                v12 = Vector3.new(0, 0, 0, 0);
            end;
            v6 = v6 + v12 * v32;
            if l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.LockCenter;
                local l_l_UserInputService_0_MouseDelta_0 = l_UserInputService_0:GetMouseDelta();
                local v38 = false;
                if v13 == nil then
                    v38 = true;
                    if l_l_UserInputService_0_MouseDelta_0.X <= 700 then
                        v38 = l_l_UserInputService_0_MouseDelta_0.Y > 300;
                    end;
                end;
                local v39 = false;
                if v13 ~= nil then
                    v39 = true;
                    if math.abs(l_l_UserInputService_0_MouseDelta_0.X - v13.X) <= 300 then
                        v39 = math.abs(l_l_UserInputService_0_MouseDelta_0.Y - v13.Y) > 150;
                    end;
                end;
                v13 = l_l_UserInputService_0_MouseDelta_0;
                if not v38 and not v39 then
                    local v40 = CFrame.Angles(0, math.rad(-l_l_UserInputService_0_MouseDelta_0.X * 0.4), 0);
                    local v41 = CFrame.Angles(math.rad(-l_l_UserInputService_0_MouseDelta_0.Y * 0.4), 0, 0);
                    local l_Position_0 = v6.Position;
                    local v43 = v40 * v6.Rotation * v41;
                    v6 = CFrame.new(l_Position_0) * v43;
                end;
            else
                l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
            end;
            l_Workspace_0.CurrentCamera.CFrame = v6;
        end;
        local function v45(v46) --[[ Line: 270 ]] --[[ Name: setCameraMode ]]
            -- upvalues: l_RunService_0 (ref), l_UserInputService_0 (ref), l_Frame_0 (copy), v5 (ref), l_Workspace_0 (ref), v25 (copy), v8 (ref), v45 (copy), v4 (ref), v14 (copy), v6 (ref), v44 (copy), v22 (ref), l_TextBox_0 (copy), v11 (ref), l_TextLabel_0 (copy), v10 (ref), v9 (ref), v7 (ref)
            local v47 = false;
            l_RunService_0:UnbindFromRenderStep("Freecam");
            l_UserInputService_0.MouseBehavior = Enum.MouseBehavior.Default;
            l_Frame_0.Visible = false;
            if v5 == nil then
                if l_Workspace_0.CurrentCamera.CameraSubject ~= nil then
                    v5 = l_Workspace_0.CurrentCamera.CameraSubject.DisplayName;
                else
                    v46 = math.max(1, v46);
                end;
            end;
            if v46 == 0 then
                l_Workspace_0.CurrentCamera.CameraType = Enum.CameraType.Custom;
                local l_v5_0 = v5;
                v25();
                local v49;
                if #v8 == 0 then
                    v49 = nil;
                else
                    for _, v51 in ipairs(v8) do
                        if v51.DisplayName == l_v5_0 then
                            v49 = v51;
                            v47 = true;
                        end;
                        if v47 then
                            break;
                        end;
                    end;
                    if not v47 then
                        v49 = nil;
                    end;
                end;
                v47 = false;
                if v49 == nil then
                    warn("Default humanoid not found: " .. tostring(v5));
                    v45(1);
                    return;
                else
                    l_Workspace_0.CurrentCamera.CameraSubject = v49;
                    v4.showOverlay("Default Camera", 2, v14.screenGui);
                    return;
                end;
            elseif v46 == 1 then
                l_Workspace_0.CurrentCamera.CameraType = Enum.CameraType.Scriptable;
                l_Workspace_0.CurrentCamera.CameraSubject = nil;
                v6 = l_Workspace_0.CurrentCamera.CFrame;
                l_RunService_0:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, v44);
                l_Frame_0.Visible = v22;
                l_TextBox_0.Text = tostring((math.floor(v11)));
                l_TextLabel_0.Text = "Free Cam Speed (Current: " .. math.floor(v11) .. ") Between 10 And 20000";
                v4.showOverlay("Free Camera", 2, v14.screenGui);
                return;
            else
                if v46 == 2 then
                    v25();
                    v10 = if #v8 == 0 then nil else v8[v9];
                    if v10 then
                        l_Workspace_0.CurrentCamera.CameraType = Enum.CameraType.Follow;
                        l_Workspace_0.CurrentCamera.CameraSubject = v10;
                        v4.showOverlay("Follow " .. v10.DisplayName, 2, v14.screenGui);
                        return;
                    else
                        v7 = 0;
                        v45(0);
                    end;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 342 ]] --[[ Name: cycleCameraMode ]]
            -- upvalues: v7 (ref), v45 (copy)
            v7 = (v7 + 1) % 3;
            v45(v7);
        end;
        local function v56(v53, v54) --[[ Line: 348 ]] --[[ Name: onInputBegan ]]
            -- upvalues: v7 (ref), v45 (copy), v25 (copy), v8 (ref), v9 (ref), v22 (ref), l_Frame_0 (copy), l_TextBox_0 (copy)
            if v54 then
                return;
            else
                if v53.KeyCode == Enum.KeyCode.C then
                    v7 = (v7 + 1) % 3;
                    v45(v7);
                end;
                if v53.KeyCode == Enum.KeyCode.N and v7 == 2 then
                    v25();
                    if #v8 ~= 0 then
                        v9 = v9 % #v8 + 1;
                        local _ = v8[v9];
                    end;
                    v45(2);
                end;
                if v53.KeyCode == Enum.KeyCode.V and v7 == 1 then
                    v22 = not v22;
                    l_Frame_0.Visible = v22;
                    if v22 then
                        l_TextBox_0:CaptureFocus();
                        return;
                    else
                        l_TextBox_0:ReleaseFocus();
                    end;
                end;
                return;
            end;
        end;
        v25();
        l_UserInputService_0.InputBegan:Connect(v56);
    end
};