local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.RoactAppExperiment);
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v10 = require(l_script_FirstAncestor_0.Utils.AreaTest);
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = v6.Utility.OpenTypeSupport;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
local l_GetFFlagEnableTextFieldContentType_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableTextFieldContentType;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v17 = game:DefineFastFlag("EnableKeyboardVisibilityCheckOnPasswordFocus", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableAndroidPasswordSuggestion");
local l_FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass_0 = require(l_Parent_0.SharedFlags).FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass;
local l_FStringLuaMultiPageSignupIxpLayer_0 = require(l_Parent_0.SharedFlags).FStringLuaMultiPageSignupIxpLayer;
local v21 = v5.PureComponent:extend("PasswordBox");
v21.init = function(v22) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v10 (copy), v17 (copy), l_UserInputService_0 (copy)
    v22.state = {
        hidePassword = true, 
        containerSize = Vector2.new(0, 0)
    };
    v22.getHidePassword = function() --[[ Line: 54 ]]
        -- upvalues: v22 (copy)
        if v22.props.hidePassword ~= nil then
            return v22.props.hidePassword;
        else
            return v22.state.hidePassword;
        end;
    end;
    v22.isMounted = false;
    v22.passwordBoxRef = v5.createRef();
    local v23 = v5.createRef();
    v22.getPasswordTextBoxRef = function() --[[ Line: 66 ]]
        -- upvalues: v22 (copy), v23 (copy)
        return v22.props.TextBoxRef or v23;
    end;
    v22.isTouchPositionInPasswordBox = function(v24) --[[ Line: 70 ]]
        -- upvalues: v22 (copy), v10 (ref)
        if not v22.passwordBoxRef.current then
            return false;
        else
            local l_AbsolutePosition_0 = v22.passwordBoxRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v22.passwordBoxRef.current.AbsoluteSize;
            return v10.IsPointInRect(Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0), v24);
        end;
    end;
    v22.tapBeganInTextbox = false;
    v22.tapEventBegan = function(v27, _) --[[ Line: 84 ]]
        -- upvalues: v22 (copy), v17 (ref), l_UserInputService_0 (ref)
        if v22.props.CentralOverlayBlocksInput and v22.props.centralOverlay and v22.props.centralOverlay.OverlayType ~= nil then
            return;
        elseif v17 and not l_UserInputService_0.OnScreenKeyboardVisible then
            return;
        else
            v22.tapBeganInTextbox = v22.isTouchPositionInPasswordBox(v27);
            local l_current_0 = v22.getPasswordTextBoxRef().current;
            local l_l_UserInputService_0_FocusedTextBox_0 = l_UserInputService_0:GetFocusedTextBox();
            if l_current_0 and l_l_UserInputService_0_FocusedTextBox_0 ~= l_current_0 and v22.tapBeganInTextbox and v22.props.CaptureFocusOnTapStart then
                if l_l_UserInputService_0_FocusedTextBox_0 then
                    l_l_UserInputService_0_FocusedTextBox_0:ReleaseFocus();
                end;
                l_current_0:CaptureFocus();
            end;
            return;
        end;
    end;
    v22.tapEventEnded = function(v31, _) --[[ Line: 118 ]]
        -- upvalues: v22 (copy), l_UserInputService_0 (ref)
        if v22.tapBeganInTextbox then
            v22.tapBeganInTextbox = false;
            return;
        else
            local l_l_UserInputService_0_FocusedTextBox_1 = l_UserInputService_0:GetFocusedTextBox();
            local l_current_1 = v22.getPasswordTextBoxRef().current;
            if not l_l_UserInputService_0_FocusedTextBox_1 or l_l_UserInputService_0_FocusedTextBox_1 ~= l_current_1 then
                return;
            else
                if not v22.isTouchPositionInPasswordBox(v31) then
                    l_current_1:ReleaseFocus();
                end;
                return;
            end;
        end;
    end;
    v22.onAbsoluteSizeChanged = function(v35) --[[ Line: 136 ]]
        -- upvalues: v22 (copy)
        local l_containerSize_0 = v22.state.containerSize;
        local l_AbsoluteSize_1 = v35.AbsoluteSize;
        if l_AbsoluteSize_1.X > 0 and l_AbsoluteSize_1.Y > 0 and l_containerSize_0 ~= l_AbsoluteSize_1 then
            spawn(function() --[[ Line: 142 ]]
                -- upvalues: v22 (ref), l_AbsoluteSize_1 (copy)
                if v22.isMounted then
                    v22:setState({
                        containerSize = l_AbsoluteSize_1
                    });
                end;
            end);
        end;
    end;
    v22.onTogglerActivated = function(_) --[[ Line: 152 ]]
        -- upvalues: v22 (copy)
        local l_onToggleCallback_0 = v22.props.onToggleCallback;
        local v40 = v22.getHidePassword();
        if l_onToggleCallback_0 then
            l_onToggleCallback_0(v40);
        end;
        if v22.isMounted then
            v22:setState({
                hidePassword = not v40
            });
        end;
    end;
    v22.shouldTakeInput = function(v41) --[[ Line: 167 ]]
        -- upvalues: v22 (copy)
        if v22.props.Disabled then
            return false;
        else
            local v42 = true;
            if v41.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v42 = v41.UserInputType == Enum.UserInputType.Touch;
            end;
            return not v22.props.ManualFocusRelease and v42;
        end;
    end;
