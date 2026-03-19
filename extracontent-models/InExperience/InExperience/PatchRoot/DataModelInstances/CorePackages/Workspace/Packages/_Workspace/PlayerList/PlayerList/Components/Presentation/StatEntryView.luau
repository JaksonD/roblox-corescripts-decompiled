local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_0.Common.FormatStatString);
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_Parent_0.Common.useLayoutValues);
local v7 = require(l_Parent_0.Flags.FFlagRemoveNewPlayerListOverlay);
local v8 = require(l_Parent_0.Flags.FFlagEnableMobilePlayerListOnConsole);
return v2.memo(function(v9) --[[ Line: 36 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), v8 (copy), v2 (copy), v4 (copy), v7 (copy)
    local v10 = l_useStyle_0();
    local v11 = v6();
    local v12 = nil;
    local v13 = nil;
    local l_TextDefault_0 = v10.Theme.TextDefault;
    local l_textStyle_0 = v9.textStyle;
    local v16 = if l_textStyle_0 then l_textStyle_0.Color else l_TextDefault_0.Color;
    local v17 = if l_textStyle_0 then l_textStyle_0.Transparency else l_TextDefault_0.Transparency;
    local v18 = if l_textStyle_0 then l_textStyle_0.StrokeColor else nil;
    local v19 = if l_textStyle_0 and l_textStyle_0.StrokeTransparency then l_textStyle_0.StrokeTransparency else nil;
    if not v11.IsTenFoot then
        v12 = v10.Font.CaptionHeader.Font;
        v13 = if v8 then v11.StatTextSize else v10.Font.CaptionHeader.RelativeSize * v10.Font.BaseSize;
    else
        v13 = v11.StatTextSize;
        v12 = v11.StatFont;
        if v9.isTeamEntry then
            v12 = v11.TeamStatFont;
        end;
    end;
    local v21 = v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v9 (copy), v4 (ref), v12 (ref), v13 (ref), v16 (copy), v17 (copy), v18 (copy), v19 (copy)
        return {
            Text = v9.statValue:map(function(v20) --[[ Line: 65 ]]
                -- upvalues: v4 (ref)
                return v4(v20);
            end), 
            Size = v9.showStatTitle and UDim2.fromScale(1, 0.5) or UDim2.fromScale(1, 1), 
            Position = v9.showStatTitle and UDim2.fromScale(0, 0.5) or UDim2.fromScale(0, 0), 
            Font = v12, 
            TextSize = v13, 
            TextColor3 = v16, 
            TextTransparency = v17, 
            TextStrokeColor3 = v18, 
            TextStrokeTransparency = v19, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            BackgroundTransparency = 1
        };
    end, {
        v9.showStatTitle, 
        v12, 
        v13, 
        v16, 
        v17, 
        v18, 
        v19
    });
    return v2.createElement("Frame", {
        Size = UDim2.new(0, v11.StatEntrySizeX, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BorderSizePixel = 0, 
        LayoutOrder = v9.layoutOrder, 
        BackgroundTransparency = if v9.backgroundStyle then v9.backgroundStyle.Transparency else 1, 
        BackgroundColor3 = if v9.backgroundStyle then v9.backgroundStyle.Color else nil
    }, {
        PlayerStatDisplay = if v9.showStatTitle and v9.statName then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            StatTitle = v2.createElement("TextLabel", {
                Text = v9.statName, 
                Size = UDim2.fromScale(1, 0.5), 
                Position = UDim2.fromScale(0, 0), 
                Font = v11.TitleStatFont, 
                TextSize = v13, 
                TextColor3 = v16, 
                TextTransparency = v17, 
                TextStrokeColor3 = v18, 
                TextStrokeTransparency = v19, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1
            }), 
            StatText = v2.createElement("TextLabel", v21)
        }) else v2.createElement("TextLabel", v21), 
        DoubleOverLay = if not v7 and v9.doubleOverlay and v9.overlayStyle then v2.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v9.overlayStyle.Transparency, 
            BackgroundColor3 = v9.overlayStyle.Color, 
            BorderSizePixel = 0
        }) else nil, 
        OverlayFrame = if not v7 and v9.overlayStyle then v2.createElement("Frame", {
            ZIndex = 2, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = v9.overlayStyle.Transparency, 
            BackgroundColor3 = v9.overlayStyle.Color
        }) else nil
    });
end);