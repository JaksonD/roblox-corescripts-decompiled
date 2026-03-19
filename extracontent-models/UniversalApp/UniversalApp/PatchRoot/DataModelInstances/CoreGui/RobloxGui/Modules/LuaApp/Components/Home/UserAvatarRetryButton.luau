local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.Components.RetryButton);
local v5 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v6 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v7 = v2.PureComponent:extend("UserAvatarRetryButton");
v7.render = function(v8) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local l_appTheme_0 = v8.props.appTheme;
    local l_position_0 = v8.props.position;
    local l_anchorPoint_0 = v8.props.anchorPoint;
    local l_maxTextWidth_0 = v8.props.maxTextWidth;
    local l_onRetry_0 = v8.props.onRetry;
    local v14 = UDim2.new(1, 0, 0, 72);
    if l_maxTextWidth_0 then
        v14 = UDim2.new(0, l_maxTextWidth_0, 0, 72);
    end;
    return v2.createElement(v3.FitFrame, {
        Position = l_position_0, 
        AnchorPoint = l_anchorPoint_0, 
        BackgroundTransparency = 1
    }, {
        ListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 40)
        }), 
        RetryButton = v2.createElement(v4, {
            layoutOrder = 1, 
            onRetry = l_onRetry_0, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }), 
        FailMessage = v2.createElement(v5, {
            LayoutOrder = 2, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = v14, 
            TextColor3 = l_appTheme_0.Main.BodyText.Color, 
            Font = l_appTheme_0.Main.BodyText.Font, 
            Text = "Feature.Avatar.Message.FailedToLoadAvatar", 
            TextScaled = true
        }, {
            UITextSizeConstraint = v2.createElement("UITextSizeConstraint", {
                MaxTextSize = 24
            })
        })
    });
end;
return (v6(v7));