end;
v21.defaultProps = {
    TextXAlignment = Enum.TextXAlignment.Left, 
    PaddingX = 10, 
    PaddingY = 7, 
    ClearTextOnFocus = false, 
    IsKeyboardOverlayUsed = true
};
v21.didMount = function(v43) --[[ Line: 187 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    v43.isMounted = true;
    if v43.props.IsKeyboardOverlayUsed then
        v43.inputBeganConnection = l_UserInputService_0.InputBegan:connect(function(v44, v45) --[[ Line: 191 ]]
            -- upvalues: v43 (copy)
            if v43.shouldTakeInput(v44) then
                v43.tapEventBegan(v44.Position, v45);
            end;
        end);
        v43.inputEndedConnection = l_UserInputService_0.InputEnded:connect(function(v46, v47) --[[ Line: 197 ]]
            -- upvalues: v43 (copy)
            if v43.shouldTakeInput(v46) then
                v43.tapEventEnded(v46.Position, v47);
            end;
        end);
    end;
end;
v21.willUnmount = function(v48) --[[ Line: 205 ]] --[[ Name: willUnmount ]]
    v48.isMounted = false;
    if v48.props.IsKeyboardOverlayUsed then
        if v48.inputBeganConnection then
            v48.inputBeganConnection:disconnect();
        end;
        if v48.inputEndedConnection then
            v48.inputEndedConnection:disconnect();
        end;
    end;
end;
v21.render = function(v49) --[[ Line: 217 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        return l_withSelectionCursorProvider_0(function(v50) --[[ Line: 219 ]]
            -- upvalues: v49 (copy)
            return v49:renderWithSelectionCursor(v50);
        end);
    else
        return v49:renderWithSelectionCursor(nil);
    end;
end;
v21.renderWithSelectionCursor = function(v51, v52) --[[ Line: 228 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_GetFFlagEnableTextFieldContentType_0 (copy), l_withStyle_0 (copy), l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_CursorKind_0 (copy), v5 (copy), l_ImageSetLabel_0 (copy), l_GetImageData_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_Size_0 = v51.props.Size;
    local l_Position_0 = v51.props.Position;
    local l_LayoutOrder_0 = v51.props.LayoutOrder;
    local l_Text_0 = v51.props.Text;
    local l_TextSize_0 = v51.props.TextSize;
    local l_PlaceholderText_0 = v51.props.PlaceholderText;
    local l_TextXAlignment_0 = v51.props.TextXAlignment;
    local l_TextColor_0 = v51.props.TextColor;
    local l_PlaceholderColor_0 = v51.props.PlaceholderColor;
    local l_ClearTextOnFocus_0 = v51.props.ClearTextOnFocus;
    local l_Color_0 = v51.props.Color;
    local l_Transparency_0 = v51.props.Transparency;
    local l_TextTransparency_0 = v51.props.TextTransparency;
    local l_ReturnKeyType_0 = v51.props.ReturnKeyType;
    local l_NextSelectionDown_0 = v51.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v51.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v51.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v51.props.NextSelectionUp;
    local l_PaddingX_0 = v51.props.PaddingX;
    local l_PaddingY_0 = v51.props.PaddingY;
    local v73 = v51.getHidePassword();
    local l_Y_0 = v51.state.containerSize.Y;
    local l_onFocused_0 = v51.props.onFocused;
    local l_onFocusLost_0 = v51.props.onFocusLost;
    local l_onMouseEnter_0 = v51.props.onMouseEnter;
    local l_onMouseLeave_0 = v51.props.onMouseLeave;
    local v79 = v51.props.IsNewPassword and v51.props.enablePasswordSuggestion;
    local v80 = v79 and l_game_EngineFeature_0 and Enum.TextInputType.NewPassword or Enum.TextInputType.Password;
    local v81 = v79 and l_game_EngineFeature_0 and Enum.TextInputType.NewPasswordShown or l_GetFFlagEnableTextFieldContentType_0() and Enum.TextInputType.PasswordShown or Enum.TextInputType.NoSuggestions;
    return l_withStyle_0(function(v82) --[[ Line: 275 ]]
        -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (ref), v52 (copy), l_CursorKind_0 (ref), v5 (ref), l_ImageSetLabel_0 (ref), l_Size_0 (copy), l_Position_0 (copy), l_LayoutOrder_0 (copy), l_GetImageData_0 (ref), l_Color_0 (copy), l_Transparency_0 (copy), v51 (copy), l_Y_0 (copy), l_Text_0 (copy), l_PlaceholderText_0 (copy), l_PlaceholderColor_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_TextSize_0 (copy), l_TextColor_0 (copy), l_TextTransparency_0 (copy), l_TextXAlignment_0 (copy), l_ClearTextOnFocus_0 (copy), v73 (copy), v80 (copy), v81 (copy), l_ReturnKeyType_0 (copy), l_NextSelectionDown_0 (copy), l_NextSelectionLeft_0 (copy), l_NextSelectionRight_0 (copy), l_NextSelectionUp_0 (copy), l_onFocused_0 (copy), l_onFocusLost_0 (copy), l_onMouseEnter_0 (copy), l_onMouseLeave_0 (copy), l_PaddingY_0 (copy), l_PaddingX_0 (copy)
        local v83 = nil;
        if l_GetFFlagLuaAppFixSelectionCursor_0() then
            v83 = v52(l_CursorKind_0.InputButton);
        end;
        return v5.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            LayoutOrder = l_LayoutOrder_0, 
            BackgroundTransparency = 1, 
            Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
            ImageColor3 = l_Color_0, 
            ImageTransparency = l_Transparency_0, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9), 
            [v5.Ref] = v51.passwordBoxRef, 
            [v5.Change.AbsoluteSize] = v51.onAbsoluteSizeChanged
        }, {
            TextBoxContainer = v5.createElement("Frame", {
                Size = UDim2.new(1, -l_Y_0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                TextBox = v5.createElement("TextBox", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Text = l_Text_0, 
                    PlaceholderText = l_PlaceholderText_0, 
                    PlaceholderColor3 = l_PlaceholderColor_0, 
                    Font = v82.Font.Body.Font, 
                    OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getPasswordStylisticAlternative() else nil, 
                    TextSize = l_TextSize_0, 
                    TextColor3 = l_TextColor_0, 
                    TextTransparency = l_TextTransparency_0, 
                    TextXAlignment = l_TextXAlignment_0, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = l_ClearTextOnFocus_0, 
                    OverlayNativeInput = true, 
                    ManualFocusRelease = v51.props.IsKeyboardOverlayUsed, 
                    ClipsDescendants = true, 
                    TextInputType = v73 and v80 or v81, 
                    ReturnKeyType = l_ReturnKeyType_0, 
                    NextSelectionDown = l_NextSelectionDown_0, 
                    NextSelectionLeft = l_NextSelectionLeft_0, 
                    NextSelectionRight = l_NextSelectionRight_0, 
                    NextSelectionUp = l_NextSelectionUp_0, 
                    SelectionImageObject = v83, 
                    [v5.Ref] = v51.getPasswordTextBoxRef(), 
                    [v5.Change.Text] = v51.props.onChangeText, 
                    [v5.Event.ReturnPressedFromOnScreenKeyboard] = v51.props.onReturnPressedFromOnScreenKeyboard, 
                    [v5.Event.Focused] = l_onFocused_0, 
                    [v5.Event.FocusLost] = l_onFocusLost_0, 
                    [v5.Event.MouseEnter] = l_onMouseEnter_0, 
                    [v5.Event.MouseLeave] = l_onMouseLeave_0
                }), 
                UIPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_PaddingY_0), 
                    PaddingBottom = UDim.new(0, l_PaddingY_0), 
                    PaddingLeft = UDim.new(0, l_PaddingX_0), 
                    PaddingRight = UDim.new(0, l_PaddingX_0)
                })
            }), 
            Toggler = v5.createElement("TextButton", {
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, l_Y_0, 1, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Text = "", 
                BackgroundTransparency = 1, 
                SelectionImageObject = v83, 
                [v5.Event.Activated] = v51.onTogglerActivated
            }, {
                ImageLabel = v5.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = if v73 then l_GetImageData_0("LuaApp/icons/actions_privacy_show") or "LuaApp/icons/actions_privacy_show" else l_GetImageData_0("LuaApp/icons/actions_edit_hide") or "LuaApp/icons/actions_edit_hide", 
                    ImageColor3 = v82.Theme.IconDefault.Color, 
                    ImageTransparency = v82.Theme.IconDefault.Transparency
                })
            })
        });
    end);
end;
v21 = v3.connect(function(v84, _) --[[ Line: 366 ]]
    return {
        centralOverlay = v84.CentralOverlay
    };
end)(v21);
if l_game_EngineFeature_0 then
    v21 = v4.connectBrowserTrackerLayer({
        l_FStringLuaMultiPageSignupIxpLayer_0
    }, function(v86, _) --[[ Line: 375 ]]
        -- upvalues: l_FStringLuaMultiPageSignupIxpLayer_0 (copy), l_FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass_0 (copy)
        return {
            enablePasswordSuggestion = (v86[l_FStringLuaMultiPageSignupIxpLayer_0] or {}).enablePasswordSuggestion or l_FFlagAndroidPasswordSuggestionExperimentEnrollmentBypass_0 or false
        };
    end)(v21);
end;
return v21;