local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("LocalizationService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TopBar");
local l_default_0 = require(l_script_FirstAncestor_0.Analytics).default;
local _ = require(l_script_FirstAncestor_0.TokenMappers.MenuNavigationPromptTokenMapper);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v13 = {
    ButtonSelect = "CoreScripts.InGameMenu.Label.ViewButton", 
    ButtonTouchpad = "CoreScripts.InGameMenu.Label.TouchpadButton", 
    ButtonShare = "CoreScripts.InGameMenu.Label.ShareButton"
};
local function v19() --[[ Line: 42 ]] --[[ Name: HeaderArea ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy)
    local l_MenuNavigationPrompt_0 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_0 = l_MenuNavigationPrompt_0.Typography;
    local l_Color_0 = l_MenuNavigationPrompt_0.Color;
    local l_Space_0 = l_MenuNavigationPrompt_0.Space;
    local v18 = l_useLocalization_0({
        HeaderText = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Title"
    });
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 0, 
        BackgroundTransparency = 1
    }, {
        Header = v4.createElement("TextLabel", {
            Text = v18.HeaderText, 
            BackgroundTransparency = 1, 
            Font = l_Typography_0.header.Font, 
            TextSize = l_Typography_0.header.FontSize, 
            TextColor3 = l_Color_0.textColor.Color3, 
            Size = UDim2.fromOffset(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_0.titlePadding), 
            PaddingBottom = UDim.new(0, l_Space_0.titlePadding), 
            PaddingLeft = UDim.new(0, l_Space_0.bodyPadding), 
            PaddingRight = UDim.new(0, l_Space_0.bodyPadding)
        })
    });
end;
local function v28() --[[ Line: 78 ]] --[[ Name: GamepadImageArea ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_UserInputService_0 (copy), v13 (copy), l_useLocalization_0 (copy), v4 (copy)
    local l_MenuNavigationPrompt_1 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_1 = l_MenuNavigationPrompt_1.Typography;
    local l_Color_1 = l_MenuNavigationPrompt_1.Color;
    local l_Size_0 = l_MenuNavigationPrompt_1.Size;
    local l_Space_1 = l_MenuNavigationPrompt_1.Space;
    local v25 = v13[l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton";
    local v26 = l_useLocalization_0({
        ButtonLabelText = v25
    });
    local l_l_UserInputService_0_ImageForKeyCode_0 = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 0, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_1.iconPadding)
        }), 
        ButtonLabelGroup = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_1.iconPadding)
            }), 
            Icon = v4.createElement("ImageLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Image = l_l_UserInputService_0_ImageForKeyCode_0, 
                Size = UDim2.fromOffset(l_Size_0.iconSize, l_Size_0.iconSize)
            }), 
            ControllerButtonLabel = v4.createElement("TextLabel", {
                Text = v26.ButtonLabelText, 
                LayoutOrder = 100, 
                BackgroundTransparency = 1, 
                Font = l_Typography_1.label.Font, 
                TextSize = l_Typography_1.label.FontSize, 
                TextColor3 = l_Color_1.textColor.Color3, 
                Size = UDim2.fromOffset(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        ControllerImage = v4.createElement("ImageLabel", {
            Image = "rbxasset://textures/ui/Gamepad/ControllerSelect.png", 
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = 100, 
            BackgroundTransparency = 1
        }, {
            UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                AspectRatio = l_Size_0.imageWidth / l_Size_0.imageHeight
            }), 
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_Size_0.imageWidth, l_Size_0.imageHeight), 
                MinSize = Vector2.new(l_Size_0.imageWidth * 0.5, l_Size_0.imageHeight * 0.5)
            })
        })
    });
