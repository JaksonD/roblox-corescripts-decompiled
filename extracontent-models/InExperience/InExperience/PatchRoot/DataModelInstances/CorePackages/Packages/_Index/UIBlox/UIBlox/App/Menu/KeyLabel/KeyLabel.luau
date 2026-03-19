local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_3.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Utilities);
local v9 = require(l_Parent_2.Core.Style.useStyle);
local v10 = require(l_Parent_1.ImageSet.Images);
local l_Label_0 = require(l_Parent_2.Core.ImageSet.ImageSetComponent).Label;
return function(v12) --[[ Line: 40 ]] --[[ Name: KeyLabel ]]
    -- upvalues: v9 (copy), v7 (copy), v8 (copy), v4 (copy), v10 (copy), l_Label_0 (copy), v5 (copy)
    local v13 = v9();
    local v14 = v13.Theme[v12.iconThemeKey or v7.DEFAULT_ICON_THEME];
    local v15 = v8.getKeyCodeContent(v12.keyCode);
    local v16 = v8.getWidthFromContent(v15, v13.Font);
    local v17 = {
        AnchorPoint = v12.AnchorPoint, 
        Position = v12.Position, 
        LayoutOrder = v12.LayoutOrder, 
        ZIndex = v12.ZIndex, 
        [v4.Change.AbsoluteSize] = v12[v4.Change.AbsoluteSize], 
        Size = UDim2.fromOffset(v16, v7.HEIGHT)
    };
    if v15.inputType == "keyboard" then
        local v18 = v13.Theme[v12.textThemeKey or v7.DEFAULT_TEXT_THEME];
        local l_Font_0 = v13.Font;
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
        local v22 = l_BaseSize_0 * l_CaptionHeader_0.RelativeSize;
        local v23 = "";
        local v24 = nil;
        if type(v15.content) == "string" then
            v23 = v15.content;
        else
            local v25 = v15.content.ImageRectSize / v10.ImagesResolutionScale;
            v24 = v4.createElement(l_Label_0, {
                Image = v15.content, 
                ImageColor3 = v18.Color, 
                ImageTransparency = v18.Transparency, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v25.X, v25.Y), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5)
            });
        end;
        return v4.createElement(l_Label_0, v5.Object.assign(v17, {
            BackgroundTransparency = 1, 
            ImageTransparency = v14.Transparency, 
            ImageColor3 = v14.Color, 
            Image = v10["icons/controls/keys/key_single"], 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(10, 9), Vector2.new(25, 25))
        }), {
            LabelContent = v4.createElement("TextLabel", {
                Text = v23, 
                BackgroundTransparency = 1, 
                TextColor3 = v18.Color, 
                TextTransparency = v18.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v22, 
                Font = l_CaptionHeader_0.Font, 
                RichText = false, 
                Position = UDim2.fromOffset(0, v7.TEXT_CENTER_OFFSET), 
                Size = UDim2.fromScale(1, 1)
            }, {
                Icon = v24
            })
        });
    elseif v15.inputType == "gamepad" then
        return v4.createElement(l_Label_0, v5.Object.assign(v17, {
            Image = v15.content, 
            ImageColor3 = v14.Color, 
            ImageTransparency = v14.Transparency, 
            BackgroundTransparency = 1
        }));
    else
        assert(false, string.format("Unreachable: Invalid inputType value: \"%s\"", v15.inputType));
        return;
    end;
end;