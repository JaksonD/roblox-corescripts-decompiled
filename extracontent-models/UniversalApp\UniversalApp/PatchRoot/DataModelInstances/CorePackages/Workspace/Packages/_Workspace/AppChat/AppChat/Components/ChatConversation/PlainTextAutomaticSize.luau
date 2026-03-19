local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v10 = require(l_Parent_0.Foundation);
local l_View_0 = v10.View;
local l_Text_0 = v10.Text;
local l_Divider_0 = v10.Divider;
local l_DividerVariant_0 = v10.Enums.DividerVariant;
local v15 = {
    text = "", 
    maxWidth = 0, 
    innerPadding = 0, 
    isIncoming = false, 
    hasTail = false, 
    LayoutOrder = 0, 
    isPending = false, 
    isUnfiltered = false, 
    isRepliedTo = false, 
    isPressed = false, 
    isLastMessageInMessageGroup = false, 
    [v4.Change.AbsoluteSize] = function() --[[ Line: 52 ]]

    end
};
PlainText = function(v16) --[[ Line: 59 ]] --[[ Name: PlainText ]]
    -- upvalues: v6 (copy), v15 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), v8 (copy), l_TextService_0 (copy), v9 (copy), v4 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), l_Divider_0 (copy), l_DividerVariant_0 (copy)
    local v17 = v6.Dictionary.join(v15, v16);
    local v18 = l_useTokens_0();
    local v19 = l_useStyle_0();
    local l_maxWidth_0 = v17.maxWidth;
    local l_innerPadding_0 = v17.innerPadding;
    local v22 = math.max(0, l_maxWidth_0 - l_innerPadding_0);
    local l_Body_0 = v19.Font.Body;
    local v24 = v17.textSize or v19.Font.BaseSize * l_Body_0.RelativeSize;
    local l_text_0 = v17.text;
    local v26 = v17.font or l_Body_0.Font;
    local v27 = v8() and v17.isRepliedTo;
    local v28 = Vector2.new(v22, if v27 then v24 * 3 else 1e999);
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_text_0, v24, v26, v28);
    local v30 = v8() and v17.isRepliedTo;
    local v31 = v17.isUnfiltered and not v17.isIncoming;
    local v32 = nil;
    v32 = if v30 then v19.Theme.TextDefault.Color else if v31 then Color3.new(1, 1, 1) else if v17.isIncoming then v18.Color.Content.Emphasis.Color3 else v18.Color.ActionEmphasis.Foreground.Color3;
    local v33 = if v9 then v4.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v27 (copy), v24 (copy)
        return {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(1e999, if v27 then v24 * 3 else 1e999)
        };
    end, {
        v27, 
        v17.textSize
    }) else nil;
    local v34 = if v9 then v4.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v22 (copy), l_maxWidth_0 (copy)
        return {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(v22 or l_maxWidth_0, 1e999)
        };
    end, {
        v22, 
        l_maxWidth_0
    }) else nil;
    if v9 and v17.translatedText then
        local v35 = {
            TextColor3 = v32, 
            Font = v26, 
            TextSize = v24, 
            TextTransparency = v17.isPending and v19.Theme.TextMuted.Transparency or 0, 
            sizeConstraint = v33
        };
        return v4.createElement(v3, {
            isIncoming = v17.isIncoming, 
            hasTail = v17.hasTail, 
            isPending = v17.isPending, 
            isUnfiltered = v17.isUnfiltered, 
            padding = {
                top = UDim.new(0, l_innerPadding_0), 
                bottom = UDim.new(0, l_innerPadding_0), 
                left = UDim.new(0, l_innerPadding_0 + 2), 
                right = UDim.new(0, l_innerPadding_0 + 2)
            }, 
            LayoutOrder = v17.LayoutOrder, 
            isRepliedTo = if v8() then v17.isRepliedTo else nil, 
            isPressed = if v8() then v17.isPressed else nil, 
            [v4.Change.AbsoluteSize] = v17[v4.Change.AbsoluteSize], 
            isLastMessageInMessageGroup = v17.isLastMessageInMessageGroup
        }, {
            Wrapper = v4.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall", 
                sizeConstraint = v34
            }, {
                textContent = v4.createElement(l_Text_0, v6.Dictionary.union(v35, {
                    Text = l_text_0, 
                    LayoutOrder = 1, 
                    tag = {
                        ["text-align-x-left text-align-y-top auto-xy text-wrap content-muted text-body-small"] = true, 
                        ["text-truncate-end"] = v27, 
                        ["text-truncate-none"] = not v27
                    }
                })), 
                Divider = v4.createElement(l_View_0, {
                    tag = "size-0 self-stretch auto-y", 
                    LayoutOrder = 2
                }, v4.createElement(l_Divider_0, {
                    variant = l_DividerVariant_0.Default
                })), 
                translatedTextContent = v4.createElement(l_Text_0, v6.Dictionary.union(v35, {
                    Text = v17.translatedText, 
                    LayoutOrder = 3, 
                    tag = {
                        ["text-align-x-left text-align-y-top auto-xy text-wrap"] = true, 
                        ["text-truncate-none"] = not v27, 
                        ["text-truncate-end"] = v27
                    }
                }))
            })
        });
    else
        return v4.createElement(v3, {
            isIncoming = v17.isIncoming, 
            hasTail = v17.hasTail, 
            isPending = v17.isPending, 
            isUnfiltered = v17.isUnfiltered, 
            padding = {
                top = UDim.new(0, l_innerPadding_0), 
                bottom = UDim.new(0, l_innerPadding_0), 
                left = UDim.new(0, l_innerPadding_0 + 2), 
                right = UDim.new(0, l_innerPadding_0 + 2)
            }, 
            LayoutOrder = v17.LayoutOrder, 
            isRepliedTo = if v8() then v17.isRepliedTo else nil, 
            isPressed = if v8() then v17.isPressed else nil, 
            [v4.Change.AbsoluteSize] = v17[v4.Change.AbsoluteSize], 
            isLastMessageInMessageGroup = v17.isLastMessageInMessageGroup
        }, {
            textContent = v4.createElement("TextLabel", {
                Text = l_text_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v32, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v26, 
                TextSize = v24, 
                Size = UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), 
                TextTransparency = v17.isPending and v19.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTruncate = if v27 then Enum.TextTruncate.AtEnd else nil, 
                TextWrapped = true
            }, {
                SizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v22 or l_maxWidth_0, if v27 then v24 * 3 else 1e999)
                })
            })
        });
    end;
end;
return PlainText;