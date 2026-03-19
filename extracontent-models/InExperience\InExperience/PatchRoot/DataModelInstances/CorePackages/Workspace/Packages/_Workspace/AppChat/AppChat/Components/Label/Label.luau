local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v9 = {
    bodyText = ""
};
return l_memo_0(function(v10) --[[ Line: 32 ]] --[[ Name: Label ]]
    -- upvalues: v3 (copy), v9 (copy), l_useStyle_0 (copy), v4 (copy), l_ImageSetLabel_0 (copy)
    local v11 = v3.Dictionary.join(v9, v10);
    local v12 = l_useStyle_0();
    local v13 = v11.style or v12;
    local l_Space_50_0 = v13.Tokens.Global.Space_50;
    local l_Space_75_0 = v13.Tokens.Global.Space_75;
    local l_Size_150_0 = v13.Tokens.Global.Size_150;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundColor3 = v11.backgroundColor3 or v13.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v11.backgroundTransparency or v13.Theme.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(0, 0, 0, v13.Tokens.Global.Size_250), 
        LayoutOrder = v11.layoutOrder
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_50_0)
        }), 
        ContentPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Space_50_0), 
            PaddingRight = UDim.new(0, l_Space_75_0), 
            PaddingBottom = UDim.new(0, l_Space_50_0), 
            PaddingTop = UDim.new(0, l_Space_50_0)
        }), 
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v13.Tokens.Semantic.Radius.Small)
        }), 
        IconImage = if v11.iconImage then v4.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, l_Size_150_0, 0, l_Size_150_0), 
            BackgroundTransparency = 1, 
            Image = v11.iconImage, 
            ImageColor3 = v11.imageColor3 or v13.Theme.IconEmphasis.Color, 
            ImageTransparency = v11.imageTransparency or v13.Theme.IconEmphasis.Transparency, 
            LayoutOrder = 1
        }) else nil, 
        BodyText = v4.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = 1, 
            Font = v13.Font.Body.Font, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, 0, 1, 0), 
            Text = v11.bodyText, 
            TextColor3 = v11.bodyTextColor3 or v13.Theme.TextEmphasis.Color, 
            TextSize = v13.Tokens.Global.FontSize_50, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end);