local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.Common.Text);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local v6 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v7 = require(l_Modules_0.LuaApp.FitChildren);
local v8 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v9 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v9.Button;
local l_ButtonVariant_0 = v9.Enums.ButtonVariant;
local l_ButtonSize_0 = v9.Enums.ButtonSize;
local l_useTokens_0 = v9.Hooks.useTokens;
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant);
local v15 = game:DefineFastFlag("AlertWindowUseFoundationTokens", false);
local v16 = v2.PureComponent:extend("AlertWindow");
v16.defaultProps = {
    titleTextSize = 25, 
    messageTextAlignment = Enum.TextXAlignment.Center
};
v16.render = function(v17) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v4 (copy), v2 (copy), v7 (copy), v8 (copy), l_Button_0 (copy), v14 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy), v5 (copy)
    local v18 = if v15 then nil else v17.props.appTheme;
    local v19 = if v15 then v17.props.tokens else nil;
    local l_containerWidth_0 = v17.props.containerWidth;
    local l_titleText_0 = v17.props.titleText;
    local l_titleTextSize_0 = v17.props.titleTextSize;
    local l_titleFont_0 = v17.props.titleFont;
    local l_messageText_0 = v17.props.messageText;
    local l_messageFont_0 = v17.props.messageFont;
    local l_confirmButtonText_0 = v17.props.confirmButtonText;
    local l_cancelButtonText_0 = v17.props.cancelButtonText;
    local l_onConfirm_0 = v17.props.onConfirm;
    local l_isConfirming_0 = v17.props.isConfirming;
    local l_hasCancelButton_0 = v17.props.hasCancelButton;
    local l_onCancel_0 = v17.props.onCancel;
    local l_messageTextAlignment_0 = v17.props.messageTextAlignment;
    local v33 = math.min(l_containerWidth_0 - 20 - 20, 400);
    local v34 = v33 - 20 - 20;
    local v35 = l_hasCancelButton_0 and (v34 - 10) / 2 or v34;
    local v36 = v4.GetTextHeight(l_messageText_0, l_messageFont_0, 20, v34);
    local function v38(v37) --[[ Line: 74 ]]
        -- upvalues: v2 (ref), v7 (ref), v33 (copy), v15 (ref), v19 (copy), v18 (copy), v8 (ref), l_titleText_0 (copy), l_titleFont_0 (copy), l_titleTextSize_0 (copy), v36 (copy), l_messageText_0 (copy), l_messageFont_0 (copy), l_messageTextAlignment_0 (copy), l_hasCancelButton_0 (copy), l_Button_0 (ref), v14 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), v35 (copy), l_onCancel_0 (copy), l_isConfirming_0 (copy), l_confirmButtonText_0 (copy), l_onConfirm_0 (copy)
        return v2.createElement(v7.FitFrame, {
            Size = UDim2.new(0, v33, 0, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v15 then v19.Color.Surface.Surface_300.Color3 else v18.AlertWindow.Background.Color, 
            BorderSizePixel = 0, 
            Active = true, 
            fitAxis = v7.FitAxis.Height
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
            Title = v2.createElement(v7.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                fitAxis = v7.FitAxis.Height
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
                Title = v2.createElement(v8, {
                    Size = UDim2.new(1, 0, 0, 28), 
                    Position = UDim2.new(0, 0, 0, 11), 
                    BackgroundTransparency = 1, 
                    Text = l_titleText_0, 
                    Font = l_titleFont_0, 
                    TextSize = l_titleTextSize_0, 
                    TextColor3 = if v15 then v19.Color.Content.Emphasis.Color3 else v18.AlertWindow.Title.Color, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextWrapped = true, 
                    LayoutOrder = 2, 
                    fitAxis = v7.FitAxis.Height
                }), 
                PaddingBottom = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 11), 
                    LayoutOrder = 3
                })
            }), 
            Divider = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                BackgroundColor3 = if v15 then v19.Color.Stroke.Default.Color3 else v18.AlertWindow.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }), 
            Message = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 86 + v36), 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                Message = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v36), 
                    Position = UDim2.new(0, 0, 0, 40), 
                    BackgroundTransparency = 1, 
                    Text = l_messageText_0, 
                    Font = l_messageFont_0, 
                    TextSize = 20, 
                    TextColor3 = if v15 then v19.Color.Content.Default.Color3 else v18.AlertWindow.Message.Color, 
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
                    variant = if v14 then l_ButtonVariant_0.Standard else l_ButtonVariant_0.Subtle, 
                    size = l_ButtonSize_0.Medium, 
                    width = UDim.new(0, v35), 
                    text = v37.cancelText, 
                    LayoutOrder = 1, 
                    onActivated = l_onCancel_0
                }), 
                ConfirmButton = v2.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    size = l_ButtonSize_0.Medium, 
                    width = UDim.new(0, v35), 
                    text = l_isConfirming_0 and "" or l_confirmButtonText_0, 
                    LayoutOrder = 2, 
                    onActivated = l_isConfirming_0 and function() --[[ Line: 189 ]]

                    end or l_onConfirm_0, 
                    isLoading = l_isConfirming_0
                })
            })
        });
    end;
    if l_cancelButtonText_0 then
        return v38({
            cancelText = l_cancelButtonText_0
        });
    else
        return v5({
            cancelText = "Feature.GamePage.LabelCancelField"
        })(v38);
    end;
end;
local function v42(v39) --[[ Line: 205 ]] --[[ Name: AlertWindowWithTokens ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), v16 (copy)
    local v40 = l_useTokens_0();
    local v41 = table.clone(v39);
    v41.tokens = v40;
    return v3.createElement(v16, v41);
end;
if v15 then
    return v42;
else
    return (v6(v16));
end;