end;
local function v37(v29) --[[ Line: 154 ]] --[[ Name: Body ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_UserInputService_0 (copy), v13 (copy), l_useLocalization_0 (copy), v4 (copy), v28 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local l_MenuNavigationPrompt_2 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_2 = l_MenuNavigationPrompt_2.Typography;
    local l_Color_2 = l_MenuNavigationPrompt_2.Color;
    local l_Size_1 = l_MenuNavigationPrompt_2.Size;
    local l_Space_2 = l_MenuNavigationPrompt_2.Space;
    local _ = v13[l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton";
    local v36 = l_useLocalization_0({
        OkText = "CoreScripts.InGameMenu.Ok", 
        Description = "CoreScripts.InGameMenu.EducationalPopup.UINavigation.Description"
    });
    return v4.createElement("Frame", {
        LayoutOrder = 200, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_2.bodyPadding)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Space_2.bodyPadding), 
            PaddingRight = UDim.new(0, l_Space_2.bodyPadding), 
            PaddingTop = UDim.new(0, l_Space_2.bodyPadding), 
            PaddingBottom = UDim.new(0, l_Space_2.bodyPadding)
        }), 
        GamepadImageArea = v4.createElement(v28), 
        ImageDescription = v4.createElement("TextLabel", {
            Text = v36.Description, 
            LayoutOrder = 100, 
            BackgroundTransparency = 1, 
            Font = l_Typography_2.caption.Font, 
            TextSize = l_Typography_2.caption.FontSize, 
            TextColor3 = l_Color_2.textColor.Color3, 
            TextWrapped = true, 
            LineHeight = l_Typography_2.caption.LineHeight, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ConfirmationButton = v4.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 200, 
            size = UDim2.new(1, 0, 0, l_Size_1.buttonHeight), 
            text = v36.OkText, 
            onActivated = v29.onDismissed, 
            icon = if v29.selectButtonDismissesGamepadNavigationDialog then l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else nil
        })
    });
end;
return function(v38) --[[ Line: 216 ]] --[[ Name: GamepadNavigationDialog ]]
    -- upvalues: l_useDesignTokens_0 (copy), v4 (copy), l_default_0 (copy), l_ContextActionService_0 (copy), v19 (copy), v37 (copy)
    local l_MenuNavigationPrompt_3 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Color_3 = l_MenuNavigationPrompt_3.Color;
    local l_Size_2 = l_MenuNavigationPrompt_3.Size;
    local l_Space_3 = l_MenuNavigationPrompt_3.Space;
    local l_Radius_0 = l_MenuNavigationPrompt_3.Radius;
    v4.useEffect(function() --[[ Line: 224 ]]
        -- upvalues: l_default_0 (ref), l_ContextActionService_0 (ref), v38 (copy)
        l_default_0:onShowGamepadNavigationDialog();
        l_ContextActionService_0:BindCoreAction("ConfirmBindComponentMapperTokenModule", function(_, v45, _) --[[ Line: 228 ]]
            -- upvalues: v38 (ref)
            if v45 == Enum.UserInputState.End then
                v38.onDismissed();
            end;
        end, false, if v38.selectButtonDismissesGamepadNavigationDialog then Enum.KeyCode.ButtonSelect else Enum.KeyCode.ButtonA);
        return function() --[[ Line: 239 ]]
            -- upvalues: l_default_0 (ref), l_ContextActionService_0 (ref)
            l_default_0:onDismissGamepadNavigationDialog();
            l_ContextActionService_0:UnbindCoreAction("ConfirmBindComponentMapperTokenModule");
        end;
    end);
    return v4.createElement("Frame", {
        BackgroundColor3 = l_Color_3.backgroundUiColor.Color3, 
        BackgroundTransparency = l_Color_3.backgroundUiColor.Transparency, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(l_Size_2.promptWidth / l_Size_2.displayWidth, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        Corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_Radius_0.cornerRadius)
        }), 
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        HeaderArea = v4.createElement(v19), 
        Separator = v4.createElement("Frame", {
            LayoutOrder = 100, 
            Size = UDim2.new(1, -2 * l_Space_3.bodyPadding, 0, 1), 
            BackgroundColor3 = l_Color_3.separatorColor.Color3, 
            BackgroundTransparency = l_Color_3.separatorColor.Transparency, 
            BorderSizePixel = 0
        }), 
        Body = v4.createElement(v37, v38), 
        UISizeConstraint = v4.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(1e999, 1e999), 
            MinSize = Vector2.new(l_Size_2.imageWidth + 2 * l_Space_3.bodyPadding, 1)
        })
    });
end;