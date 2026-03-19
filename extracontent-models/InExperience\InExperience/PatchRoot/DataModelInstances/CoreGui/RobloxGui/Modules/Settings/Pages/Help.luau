local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v8 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v9 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v11 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v11.Migration.uiblox;
local v13 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v14 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 48 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v18 = l_status_0 and l_result_0;
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v20 = nil;
if l_isInExperienceUIVREnabled_0 then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v20 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local v22 = if l_isInExperienceUIVREnabled_0 then require(l_RobloxGui_0.Modules.Settings.Resources.HelpConstants) else nil;
v13 = (function() --[[ Line: 68 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v9 (copy), v7 (copy), v8 (copy), v14 (copy), v18 (copy), l_TextService_0 (copy), v6 (copy), l_GuiService_0 (copy), v22 (copy), v20 (ref), l_GameSettings_0 (copy), l_uiblox_0 (copy), v11 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.HelpPages = {};
    l_NewPage_0.HelpPageContents = {};
    l_NewPage_0.ActiveHelpScheme = nil;
    local v24 = nil;
    l_NewPage_0.GetCurrentInputType = function(_) --[[ Line: 77 ]] --[[ Name: GetCurrentInputType ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v24 (ref), l_UserInputService_0 (ref)
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return "SpatialGamepad";
        elseif v24 == nil then
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                return "Gamepad";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                return "KeyboardMouse";
            else
                return "Touch";
            end;
        elseif v24 == Enum.UserInputType.Keyboard or v24 == Enum.UserInputType.MouseMovement or v24 == Enum.UserInputType.MouseButton1 or v24 == Enum.UserInputType.MouseButton2 or v24 == Enum.UserInputType.MouseButton3 or v24 == Enum.UserInputType.MouseWheel then
            return "KeyboardMouse";
        elseif v24 == Enum.UserInputType.Touch then
            return "Touch";
        elseif v24 == Enum.UserInputType.Gamepad1 or v24 == Enum.UserInputType.Gamepad2 or v24 == Enum.UserInputType.Gamepad3 or v24 == Enum.UserInputType.Gamepad4 then
            return "Gamepad";
        else
            return "KeyboardMouse";
        end;
    end;
    local function v52(v27) --[[ Line: 109 ]] --[[ Name: createPCHelp ]]
        -- upvalues: l_Create_0 (ref), v9 (ref), l_UserInputService_0 (ref), v7 (ref), v8 (ref)
        local function v42(v28, v29) --[[ Line: 110 ]] --[[ Name: createPCGroup ]]
            -- upvalues: l_Create_0 (ref), v9 (ref)
            local v30 = l_Create_0("Frame")({
                Size = UDim2.new(0.3333333333333333, -4, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Name = "PCGroupFrame" .. tostring(v28)
            });
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 2), 
                Parent = v30, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            local v32 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 9, 0, 0), 
                Size = UDim2.new(1, -9, 0, 30), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v28, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                TextColor3 = Color3.new(1, 1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Name = "PCGroupTitle" .. tostring(v28), 
                ZIndex = 2, 
                LayoutOrder = 1, 
                Parent = v30
            });
            local _ = l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 9), 
                Parent = v32
            });
            local v34 = 0;
            local l_Offset_0 = v32.Size.Y.Offset;
            for v36 = 1, #v29 do
                for v37, v38 in pairs(v29[v36]) do
                    local v39 = l_Create_0("Frame")({
                        Size = UDim2.new(1, 0, 0, 42), 
                        Position = UDim2.new(0, 0, 0, l_Offset_0 + v34 * 44), 
                        BackgroundTransparency = v9.transparency("InputActionBackground", 0.65), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v36 + 1, 
                        BorderSizePixel = 0, 
                        ZIndex = 2, 
                        Name = "ActionInputBinding" .. tostring(v37), 
                        Parent = v30
                    });
                    v39.BackgroundColor3 = v9.color("InputActionBackground");
                    l_Create_0("UICorner")({
                        CornerRadius = UDim.new(0, 3), 
                        Parent = v39
                    });
                    local v40 = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.4, -9, 0, 42), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 9, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v37, 
                        Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v37 .. "Label", 
                        ZIndex = 2, 
                        Parent = v39, 
                        TextWrapped = true
                    });
                    Instance.new("UITextSizeConstraint", v40).MaxTextSize = v9.textSize(28);
                    local _ = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.5, 0, 0, 42), 
                        Position = UDim2.new(0.5, -4, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v38, 
                        Font = v9.font(Enum.Font.SourceSans, "HelpText"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpText"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v38 .. "Label", 
                        ZIndex = 2, 
                        Parent = v39, 
                        TextWrapped = true, 
                        TextScaled = false, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    });
                    v34 = v34 + 1;
                end;
            end;
            v30.Size = UDim2.new(v30.Size.X.Scale, v30.Size.X.Offset, 0, l_Offset_0 + v34 * 44);
            return v30;
        end;
        local v43 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
        local v44 = v42("Character Movement", {
            [1] = {
                ["Move Forward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. v7:FormatByKey("InGame.HelpMenu.UpArrow")
            }, 
            [2] = {
                ["Move Backward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. v7:FormatByKey("InGame.HelpMenu.DownArrow")
            }, 
            [3] = {
                ["Move Left"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. v7:FormatByKey("InGame.HelpMenu.LeftArrow")
            }, 
            [4] = {
                ["Move Right"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. v7:FormatByKey("InGame.HelpMenu.RightArrow")
            }, 
            [5] = {
                Jump = "Space"
            }
        });
        v44.Parent = v27;
        v44.LayoutOrder = 1;
        local v45 = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Three) .. "...";
        local v46 = v42("Accessories", {
            [1] = {
                ["Equip Tools"] = v45
            }, 
            [2] = {
                ["Unequip Tools"] = v45
            }, 
            [3] = {
                ["Drop Tool"] = "Backspace"
            }, 
            [4] = {
                ["Use Tool"] = "Left Mouse Button"
            }
        });
        v46.Position = UDim2.new(0.3333333333333333, 4, 0, 0);
        v46.Parent = v27;
        v46.LayoutOrder = 2;
        local v47 = {};
        table.insert(v47, {
            ["UI Selection Toggle"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v48 = not v8:IsSubjectToChinaPolicies();
        if v48 then
            table.insert(v47, {
                Screenshot = v43 and "Opt + 1" or "Alt + 1"
            });
            if not v43 then
                table.insert(v47, {
                    ["Record Video"] = "F12"
                });
            end;
        end;
        if v48 then
            table.insert(v47, {
                ["Dev Console"] = v43 and "F9/fn + F9" or "F9"
            });
        end;
        table.insert(v47, {
            Mouselock = "Shift"
        });
        if v48 then
            table.insert(v47, {
                ["Graphics Level"] = v43 and "F10/fn + F10" or "F10"
            });
            table.insert(v47, {
                Fullscreen = v43 and "Ctrl + Cmd + F" or "F11"
            });
        end;
        if v48 then
            table.insert(v47, {
                ["Perf. Stats"] = v43 and "Fn+Opt+Cmd+F7" or "Ctrl + Shift + F7"
            });
        end;
        local v49 = v42("Misc", v47);
        v49.Position = UDim2.new(0.6666666666666666, 8, 0, 0);
        v49.Parent = v27;
        v49.LayoutOrder = 3;
        local v50 = v42("Camera Movement", {
            [1] = {
                Rotate = "Right Mouse Button"
            }, 
            [2] = {
                ["Zoom In/Out"] = "Mouse Wheel"
            }, 
            [3] = {
                ["Zoom In"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.I)
            }, 
            [4] = {
                ["Zoom Out"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.O)
            }
        });
        v50.Position = UDim2.new(0, 0, v44.Size.Y.Scale, v44.Size.Y.Offset + 50);
        v50.Parent = v27;
        v50.LayoutOrder = 4;
        local v51 = v42("Menu Items", {
            [1] = {
                ["Roblox Menu"] = "Esc"
            }, 
            [2] = {
                Backpack = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Backquote)
            }, 
            [3] = {
                Playerlist = "Tab"
            }, 
            [4] = {
                Chat = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Slash)
            }
        });
        v51.Position = UDim2.new(0.3333333333333333, 4, v44.Size.Y.Scale, v44.Size.Y.Offset + 50);
        v51.Parent = v27;
        v51.LayoutOrder = 5;
        v27.Size = UDim2.new(v27.Size.X.Scale, v27.Size.X.Offset, 0, v51.Size.Y.Offset + v51.Position.Y.Offset);
    end;
    local function v75(v53) --[[ Line: 314 ]] --[[ Name: createGamepadHelp ]]
        -- upvalues: l_NewPage_0 (copy), l_Create_0 (ref), v14 (ref), v9 (ref), v18 (ref), l_TextService_0 (ref), v7 (ref)
        local v54 = math.max(l_NewPage_0.Page.AbsoluteSize.X * 0.58, 270);
        local v55 = UDim2.new(0, v54, 0, v54 * 0.64);
        local v56 = UDim2.new(0.5, -v55.X.Offset / 2 + 30, 0.5, -v55.Y.Offset / 2 + 7);
        local v57 = l_Create_0("ImageLabel")({
            Name = "GamepadImage", 
            Size = v55, 
            Position = v56, 
            Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v53
        });
        v53.Size = UDim2.new(v53.Size.X.Scale, v53.Size.X.Offset, 0, v57.Size.Y.Offset + 100);
        local v58 = v14 and v9.fontSize(Enum.FontSize.Size36) or v9.fontSize(Enum.FontSize.Size24);
        local v59 = v58 == v9.fontSize(Enum.FontSize.Size36) and v9.textSize(36) or v9.textSize(24);
        local function v71(v60, v61, v62, v63) --[[ Line: 334 ]] --[[ Name: createGamepadLabel ]]
            -- upvalues: v18 (ref), l_Create_0 (ref), v9 (ref), v58 (copy), v57 (copy), l_TextService_0 (ref), v59 (copy), v53 (copy)
            local v64 = nil;
            v64 = if v18 == true then l_Create_0("TextLabel")({
                Position = v61, 
                Size = v62, 
                BackgroundTransparency = 1, 
                Text = v60, 
                TextXAlignment = v63 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = v63 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v58, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v60 .. "Label", 
                ZIndex = 2, 
                Parent = v57, 
                TextScaled = true, 
                TextWrapped = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) else l_Create_0("TextLabel")({
                Position = v61, 
                Size = v62, 
                BackgroundTransparency = 1, 
                Text = v60, 
                TextXAlignment = v63 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = v63 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v58, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v60 .. "Label", 
                ZIndex = 2, 
                Parent = v57, 
                TextTruncate = Enum.TextTruncate.AtEnd
            });
            v64.TextWrapped = true;
            local l_X_0 = l_TextService_0:GetTextSize(v60, v59, v9.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X;
            local v66 = math.abs(v61.X.Offset);
            local l_v53_0 = v53;
            local function v69() --[[ Line: 379 ]] --[[ Name: updateNameLabelSize ]]
                -- upvalues: v63 (copy), l_v53_0 (copy), v66 (copy), v64 (ref), v59 (ref), l_X_0 (copy), v58 (ref)
                local v68 = v63 and l_v53_0.AbsoluteSize.X / 2 + 30 - v66 or l_v53_0.AbsoluteSize.X / 2 - 30 - v66;
                v64.Size = UDim2.new(v64.Size.X.Scale, v68, v64.Size.Y.Scale, v59 * 2);
                v64.TextScaled = false;
                if v68 >= l_X_0 then
                    v64.FontSize = v58;
                end;
            end;
            local _ = l_v53_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 392 ]]
                -- upvalues: v69 (copy)
                v69();
            end);
            v69();
        end;
        local v72 = -v57.Size.X.Offset / 2 - 20;
        local v73 = v57.Size.X.Offset / 2 - 20;
        local v74 = v73 + 40;
        v71("Switch Tool", UDim2.new(0.5, v72, 0, 15), UDim2.new(0, 100, 0, v59), true);
        v71(v7:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, v72, 0.15, 10), UDim2.new(0, 164, 0, v59), true);
        v71("Move", UDim2.new(0.5, v72, 0.31, 5), UDim2.new(0, 46, 0, v59), true);
        v71("Menu Navigation", UDim2.new(0.5, v72, 0.46, 0), UDim2.new(0, 164, 0, v59), true);
        v71("Use Tool", UDim2.new(0.5, v73, 0, 15), UDim2.new(0, 73, 0, v59));
        v71("Roblox Menu", UDim2.new(0.5, v73, 0.15, 10), UDim2.new(0, 122, 0, v59));
        v71("Back", UDim2.new(0.5, v73, 0.31, 5), UDim2.new(0, 43, 0, v59));
        v71("Jump", UDim2.new(0.5, v73, 0.46, 0), UDim2.new(0, 49, 0, v59));
        v71("Rotate Camera", UDim2.new(0.5, v74, 0.62, -10), UDim2.new(0, 132, 0, v59));
        v71("Camera Zoom", UDim2.new(0.5, v74, 0.77, -10), UDim2.new(0, 122, 0, v59));
    end;
    local function v87(v76) --[[ Line: 424 ]] --[[ Name: updateTouchLayout ]]
        -- upvalues: l_NewPage_0 (copy), v6 (ref)
        l_NewPage_0.ActiveHelpScheme = v76;
        local v77 = v6:IsPortrait();
        if l_NewPage_0.HelpPages.Touch then
            local l_Touch_0 = l_NewPage_0.HelpPageContents.Touch;
            local function _(v79) --[[ Line: 432 ]] --[[ Name: hideUneeded ]]
                -- upvalues: l_Touch_0 (copy)
                if v79 then
                    for v80, v81 in pairs(l_Touch_0) do
                        v81.Visible = not v79[v80];
                    end;
                end;
            end;
            local v83 = nil;
            if v76 == Enum.TouchMovementMode.DynamicThumbstick or v76 == Enum.TouchMovementMode.Default then
                v83 = {
                    MoveImageCTM = true
                };
                l_Touch_0.MoveLabel.Position = v77 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.85, -l_Touch_0.MoveLabel.AbsoluteSize.y);
                l_Touch_0.JumpLabel.Position = v77 and UDim2.new(0.75, -l_Touch_0.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -l_Touch_0.JumpLabel.AbsoluteSize.y);
                l_Touch_0.RotateLabel.Position = v77 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -l_Touch_0.RotateLabel.AbsoluteSize.x / 2, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v77 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60);
                l_Touch_0.EquipLabel.Position = v77 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v77 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            elseif v76 == Enum.TouchMovementMode.ClickToMove then
                v83 = {
                    MoveImageDTS = true, 
                    JumpLabel = true
                };
                l_Touch_0.MoveLabel.Position = v77 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 40);
                l_Touch_0.RotateLabel.Position = v77 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v77 and UDim2.new(0.75, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v77 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v77 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            else
                v83 = {
                    MoveImageDTS = true, 
                    MoveImageCTM = true, 
                    JumpImage = true
                };
                l_Touch_0.MoveLabel.Position = v77 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0);
                l_Touch_0.JumpLabel.Position = v77 and UDim2.new(0.94, -l_Touch_0.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0);
                l_Touch_0.RotateLabel.Position = v77 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v77 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v77 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v77 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            end;
            local l_v83_0 = v83;
            if l_v83_0 then
                for v85, v86 in pairs(l_Touch_0) do
                    v86.Visible = not l_v83_0[v85];
                end;
            end;
        end;
    end;
    local function v110(v88) --[[ Line: 480 ]] --[[ Name: createTouchHelp ]]
        -- upvalues: v6 (ref), l_GuiService_0 (ref), l_Create_0 (ref), v9 (ref)
        local v89 = {};
        local v90 = v6:IsSmallTouchScreen();
        local v91 = l_GuiService_0:GetScreenResolution().y - 350;
        if v90 then
            v91 = l_GuiService_0:GetScreenResolution().y - 100;
        end;
        v88.Size = UDim2.new(1, 0, 0, v91);
        local function v99(v92, v93, v94, v95) --[[ Line: 489 ]] --[[ Name: createTouchLabel ]]
            -- upvalues: l_Create_0 (ref), v9 (ref), v90 (copy)
            local v96 = l_Create_0("TextLabel")({
                Position = v93, 
                Size = v94, 
                BackgroundTransparency = 1, 
                Name = v92 .. "Frame", 
                Parent = v95
            });
            local v97 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v92, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTouch"), 
                FontSize = v9.fontSize(Enum.FontSize.Size14, "HelpTouch"), 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v92 .. "Label", 
                ZIndex = 3, 
                Parent = v96, 
                TextScaled = true, 
                TextWrapped = true
            });
            if not v90 then
                v97.FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle");
                v97.Size = UDim2.new(v97.Size.X.Scale, v97.Size.X.Offset, v97.Size.Y.Scale, v97.Size.Y.Offset + 4);
            end;
            local _ = l_Create_0("ImageLabel")({
                Name = v92 .. "BackgroundImage", 
                Size = UDim2.new(1.25, 0, 1.25, 0), 
                Position = UDim2.new(-0.125, 0, -0.065, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 2, 65, 21), 
                ZIndex = 2, 
                Parent = v96
            });
            Instance.new("UITextSizeConstraint", v97).MaxTextSize = v9.textSize(18, "HelpText");
            return v96;
        end;
        local function _(v100, v101, v102, v103, v104) --[[ Line: 539 ]] --[[ Name: createTouchGestureImage ]]
            -- upvalues: l_Create_0 (ref)
            return (l_Create_0("ImageLabel")({
                Name = v100, 
                Size = v103, 
                Position = v102, 
                BackgroundTransparency = 1, 
                Image = v101, 
                ZIndex = 2, 
                Parent = v104
            }));
        end;
        local v106 = 30;
        if v90 then
            v106 = 0;
        end;
        v89.MoveLabel = v99("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, v106 + 77, 0, 25), v88);
        local v107 = UDim2.new(0.5, -32, 1, 3);
        local v108 = UDim2.new(0, 65, 0, 48);
        local l_MoveLabel_0 = v89.MoveLabel;
        v89.MoveImageDTS = l_Create_0("ImageLabel")({
            Name = "MoveImageDTS", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v107 = UDim2.new(0.5, -19, 1, 3);
        v108 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v89.MoveLabel;
        v89.MoveImageCTM = l_Create_0("ImageLabel")({
            Name = "MoveImageCTM", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v89.JumpLabel = v99("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, v106 + 77, 0, 25), v88);
        v107 = UDim2.new(0.5, -19, 1, 3);
        v108 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v89.JumpLabel;
        v89.JumpImage = l_Create_0("ImageLabel")({
            Name = "JumpImage", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v89.EquipLabel = v99("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, v106 + 120, 0, 25), v88);
        v89.ZoomLabel = v99("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v88);
        v107 = UDim2.new(0.5, -26, 1, 3);
        v108 = UDim2.new(0, 53, 0, 59);
        l_MoveLabel_0 = v89.ZoomLabel;
        v89.ZoomImage = l_Create_0("ImageLabel")({
            Name = "ZoomImage", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v89.RotateLabel = v99("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v88);
        v107 = UDim2.new(0.5, -32, 1, 3);
        v108 = UDim2.new(0, 65, 0, 48);
        l_MoveLabel_0 = v89.RotateLabel;
        v89.RotateImage = l_Create_0("ImageLabel")({
            Name = "RotateImage", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v89.UseToolLabel = v99("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v88);
        v107 = UDim2.new(0.5, -19, 1, 3);
        v108 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v89.UseToolLabel;
        v89.ToolImage = l_Create_0("ImageLabel")({
            Name = "ToolImage", 
            Size = v108, 
            Position = v107, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        return v89;
    end;
    local function v126(v111) --[[ Line: 579 ]] --[[ Name: createSpatialGamepadHelp ]]
        -- upvalues: v22 (ref), l_Create_0 (ref), l_NewPage_0 (copy), v20 (ref), v9 (ref)
        local l_GamepadQuest_0 = v22.Images.GamepadQuest;
        local l_QuestGamepadLabels_0 = v22.Labels.QuestGamepadLabels;
        local l_Image_0 = l_GamepadQuest_0.Image;
        local l_HeightRatio_0 = l_GamepadQuest_0.HeightRatio;
        local l_LocalizationKeyPrefix_0 = l_QuestGamepadLabels_0.LocalizationKeyPrefix;
        local l_LabelRelativeTextHeight_0 = l_QuestGamepadLabels_0.LabelRelativeTextHeight;
        local l_LabelsInfo_0 = l_QuestGamepadLabels_0.LabelsInfo;
        local v119 = l_Create_0("ImageLabel")({
            Name = "SpatialGamepadImage", 
            Size = UDim2.new(1, 0, l_HeightRatio_0, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            Image = l_Image_0, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v111
        });
        local l_UIPadding_0 = l_NewPage_0.Page:FindFirstChildOfClass("UIPadding");
        local v121 = if l_UIPadding_0 then l_UIPadding_0.PaddingLeft.Offset + l_UIPadding_0.PaddingRight.Offset else 0;
        v111.Size = UDim2.new(v111.Size.X.Scale, v111.Size.X.Offset, 0, (l_NewPage_0.Page.AbsoluteSize.X - v121) * l_HeightRatio_0);
        for _, v123 in l_LabelsInfo_0 do
            local v124 = l_LocalizationKeyPrefix_0 .. v123.labelKey;
            local v125 = v20:Format(v124);
            l_Create_0("TextLabel")({
                Name = v123.labelKey, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(v123.xPosition, v123.yPosition), 
                Size = UDim2.fromScale(v123.width, l_LabelRelativeTextHeight_0), 
                Text = v125, 
                TextXAlignment = v123.xAlignment or Enum.TextXAlignment.Right, 
                Font = v9.font(nil, "HelpGamepad"), 
                TextColor3 = v9.color("TextEmphasis"), 
                TextTransparency = v9.transparency("TextEmphasis"), 
                ZIndex = 2, 
                TextScaled = true, 
                Parent = v119
            });
        end;
    end;
    local function v131(v127) --[[ Line: 631 ]] --[[ Name: createHelpDisplay ]]
        -- upvalues: l_Create_0 (ref), v52 (copy), v75 (copy), v110 (copy), l_isInExperienceUIVREnabled_0 (ref), v126 (copy)
        local v128 = nil;
        local v129 = l_Create_0("Frame")({
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Name = "HelpFrame" .. tostring(v127)
        });
        if v127 == "KeyboardMouse" then
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                Wraps = true, 
                Parent = v129, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            });
        end;
        if v127 == "KeyboardMouse" then
            v52(v129);
        elseif v127 == "Gamepad" then
            v75(v129);
        elseif v127 == "Touch" then
            v128 = v110(v129);
        elseif l_isInExperienceUIVREnabled_0 and v127 == "SpatialGamepad" then
            v126(v129);
        end;
        return v129, v128;
    end;
    local function v135(v132) --[[ Line: 665 ]] --[[ Name: displayHelp ]]
        -- upvalues: l_NewPage_0 (copy), v14 (ref), l_UserInputService_0 (ref)
        for _, v134 in pairs(l_NewPage_0.HelpPages) do
            if v134 == v132 then
                v134.Parent = l_NewPage_0.Page;
                l_NewPage_0.Page.Size = v134.Size;
                if v14 then
                    l_NewPage_0.Page.Size = UDim2.new(v134.Size.X.Scale, v134.Size.X.Offset, v134.Size.Y.Scale, 0);
                end;
            else
                v134.Parent = nil;
            end;
        end;
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_NewPage_0.HubRef.PageViewClipper.ClipsDescendants = false;
            l_NewPage_0.HubRef.PageView.ClipsDescendants = false;
        end;
    end;
    local function v136(v137) --[[ Line: 683 ]] --[[ Name: switchToHelp ]]
        -- upvalues: l_NewPage_0 (copy), v135 (copy), l_GameSettings_0 (ref), v87 (copy), v131 (copy), v136 (copy)
        local v138 = l_NewPage_0.HelpPages[v137];
        if v138 then
            v135(v138);
            if v137 == "Touch" then
                local l_TouchMovementMode_0 = l_GameSettings_0.TouchMovementMode;
                if l_NewPage_0.ActiveHelpScheme ~= l_TouchMovementMode_0 then
                    v87(l_TouchMovementMode_0);
                    return;
                end;
            end;
        else
            local l_HelpPages_0 = l_NewPage_0.HelpPages;
            local l_HelpPageContents_0 = l_NewPage_0.HelpPageContents;
            local v142, v143 = v131(v137);
            l_HelpPages_0[v137] = v142;
            l_HelpPageContents_0[v137] = v143;
            v136(v137);
        end;
    end;
    local function _() --[[ Line: 700 ]] --[[ Name: showTypeOfHelp ]]
        -- upvalues: v136 (copy), l_NewPage_0 (copy)
        v136(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageDisplayed = function(_) --[[ Line: 704 ]] --[[ Name: PageDisplayed ]]
        -- upvalues: l_NewPage_0 (copy), l_UserInputService_0 (ref), v24 (ref), v136 (copy)
        if not l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v146) --[[ Line: 706 ]]
                -- upvalues: v24 (ref), v136 (ref), l_NewPage_0 (ref)
                if v146 ~= Enum.UserInputType.Focus and v146 ~= Enum.UserInputType.None then
                    v24 = v146;
                    v136(l_NewPage_0:GetCurrentInputType());
                end;
            end);
        end;
        v24 = l_UserInputService_0:GetLastInputType();
        v136(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageHidden = function(_) --[[ Line: 717 ]] --[[ Name: PageHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        if l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection:Disconnect();
            l_NewPage_0.LastInputTypeChangedConnection = nil;
        end;
    end;
    local function v153(v148) --[[ Line: 724 ]] --[[ Name: adjustForScreenLayout ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v6 (ref), l_GuiService_0 (ref), v87 (copy)
        if l_NewPage_0:GetCurrentInputType() == "Touch" then
            local l_TouchMovementMode_1 = l_GameSettings_0.TouchMovementMode;
            local v150 = v6:IsSmallTouchScreen();
            local v151 = v148 or l_GuiService_0:GetScreenResolution();
            local v152 = v151.y - 350;
            if v150 then
                v152 = v151.y - 120;
            end;
            l_NewPage_0.HelpPages.Touch.Size = UDim2.new(1, 0, 0, v152);
            v87(l_TouchMovementMode_1);
        end;
    end;
    l_NewPage_0.TabHeader.Name = "HelpTab";
    local v154 = l_uiblox_0["icons/menu/help"];
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v11.Font[v154.variant];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v154.name;
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Help";
    l_NewPage_0.Page.Name = "Help";
    v6:OnResized(l_NewPage_0, function(v155, _) --[[ Line: 748 ]]
        -- upvalues: l_NewPage_0 (copy), v153 (copy)
        if l_NewPage_0.HelpPages.Touch then
            v153(v155);
        end;
    end);
    return l_NewPage_0;
end)();
v13.Displayed.Event:connect(function() --[[ Line: 762 ]]
    -- upvalues: v13 (ref)
    v13:PageDisplayed();
    if v13.HubRef.VersionContainer then
        v13.HubRef.VersionContainer.Visible = true;
    end;
end);
v13.Hidden.Event:connect(function() --[[ Line: 769 ]]
    -- upvalues: v13 (ref)
    v13:PageHidden();
    v13.HubRef.PageViewClipper.ClipsDescendants = true;
    v13.HubRef.PageView.ClipsDescendants = true;
    v13.HubRef:ShowShield();
    if v13.HubRef.VersionContainer then
        v13.HubRef.VersionContainer.Visible = false;
    end;
end);
return v13;