local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Core_0.Style.useStyle);
local v5 = require(l_Parent_0.Core.Style.useTextSizeOffset);
local _ = require(l_Parent_0.App.Style.Fonts);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local v8 = require(l_Parent_0.Utility.setDefault);
return function(v9) --[[ Line: 44 ]] --[[ Name: TileContentPanel ]]
    -- upvalues: v4 (copy), v5 (copy), v8 (copy), v3 (copy)
    local v10 = v4();
    local l_Settings_0 = v10.Settings;
    local v12 = v5();
    local v13 = l_Settings_0.ReducedMotion and 6 or 8;
    local l_contentTitle_0 = v9.contentTitle;
    local l_contentFooter_0 = v9.contentFooter;
    local v16 = v8(v9.textLineCount, 2);
    local v17 = v8(v9.hasSidePadding, true);
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    if v9.outerPadding == nil or type(v9.outerPadding) == "number" then
        local v22 = v8(v9.outerPadding, v13);
        v18 = v22;
        v19 = v22;
        v20 = v22;
        v21 = v22;
    else
        v18 = v8(v9.outerPadding.Left, v13);
        v19 = v8(v9.outerPadding.Right, v13);
        v20 = v8(v9.outerPadding.Top, v13);
        v21 = v8(v9.outerPadding.Bottom, v13);
    end;
    local v23 = v8(v9.titlePadding, v13);
    local l_panelHeight_0 = v9.panelHeight;
    local l_footerHeight_0 = v9.footerHeight;
    local l_Font_0 = v10.Font;
    local v27 = v8(v9.titleFont, l_Font_0.Header2);
    local l_Theme_0 = v10.Theme;
    local v29 = (l_Font_0.BaseSize + v12) * v27.RelativeSize * v16;
    local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
    return v3.createElement("Frame", {
        Size = UDim2.new(UDim.new(1, 0), l_panelHeight_0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v23)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = if v17 then UDim.new(0, v18) else nil, 
            PaddingRight = if v17 then UDim.new(0, v19) else nil, 
            PaddingTop = UDim.new(0, v20), 
            PaddingBottom = UDim.new(0, v21)
        }), 
        TitleText = if v16 > 0 and l_contentTitle_0 and string.len(l_contentTitle_0) > 0 then v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Text = l_contentTitle_0, 
            Font = v27.Font, 
            TextSize = l_Font_0.BaseSize * v27.RelativeSize, 
            TextTransparency = l_TextEmphasis_0.Transparency, 
            TextColor3 = l_TextEmphasis_0.Color, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(1e999, v29)
            })
        }) else nil, 
        ContentFooter = if l_contentFooter_0 then v3.createElement("Frame", {
            Size = UDim2.new(UDim.new(1, 0), l_footerHeight_0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            l_contentFooter_0
        }) else nil
    });
end;