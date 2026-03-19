local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_TextService_0 = game:GetService("TextService");
local v4 = require(l_script_FirstAncestor_0.BubbleChat.Helpers.getAbsolutePaddingbyDimension);
local l_getFFlagExpChatAlwaysRunTCS_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagExpChatAlwaysRunTCS;
local function v17(v6, v7) --[[ Line: 9 ]]
    -- upvalues: l_CoreGui_0 (copy), v4 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.Name = "RichTextSizingLabel";
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.Parent = l_ScreenGui_0;
    l_TextLabel_0.Text = v6;
    l_TextLabel_0.TextSize = v7.TextSize;
    if v7.FontFace then
        l_TextLabel_0.FontFace = v7.FontFace;
    else
        l_TextLabel_0.Font = v7.Font;
    end;
    l_TextLabel_0.Size = UDim2.fromOffset(v7.MaxWidth, 10000);
    local l_TextBounds_0 = l_TextLabel_0.TextBounds;
    l_ScreenGui_0:Destroy();
    local v11 = nil;
    if v7.UIPadding then
        local v12 = v4(v7.UIPadding.PaddingLeft, l_TextBounds_0.X);
        local v13 = v4(v7.UIPadding.PaddingRight, l_TextBounds_0.X);
        local v14 = v4(v7.UIPadding.PaddingTop, l_TextBounds_0.Y);
        local v15 = v4(v7.UIPadding.PaddingBottom, l_TextBounds_0.Y);
        v11 = Vector2.new((v12 + v13) * 2, v14 + v15);
    else
        local l_Padding_0 = v7.Padding;
        v11 = Vector2.new(l_Padding_0 * 4, l_Padding_0 * 2);
    end;
    return v11 + l_TextBounds_0;
end;
return function(v18, v19, v20) --[[ Line: 51 ]]
    -- upvalues: l_TextChatService_0 (copy), l_getFFlagExpChatAlwaysRunTCS_0 (copy), v17 (copy), l_TextService_0 (copy)
    if v20 == nil then
        v20 = l_TextChatService_0;
    end;
    if l_getFFlagExpChatAlwaysRunTCS_0() or v20.ChatVersion == Enum.ChatVersion.TextChatService then
        return (v17(v18, v19));
    else
        return l_TextService_0:GetTextSize(v18, v19.TextSize, v19.Font, Vector2.new(v19.MaxWidth, 10000)) + Vector2.new(v19.Padding * 4, v19.Padding * 2);
    end;
end;