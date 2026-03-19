local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_ContextualMenu_0 = v3.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v3.App.Menu.MenuDirection;
return function(v8) --[[ Line: 24 ]] --[[ Name: MoreMenu ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), l_ImageSetButton_0 (copy), l_Images_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy)
    local l_Semantic_0 = l_useDesignTokens_0().Semantic;
    local l_Medium_0 = l_Semantic_0.Icon.Size.Medium;
    local l_Color_0 = l_Semantic_0.Color;
    return v1.createElement(l_ImageSetButton_0, {
        Size = UDim2.fromOffset(l_Medium_0, l_Medium_0), 
        AnchorPoint = Vector2.new(0.25, 0.75), 
        Position = UDim2.fromScale(1, 0), 
        Image = l_Images_0["icons/common/overflow"], 
        ImageColor3 = l_Color_0.Icon.Emphasis.Color3, 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        [v1.Event.Activated] = v8.onActivated
    }, {
        Menu = v1.createElement("Frame", {
            BackgroundTransparency = 1
        }, {
            ContextualMenu = v1.createElement(l_ContextualMenu_0, {
                buttonProps = v8.buttonProps, 
                screenSize = v8.screenSize, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, l_Medium_0), 
                openPositionX = UDim.new(0, -100), 
                open = v8.showMenu, 
                onDismiss = v8.onDismiss, 
                elementHeight = 38, 
                closeBackgroundVisible = false, 
                contextMenuWidthOverride = UDim.new(0, 155)
            })
        })
    });
end;