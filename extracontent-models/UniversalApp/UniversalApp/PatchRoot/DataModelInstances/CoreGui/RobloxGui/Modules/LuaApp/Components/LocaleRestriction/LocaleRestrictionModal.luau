local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v10 = require(l_Modules_0.LuaApp.AppPage);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v12 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v13) --[[ Line: 26 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), v12 (copy), v10 (copy), l_useStyle_0 (copy), v9 (copy), v2 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), v8 (copy)
    local v14 = l_useDispatch_0();
    local v15 = l_useLocalization_0({
        LearnMoreText = "Feature.LocaleRestriction.Label.LearnMore", 
        TitleText = "Feature.LocaleRestriction.Title.RobloxUnavailable", 
        BodyText = "Feature.LocaleRestriction.Description.RobloxUnavailable"
    });
    local function v16() --[[ Line: 35 ]] --[[ Name: openBrowser ]]
        -- upvalues: v14 (copy), v12 (ref), v10 (ref), v15 (copy)
        v14(v12({
            name = v10.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/articles/360000313606", 
            extraProps = {
                title = v15.TitleText
            }
        }));
    end;
    local l_screenSize_0 = v13.screenSize;
    local v18 = l_useStyle_0();
    local l_Theme_0 = v18.Theme;
    local l_Font_0 = v18.Font;
    local l_globalGuiInset_0 = v13.globalGuiInset;
    l_globalGuiInset_0.bottom = v9();
    local v22 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v23 = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.top - l_globalGuiInset_0.bottom);
    local v24 = v2.createElement(l_PartialPageModal_0, {
        title = v15.TitleText, 
        screenSize = l_screenSize_0, 
        buttonHeight = 48, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isDisabled = false, 
                        onActivated = v16, 
                        text = v15.LearnMoreText
                    }
                }
            }
        }
    }, {
        Body = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 60), 
            BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
            LayoutOrder = 1
        }, {
            CustomInner = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v15.BodyText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextScaled = true, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                    MaxTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize
                })
            })
        })
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
                Position = v22, 
                Size = v23, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Content = v24
            })
        })
    });
end;