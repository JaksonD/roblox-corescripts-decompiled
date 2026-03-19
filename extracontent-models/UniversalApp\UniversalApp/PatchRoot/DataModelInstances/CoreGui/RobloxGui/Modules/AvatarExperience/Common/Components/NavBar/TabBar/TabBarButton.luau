local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useCursorByType_0 = v3.App.SelectionCursor.useCursorByType;
local l_CursorType_0 = v3.App.SelectionCursor.CursorType;
return function(v7) --[[ Line: 30 ]]
    -- upvalues: l_useStyle_0 (copy), l_useCursorByType_0 (copy), l_CursorType_0 (copy), v1 (copy), l_Focusable_0 (copy)
    local v8 = l_useStyle_0();
    local l_Font_0 = v8.Font;
    local l_Theme_0 = v8.Theme;
    local l_isSelected_0 = v7.isSelected;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v13 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_tabTitle_0 = v7.tabTitle;
    local v15 = l_isSelected_0 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
    local v16 = l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local l_ref_0 = v7.ref;
    local l_frameRef_0 = v7.frameRef;
    local v19 = l_useCursorByType_0(l_CursorType_0.NavHighlight);
    local l_tabsLength_0 = v7.tabsLength;
    local v21 = 1;
    if l_tabsLength_0 > 0 then
        v21 = 1 / l_tabsLength_0;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(v21, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        ref = l_frameRef_0
    }, {
        Button = v1.createElement(l_Focusable_0.TextButton, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_tabTitle_0, 
            TextSize = v13, 
            TextColor3 = v15, 
            TextTransparency = v16, 
            Font = l_Font_1, 
            [v1.Event.Activated] = function() --[[ Line: 77 ]]
                -- upvalues: v7 (copy)
                v7.onActivate(v7.tabIndex);
            end, 
            ref = l_ref_0, 
            NextSelectionLeft = v7.NextSelectionLeft, 
            NextSelectionRight = v7.NextSelectionRight, 
            NextSelectionUp = v7.NextSelectionUp, 
            NextSelectionDown = v7.NextSelectionDown, 
            SelectionImageObject = v19
        }), 
        Frame = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, l_isSelected_0 and 3 or 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = if l_isSelected_0 then l_Theme_0.IconEmphasis.Color else l_Theme_0.Divider.Color, 
            BackgroundTransparency = if l_isSelected_0 then l_Theme_0.IconEmphasis.Transparency else l_Theme_0.Divider.Transparency
        })
    });
end;