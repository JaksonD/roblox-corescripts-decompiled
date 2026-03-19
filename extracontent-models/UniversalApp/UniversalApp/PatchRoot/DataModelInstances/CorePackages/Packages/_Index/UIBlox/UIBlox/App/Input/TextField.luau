local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.React);
local v5 = require(l_Parent_0.InputLabel);
local v6 = require(l_Parent_0.HelperText);
local v7 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local _ = require(l_Parent_1.ImageSet.ImagesTypes);
local v9 = require(l_Parent_2.Core.Style.useStyle);
local v10 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v11 = require(l_Parent_2.UIBloxConfig);
local v12 = {
    width = UDim.new(0, 400)
};
return function(v13) --[[ Line: 54 ]] --[[ Name: TextField ]]
    -- upvalues: v9 (copy), v4 (copy), v10 (copy), v12 (copy), v5 (copy), v7 (copy), v11 (copy), v6 (copy)
    local l_Tokens_0 = v9().Tokens;
    local v15 = v4.useRef(nil);
    local v16, v17 = v4.useState(false);
    local v18, v19 = v4.useState(false);
    local l_TextField_0 = l_Tokens_0.Component.TextField;
    local l_Focus_0 = l_Tokens_0.Semantic.Stroke.Focus;
    local l_Small_0 = l_Tokens_0.Semantic.Icon.Size.Small;
    local l_Input_0 = l_Tokens_0.Semantic.Stroke.Input;
    local v24 = math.ceil(l_Input_0) * 2;
    local l_Focus_1 = l_Tokens_0.Semantic.Stroke.Focus;
    local v26 = math.ceil(l_Focus_1) * 2;
    local v27 = v10(UDim.new(0, l_TextField_0.Base.Field.BorderRadius), l_Focus_0, l_Focus_0);
    local v28 = v10(UDim.new(0.5), l_Small_0 / 2, l_Focus_0);
    local v29 = if v13.width ~= nil then v13.width else v12.width;
    local _ = function() --[[ Line: 80 ]] --[[ Name: canUseTextInputType ]]
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 81 ]]
            local l_CoreGui_0 = game:GetService("CoreGui");
            local _ = l_CoreGui_0.Name;
            return l_CoreGui_0;
        end);
        return l_status_0 and l_result_0 ~= nil;
    end;
    local function _() --[[ Line: 89 ]] --[[ Name: getTextBoxWidthOffset ]]
        -- upvalues: v13 (copy), l_Small_0 (copy), l_TextField_0 (copy)
        local v35 = 0;
        if v13.iconLeading then
            v35 = v35 - l_Small_0 - l_TextField_0.Base.Field.Gap * 2;
        end;
        if v13.iconButton then
            v35 = v35 - l_Small_0 - l_TextField_0.Base.Field.Gap * 2;
        end;
        return v35;
    end;
    local function v38(v37) --[[ Line: 102 ]] --[[ Name: onTextChange ]]
        -- upvalues: v13 (copy)
        if v37 == nil then
            v13.onChange("");
            return;
        else
            v13.onChange(v37.Text);
            return;
        end;
    end;
    local function v39() --[[ Line: 110 ]] --[[ Name: onFocusGained ]]
        -- upvalues: v13 (copy), v15 (copy), v19 (copy)
        if v13.disabled and v15.current then
            v15.current:ReleaseFocus();
            return;
        else
            v19(true);
            if v13.onFocusGained then
                v13.onFocusGained();
            end;
            return;
        end;
    end;
    local function v40() --[[ Line: 121 ]] --[[ Name: onFocusLost ]]
        -- upvalues: v19 (copy)
        v19(false);
    end;
    local l_createElement_0 = v4.createElement;
    local v42 = "Frame";
    local v43 = {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v29, UDim.new(0, 0)), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v13.LayoutOrder
    };
    local v44 = {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Tokens_0.Component.InputLabel.Base.Spacing.Bottom)
        }), 
        InputLabel = if v13.label then v4.createElement(v5, {
            text = v13.label, 
            required = v13.required, 
            LayoutOrder = 1
        }) else nil
    };
    local l_createElement_1 = v4.createElement;
    local v46 = "CanvasGroup";
    local v47 = {
        Size = UDim2.new(1, 0, 0, l_Tokens_0.Global.Size_600), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        GroupTransparency = if v13.disabled then 1 - l_TextField_0.Disabled.Field.Opacity else 0
    };
    local v48 = {};
    local l_createElement_2 = v4.createElement;
    local v50 = "ImageButton";
    local v51 = {
        Size = UDim2.new(1, -v24, 1, -v24), 
        Position = UDim2.new(0, v24 / 2, 0, v24 / 2), 
        BackgroundTransparency = 1, 
        Selectable = not v13.disabled, 
        Image = "", 
        SelectionImageObject = v27, 
        [v4.Event.Activated] = function() --[[ Line: 159 ]]
            -- upvalues: v15 (copy)
            if v15.current then
                v15.current:CaptureFocus();
            end;
        end, 
        [v4.Event.MouseEnter] = function() --[[ Line: 164 ]]
            -- upvalues: v17 (copy)
            v17(true);
        end, 
        [v4.Event.MouseLeave] = function() --[[ Line: 167 ]]
            -- upvalues: v17 (copy)
            v17(false);
        end
    };
    local v52 = {
        Corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius)
        }), 
        Border = v4.createElement("UIStroke", {
            Color = if v13.error then l_TextField_0.Error.Field.BorderColor.Color3 else l_TextField_0.Base.Field.BorderColor.Color3, 
            Transparency = if v13.error then l_TextField_0.Error.Field.BorderColor.Transparency else v18 and 0 or l_TextField_0.Base.Field.BorderColor.Transparency, 
            Thickness = l_Input_0
        })
    };
    local l_createElement_3 = v4.createElement;
    local v54 = "Frame";
    local v55 = {
        Size = UDim2.new(1, -v26, 1, -v26), 
        Position = UDim2.new(0, v26 / 2, 0, v26 / 2), 
        BackgroundTransparency = 1
    };
    local v56 = {
        Corner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_TextField_0.Base.Field.BorderRadius - v26 / 2)
        }), 
        Focus = if not v13.disabled and (v16 or v18) then v4.createElement("UIStroke", {
            Color = l_TextField_0.Base.Field.BorderColor.Color3, 
            Transparency = l_Tokens_0.Global.Opacity_12, 
            Thickness = l_Focus_1
        }) else nil, 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_TextField_0.Base.Field.Spacing.Leading), 
            PaddingRight = UDim.new(0, l_TextField_0.Base.Field.Spacing.Trailing)
        }), 
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_TextField_0.Base.Field.Gap * 2)
        }), 
        IconLeading = if v13.iconLeading then v4.createElement(v7.Label, {
            BackgroundTransparency = 1, 
            Image = v13.iconLeading, 
            Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
            ImageColor3 = l_TextField_0.Base.IconLeading.ContentColor.Color3, 
            ImageTransparency = l_TextField_0.Base.IconLeading.ContentColor.Transparency, 
            LayoutOrder = 1
        }) else nil
    };
    local l_createElement_4 = v4.createElement;
    local v58 = "TextBox";
    local v59 = {
        ref = v15, 
        Text = v13.text
    };
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 81 ]]
        local l_CoreGui_1 = game:GetService("CoreGui");
        local _ = l_CoreGui_1.Name;
        return l_CoreGui_1;
    end);
    v59.TextInputType = l_status_1 and l_result_1 ~= nil and v13.textInputType or nil;
    v59.ClearTextOnFocus = false;
    local l_new_0 = UDim2.new;
    local v65 = 1;
    l_result_1 = 0;
    if v13.iconLeading then
        l_result_1 = l_result_1 - l_Small_0 - l_TextField_0.Base.Field.Gap * 2;
    end;
    if v13.iconButton then
        l_result_1 = l_result_1 - l_Small_0 - l_TextField_0.Base.Field.Gap * 2;
    end;
    v59.Size = l_new_0(v65, l_result_1, 1, 0);
    v59.TextEditable = not v13.disabled;
    v59.BackgroundTransparency = 1;
    v59.TextXAlignment = Enum.TextXAlignment.Left;
    v59.TextYAlignment = Enum.TextYAlignment.Center;
    v59.Font = l_TextField_0.Base.Field.Typography.Font;
    v59.OpenTypeFeatures = if v11.enableOpenTypeSupport and v13.openTypeFeatures then v13.openTypeFeatures else nil;
    v59.TextSize = l_TextField_0.Base.Field.Typography.FontSize;
    v59.LineHeight = 1;
    v59.TextColor3 = l_TextField_0.Base.FieldValue.ContentColor.Color3;
    v59.TextTransparency = l_TextField_0.Base.FieldValue.ContentColor.Transparency;
    v59.PlaceholderText = v13.placeholder;
    v59.PlaceholderColor3 = l_Tokens_0.Semantic.Color.Text.Default.Color3;
    v59.ClipsDescendants = true;
    v59.Selectable = false;
    v59.LayoutOrder = 2;
    v59[v4.Event.Focused] = v39;
    v59[v4.Event.FocusLost] = v40;
    v59[v4.Change.Text] = v38;
    v56.TextBox = l_createElement_4(v58, v59);
    v56.IconButton = if v13.iconButton then v4.createElement(v7.Button, {
        BackgroundTransparency = 1, 
        Image = v13.iconButton, 
        Size = UDim2.new(0, l_Small_0, 0, l_Small_0), 
        ImageColor3 = l_TextField_0.Base.IconLeading.ContentColor.Color3, 
        Selectable = not v13.disabled, 
        SelectionImageObject = v28, 
        LayoutOrder = 3, 
        [v4.Event.Activated] = if not v13.disabled then v13.onButtonPress else nil
    }) else nil;
    v52.BorderFrame = l_createElement_3(v54, v55, v56);
    v48.Input = l_createElement_2(v50, v51, v52);
    v44.InputCanvas = l_createElement_1(v46, v47, v48);
    v44.HelperText = if v13.hint then v4.createElement(v6, {
        text = v13.hint, 
        error = v13.error, 
        LayoutOrder = 3
    }) else nil;
    return l_createElement_0(v42, v43, v44);
end;