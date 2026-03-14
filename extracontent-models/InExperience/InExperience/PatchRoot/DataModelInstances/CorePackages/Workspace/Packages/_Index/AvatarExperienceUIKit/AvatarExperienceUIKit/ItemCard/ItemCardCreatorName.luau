local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceUIKit").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local v5 = require(l_Parent_0.VerifiedBadges);
local l_FFlagAXAddTextXAlignmentProp_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXAddTextXAlignmentProp;
local l_FFlagAXUpdateItemCardCreatorNameFontStyle_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXUpdateItemCardCreatorNameFontStyle;
return function(v8) --[[ Line: 20 ]] --[[ Name: ItemCardCreatorName ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Text_0 (copy), l_FFlagAXUpdateItemCardCreatorNameFontStyle_0 (copy), v5 (copy), l_FFlagAXAddTextXAlignmentProp_0 (copy)
    local v9 = l_useTokens_0();
    return v1.createElement(l_Text_0, {
        textStyle = v9.Color.Content.Default, 
        fontStyle = if l_FFlagAXUpdateItemCardCreatorNameFontStyle_0 then v9.Typography.BodyMedium else v9.Typography.BodySmall, 
        LayoutOrder = v8.LayoutOrder, 
        Text = if v8.hasVerifiedBadge then ("%*%*"):format(v8.name, v5.emoji.verified) else v8.name, 
        TextXAlignment = if l_FFlagAXAddTextXAlignmentProp_0 and v8.TextXAlignment then v8.TextXAlignment else Enum.TextXAlignment.Left, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextTruncate = Enum.TextTruncate.SplitWord
    });
end;