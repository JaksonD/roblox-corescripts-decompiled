local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_ExpandableTextArea_0 = v3.App.Text.ExpandableTextArea;
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useSelectionCursor_0 = v3.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v3.App.SelectionImage.CursorKind;
local v11 = v5.wrap(v4.strictInterface({
    compactNumberOfLines = v4.optional(v4.integer), 
    isLoading = v4.boolean, 
    descriptionText = v4.optional(v4.string), 
    width = v4.optional(v4.integer), 
    Position = v4.optional(v4.UDim2), 
    LayoutOrder = v4.optional(v4.integer)
}));
return function(v12) --[[ Line: 36 ]] --[[ Name: LookDescription ]]
    -- upvalues: v11 (copy), l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v1 (copy), l_Focusable_0 (copy), l_ShimmerPanel_0 (copy), l_ExpandableTextArea_0 (copy)
    assert(v11(v12));
    local l_LayoutOrder_0 = v12.LayoutOrder;
    local v14 = l_useStyle_0();
    local v15 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local v16 = v12.compactNumberOfLines or 3;
    local l_descriptionText_0 = v12.descriptionText;
    local l_isLoading_0 = v12.isLoading;
    local l_Position_0 = v12.Position;
    local l_Space_75_0 = v14.Tokens.Global.Space_75;
    local l_Space_0_0 = v14.Tokens.Global.Space_0;
    local l_Font_0 = v14.Font;
    local v23 = v16 * (l_Font_0.BaseSize * l_Font_0.Body.RelativeSize) + l_Space_75_0;
    local v24 = v23 + l_Space_0_0;
    return v1.createElement(l_Focusable_0.Frame, {
        LayoutOrder = l_LayoutOrder_0, 
        Position = UDim2.fromScale(0, 0), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        SelectionImageObject = v15
    }, {
        DescriptionShimmer = if l_isLoading_0 then v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v24)
        }, {
            ShimmerPanel = v1.createElement(l_ShimmerPanel_0, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, v23)
            })
        }) else nil, 
        DescriptionExpandable = if l_descriptionText_0 and l_descriptionText_0 ~= "" then v1.createElement(l_ExpandableTextArea_0, {
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            Text = l_descriptionText_0, 
            compactNumberOfLines = v16, 
            padding = Vector2.new(0, 0)
        }) else nil
    });
end;