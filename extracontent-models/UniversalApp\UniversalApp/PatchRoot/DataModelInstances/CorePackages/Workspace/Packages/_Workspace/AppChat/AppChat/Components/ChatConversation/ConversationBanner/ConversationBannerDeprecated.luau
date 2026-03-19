local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_memo_0 = v4.memo;
local l_useMemo_0 = v4.useMemo;
local v8 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_LinkButton_0 = v8.App.Button.LinkButton;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v12 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v14 = {
    actionText = "PLACEHOLDER Action", 
    bodyText = "PLACEHOLDER Body", 
    height = 40, 
    onActivated = function() --[[ Line: 36 ]] --[[ Name: onActivated ]]

    end
};
return l_memo_0(function(v15) --[[ Line: 39 ]] --[[ Name: ConversationBanner ]]
    -- upvalues: v3 (copy), v14 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v13 (copy), v12 (copy), l_useMemo_0 (copy), l_Text_0 (copy), v4 (copy), l_LinkButton_0 (copy)
    local v16 = v3.Dictionary.union(v14, v15);
    local v17 = l_useStyle_0();
    local v18 = v16.style or v17;
    local v19 = l_useTokens_0();
    local v20 = v13();
    local l_Space_200_0 = v18.Tokens.Global.Space_200;
    local l_Font_0 = v18.Font.CaptionBody.Font;
    local v23 = v18.Font.CaptionBody.RelativeSize * v18.Font.BaseSize;
    local v24 = v12();
    local v25 = l_useMemo_0(function() --[[ Line: 51 ]]
        -- upvalues: l_Text_0 (ref), v16 (copy), l_Font_0 (copy), v23 (copy)
        return l_Text_0.GetTextBounds(v16.actionText, l_Font_0, v23 + 2, Vector2.new(250, v16.height)).X;
    end, {
        v16.actionText, 
        l_Font_0, 
        v23, 
        v16.height
    });
    return v4.createElement("Frame", {
        BackgroundColor3 = if v20 then v19.Color.OverMedia.OverMedia_100.Color3 else v18.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = if v20 then v19.Color.OverMedia.OverMedia_100.Transparency else v18.Theme.BackgroundUIDefault.Transparency, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, v16.height)
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_Space_200_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v24.left), 
            PaddingRight = UDim.new(0, v24.right)
        }), 
        BodyText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, -v25 - l_Space_200_0, 1, 0), 
            Text = v16.bodyText, 
            TextColor3 = v18.Theme.TextEmphasis.Color, 
            TextSize = v23, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ActionText = v4.createElement(l_LinkButton_0, {
            fontStyle = "CaptionBody", 
            layoutOrder = 2, 
            size = UDim2.new(0, v25, 1, 0), 
            text = ("<b>%*</b>"):format(v16.actionText), 
            onActivated = v16.onActivated
        })
    });
end);