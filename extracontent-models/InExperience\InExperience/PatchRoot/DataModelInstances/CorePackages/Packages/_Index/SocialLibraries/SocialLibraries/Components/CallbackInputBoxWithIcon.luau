local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = require(script.Parent.CallbackInputBox);
local v3 = l_Roact_0.PureComponent:extend("CallbackInputBoxWithIcon");
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagFilteredScrollingListAdditionalCustomizationsEnabled);
v3.defaultProps = {
    backgroundTransparency = 0, 
    backgroundColor3 = Color3.new(1, 1, 1), 
    borderColor = nil, 
    borderThickness = v4() and 0 or nil, 
    borderTransparency = v4() and 1 or nil, 
    cornerRadius = v4() and 0 or nil, 
    iconCellWidth = 60, 
    iconSize = 24, 
    iconColor3 = Color3.new(1, 1, 1), 
    iconTransparency = 0, 
    iconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png", 
    inputTextFont = Enum.Font.BuilderSans, 
    inputTextColor3 = Color3.new(1, 0, 1), 
    inputTextSize = 14, 
    inputTextYAlignment = Enum.TextYAlignment.Center, 
    inputTextXAlignment = Enum.TextXAlignment.Left, 
    inputTextTransparency = 0, 
    placeholderTextTransparency = 0.6, 
    placeholderTextColor3 = Color3.new(1, 0, 0), 
    placeholderText = "Test placeholder text", 
    clearIconColor3 = Color3.new(1, 1, 0), 
    clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
    clearButtonDisabled = nil, 
    textChangedCallback = nil
};
v3.render = function(v5) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v4 (copy), v2 (copy)
    local l_iconCellWidth_0 = v5.props.iconCellWidth;
    local l_iconSize_0 = v5.props.iconSize;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = v5.props.backgroundTransparency, 
        BackgroundColor3 = v5.props.backgroundColor3, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIStroke = if v4() then l_Roact_0.createElement("UIStroke", {
            Thickness = v5.props.borderThickness, 
            Color = v5.props.borderColor, 
            Transparency = v5.props.borderTransparency
        }) else nil, 
        UICorner = if v4() then l_Roact_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, v5.props.cornerRadius)
        }) else nil, 
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_iconCellWidth_0 / 4)
        }), 
        padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_iconCellWidth_0 / 4)
        }), 
        icon = l_Roact_0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_iconSize_0, 0, l_iconSize_0), 
            ImageColor3 = v5.props.iconColor3, 
            ImageTransparency = v5.props.iconTransparency, 
            Image = v5.props.iconImage, 
            LayoutOrder = 1
        }), 
        inputBoxContainer = l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -l_iconSize_0 - l_iconCellWidth_0 / 4, 1, 0), 
            LayoutOrder = 2
        }, {
            padding = l_Roact_0.createElement("UIPadding", {
                PaddingRight = UDim.new(0, l_iconCellWidth_0 / 4)
            }), 
            inputBox = l_Roact_0.createElement(v2, v5.props)
        })
    });
end;
return v3;