local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Enum.Emoji);
local v4 = require(l_Parent_0.constants);
local function _(v5) --[[ Line: 20 ]] --[[ Name: getEmojiString ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v3.isEnumValue(v5) then
        return v4[v5.rawValue()];
    else
        return "";
    end;
end;
return function(v7) --[[ Line: 28 ]] --[[ Name: Emoji ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local l_createElement_0 = v2.createElement;
    local v9 = v7.onActivated and "TextButton" or "TextLabel";
    local v10 = {
        Size = UDim2.fromScale(0, 1)
    };
    local l_emoji_0 = v7.emoji;
    v10.Text = if v3.isEnumValue(l_emoji_0) then v4[l_emoji_0.rawValue()] else "";
    v10.TextColor3 = Color3.fromHex("#fff");
    v10.AutomaticSize = Enum.AutomaticSize.X;
    v10.Font = v7.textFont;
    v10.TextSize = v7.textSize;
    v10.Position = v7.Position;
    v10.BackgroundTransparency = 1;
    v10[v2.Event.Activated] = v7.onActivated;
    return l_createElement_0(v9, v10);
end;