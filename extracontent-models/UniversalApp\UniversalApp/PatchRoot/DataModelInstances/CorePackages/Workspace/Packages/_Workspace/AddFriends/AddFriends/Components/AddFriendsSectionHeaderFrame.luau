local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_withStyle_0 = v3.Style.withStyle;
local l_validateImage_0 = v3.Core.ImageSet.Validator.validateImage;
local v8 = v1.PureComponent:extend("AddFriendsSectionHeaderFrame");
v8.validateProps = v2.strictInterface({
    title = v2.string, 
    icon = v2.optional(l_validateImage_0), 
    iconVisible = v2.optional(v2.boolean), 
    onIconActivated = v2.optional(v2.callback), 
    layoutOrder = v2.optional(v2.integer)
});
v8.defaultProps = {
    layoutOrder = 1
};
v8.render = function(v9) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v10) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), v9 (copy), l_IconButton_0 (ref), l_IconSize_0 (ref)
        return v1.createElement("Frame", {
            ZIndex = 2, 
            Position = UDim2.new(0, 24, 0, 0), 
            Size = UDim2.new(1, 0, 0, v10.Tokens.Global.Space_600), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v9.props.layoutOrder, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
            }), 
            HeaderLabel = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = v10.Font.Header1.Font, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0.8, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v9.props.title, 
                TextColor3 = v10.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                TextSize = v10.Tokens.Semantic.Typography.Header.FontSize, 
                TextTransparency = v10.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextWrapped = true, 
                LayoutOrder = 1
            }), 
            HeaderImageButton = v9.props.iconVisible and v1.createElement(l_IconButton_0, {
                size = UDim2.fromOffset(l_IconSize_0.Medium, l_IconSize_0.Medium), 
                position = UDim2.new(1, 0, 0, 6), 
                anchorPoint = Vector2.new(1, 0), 
                icon = v9.props.icon, 
                iconTransparency = v10.Tokens.Semantic.Color.Icon.Emphasis.Transparency, 
                iconColor3 = v10.Tokens.Semantic.Color.Icon.Emphasis.Color3, 
                onActivated = v9.props.onIconActivated, 
                layoutOrder = 2
            }) or nil
        });
    end);
end;
return v8;