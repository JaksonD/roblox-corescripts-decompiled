local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Responsive);
local l_Core_0 = v1.Core;
local l_App_0 = v1.App;
local l_useStyle_0 = l_Core_0.Style.useStyle;
local l_Button_0 = v1.App.Button.Button;
local l_Images_0 = l_App_0.ImageSet.Images;
local l_IconButton_0 = l_App_0.Button.IconButton;
local l_IconSize_0 = l_App_0.ImageSet.Enum.IconSize;
local l_ImageSetLabel_0 = l_Core_0.ImageSet.ImageSetLabel;
local l_getIconSize_0 = l_App_0.ImageSet.getIconSize;
local v14 = l_Images_0["icons/navigation/close"];
return function(v15) --[[ Line: 54 ]] --[[ Name: InlinePrompt ]]
    -- upvalues: l_useStyle_0 (copy), l_getIconSize_0 (copy), l_IconSize_0 (copy), v2 (copy), v4 (copy), l_ImageSetLabel_0 (copy), l_Button_0 (copy), v3 (copy), l_IconButton_0 (copy), v14 (copy)
    local v16 = l_useStyle_0();
    local l_Tokens_0 = v16.Tokens;
    local v18 = if v15.onDismiss then l_getIconSize_0(l_IconSize_0.Small) else 0;
    local v19 = (v15.iconImage and 36 or 0) + v18;
    local v20 = v2.useRef(nil);
    local v21 = v4.useBreakpointXOrSmaller(v4.Keys.Small);
    local v22 = v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1
    }, {
        UILayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = if v21 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center
        }), 
        Icon = if v15.iconImage then v2.createElement(l_ImageSetLabel_0, {
            LayoutOrder = 1, 
            Selectable = false, 
            Size = UDim2.fromOffset(36, 36), 
            Image = v15.iconImage, 
            ImageColor3 = l_Tokens_0.Semantic.Color.Icon.Emphasis.Color3, 
            ImageTransparency = l_Tokens_0.Semantic.Color.Icon.Emphasis.Transparency, 
            BackgroundTransparency = 1
        }) else nil, 
        MiddleFrame = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(1, -v19, 0, 0), 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UILayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 12)
            }), 
            Text = v2.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                }), 
                TextLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                UIPadding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Title = v2.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Text = v15.titleMessage, 
                    BackgroundTransparency = 1, 
                    TextColor3 = v16.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v16.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v16.Tokens.Semantic.Typography.CaptionHeader.FontSize, 
                    Font = v16.Tokens.Semantic.Typography.CaptionHeader.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    TextScaled = false, 
                    LineHeight = v16.Tokens.Global.LineHeight_400
                }), 
                Subline = if v15.sublineMessage then v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Text = v15.sublineMessage, 
                    BackgroundTransparency = 1, 
                    TextColor3 = v16.Tokens.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = v16.Tokens.Semantic.Color.Text.Default.Transparency, 
                    TextSize = v16.Tokens.Semantic.Typography.CaptionBody.FontSize, 
                    Font = v16.Tokens.Semantic.Typography.CaptionBody.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    TextScaled = false, 
                    LineHeight = 1
                }) else nil
            }), 
            Button = if not v21 and v15.buttonProps then v2.createElement(l_Button_0, v3.Dictionary.join({
                size = UDim2.new(0, 0, 0, 0), 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2
            }, v15.buttonProps)) else nil
        }), 
        DismissButtonFrame = if v15.onDismiss then v2.createElement(l_IconButton_0, {
            backgroundTransparency = 1, 
            icon = v14, 
            iconSize = l_IconSize_0.Small, 
            size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
            onActivated = v15.onDismiss, 
            layoutOrder = 3
        }) else nil
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = v15.backgroundTransparency or l_Tokens_0.Semantic.Color.BackgroundUi.Default.Transparency, 
        BackgroundColor3 = v15.backgroundColor3 or l_Tokens_0.Semantic.Color.BackgroundUi.Default.Color3, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        ref = v20
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        ContainerRef = v2.createElement(v4.ContainerRef.Provider, {
            value = v20
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            UILayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            HorizontalContent = v22, 
            Button = if v21 and v15.buttonProps then v2.createElement(l_Button_0, v3.Dictionary.join({
                size = UDim2.new(1, 0, 0, 0), 
                fitContent = false, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2
            }, v15.buttonProps)) else nil
        })
    });
end;