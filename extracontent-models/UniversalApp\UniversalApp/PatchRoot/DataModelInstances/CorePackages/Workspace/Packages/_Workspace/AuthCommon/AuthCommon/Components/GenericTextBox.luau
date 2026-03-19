local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_withSelectionCursorProvider_0 = v2.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = v2.Utility.OpenTypeSupport;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
local v9 = v1.PureComponent:extend("GenericTextBox");
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
v9.defaultProps = {
    PaddingX = 0, 
    PaddingY = 0
};
v9.render = function(v12) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        return l_withSelectionCursorProvider_0(function(v13) --[[ Line: 29 ]]
            -- upvalues: v12 (copy)
            return v12:renderWithSelectionCursor(v13);
        end);
    else
        return v12:renderWithSelectionCursor(nil);
    end;
end;
v9.renderWithSelectionCursor = function(v14, v15) --[[ Line: 38 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_game_EngineFeature_0 (copy), l_OpenTypeSupport_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy)
    local l_Size_0 = v14.props.Size;
    local l_Position_0 = v14.props.Position;
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local l_Text_0 = v14.props.Text;
    local l_Font_0 = v14.props.Font;
    local l_TextSize_0 = v14.props.TextSize;
    local l_PlaceholderText_0 = v14.props.PlaceholderText;
    local l_TextXAlignment_0 = v14.props.TextXAlignment;
    local l_TextColor_0 = v14.props.TextColor;
    local l_PlaceholderColor_0 = v14.props.PlaceholderColor;
    local l_ClearTextOnFocus_0 = v14.props.ClearTextOnFocus;
    local l_TextInputType_0 = v14.props.TextInputType;
    local l_ReturnKeyType_0 = v14.props.ReturnKeyType;
    local l_ManualFocusRelease_0 = v14.props.ManualFocusRelease;
    local l_NextSelectionDown_0 = v14.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v14.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v14.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v14.props.NextSelectionUp;
    local l_Color_0 = v14.props.Color;
    local l_Transparency_0 = v14.props.Transparency;
    local l_TextTransparency_0 = v14.props.TextTransparency;
    local l_onChangeText_0 = v14.props.onChangeText;
    local l_onAncestryChanged_0 = v14.props.onAncestryChanged;
    local l_onReturnPressedFromOnScreenKeyboard_0 = v14.props.onReturnPressedFromOnScreenKeyboard;
    local l_onFocused_0 = v14.props.onFocused;
    local l_onFocusLost_0 = v14.props.onFocusLost;
    local l_onMouseEnter_0 = v14.props.onMouseEnter;
    local l_onMouseLeave_0 = v14.props.onMouseLeave;
    local l_PaddingX_0 = v14.props.PaddingX;
    local l_PaddingY_0 = v14.props.PaddingY;
    local l_TextBoxRef_0 = v14.props.TextBoxRef;
    local v47 = nil;
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        v47 = v15(l_CursorKind_0.InputButton);
    end;
    local v48 = nil;
    if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then
        if v14.props.openTypeFeatures == nil then
            if l_TextInputType_0 == Enum.TextInputType.Password or l_TextInputType_0 == Enum.TextInputType.PasswordShown or l_TextInputType_0 == Enum.TextInputType.OneTimePassword or l_game_EngineFeature_0 and l_TextInputType_0 == Enum.TextInputType.NewPassword or l_game_EngineFeature_0 and l_TextInputType_0 == Enum.TextInputType.NewPasswordShown then
                v48 = l_OpenTypeSupport_0:getPasswordStylisticAlternative();
            elseif l_TextInputType_0 == Enum.TextInputType.Username then
                v48 = l_OpenTypeSupport_0:getUserNameStylisticAlternative();
            end;
        else
            v48 = v14.props.openTypeFeatures;
        end;
    else
        v48 = nil;
    end;
    return v1.createElement(l_ImageSetLabel_0, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_Color_0, 
        ImageTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9)
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_PaddingY_0), 
            PaddingBottom = UDim.new(0, l_PaddingY_0), 
            PaddingLeft = UDim.new(0, l_PaddingX_0), 
            PaddingRight = UDim.new(0, l_PaddingX_0)
        }), 
        TextBox = v1.createElement("TextBox", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = l_Text_0, 
            PlaceholderText = l_PlaceholderText_0, 
            PlaceholderColor3 = l_PlaceholderColor_0, 
            Font = l_Font_0, 
            TextSize = l_TextSize_0, 
            TextColor3 = l_TextColor_0, 
            TextTransparency = l_TextTransparency_0, 
            TextXAlignment = l_TextXAlignment_0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = l_ClearTextOnFocus_0, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            TextInputType = l_TextInputType_0, 
            ReturnKeyType = l_ReturnKeyType_0, 
            ManualFocusRelease = l_ManualFocusRelease_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            SelectionImageObject = v47, 
            OpenTypeFeatures = v48 or nil, 
            RichText = v48 and true or nil, 
            [v1.Ref] = l_TextBoxRef_0, 
            [v1.Change.Text] = l_onChangeText_0, 
            [v1.Event.AncestryChanged] = l_onAncestryChanged_0, 
            [v1.Event.ReturnPressedFromOnScreenKeyboard] = l_onReturnPressedFromOnScreenKeyboard_0, 
            [v1.Event.Focused] = l_onFocused_0, 
            [v1.Event.FocusLost] = l_onFocusLost_0, 
            [v1.Event.MouseEnter] = l_onMouseEnter_0, 
            [v1.Event.MouseLeave] = l_onMouseLeave_0
        })
    });
end;
return v9;