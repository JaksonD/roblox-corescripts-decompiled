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
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local v17 = nil;
if l_isInExperienceUIVREnabled_0 then
    local l_LocalizationService_0 = game:GetService("LocalizationService");
    v17 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization.new(l_LocalizationService_0.RobloxLocaleId);
end;
local v19 = if l_isInExperienceUIVREnabled_0 then require(l_RobloxGui_0.Modules.Settings.Resources.HelpConstants) else nil;
v13 = (function() --[[ Line: 66 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), l_UserInputService_0 (copy), l_Create_0 (copy), v9 (copy), v7 (copy), v8 (copy), v14 (copy), l_TextService_0 (copy), v6 (copy), l_GuiService_0 (copy), v19 (copy), v17 (ref), l_GameSettings_0 (copy), l_uiblox_0 (copy), v11 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.HelpPages = {};
    l_NewPage_0.HelpPageContents = {};
    l_NewPage_0.ActiveHelpScheme = nil;
    local v21 = nil;
    l_NewPage_0.GetCurrentInputType = function(_) --[[ Line: 75 ]] --[[ Name: GetCurrentInputType ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), l_isSpatial_0 (ref), v21 (ref), l_UserInputService_0 (ref)
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            return "SpatialGamepad";
        elseif v21 == nil then
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                return "Gamepad";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                return "KeyboardMouse";
            else
                return "Touch";
            end;
        elseif v21 == Enum.UserInputType.Keyboard or v21 == Enum.UserInputType.MouseMovement or v21 == Enum.UserInputType.MouseButton1 or v21 == Enum.UserInputType.MouseButton2 or v21 == Enum.UserInputType.MouseButton3 or v21 == Enum.UserInputType.MouseWheel then
            return "KeyboardMouse";
        elseif v21 == Enum.UserInputType.Touch then
            return "Touch";
        elseif v21 == Enum.UserInputType.Gamepad1 or v21 == Enum.UserInputType.Gamepad2 or v21 == Enum.UserInputType.Gamepad3 or v21 == Enum.UserInputType.Gamepad4 then
            return "Gamepad";
        else
            return "KeyboardMouse";
        end;
    end;
    local function v49(v24) --[[ Line: 107 ]] --[[ Name: createPCHelp ]]
        -- upvalues: l_Create_0 (ref), v9 (ref), l_UserInputService_0 (ref), v7 (ref), v8 (ref)
        local function v39(v25, v26) --[[ Line: 108 ]] --[[ Name: createPCGroup ]]
            -- upvalues: l_Create_0 (ref), v9 (ref)
            local v27 = l_Create_0("Frame")({
                Size = UDim2.new(0.3333333333333333, -4, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Name = "PCGroupFrame" .. tostring(v25)
            });
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 2), 
                Parent = v27, 
                SortOrder = Enum.SortOrder.LayoutOrder
            });
            local v29 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 9, 0, 0), 
                Size = UDim2.new(1, -9, 0, 30), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Text = v25, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                TextColor3 = Color3.new(1, 1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Name = "PCGroupTitle" .. tostring(v25), 
                ZIndex = 2, 
                LayoutOrder = 1, 
                Parent = v27
            });
            local _ = l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 9), 
                Parent = v29
            });
            local v31 = 0;
            local l_Offset_0 = v29.Size.Y.Offset;
            for v33 = 1, #v26 do
                for v34, v35 in pairs(v26[v33]) do
                    local v36 = l_Create_0("Frame")({
                        Size = UDim2.new(1, 0, 0, 42), 
                        Position = UDim2.new(0, 0, 0, l_Offset_0 + v31 * 44), 
                        BackgroundTransparency = v9.transparency("InputActionBackground", 0.65), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v33 + 1, 
                        BorderSizePixel = 0, 
                        ZIndex = 2, 
                        Name = "ActionInputBinding" .. tostring(v34), 
                        Parent = v27
                    });
                    v36.BackgroundColor3 = v9.color("InputActionBackground");
                    l_Create_0("UICorner")({
                        CornerRadius = UDim.new(0, 3), 
                        Parent = v36
                    });
                    local v37 = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.4, -9, 0, 42), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Position = UDim2.new(0, 9, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v34, 
                        Font = v9.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v34 .. "Label", 
                        ZIndex = 2, 
                        Parent = v36, 
                        TextWrapped = true
                    });
                    Instance.new("UITextSizeConstraint", v37).MaxTextSize = v9.textSize(28);
                    local _ = l_Create_0("TextLabel")({
                        Size = UDim2.new(0.5, 0, 0, 42), 
                        Position = UDim2.new(0.5, -4, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v35, 
                        Font = v9.font(Enum.Font.SourceSans, "HelpText"), 
                        FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpText"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v35 .. "Label", 
                        ZIndex = 2, 
                        Parent = v36, 
                        TextWrapped = true, 
                        TextScaled = false, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    });
                    v31 = v31 + 1;
                end;
            end;
            v27.Size = UDim2.new(v27.Size.X.Scale, v27.Size.X.Offset, 0, l_Offset_0 + v31 * 44);
            return v27;
        end;
        local v40 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
        local v41 = v39("Character Movement", {
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
        v41.Parent = v24;
        v41.LayoutOrder = 1;
        local v42 = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Three) .. "...";
        local v43 = v39("Accessories", {
            [1] = {
                ["Equip Tools"] = v42
            }, 
            [2] = {
                ["Unequip Tools"] = v42
            }, 
            [3] = {
                ["Drop Tool"] = "Backspace"
            }, 
            [4] = {
                ["Use Tool"] = "Left Mouse Button"
            }
        });
        v43.Position = UDim2.new(0.3333333333333333, 4, 0, 0);
        v43.Parent = v24;
        v43.LayoutOrder = 2;
        local v44 = {};
        table.insert(v44, {
            ["UI Selection Toggle"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v45 = not v8:IsSubjectToChinaPolicies();
        if v45 then
            table.insert(v44, {
                Screenshot = v40 and "Opt + 1" or "Alt + 1"
            });
            if not v40 then
                table.insert(v44, {
                    ["Record Video"] = "F12"
                });
            end;
        end;
        if v45 then
            table.insert(v44, {
                ["Dev Console"] = v40 and "F9/fn + F9" or "F9"
            });
        end;
        table.insert(v44, {
            Mouselock = "Shift"
        });
        if v45 then
            table.insert(v44, {
                ["Graphics Level"] = v40 and "F10/fn + F10" or "F10"
            });
            table.insert(v44, {
                Fullscreen = v40 and "Ctrl + Cmd + F" or "F11"
            });
        end;
        if v45 then
            table.insert(v44, {
                ["Perf. Stats"] = v40 and "Fn+Opt+Cmd+F7" or "Ctrl + Shift + F7"
            });
        end;
        local v46 = v39("Misc", v44);
        v46.Position = UDim2.new(0.6666666666666666, 8, 0, 0);
        v46.Parent = v24;
        v46.LayoutOrder = 3;
        local v47 = v39("Camera Movement", {
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
        v47.Position = UDim2.new(0, 0, v41.Size.Y.Scale, v41.Size.Y.Offset + 50);
        v47.Parent = v24;
        v47.LayoutOrder = 4;
        local v48 = v39("Menu Items", {
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
        v48.Position = UDim2.new(0.3333333333333333, 4, v41.Size.Y.Scale, v41.Size.Y.Offset + 50);
        v48.Parent = v24;
        v48.LayoutOrder = 5;
        v24.Size = UDim2.new(v24.Size.X.Scale, v24.Size.X.Offset, 0, v48.Size.Y.Offset + v48.Position.Y.Offset);
    end;
    local function v72(v50) --[[ Line: 312 ]] --[[ Name: createGamepadHelp ]]
        -- upvalues: l_NewPage_0 (copy), l_Create_0 (ref), v14 (ref), v9 (ref), l_TextService_0 (ref), v7 (ref)
        local v51 = math.max(l_NewPage_0.Page.AbsoluteSize.X * 0.58, 270);
        local v52 = UDim2.new(0, v51, 0, v51 * 0.64);
        local v53 = UDim2.new(0.5, -v52.X.Offset / 2 + 30, 0.5, -v52.Y.Offset / 2 + 7);
        local v54 = l_Create_0("ImageLabel")({
            Name = "GamepadImage", 
            Size = v52, 
            Position = v53, 
            Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v50
        });
        v50.Size = UDim2.new(v50.Size.X.Scale, v50.Size.X.Offset, 0, v54.Size.Y.Offset + 100);
        local v55 = v14 and v9.fontSize(Enum.FontSize.Size36) or v9.fontSize(Enum.FontSize.Size24);
        local v56 = v55 == v9.fontSize(Enum.FontSize.Size36) and v9.textSize(36) or v9.textSize(24);
        local function v68(v57, v58, v59, v60) --[[ Line: 332 ]] --[[ Name: createGamepadLabel ]]
            -- upvalues: l_Create_0 (ref), v9 (ref), v55 (copy), v54 (copy), l_TextService_0 (ref), v56 (copy), v50 (copy)
            local v61 = l_Create_0("TextLabel")({
                Position = v58, 
                Size = v59, 
                BackgroundTransparency = 1, 
                Text = v57, 
                TextXAlignment = v60 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = v60 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v55, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v57 .. "Label", 
                ZIndex = 2, 
                Parent = v54, 
                TextTruncate = Enum.TextTruncate.AtEnd
            });
            v61.TextWrapped = true;
            local l_X_0 = l_TextService_0:GetTextSize(v57, v56, v9.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X;
            local v63 = math.abs(v58.X.Offset);
            local l_v50_0 = v50;
            local function v66() --[[ Line: 356 ]] --[[ Name: updateNameLabelSize ]]
                -- upvalues: v60 (copy), l_v50_0 (copy), v63 (copy), v61 (copy), v56 (ref), l_X_0 (copy), v55 (ref)
                local v65 = v60 and l_v50_0.AbsoluteSize.X / 2 + 30 - v63 or l_v50_0.AbsoluteSize.X / 2 - 30 - v63;
                v61.Size = UDim2.new(v61.Size.X.Scale, v65, v61.Size.Y.Scale, v56 * 2);
                v61.TextScaled = false;
                if v65 >= l_X_0 then
                    v61.FontSize = v55;
                end;
            end;
            local _ = l_v50_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function() --[[ Line: 369 ]]
                -- upvalues: v66 (copy)
                v66();
            end);
            v66();
        end;
        local v69 = -v54.Size.X.Offset / 2 - 20;
        local v70 = v54.Size.X.Offset / 2 - 20;
        local v71 = v70 + 40;
        v68("Switch Tool", UDim2.new(0.5, v69, 0, 15), UDim2.new(0, 100, 0, v56), true);
        v68(v7:FormatByKey("InGame.HelpMenu.Controls.ToggleGameMenu"), UDim2.new(0.5, v69, 0.15, 10), UDim2.new(0, 164, 0, v56), true);
        v68("Move", UDim2.new(0.5, v69, 0.31, 5), UDim2.new(0, 46, 0, v56), true);
        v68("Menu Navigation", UDim2.new(0.5, v69, 0.46, 0), UDim2.new(0, 164, 0, v56), true);
        v68("Use Tool", UDim2.new(0.5, v70, 0, 15), UDim2.new(0, 73, 0, v56));
        v68("Roblox Menu", UDim2.new(0.5, v70, 0.15, 10), UDim2.new(0, 122, 0, v56));
        v68("Back", UDim2.new(0.5, v70, 0.31, 5), UDim2.new(0, 43, 0, v56));
        v68("Jump", UDim2.new(0.5, v70, 0.46, 0), UDim2.new(0, 49, 0, v56));
        v68("Rotate Camera", UDim2.new(0.5, v71, 0.62, -10), UDim2.new(0, 132, 0, v56));
        v68("Camera Zoom", UDim2.new(0.5, v71, 0.77, -10), UDim2.new(0, 122, 0, v56));
    end;
    local function v84(v73) --[[ Line: 401 ]] --[[ Name: updateTouchLayout ]]
        -- upvalues: l_NewPage_0 (copy), v6 (ref)
        l_NewPage_0.ActiveHelpScheme = v73;
        local v74 = v6:IsPortrait();
        if l_NewPage_0.HelpPages.Touch then
            local l_Touch_0 = l_NewPage_0.HelpPageContents.Touch;
            local function _(v76) --[[ Line: 409 ]] --[[ Name: hideUneeded ]]
                -- upvalues: l_Touch_0 (copy)
                if v76 then
                    for v77, v78 in pairs(l_Touch_0) do
                        v78.Visible = not v76[v77];
                    end;
                end;
            end;
            local v80 = nil;
            if v73 == Enum.TouchMovementMode.DynamicThumbstick or v73 == Enum.TouchMovementMode.Default then
                v80 = {
                    MoveImageCTM = true
                };
                l_Touch_0.MoveLabel.Position = v74 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.85, -l_Touch_0.MoveLabel.AbsoluteSize.y);
                l_Touch_0.JumpLabel.Position = v74 and UDim2.new(0.75, -l_Touch_0.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -l_Touch_0.JumpLabel.AbsoluteSize.y);
                l_Touch_0.RotateLabel.Position = v74 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -l_Touch_0.RotateLabel.AbsoluteSize.x / 2, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v74 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60);
                l_Touch_0.EquipLabel.Position = v74 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v74 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            elseif v73 == Enum.TouchMovementMode.ClickToMove then
                v80 = {
                    MoveImageDTS = true, 
                    JumpLabel = true
                };
                l_Touch_0.MoveLabel.Position = v74 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 40);
                l_Touch_0.RotateLabel.Position = v74 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v74 and UDim2.new(0.75, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v74 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v74 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            else
                v80 = {
                    MoveImageDTS = true, 
                    MoveImageCTM = true, 
                    JumpImage = true
                };
                l_Touch_0.MoveLabel.Position = v74 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0);
                l_Touch_0.JumpLabel.Position = v74 and UDim2.new(0.94, -l_Touch_0.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0);
                l_Touch_0.RotateLabel.Position = v74 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = v74 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = v74 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = v74 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            end;
            local l_v80_0 = v80;
            if l_v80_0 then
                for v82, v83 in pairs(l_Touch_0) do
                    v83.Visible = not l_v80_0[v82];
                end;
            end;
        end;
    end;
    local function v107(v85) --[[ Line: 457 ]] --[[ Name: createTouchHelp ]]
        -- upvalues: v6 (ref), l_GuiService_0 (ref), l_Create_0 (ref), v9 (ref)
        local v86 = {};
        local v87 = v6:IsSmallTouchScreen();
        local v88 = l_GuiService_0:GetScreenResolution().y - 350;
        if v87 then
            v88 = l_GuiService_0:GetScreenResolution().y - 100;
        end;
        v85.Size = UDim2.new(1, 0, 0, v88);
        local function v96(v89, v90, v91, v92) --[[ Line: 466 ]] --[[ Name: createTouchLabel ]]
            -- upvalues: l_Create_0 (ref), v9 (ref), v87 (copy)
            local v93 = l_Create_0("TextLabel")({
                Position = v90, 
                Size = v91, 
                BackgroundTransparency = 1, 
                Name = v89 .. "Frame", 
                Parent = v92
            });
            local v94 = l_Create_0("TextLabel")({
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v89, 
                Font = v9.font(Enum.Font.SourceSansBold, "HelpTouch"), 
                FontSize = v9.fontSize(Enum.FontSize.Size14, "HelpTouch"), 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v89 .. "Label", 
                ZIndex = 3, 
                Parent = v93, 
                TextScaled = true, 
                TextWrapped = true
            });
            if not v87 then
                v94.FontSize = v9.fontSize(Enum.FontSize.Size18, "HelpTitle");
                v94.Size = UDim2.new(v94.Size.X.Scale, v94.Size.X.Offset, v94.Size.Y.Scale, v94.Size.Y.Offset + 4);
            end;
            local _ = l_Create_0("ImageLabel")({
                Name = v89 .. "BackgroundImage", 
                Size = UDim2.new(1.25, 0, 1.25, 0), 
                Position = UDim2.new(-0.125, 0, -0.065, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 2, 65, 21), 
                ZIndex = 2, 
                Parent = v93
            });
            Instance.new("UITextSizeConstraint", v94).MaxTextSize = v9.textSize(18, "HelpText");
            return v93;
        end;
        local function _(v97, v98, v99, v100, v101) --[[ Line: 516 ]] --[[ Name: createTouchGestureImage ]]
            -- upvalues: l_Create_0 (ref)
            return (l_Create_0("ImageLabel")({
                Name = v97, 
                Size = v100, 
                Position = v99, 
                BackgroundTransparency = 1, 
                Image = v98, 
                ZIndex = 2, 
                Parent = v101
            }));
        end;
        local v103 = 30;
        if v87 then
            v103 = 0;
        end;
        v86.MoveLabel = v96("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, v103 + 77, 0, 25), v85);
        local v104 = UDim2.new(0.5, -32, 1, 3);
        local v105 = UDim2.new(0, 65, 0, 48);
        local l_MoveLabel_0 = v86.MoveLabel;
        v86.MoveImageDTS = l_Create_0("ImageLabel")({
            Name = "MoveImageDTS", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v104 = UDim2.new(0.5, -19, 1, 3);
        v105 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v86.MoveLabel;
        v86.MoveImageCTM = l_Create_0("ImageLabel")({
            Name = "MoveImageCTM", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v86.JumpLabel = v96("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, v103 + 77, 0, 25), v85);
        v104 = UDim2.new(0.5, -19, 1, 3);
        v105 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v86.JumpLabel;
        v86.JumpImage = l_Create_0("ImageLabel")({
            Name = "JumpImage", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v86.EquipLabel = v96("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, v103 + 120, 0, 25), v85);
        v86.ZoomLabel = v96("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v85);
        v104 = UDim2.new(0.5, -26, 1, 3);
        v105 = UDim2.new(0, 53, 0, 59);
        l_MoveLabel_0 = v86.ZoomLabel;
        v86.ZoomImage = l_Create_0("ImageLabel")({
            Name = "ZoomImage", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v86.RotateLabel = v96("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v85);
        v104 = UDim2.new(0.5, -32, 1, 3);
        v105 = UDim2.new(0, 65, 0, 48);
        l_MoveLabel_0 = v86.RotateLabel;
        v86.RotateImage = l_Create_0("ImageLabel")({
            Name = "RotateImage", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        v86.UseToolLabel = v96("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v85);
        v104 = UDim2.new(0.5, -19, 1, 3);
        v105 = UDim2.new(0, 38, 0, 52);
        l_MoveLabel_0 = v86.UseToolLabel;
        v86.ToolImage = l_Create_0("ImageLabel")({
            Name = "ToolImage", 
            Size = v105, 
            Position = v104, 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = l_MoveLabel_0
        });
        return v86;
    end;
    local function v123(v108) --[[ Line: 556 ]] --[[ Name: createSpatialGamepadHelp ]]
        -- upvalues: v19 (ref), l_Create_0 (ref), l_NewPage_0 (copy), v17 (ref), v9 (ref)
        local l_GamepadQuest_0 = v19.Images.GamepadQuest;
        local l_QuestGamepadLabels_0 = v19.Labels.QuestGamepadLabels;
        local l_Image_0 = l_GamepadQuest_0.Image;
        local l_HeightRatio_0 = l_GamepadQuest_0.HeightRatio;
        local l_LocalizationKeyPrefix_0 = l_QuestGamepadLabels_0.LocalizationKeyPrefix;
        local l_LabelRelativeTextHeight_0 = l_QuestGamepadLabels_0.LabelRelativeTextHeight;
        local l_LabelsInfo_0 = l_QuestGamepadLabels_0.LabelsInfo;
        local v116 = l_Create_0("ImageLabel")({
            Name = "SpatialGamepadImage", 
            Size = UDim2.new(1, 0, l_HeightRatio_0, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            Image = l_Image_0, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v108
        });
        local l_UIPadding_0 = l_NewPage_0.Page:FindFirstChildOfClass("UIPadding");
        local v118 = if l_UIPadding_0 then l_UIPadding_0.PaddingLeft.Offset + l_UIPadding_0.PaddingRight.Offset else 0;
        v108.Size = UDim2.new(v108.Size.X.Scale, v108.Size.X.Offset, 0, (l_NewPage_0.Page.AbsoluteSize.X - v118) * l_HeightRatio_0);
        for _, v120 in l_LabelsInfo_0 do
            local v121 = l_LocalizationKeyPrefix_0 .. v120.labelKey;
            local v122 = v17:Format(v121);
            l_Create_0("TextLabel")({
                Name = v120.labelKey, 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(v120.xPosition, v120.yPosition), 
                Size = UDim2.fromScale(v120.width, l_LabelRelativeTextHeight_0), 
                Text = v122, 
                TextXAlignment = v120.xAlignment or Enum.TextXAlignment.Right, 
                Font = v9.font(nil, "HelpGamepad"), 
                TextColor3 = v9.color("TextEmphasis"), 
                TextTransparency = v9.transparency("TextEmphasis"), 
                ZIndex = 2, 
                TextScaled = true, 
                Parent = v116
            });
        end;
    end;
    local function v128(v124) --[[ Line: 608 ]] --[[ Name: createHelpDisplay ]]
        -- upvalues: l_Create_0 (ref), v49 (copy), v72 (copy), v107 (copy), l_isInExperienceUIVREnabled_0 (ref), v123 (copy)
        local v125 = nil;
        local v126 = l_Create_0("Frame")({
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Name = "HelpFrame" .. tostring(v124)
        });
        if v124 == "KeyboardMouse" then
            local _ = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                Wraps = true, 
                Parent = v126, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            });
        end;
        if v124 == "KeyboardMouse" then
            v49(v126);
        elseif v124 == "Gamepad" then
            v72(v126);
        elseif v124 == "Touch" then
            v125 = v107(v126);
        elseif l_isInExperienceUIVREnabled_0 and v124 == "SpatialGamepad" then
            v123(v126);
        end;
        return v126, v125;
    end;
    local function v132(v129) --[[ Line: 642 ]] --[[ Name: displayHelp ]]
        -- upvalues: l_NewPage_0 (copy), v14 (ref), l_UserInputService_0 (ref)
        for _, v131 in pairs(l_NewPage_0.HelpPages) do
            if v131 == v129 then
                v131.Parent = l_NewPage_0.Page;
                l_NewPage_0.Page.Size = v131.Size;
                if v14 then
                    l_NewPage_0.Page.Size = UDim2.new(v131.Size.X.Scale, v131.Size.X.Offset, v131.Size.Y.Scale, 0);
                end;
            else
                v131.Parent = nil;
            end;
        end;
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_NewPage_0.HubRef.PageViewClipper.ClipsDescendants = false;
            l_NewPage_0.HubRef.PageView.ClipsDescendants = false;
        end;
    end;
    local function v133(v134) --[[ Line: 660 ]] --[[ Name: switchToHelp ]]
        -- upvalues: l_NewPage_0 (copy), v132 (copy), l_GameSettings_0 (ref), v84 (copy), v128 (copy), v133 (copy)
        local v135 = l_NewPage_0.HelpPages[v134];
        if v135 then
            v132(v135);
            if v134 == "Touch" then
                local l_TouchMovementMode_0 = l_GameSettings_0.TouchMovementMode;
                if l_NewPage_0.ActiveHelpScheme ~= l_TouchMovementMode_0 then
                    v84(l_TouchMovementMode_0);
                    return;
                end;
            end;
        else
            local l_HelpPages_0 = l_NewPage_0.HelpPages;
            local l_HelpPageContents_0 = l_NewPage_0.HelpPageContents;
            local v139, v140 = v128(v134);
            l_HelpPages_0[v134] = v139;
            l_HelpPageContents_0[v134] = v140;
            v133(v134);
        end;
    end;
    local function _() --[[ Line: 677 ]] --[[ Name: showTypeOfHelp ]]
        -- upvalues: v133 (copy), l_NewPage_0 (copy)
        v133(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageDisplayed = function(_) --[[ Line: 681 ]] --[[ Name: PageDisplayed ]]
        -- upvalues: l_NewPage_0 (copy), l_UserInputService_0 (ref), v21 (ref), v133 (copy)
        if not l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v143) --[[ Line: 683 ]]
                -- upvalues: v21 (ref), v133 (ref), l_NewPage_0 (ref)
                if v143 ~= Enum.UserInputType.Focus and v143 ~= Enum.UserInputType.None then
                    v21 = v143;
                    v133(l_NewPage_0:GetCurrentInputType());
                end;
            end);
        end;
        v21 = l_UserInputService_0:GetLastInputType();
        v133(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageHidden = function(_) --[[ Line: 694 ]] --[[ Name: PageHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        if l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection:Disconnect();
            l_NewPage_0.LastInputTypeChangedConnection = nil;
        end;
    end;
    local function v150(v145) --[[ Line: 701 ]] --[[ Name: adjustForScreenLayout ]]
        -- upvalues: l_NewPage_0 (copy), l_GameSettings_0 (ref), v6 (ref), l_GuiService_0 (ref), v84 (copy)
        if l_NewPage_0:GetCurrentInputType() == "Touch" then
            local l_TouchMovementMode_1 = l_GameSettings_0.TouchMovementMode;
            local v147 = v6:IsSmallTouchScreen();
            local v148 = v145 or l_GuiService_0:GetScreenResolution();
            local v149 = v148.y - 350;
            if v147 then
                v149 = v148.y - 120;
            end;
            l_NewPage_0.HelpPages.Touch.Size = UDim2.new(1, 0, 0, v149);
            v84(l_TouchMovementMode_1);
        end;
    end;
    l_NewPage_0.TabHeader.Name = "HelpTab";
    local v151 = l_uiblox_0["icons/menu/help"];
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v11.Font[v151.variant];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v151.name;
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Help";
    l_NewPage_0.Page.Name = "Help";
    v6:OnResized(l_NewPage_0, function(v152, _) --[[ Line: 725 ]]
        -- upvalues: l_NewPage_0 (copy), v150 (copy)
        if l_NewPage_0.HelpPages.Touch then
            v150(v152);
        end;
    end);
    return l_NewPage_0;
end)();
v13.Displayed.Event:connect(function() --[[ Line: 739 ]]
    -- upvalues: v13 (ref)
    v13:PageDisplayed();
    if v13.HubRef.VersionContainer then
        v13.HubRef.VersionContainer.Visible = true;
    end;
end);
v13.Hidden.Event:connect(function() --[[ Line: 746 ]]
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