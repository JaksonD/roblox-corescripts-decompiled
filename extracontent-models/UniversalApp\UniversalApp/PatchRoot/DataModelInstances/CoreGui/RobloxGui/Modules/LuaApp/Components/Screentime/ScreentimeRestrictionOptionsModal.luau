local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.getScreenBottomInset);
return function(v10) --[[ Line: 24 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), v9 (copy), v2 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy), v8 (copy)
    local v11 = l_useLocalization_0({
        AddFifteenButtonText = "Feature.Screentime.Label.FifteenMoreMinutes", 
        AddFiveButtonText = "Feature.Screentime.Label.FiveMoreMinutes", 
        TitleText = "Feature.Screentime.Label.Options", 
        BodyText = "Feature.Screentime.Description.MoreScreentimeDescription"
    });
    local l_screenSize_0 = v10.screenSize;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_globalGuiInset_0 = v10.globalGuiInset;
    local v15 = v9();
    local v16 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v17 = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.top - v15);
    local v18, v19 = v2.useState(false);
    local v20 = {
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 45 ]] --[[ Name: onActivated ]]
                    -- upvalues: v19 (copy), v10 (copy)
                    v19(true);
                    v10.onAddTime(15);
                    v19(false);
                end, 
                text = v11.AddFifteenButtonText, 
                isDisabled = v18
            }
        }, 
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function() --[[ Line: 57 ]] --[[ Name: onActivated ]]
                    -- upvalues: v19 (copy), v10 (copy)
                    v19(true);
                    v10.onAddTime(5);
                    v19(false);
                end, 
                text = v11.AddFiveButtonText, 
                isDisabled = v18
            }
        }
    };
    local v21 = v2.createElement(l_InteractiveAlert_0, {
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        screenSize = l_screenSize_0, 
        title = v11.TitleText, 
        bodyText = v11.BodyText, 
        buttonStackInfo = {
            buttons = v20, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttonHeight = 48
        }, 
        onCloseClicked = v10.onClose
    });
    return v2.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = v8.DisplayOrder.AntiAddictionPrompt, 
        IgnoreGuiInset = true
    }, {
        OverlayFrame = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            ImageTransparency = 1, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            BorderSizePixel = 0, 
            Selectable = false
        }, {
            Overlay = v2.createElement("Frame", {
                Position = v16, 
                Size = v17, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Content = v21
            })
        })
    });
end;