local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.ScrollingTextBox);
local v3 = require(script.Parent.Parent.Constants);
local v4 = v1.Component:extend("SearchBar");
v4.render = function(v5) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local l_size_0 = v5.props.size;
    local l_pos_0 = v5.props.pos;
    local l_frameHeight_0 = v5.props.frameHeight;
    local l_textSize_0 = v5.props.textSize;
    local l_font_0 = v5.props.font;
    local l_searchTerm_0 = v5.props.searchTerm;
    local l_layoutOrder_0 = v5.props.layoutOrder;
    local l_visible_0 = v5.props.visible;
    local l_showClear_0 = v5.props.showClear;
    local v15 = l_frameHeight_0 * 0.6;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundColor3 = v3.Color.UnselectedGray, 
        BorderColor3 = v3.Color.BorderGray, 
        Visible = l_visible_0, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SearchImage = v1.createElement("ImageLabel", {
            Name = "SearchIcon", 
            Size = UDim2.new(0, v15, 0, v15), 
            Position = UDim2.new(0, 10, 0.5, -v15 / 2), 
            BackgroundTransparency = 1, 
            Image = v3.Image.Search
        }), 
        ClearButton = l_showClear_0 and v1.createElement("ImageButton", {
            Size = UDim2.new(0, -v15, 0, v15), 
            Position = UDim2.new(1, -10, 0.5, -v15 / 2), 
            BackgroundTransparency = 1, 
            Image = v3.Image.Clear, 
            [v1.Event.InputEnded] = v5.props.cancelInput
        }), 
        InputField = v1.createElement(v2, {
            Text = l_searchTerm_0 and l_searchTerm_0 or "", 
            TextSize = l_textSize_0, 
            Font = l_font_0, 
            Size = UDim2.new(1, -(2 * l_frameHeight_0), 1, 0), 
            Position = UDim2.new(0, 20 + v15, 0, 0), 
            ShowNativeInput = true, 
            TextColor3 = v3.Color.Text, 
            BackgroundTransparency = 1, 
            TextXAlignment = 0, 
            ClearTextOnFocus = false, 
            PlaceholderText = "Search", 
            [v1.Ref] = v5.props.refForParent, 
            TextBoxFocusLost = v5.props.focusLost
        })
    });
end;
return v4;