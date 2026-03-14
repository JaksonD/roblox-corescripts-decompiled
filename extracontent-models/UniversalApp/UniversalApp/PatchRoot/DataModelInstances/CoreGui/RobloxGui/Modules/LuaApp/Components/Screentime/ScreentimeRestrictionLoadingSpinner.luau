local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_LoadingSpinner_0 = v3.App.Loading.LoadingSpinner;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.getScreenBottomInset);
return function(v9) --[[ Line: 19 ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v2 (copy), v7 (copy), l_LoadingSpinner_0 (copy), l_IconSize_0 (copy)
    local l_screenSize_0 = v9.screenSize;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_globalGuiInset_0 = v9.globalGuiInset;
    local v13 = v8();
    local v14 = UDim2.fromOffset(0, l_globalGuiInset_0.top);
    local v15 = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y - l_globalGuiInset_0.top - v13);
    return v2.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        DisplayOrder = v7.DisplayOrder.AntiAddictionPrompt, 
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
                Position = v14, 
                Size = v15, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                Content = v2.createElement(l_LoadingSpinner_0, {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                })
            })
        })
    });
end;