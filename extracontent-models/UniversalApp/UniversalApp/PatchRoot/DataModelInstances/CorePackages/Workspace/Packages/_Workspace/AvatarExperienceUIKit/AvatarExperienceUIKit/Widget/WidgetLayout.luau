local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v3) --[[ Line: 18 ]] --[[ Name: WidgetLayout ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy)
    local v4 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = v3.LayoutOrder, 
        BorderSizePixel = 0
    }, {
        UIPadding = if v3.padding then v1.createElement("UIPadding", {
            PaddingLeft = v3.padding.left, 
            PaddingRight = v3.padding.right, 
            PaddingTop = v3.padding.top, 
            PaddingBottom = v3.padding.bottom
        }) else nil, 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v4.Global.Space_150)
        }), 
        TopContent = if v3.headerSlot then v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v3.headerSlot) else nil, 
        ItemGroup = if v3.contentSlot then v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, v3.contentSlot) else nil
    });
end;