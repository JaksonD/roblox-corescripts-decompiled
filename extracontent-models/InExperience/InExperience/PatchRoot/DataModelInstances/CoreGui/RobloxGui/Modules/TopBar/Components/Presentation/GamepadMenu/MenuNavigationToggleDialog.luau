local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.ReactUtils);
local v6 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Packages.UIBlox);
local l_FFlagEnableConsoleExpControls_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls;
local l_useEventConnection_0 = v5.useEventConnection;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v14 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v15 = if not l_FFlagEnableConsoleExpControls_0 or v14 then require(l_Parent_0.Components.GamepadConnector) else nil;
local v16 = require(l_Chrome_0.ChromeShared.Hooks.useObservableValue);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v18 = require(l_CoreGui_0.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog);
return function(v19) --[[ Line: 40 ]] --[[ Name: MenuNavigationToggleDialog ]]
    -- upvalues: l_useDesignTokens_0 (copy), v18 (copy), l_UserInputService_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_useEventConnection_0 (copy), l_Localization_0 (copy), l_GetTextSize_0 (copy), v14 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v16 (copy), v15 (copy)
    local v20 = l_useDesignTokens_0();
    local l_CaptionHeader_0 = v20.Semantic.Typography.CaptionHeader;
    local l_Space_200_0 = v20.Global.Space_200;
    local l_Space_75_0 = v20.Global.Space_75;
    local l_Medium_0 = v20.Semantic.Radius.Medium;
    local l_Size_300_0 = v20.Global.Size_300;
    local l_Contrast_0 = v20.Semantic.Color.BackgroundUi.Contrast;
    local l_Color3_0 = v20.Semantic.Color.Text.Emphasis.Color3;
    local l_Space_50_0 = v20.Global.Space_50;
    local v29 = if v18 and game:GetEngineFeature("GetImageForKeyCode") then l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png";
    local v30 = nil;
    local v31 = nil;
    if v18 then
        local v32, v33 = v6.useState(l_LocalizationService_0.RobloxLocaleId);
        local l_v33_0 = v33 --[[ copy: 14 -> 17 ]];
        l_useEventConnection_0(l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ Line: 59 ]]
            -- upvalues: l_v33_0 (copy), l_LocalizationService_0 (ref)
            l_v33_0(l_LocalizationService_0.RobloxLocaleId);
        end);
        local l_v32_0 = v32 --[[ copy: 13 -> 18 ]];
        local v42, v43 = v6.useMemo(function() --[[ Line: 69 ]]
            -- upvalues: l_Localization_0 (ref), l_v32_0 (copy)
            local v36 = l_Localization_0.new(l_v32_0);
            local l_status_0, l_result_0 = pcall(v36.Format, v36, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon");
            local l_status_1, l_result_1 = pcall(v36.Format, v36, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon");
            local v41 = if l_status_0 then l_result_0 else "Some experiences require pressing";
            if l_status_1 then
                return v41, l_result_1;
            else
                return v41, "to toggle menu navigation";
            end;
        end, {
            v32
        });
        v30 = v42;
        v31 = v43;
    else
        local v44 = {
            VirtualCursorHintPreIcon = "Some experiences require pressing ", 
            VirtualCursorHintPostIcon = " to toggle menu navigation"
        };
        v30 = v44.VirtualCursorHintPreIcon;
        v31 = v44.VirtualCursorHintPostIcon;
    end;
    local v45, v46 = v6.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: l_GetTextSize_0 (ref), v30 (ref), l_CaptionHeader_0 (copy), v31 (ref)
        return l_GetTextSize_0(v30, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(1e999, 1e999)), (l_GetTextSize_0(v31, l_CaptionHeader_0.FontSize, l_CaptionHeader_0.Font, Vector2.new(1e999, 1e999)));
    end, {
        l_CaptionHeader_0.FontSize, 
        l_CaptionHeader_0.Font, 
        v30, 
        v31
    });
    local v47 = nil;
    if v14 then
        if l_FFlagEnableConsoleExpControls_0 then
            v47 = v16(v15:getSelectedCoreObject());
        end;
    else
        v47 = nil;
    end;
    return v6.createElement("Frame", {
        BackgroundColor3 = l_Contrast_0.Color3, 
        BackgroundTransparency = l_Contrast_0.Transparency, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v19.Position, 
        Visible = not v14 or not l_FFlagEnableConsoleExpControls_0 or v47 ~= nil
    }, {
        Corner = v6.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_Medium_0)
        }), 
        Layout = v6.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = if v18 then UDim.new(0, l_Space_50_0) else nil
        }), 
        LeftText = v6.createElement("TextLabel", {
            Size = UDim2.fromOffset(v45.X, v45.Y), 
            Text = v30, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }), 
        Icon = v6.createElement("ImageLabel", {
            Size = UDim2.fromOffset(l_Size_300_0, l_Size_300_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 100, 
            Image = v29
        }), 
        RightText = v6.createElement("TextLabel", {
            Size = UDim2.fromOffset(v46.X, v46.Y), 
            Text = v31, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Color3_0, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = l_CaptionHeader_0.FontSize, 
            TextWrapped = false, 
            BackgroundTransparency = 1, 
            LayoutOrder = 200
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_75_0), 
            PaddingBottom = UDim.new(0, l_Space_75_0), 
            PaddingLeft = UDim.new(0, l_Space_200_0), 
            PaddingRight = UDim.new(0, l_Space_200_0)
        })
    });
end;