local v0 = require(script.Parent.Constants);
local v1 = require(script.Parent.getTextHeight);
local _ = require(script.Parent.StyleTypes);
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v4 = v3 and v3.nameTopPadding or v0.NAME_TOP_PADDING;
    local v5 = v3 and v3.contextualTopPadding or v0.CONTEXTUAL_TOP_PADDING;
    local v6 = v3 and v3.maxLinesNumber or v0.LINES_MAX;
    local l_font_0 = v3.font;
    local v8 = v1("", l_font_0.CaptionHeader.Font, l_font_0.BaseSize * l_font_0.CaptionHeader.RelativeSize);
    local v9 = v1("", l_font_0.CaptionBody.Font, l_font_0.BaseSize * l_font_0.CaptionBody.RelativeSize) * v6;
    return v4 + v8 + v5 + v9;
end;