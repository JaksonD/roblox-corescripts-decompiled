local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.AppCommonLib);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Text_0 = v1.Text;
local l_useStyle_0 = v3.Core.Style.useStyle;
return function(v8) --[[ Line: 25 ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v9 = l_useStyle_0();
    local l_Font_0 = v9.Font.Header2.Font;
    local v11 = v9.Font.BaseSize * v9.Font.Header2.RelativeSize;
    local v12 = v2.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v8 (copy), l_Text_0 (ref), l_Font_0 (copy), v11 (copy)
        if v8.buttonWidth then
            return v8.buttonWidth;
        else
            return l_Text_0.GetTextWidth(v8.text, l_Font_0, v11) + 24;
        end;
    end, {
        v8.text, 
        l_Font_0, 
        v11, 
        v8.buttonWidth
    });
    local v13 = if v8.buttonHeight then UDim2.fromOffset(v12, v8.buttonHeight) else UDim2.new(0, v12, 1, 0);
    return v2.createElement("Frame", {
        AnchorPoint = v8.AnchorPoint, 
        BackgroundTransparency = 1, 
        LayoutOrder = v8.LayoutOrder, 
        Position = v8.Position, 
        Size = v13
    }, {
        ShowMoreButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            onActivated = v8.onActivated, 
            size = UDim2.fromScale(1, 1), 
            text = v8.text
        })
    });
end;