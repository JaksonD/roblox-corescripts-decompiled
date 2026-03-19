local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Enum.Alignment);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
return (v2.forwardRef(function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy)
    local l_EngagementScreen_0 = l_useDesignTokens_0().LuaApps.EngagementScreen;
    local l_children_0 = v7.children;
    local v11 = v7.ContentAlign or v4.Top;
    local l_FooterElement_0 = v7.FooterElement;
    local v13 = {
        [v4.Top] = {
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0)
        }, 
        [v4.Bottom] = {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1)
        }
    };
    return {
        Logo = v2.createElement("ImageLabel", {
            Position = l_EngagementScreen_0.robloxLogoTextImagePosition, 
            Size = l_EngagementScreen_0.robloxLogoTextImageSize, 
            Image = l_EngagementScreen_0.robloxLogoTextImageUrl, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }), 
        AlignmentContainer = v2.createElement("Frame", {
            Position = l_EngagementScreen_0.buttonContainerPosition, 
            Size = UDim2.new(0, l_EngagementScreen_0.containerWidth, 0, l_EngagementScreen_0.containerHeight), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            ref = v8
        }, {
            Content = v2.createElement(v3.FitFrame, {
                Position = v13[v11].Position, 
                Size = UDim2.new(1, 0, 1, 0), 
                fitAxis = v3.FitAxis.Height, 
                AnchorPoint = v13[v11].AnchorPoint, 
                BackgroundTransparency = 1
            }, {
                l_children_0
            })
        }), 
        Footer = l_FooterElement_0 and v2.createElement(v5.View, {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.new(0.5, 0, 1, -40), 
            AnchorPoint = Vector2.new(0.5, 1), 
            ZIndex = 3, 
            tag = "col align-x-center"
        }, {
            Content = l_FooterElement_0
        })
    };
end));