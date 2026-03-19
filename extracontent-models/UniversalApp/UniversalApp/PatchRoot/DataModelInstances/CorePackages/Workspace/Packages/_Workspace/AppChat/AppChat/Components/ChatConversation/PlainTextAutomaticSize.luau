local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(script.Parent.Bubble.ChatBubbleContainerAutomaticSize);
local v4 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v6 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAutotranslation);
local v11 = require(l_Parent_0.Foundation);
local l_View_0 = v11.View;
local l_Text_0 = v11.Text;
local l_Divider_0 = v11.Divider;
local l_DividerVariant_0 = v11.Enums.DividerVariant;
local v16 = {
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
    [v4.Change.AbsoluteSize] = function() --[[ Line: 53 ]]

    end
};
PlainText = function(v17) --[[ Line: 60 ]] --[[ Name: PlainText ]]
    -- upvalues: v6 (copy), v16 (copy), l_useTokens_0 (copy), l_useStyle_0 (copy), v8 (copy), l_TextService_0 (copy), v9 (copy), v10 (copy), v4 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy), l_Divider_0 (copy), l_DividerVariant_0 (copy)
    local v18 = v6.Dictionary.join(v16, v17);
    local v19 = l_useTokens_0();
    local v20 = l_useStyle_0();
    local l_maxWidth_0 = v18.maxWidth;
    local l_innerPadding_0 = v18.innerPadding;
    local v23 = math.max(0, l_maxWidth_0 - l_innerPadding_0);
    local l_Body_0 = v20.Font.Body;
    local v25 = v18.textSize or v20.Font.BaseSize * l_Body_0.RelativeSize;
    local l_text_0 = v18.text;
    local v27 = v18.font or l_Body_0.Font;
    local v28 = v8() and v18.isRepliedTo;
    local v29 = Vector2.new(v23, if v28 then v25 * 3 else 1e999);
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_text_0, v25, v27, v29);
    local v31 = v8() and v18.isRepliedTo;
    local v32 = v18.isUnfiltered and not v18.isIncoming;
    local v33 = nil;
    v33 = if v31 then v20.Theme.TextDefault.Color else if v32 then Color3.new(1, 1, 1) else if v9 then if v18.isIncoming then v19.Color.Content.Emphasis.Color3 else v19.Color.ActionEmphasis.Foreground.Color3 else v20.Theme.TextEmphasis.Color;
    local v34 = if v10 then v4.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v28 (copy), v25 (copy)
        return {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(1e999, if v28 then v25 * 3 else 1e999)
        };
    end, {
        v28, 
        v18.textSize
    }) else nil;
    local v35 = if v10 then v4.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: v23 (copy), l_maxWidth_0 (copy)
        return {
            MinSize = Vector2.new(0, 0), 
            MaxSize = Vector2.new(v23 or l_maxWidth_0, 1e999)
        };
    end, {
        v23, 
        l_maxWidth_0
    }) else nil;
    if v10 and v18.translatedText then
        local v36 = {
            TextColor3 = v33, 
            Font = v27, 
            TextSize = v25, 
            TextTransparency = v18.isPending and v20.Theme.TextMuted.Transparency or 0, 
            sizeConstraint = v34
        };
        return v4.createElement(v3, {
            isIncoming = v18.isIncoming, 
            hasTail = v18.hasTail, 
            isPending = v18.isPending, 
            isUnfiltered = v18.isUnfiltered, 
            padding = if v9 then {
                top = UDim.new(0, l_innerPadding_0), 
                bottom = UDim.new(0, l_innerPadding_0), 
                left = UDim.new(0, l_innerPadding_0 + 2), 
                right = UDim.new(0, l_innerPadding_0 + 2)
            } else l_innerPadding_0, 
            LayoutOrder = v18.LayoutOrder, 
            isRepliedTo = if v8() then v18.isRepliedTo else nil, 
            isPressed = if v8() then v18.isPressed else nil, 
            [v4.Change.AbsoluteSize] = v18[v4.Change.AbsoluteSize], 
            isLastMessageInMessageGroup = v18.isLastMessageInMessageGroup
        }, {
            Wrapper = v4.createElement(l_View_0, {
                tag = "auto-xy col gap-xsmall", 
                sizeConstraint = v35
            }, {
                textContent = v4.createElement(l_Text_0, v6.Dictionary.union(v36, {
                    Text = l_text_0, 
                    LayoutOrder = 1, 
                    tag = {
                        ["text-align-x-left text-align-y-top auto-xy text-wrap content-muted text-body-small"] = true, 
                        ["text-truncate-end"] = v28, 
                        ["text-truncate-none"] = not v28
                    }
                })), 
                Divider = v4.createElement(l_View_0, {
                    tag = "size-0 self-stretch auto-y", 
                    LayoutOrder = 2
                }, v4.createElement(l_Divider_0, {
                    variant = l_DividerVariant_0.Default
                })), 
                translatedTextContent = v4.createElement(l_Text_0, v6.Dictionary.union(v36, {
                    Text = v18.translatedText, 
                    LayoutOrder = 3, 
                    tag = {
                        ["text-align-x-left text-align-y-top auto-xy text-wrap"] = true, 
                        ["text-truncate-none"] = not v28, 
                        ["text-truncate-end"] = v28
                    }
                }))
            })
        });
    else
        return v4.createElement(v3, {
            isIncoming = v18.isIncoming, 
            hasTail = v18.hasTail, 
            isPending = v18.isPending, 
            isUnfiltered = v18.isUnfiltered, 
            padding = if v9 then {
                top = UDim.new(0, l_innerPadding_0), 
                bottom = UDim.new(0, l_innerPadding_0), 
                left = UDim.new(0, l_innerPadding_0 + 2), 
                right = UDim.new(0, l_innerPadding_0 + 2)
            } else l_innerPadding_0, 
            LayoutOrder = v18.LayoutOrder, 
            isRepliedTo = if v8() then v18.isRepliedTo else nil, 
            isPressed = if v8() then v18.isPressed else nil, 
            [v4.Change.AbsoluteSize] = v18[v4.Change.AbsoluteSize], 
            isLastMessageInMessageGroup = v18.isLastMessageInMessageGroup
        }, {
            textContent = v4.createElement("TextLabel", {
                Text = l_text_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v33, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v27, 
                TextSize = v25, 
                Size = UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))), 
                TextTransparency = v18.isPending and v20.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTruncate = if v28 then Enum.TextTruncate.AtEnd else nil, 
                TextWrapped = true
            }, {
                SizeConstraint = v4.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v23 or l_maxWidth_0, if v28 then v25 * 3 else 1e999)
                })
            })
        });
    end;
end;
return PlainText;