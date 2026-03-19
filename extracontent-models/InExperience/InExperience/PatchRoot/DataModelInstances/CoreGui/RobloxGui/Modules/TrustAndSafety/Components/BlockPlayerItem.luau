local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Dependencies);
local v6 = require(v5.Divider);
local v7 = require(v5.ThemedTextLabel);
local l_withStyle_0 = v2.Style.withStyle;
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_Checkbox_0 = v2.App.InputButton.Checkbox;
local v11 = v1.PureComponent:extend("BlockPlayerItem");
v11.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.number), 
    size = v3.UDim2, 
    text = v3.string, 
    description = v3.string, 
    icon = v3.union(v3.string, v3.table), 
    iconSize = v3.UDim2, 
    isDisabled = v3.optional(v3.boolean), 
    isCheckBoxSelected = v3.boolean, 
    onCheckBoxActivated = v3.callback
});
v11.defaultProps = {
    isDisabled = false, 
    isCheckBoxSelected = false
};
v11.init = function(v12) --[[ Line: 36 ]] --[[ Name: init ]]
    v12.onClicked = function() --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        if v12.props.onCheckBoxActivated and not v12.props.isDisabled then
            v12.props.onCheckBoxActivated(not v12.props.isCheckBoxSelected);
        end;
    end;
end;
v11.render = function(v13) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), l_Checkbox_0 (copy), v7 (copy), v6 (copy)
    local l_props_0 = v13.props;
    return l_withStyle_0(function(v15) --[[ Line: 47 ]]
        -- upvalues: v1 (ref), l_props_0 (copy), v13 (copy), l_ImageSetLabel_0 (ref), l_Checkbox_0 (ref), v7 (ref), v6 (ref)
        local _ = v15.Theme;
        return v1.createElement("TextButton", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_props_0.layoutOrder, 
            Size = l_props_0.size, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            Text = "", 
            [v1.Event.Activated] = v13.onClicked
        }, {
            BlockIcon = v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_props_0.icon, 
                ImageTransparency = l_props_0.isDisabled and 0.5 or nil, 
                Position = UDim2.new(0, 16, 0.5, 0), 
                Size = l_props_0.iconSize
            }), 
            CheckBoxFrame = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -20, 0.5, 0), 
                Size = UDim2.fromOffset(24, 24)
            }, {
                CheckBox = v1.createElement(l_Checkbox_0, {
                    size = UDim2.new(1, 0, 1, 0), 
                    text = "", 
                    isDisabled = l_props_0.isDisabled, 
                    onActivated = l_props_0.onCheckBoxActivated, 
                    isSelected = l_props_0.isCheckBoxSelected
                })
            }), 
            TextFrame = v1.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 60, 0.5, 0), 
                Size = UDim2.new(1, -124, 1, 0)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                Text = v1.createElement(v7, {
                    LayoutOrder = 1, 
                    TextTransparency = l_props_0.isDisabled and 0.5 or nil, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    fontKey = "SubHeader1", 
                    themeKey = "TextEmphasis", 
                    Text = l_props_0.text, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                Description = v1.createElement(v7, {
                    LayoutOrder = 2, 
                    TextTransparency = l_props_0.isDisabled and 0.5 or nil, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    fontKey = "Footer", 
                    TextWrapped = true, 
                    themeKey = "TextDefault", 
                    Text = l_props_0.description, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LineHeight = 1.25
                })
            }), 
            Divider = v1.createElement(v6, {
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
return v11;