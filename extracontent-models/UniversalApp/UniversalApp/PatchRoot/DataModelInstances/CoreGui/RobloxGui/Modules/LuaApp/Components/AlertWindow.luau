local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v7 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v8.Button;
local l_ButtonVariant_0 = v8.Enums.ButtonVariant;
local l_ButtonSize_0 = v8.Enums.ButtonSize;
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
local v13 = v2.PureComponent:extend("AlertWindow");
v13.defaultProps = {
    titleTextSize = 25, 
    messageTextAlignment = Enum.TextXAlignment.Center
};
v13.render = function(v14) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v6 (copy), l_Button_0 (copy), v12 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), v4 (copy)
    local l_appTheme_0 = v14.props.appTheme;
    local l_containerWidth_0 = v14.props.containerWidth;
    local l_titleText_0 = v14.props.titleText;
    local l_titleTextSize_0 = v14.props.titleTextSize;
    local l_titleFont_0 = v14.props.titleFont;
    local l_messageText_0 = v14.props.messageText;
    local l_messageFont_0 = v14.props.messageFont;
    local l_confirmButtonText_0 = v14.props.confirmButtonText;
    local l_cancelButtonText_0 = v14.props.cancelButtonText;
    local l_onConfirm_0 = v14.props.onConfirm;
    local l_isConfirming_0 = v14.props.isConfirming;
    local l_hasCancelButton_0 = v14.props.hasCancelButton;
    local l_onCancel_0 = v14.props.onCancel;
    local l_messageTextAlignment_0 = v14.props.messageTextAlignment;
    local v29 = math.min(l_containerWidth_0 - 20 - 20, 400);
    local v30 = v29 - 20 - 20;
    local v31 = l_hasCancelButton_0 and (v30 - 10) / 2 or v30;
    local v32 = v3.GetTextHeight(l_messageText_0, l_messageFont_0, 20, v30);
    local function v34(v33) --[[ Line: 70 ]]
        -- upvalues: v2 (ref), v5 (ref), v29 (copy), l_appTheme_0 (copy), v6 (ref), l_titleText_0 (copy), l_titleFont_0 (copy), l_titleTextSize_0 (copy), v32 (copy), l_messageText_0 (copy), l_messageFont_0 (copy), l_messageTextAlignment_0 (copy), l_hasCancelButton_0 (copy), l_Button_0 (ref), v12 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), v31 (copy), l_onCancel_0 (copy), l_isConfirming_0 (copy), l_confirmButtonText_0 (copy), l_onConfirm_0 (copy)
        return v2.createElement(v5.FitFrame, {
            Size = UDim2.new(0, v29, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = l_appTheme_0.AlertWindow.Background.Color, 
            BorderSizePixel = 0, 
            Active = true, 
            fitAxis = v5.FitAxis.Height
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 20), 
                PaddingRight = UDim.new(0, 20), 
                PaddingBottom = UDim.new(0, 20)
            }), 
            Title = v2.createElement(v5.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                fitAxis = v5.FitAxis.Height
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                PaddingTop = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 11), 
                    LayoutOrder = 1
                }), 
                Title = v2.createElement(v6, {
                    Size = UDim2.new(1, 0, 0, 28), 
                    Position = UDim2.new(0, 0, 0, 11), 
                    BackgroundTransparency = 1, 
                    Text = l_titleText_0, 
                    Font = l_titleFont_0, 
                    TextSize = l_titleTextSize_0, 
                    TextColor3 = l_appTheme_0.AlertWindow.Title.Color, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    fitAxis = v5.FitAxis.Height
                }), 
                PaddingBottom = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 11), 
                    LayoutOrder = 3
                })
            }), 
            Divider = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = l_appTheme_0.AlertWindow.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            Message = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 86 + v32), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Message = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v32), 
                    Position = UDim2.new(0, 0, 0, 40), 
                    BackgroundTransparency = 1, 
                    Text = l_messageText_0, 
                    Font = l_messageFont_0, 
                    TextSize = 20, 
                    TextColor3 = l_appTheme_0.AlertWindow.Message.Color, 
                    TextXAlignment = l_messageTextAlignment_0, 
                    TextWrapped = true
                })
            }), 
            Buttons = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 36), 
                BackgroundTransparency = 1, 
                LayoutOrder = 4
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 10)
                }), 
                CancelButton = l_hasCancelButton_0 and v2.createElement(l_Button_0, {
                    variant = if v12 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                    size = l_ButtonSize_0.Medium, 
                    width = UDim.new(0, v31), 
                    text = v33.cancelText, 
                    LayoutOrder = 1, 
                    onActivated = l_onCancel_0
                }), 
                ConfirmButton = v2.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    size = l_ButtonSize_0.Medium, 
                    width = UDim.new(0, v31), 
                    text = l_isConfirming_0 and "" or l_confirmButtonText_0, 
                    LayoutOrder = 2, 
                    onActivated = l_isConfirming_0 and function() --[[ Line: 177 ]]

                    end or l_onConfirm_0, 
                    isLoading = l_isConfirming_0
                })
            })
        });
    end;
    if l_cancelButtonText_0 then
        return v34({
            cancelText = l_cancelButtonText_0
        });
    else
        return v4({
            cancelText = "Feature.GamePage.LabelCancelField"
        })(v34);
    end;
end;
return (v7(v13));