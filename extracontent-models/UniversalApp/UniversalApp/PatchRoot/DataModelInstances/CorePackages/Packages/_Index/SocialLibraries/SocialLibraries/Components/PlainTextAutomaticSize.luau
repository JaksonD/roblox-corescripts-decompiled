local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(script.Parent.ChatBubbleContainerAutomaticSize);
local l_Roact_0 = v1.Roact;
local l_withStyle_0 = v1.UIBlox.Style.withStyle;
local l_TextService_0 = game:GetService("TextService");
game:DefineFastFlag("FixPlainTextAutomaticSizeClippingText", false);
local l_FixPlainTextAutomaticSizeClippingText_0 = game:GetFastFlag("FixPlainTextAutomaticSizeClippingText");
local v7 = {
    text = "", 
    maxWidth = 0, 
    innerPadding = 0, 
    isIncoming = false, 
    hasTail = false, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_Roact_0.Change.AbsoluteSize] = function() --[[ Line: 20 ]]

    end
};
return function(v8) --[[ Line: 23 ]] --[[ Name: PlainText ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), l_TextService_0 (copy), l_Roact_0 (copy), v2 (copy), l_FixPlainTextAutomaticSizeClippingText_0 (copy)
    return l_withStyle_0(function(v9) --[[ Line: 24 ]]
        -- upvalues: v8 (copy), v7 (ref), l_TextService_0 (ref), l_Roact_0 (ref), v2 (ref), l_FixPlainTextAutomaticSizeClippingText_0 (ref)
        local v10 = v8.maxWidth or v7.maxWidth;
        local v11 = v8.innerPadding or v7.innerPadding;
        local v12 = math.max(0, v10 - v11);
        local l_Body_0 = v9.Font.Body;
        local v14 = v8.textSize or v9.Font.BaseSize * l_Body_0.RelativeSize;
        local v15 = v8.text or v7.text;
        local v16 = v8.font or l_Body_0.Font;
        local v17 = Vector2.new(v12, 1e999);
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v15, v14, v16, v17);
        return l_Roact_0.createElement(v2, {
            isIncoming = v8.isIncoming or v7.isIncoming, 
            hasTail = v8.hasTail or v7.hasTail, 
            isPending = v8.isPending or v7.isPending, 
            padding = v11, 
            LayoutOrder = v8.LayoutOrder or v7.LayoutOrder, 
            [l_Roact_0.Change.AbsoluteSize] = v8[l_Roact_0.Change.AbsoluteSize] or v7[l_Roact_0.Change.AbsoluteSize]
        }, {
            textContent = l_Roact_0.createElement("TextLabel", {
                Text = v15, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v9.Theme.TextEmphasis.Color, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v16, 
                TextSize = v14, 
                Size = l_FixPlainTextAutomaticSizeClippingText_0 and UDim2.fromOffset(math.ceil(l_l_TextService_0_TextSize_0.X), (math.ceil(l_l_TextService_0_TextSize_0.Y))) or UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                TextTransparency = v8.isPending and v9.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true
            }, {
                SizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v12 or v10, 1e999)
                })
            })
        });
    end);
end;