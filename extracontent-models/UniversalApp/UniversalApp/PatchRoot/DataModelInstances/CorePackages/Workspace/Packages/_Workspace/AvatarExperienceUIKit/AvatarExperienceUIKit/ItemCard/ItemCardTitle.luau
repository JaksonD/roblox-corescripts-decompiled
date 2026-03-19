local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagAXAddTextXAlignmentProp_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
return function(v7) --[[ Line: 19 ]] --[[ Name: ItemCardTitle ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_FFlagAXAddTextXAlignmentProp_0 (copy)
    local v8 = l_useTokens_0();
    return v1.createElement(l_Text_0, {
        textStyle = v8.Color.Content.Emphasis, 
        fontStyle = if l_FFlagAXRootSlotBasedEditorFlag_0 and v7.titleTextSize then v7.titleTextSize else v8.Typography.TitleMedium, 
        LayoutOrder = v7.LayoutOrder, 
        Text = v7.title, 
        TextXAlignment = if l_FFlagAXAddTextXAlignmentProp_0 and v7.TextXAlignment then v7.TextXAlignment else Enum.TextXAlignment.Left, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextTruncate = Enum.TextTruncate.SplitWord
    });
end;