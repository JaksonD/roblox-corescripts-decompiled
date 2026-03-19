local l_TextService_0 = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.GlobalConfig);
local v11 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = {
    [Enum.KeyCode.Escape] = {
        text = "ESC", 
        fontKey = "Footer", 
        width = 36
    }, 
    [Enum.KeyCode.Space] = {
        text = "Space", 
        width = 92
    }, 
    [Enum.KeyCode.LeftShift] = {
        text = "Shift", 
        width = 66, 
        alignment = Enum.TextXAlignment.Left
    }, 
    [Enum.KeyCode.LeftControl] = {
        text = "Ctrl", 
        width = 66, 
        alignment = Enum.TextXAlignment.Left
    }, 
    [Enum.KeyCode.LeftSuper] = {
        text = "Command"
    }, 
    [Enum.KeyCode.LeftMeta] = {
        text = "fn"
    }, 
    [Enum.KeyCode.LeftAlt] = {
        text = "Opt"
    }, 
    [Enum.KeyCode.Tilde] = {
        text = "~", 
        fontKey = "CaptionHeader"
    }, 
    [Enum.KeyCode.F10] = {
        fontKey = "CaptionHeader", 
        width = 36
    }, 
    [Enum.KeyCode.F11] = {
        fontKey = "CaptionHeader", 
        width = 36
    }, 
    [Enum.KeyCode.Up] = {
        image = v9.Images.UpArrow
    }, 
    [Enum.KeyCode.Down] = {
        image = v9.Images.DownArrow
    }, 
    [Enum.KeyCode.Left] = {
        image = v9.Images.LeftArrow
    }, 
    [Enum.KeyCode.Right] = {
        image = v9.Images.RightArrow
    }
};
local v14 = l_t_0.strictInterface({
    input = l_t_0.enum(Enum.KeyCode), 
    borderThemeKey = l_t_0.optional(l_t_0.string), 
    textThemeKey = l_t_0.optional(l_t_0.string), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    ZIndex = l_t_0.optional(l_t_0.integer)
});
local function v28(v15, v16, v17) --[[ Line: 71 ]] --[[ Name: getLabelWidthAndContent ]]
    -- upvalues: v13 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), l_UserInputService_0 (copy), l_TextService_0 (copy), v11 (copy)
    local v18 = v13[v15];
    if v18 and v18.image then
        return 36, (l_Roact_0.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v18.image, 
            ImageColor3 = v16.Theme.IconEmphasis.Color, 
            ImageTransparency = v16.Theme.IconEmphasis.Transparency, 
            Position = UDim2.new(0.5, 0, 0.5, -1), 
            Size = UDim2.new(0, 16, 0, 16)
        }));
    else
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        local v22 = nil;
        local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v15);
        v19 = if v18 and v18.text then v18.text else if l_l_UserInputService_0_StringForKeyCode_0 and l_l_UserInputService_0_StringForKeyCode_0 ~= "" then l_l_UserInputService_0_StringForKeyCode_0 else v15.Name;
        local v24 = v19:len() < 3;
        v20 = if v18 and v18.fontKey then v18.fontKey else v24 and "CaptionHeader" or "Footer";
        if v18 and v18.width then
            v21 = v18.width;
        elseif v24 then
            v21 = 36;
        else
            local v25 = v16.Font[v20];
            local v26 = v25.RelativeSize * v16.Font.BaseSize;
            local l_Font_0 = v25.Font;
            v21 = l_TextService_0:GetTextSize(v19, v26, l_Font_0, Vector2.new(1e999, 36)).X + 28;
        end;
        if v18 and v18.alignment then
            v22 = v18.alignment;
        end;
        return v21, l_Roact_0.createElement(v11, {
            fontKey = v20, 
            themeKey = v17 or "TextEmphasis", 
            Text = v19, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, -1), 
            TextXAlignment = v22
        }), v22;
    end;
end;
return function(v29) --[[ Line: 142 ]] --[[ Name: KeyLabel ]]
    -- upvalues: v10 (copy), v14 (copy), l_withStyle_0 (copy), v28 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v9 (copy)
    if v10.propValidation then
        assert(v14(v29));
    end;
    return l_withStyle_0(function(v30) --[[ Line: 147 ]]
        -- upvalues: v29 (copy), v28 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v9 (ref)
        local v31 = v30.Theme[v29.borderThemeKey or "UIEmphasis"];
        local v32, v33, v34 = v28(v29.input, v30, v29.textThemeKey);
        local v35 = nil;
        if v34 then
            v35 = 9;
        end;
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            ImageTransparency = v31.Transparency, 
            ImageColor3 = v31.Color, 
            Image = v9.Images.KeyBorder, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(Vector2.new(9, 7), Vector2.new(26, 26)), 
            Size = UDim2.new(0, v32, 0, 36), 
            Position = v29.Position, 
            AnchorPoint = v29.AnchorPoint, 
            LayoutOrder = v29.LayoutOrder, 
            ZIndex = v29.ZIndex
        }, {
            Padding = v35 and l_Roact_0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v35), 
                PaddingRight = UDim.new(0, v35)
            }), 
            LabelContent = v33
        });
    end);
end;