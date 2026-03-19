local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_Text_0 = v2.Text;
local v5 = require(l_Parent_0.Responsive);
local l_FFlagAXAddTextXAlignmentProp_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
return function(v8) --[[ Line: 19 ]] --[[ Name: SlotItemCardFooter ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), v1 (copy), l_Text_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_FFlagAXAddTextXAlignmentProp_0 (copy)
    local v9 = l_useTokens_0();
    local v10 = v5.useOrientation() == v5.BreakpointConfig.Enum.Portrait;
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v8.LayoutOrder
    }, {
        ItemCardFooterLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v9.Gap.XSmall)
        }), 
        ItemCardFooterInfo = if v8.title then v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            ItemCardFooterInfoLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v9.Gap.XXSmall)
            }), 
            ItemCardFooterInfoTitle = if v8.title then v1.createElement(l_Text_0, {
                textStyle = v9.Color.Content.Emphasis, 
                fontStyle = if v10 then v9.Typography.CaptionSmall else if l_FFlagAXCustomizeMakeupSupport_0 then v9.Typography.CaptionMedium else v9.Typography.LabelMedium, 
                LayoutOrder = l_FFlagAXCustomizeMakeupSupport_0 and 1 or v8.LayoutOrder, 
                Text = v8.title, 
                TextXAlignment = if l_FFlagAXAddTextXAlignmentProp_0 and v8.TextXAlignment then v8.TextXAlignment else Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextTruncate = Enum.TextTruncate.SplitWord
            }) else nil
        }) else nil
    });
end;