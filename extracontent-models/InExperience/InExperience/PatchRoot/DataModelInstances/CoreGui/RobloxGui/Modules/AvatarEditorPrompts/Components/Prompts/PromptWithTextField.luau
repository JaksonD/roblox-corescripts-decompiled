local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local _ = v7.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v14 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v16 = l_Images_0["component_assets/circle_17_stroke_1"];
local v17 = Rect.new(8, 8, 8, 8);
local v18 = v3.PureComponent:extend("PromptWithTextField");
v18.validateProps = v6.strictInterface({
    fieldText = v6.string, 
    onFieldTextUpdated = v6.callback, 
    title = v6.string, 
    bodyText = v6.optional(v6.string), 
    buttonStackInfo = v6.table, 
    screenSize = v6.Vector2
});
v18.init = function(v19) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_UserInputService_0 (copy)
    v19:setState({
        alertPosition = UDim2.fromScale(0.5, 0.5)
    });
    v19.textBoxRef = v3.createRef();
    v19.textUpdated = function(v20) --[[ Line: 57 ]]
        -- upvalues: v19 (copy)
        v19.props.onFieldTextUpdated(v20.Text);
    end;
    v19.lastAlertHeight = 100;
    v19.calculateAlertPosition = function() --[[ Line: 63 ]]
        -- upvalues: l_UserInputService_0 (ref), v19 (copy)
        local v21 = UDim2.fromScale(0.5, 0.5);
        if l_UserInputService_0.OnScreenKeyboardVisible then
            local v22 = (v19.props.screenSize.Y - l_UserInputService_0.OnScreenKeyboardSize.Y) / 2;
            local v23 = v22 - v19.lastAlertHeight / 2;
            if v23 < 20 then
                v22 = v22 + (20 - v23);
            end;
            v21 = UDim2.new(0.5, 0, 0, v22);
        end;
        if v19.state.alertPosition ~= v21 then
            v19:setState({
                alertPosition = v21
            });
        end;
    end;
    v19.alertSizeChanged = function(v24) --[[ Line: 86 ]]
        -- upvalues: v19 (copy)
        v19.lastAlertHeight = v24.AbsoluteSize.Y;
        v19.calculateAlertPosition();
    end;
    v19.alertMounted = function() --[[ Line: 92 ]]
        -- upvalues: v19 (copy)
        local v25 = v19.textBoxRef:getValue();
        if v25 then
            v25:CaptureFocus();
        end;
    end;
end;
v18.renderAlertMiddleContent = function(v26) --[[ Line: 100 ]] --[[ Name: renderAlertMiddleContent ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v17 (copy), v5 (copy), v14 (copy)
    return l_withStyle_0(function(v27) --[[ Line: 101 ]]
        -- upvalues: v3 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v17 (ref), v5 (ref), v14 (ref), v26 (copy)
        local l_Font_0 = v27.Font;
        local l_Theme_0 = v27.Theme;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 35), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }, {
            TextboxBorder = v3.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v16, 
                ImageColor3 = l_Theme_0.UIDefault.Color, 
                ImageTransparency = l_Theme_0.UIDefault.Transparency, 
                LayoutOrder = 3, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 1, -5), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                SliceCenter = v17
            }, {
                Textbox = v3.createElement(v5.Focusable.TextBox, {
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.TextDefault.Color, 
                    PlaceholderText = v14:FormatByKey("CoreScripts.AvatarEditorPrompts.OutfitNamePlaceholder"), 
                    Position = UDim2.new(0, 6, 0, 0), 
                    Size = UDim2.new(1, -12, 1, 0), 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Text = v26.props.fieldText, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OverlayNativeInput = true, 
                    [v3.Change.Text] = v26.textUpdated, 
                    [v3.Ref] = v26.textBoxRef
                })
            })
        });
    end);
end;
v18.render = function(v30) --[[ Line: 149 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_InteractiveAlert_0 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    return v3.createFragment({
        InteractiveAlert = v3.createElement(l_InteractiveAlert_0, {
            title = v30.props.title, 
            bodyText = v30.props.bodyText, 
            buttonStackInfo = v30.props.buttonStackInfo, 
            position = v30.state.alertPosition, 
            screenSize = v30.props.screenSize, 
            middleContent = function() --[[ Line: 159 ]] --[[ Name: middleContent ]]
                -- upvalues: v30 (copy)
                return v30:renderAlertMiddleContent();
            end, 
            isMiddleContentFocusable = true, 
            onAbsoluteSizeChanged = v30.alertSizeChanged, 
            onMounted = v30.alertMounted
        }), 
        OnScreenKeyboardVisibleConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"), 
            callback = v30.calculateAlertPosition
        }), 
        OnScreenKeyboardSizeConnection = v3.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardSize"), 
            callback = v30.calculateAlertPosition
        })
    });
end;
v18.didMount = function(v31) --[[ Line: 179 ]] --[[ Name: didMount ]]
    v31.calculateAlertPosition();
end;
return v4.connect(function(v32) --[[ Line: 183 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v32.screenSize
    };
end, nil)(v18);