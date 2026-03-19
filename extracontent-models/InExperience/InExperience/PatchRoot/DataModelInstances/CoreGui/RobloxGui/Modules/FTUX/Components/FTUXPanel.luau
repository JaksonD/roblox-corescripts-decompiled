local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Components.FTUXSlideshow);
local v5 = require(l_Parent_0.Resources.FTUXConstants);
local _ = require(l_Parent_0.Enums.PlatformEnum);
local v7 = game:DefineFastInt("FTUXPanelXOffset", 50);
return function(v8) --[[ Line: 20 ]] --[[ Name: FTUXPanel ]]
    -- upvalues: l_useStyle_0 (copy), v5 (copy), v1 (copy), v7 (copy), v4 (copy)
    local v9 = l_useStyle_0();
    local l_PanelConstants_0 = v5[v8.platform].PanelConstants;
    local l_MAIN_SCREEN_SIZE_WIDTH_0 = l_PanelConstants_0.MAIN_SCREEN_SIZE_WIDTH;
    local l_MAIN_SCREEN_SIZE_HEIGHT_0 = l_PanelConstants_0.MAIN_SCREEN_SIZE_HEIGHT;
    local l_SLIDESHOW_FRAME_WIDTH_0 = l_PanelConstants_0.SLIDESHOW_FRAME_WIDTH;
    local l_SLIDESHOW_FRAME_HEIGHT_0 = l_PanelConstants_0.SLIDESHOW_FRAME_HEIGHT;
    local l_SLIDESHOW_FRAME_X_0 = l_PanelConstants_0.SLIDESHOW_FRAME_X;
    local l_SLIDESHOW_FRAME_Y_0 = l_PanelConstants_0.SLIDESHOW_FRAME_Y;
    local l_Color_0 = v9.Theme.BackgroundDefault.Color;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, v7, 0, 0)
    }, {
        Slideshow = v1.createElement("Frame", {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = 0, 
            Size = UDim2.new(l_SLIDESHOW_FRAME_WIDTH_0 / l_MAIN_SCREEN_SIZE_WIDTH_0, 0, l_SLIDESHOW_FRAME_HEIGHT_0 / l_MAIN_SCREEN_SIZE_HEIGHT_0, 0), 
            Position = UDim2.new(l_SLIDESHOW_FRAME_X_0 / l_MAIN_SCREEN_SIZE_WIDTH_0, 0, l_SLIDESHOW_FRAME_Y_0 / l_MAIN_SCREEN_SIZE_HEIGHT_0, 0), 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.02, 0)
            }), 
            Slideshow = v1.createElement(v4, {
                platform = v8.platform
            }, {})
        })
    });
end;