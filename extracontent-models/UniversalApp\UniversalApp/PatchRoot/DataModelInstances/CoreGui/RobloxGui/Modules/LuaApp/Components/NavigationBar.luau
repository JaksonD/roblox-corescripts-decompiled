local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Themes.Colors);
local v5 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v6 = require(l_Modules_0.LuaApp.Components.Generic.TouchFriendlyIconButton);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v8 = v2.PureComponent:extend("NavigationBar");
v8.defaultProps = {
    icon = "LuaApp/icons/ic-roblox-close", 
    iconSize = 36, 
    iconColor = v4.White, 
    buttonSize = 36, 
    buttonLeftPadding = 10, 
    titleFont = Enum.Font.SourceSansBold, 
    titleTextSize = 23, 
    titleColor = v4.White, 
    paddingTop = 0, 
    paddingBottom = 0
};
v8.render = function(v9) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), v5 (copy)
    local l_Size_0 = v9.props.Size;
    local l_Position_0 = v9.props.Position;
    local l_icon_0 = v9.props.icon;
    local l_iconSize_0 = v9.props.iconSize;
    local l_iconColor_0 = v9.props.iconColor;
    local l_buttonSize_0 = v9.props.buttonSize;
    local l_buttonLeftPadding_0 = v9.props.buttonLeftPadding;
    local l_title_0 = v9.props.title;
    local l_titleFont_0 = v9.props.titleFont;
    local l_titleTextSize_0 = v9.props.titleTextSize;
    local l_titleColor_0 = v9.props.titleColor;
    local l_paddingTop_0 = v9.props.paddingTop;
    local l_paddingBottom_0 = v9.props.paddingBottom;
    local v23 = v9.props.onNavigationButtonActivated or v9.props.navigateBack;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        Position = l_Position_0, 
        BackgroundTransparency = 1
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_paddingTop_0), 
            PaddingBottom = UDim.new(0, l_paddingBottom_0)
        }), 
        NavigationButton = v2.createElement(v6, {
            Position = UDim2.new(0, l_buttonLeftPadding_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, l_buttonSize_0, 0, l_buttonSize_0), 
            onActivated = v23, 
            icon = l_icon_0, 
            iconColor = l_iconColor_0, 
            iconSize = l_iconSize_0
        }), 
        Title = l_title_0 and v2.createElement(v5, {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = l_title_0, 
            Font = l_titleFont_0, 
            TextSize = l_titleTextSize_0, 
            TextColor3 = l_titleColor_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        })
    });
end;
return v3.connect(nil, function(v24) --[[ Line: 85 ]]
    -- upvalues: v7 (copy)
    return {
        navigateBack = function() --[[ Line: 87 ]] --[[ Name: navigateBack ]]
            -- upvalues: v24 (copy), v7 (ref)
            return v24(v7());
        end
    };
end)(v8);