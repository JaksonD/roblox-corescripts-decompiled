local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Icon_0 = v2.Icon;
local l_Image_0 = v2.Image;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagSduiAttributionRowV2_0 = require(l_Parent_0.SharedFlags).FFlagSduiAttributionRowV2;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v10) --[[ Line: 64 ]] --[[ Name: SduiAttributionRow ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_useTokens_0 (copy), l_FFlagSduiAttributionRowV2_0 (copy), v1 (copy), l_View_0 (copy), v2 (copy), l_Image_0 (copy), l_Text_0 (copy), l_Icon_0 (copy)
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if l_FFlagSduiServerCompat_0 then
        v11 = v10.layoutOrder;
        v12 = v10.zIndex;
        v13 = v10.position;
        v14 = v10.size;
    else
        v11 = v10.LayoutOrder;
        v12 = v10.ZIndex;
        v13 = v10.Position;
        v14 = v10.Size;
    end;
    local v15 = l_useTokens_0();
    local l_TitleMedium_0 = v15.Typography.TitleMedium;
    local l_BodyMedium_0 = v15.Typography.BodyMedium;
    if l_FFlagSduiAttributionRowV2_0 then
        l_TitleMedium_0 = v10.titleFontStyle or l_TitleMedium_0;
        l_BodyMedium_0 = v10.subtitleFontStyle or l_BodyMedium_0;
        return v1.createElement(l_View_0, {
            tag = "row size-full-0 auto-y align-y-center align-x-left gap-medium", 
            ZIndex = v12, 
            Position = v13, 
            LayoutOrder = v11, 
            Active = v10.onActivated ~= nil, 
            onActivated = v10.onActivated, 
            selection = {
                Selectable = false
            }, 
            Size = v14 or UDim2.new(1, 0, 0, v15.Size.Size_1000), 
            testId = v10.testId, 
            stateLayer = {
                affordance = v2.Enums.StateLayerAffordance.None
            }
        }, {
            Image = v10.image and v1.createElement(l_Image_0, {
                tag = "radius-medium", 
                Image = v10.image, 
                Size = v10.imageSize or UDim2.new(0, v15.Size.Size_1000, 0, v15.Size.Size_1000), 
                LayoutOrder = 1
            }), 
            TextContainer = v1.createElement(l_View_0, {
                LayoutOrder = 2, 
                tag = "col auto-xy fill"
            }, {
                Title = v1.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = v10.title, 
                    TextWrapped = v10.titleTextWrap, 
                    TextTruncate = v10.titleTextTruncate or Enum.TextTruncate.SplitWord, 
                    textStyle = v10.titleTextColor or v15.DarkMode.Content.Emphasis, 
                    fontStyle = v10.titleFontStyle or l_TitleMedium_0, 
                    tag = "auto-xy text-align-x-left", 
                    Size = v10.textContainerSize or UDim2.new(1, 0, 0, v15.Size.Size_500)
                }), 
                SubtitleContainer = v1.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    Size = v10.textContainerSize or UDim2.new(1, 0, 0, v15.Size.Size_500), 
                    onActivated = v10.subtitleOnActivated, 
                    tag = {
                        ["row size-full-0 auto-y"] = true, 
                        ["align-y-center gap-xsmall"] = v10.subtitleIconName ~= nil
                    }
                }, {
                    Subtitle = v1.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = v10.subtitle, 
                        onActivated = v10.subtitleOnActivated, 
                        fontStyle = v10.subtitleFontStyle or l_BodyMedium_0, 
                        textStyle = v10.subtitleTextColor or v15.DarkMode.Content.Emphasis, 
                        TextWrapped = v10.subtitleTextWrap, 
                        TextTruncate = v10.subtitleTextTruncate or Enum.TextTruncate.SplitWord, 
                        tag = "auto-xy text-align-x-left"
                    }), 
                    Icon = if v10.subtitleIconName and v10.subtitleBackgroundIconName then v1.createElement(l_View_0, {
                        LayoutOrder = 2, 
                        tag = "auto-xy"
                    }, {
                        BackgroundIcon = v1.createElement(l_Icon_0, {
                            size = if v10.subtitleIconSize then v10.subtitleIconSize else nil, 
                            name = v10.subtitleBackgroundIconName, 
                            style = if v10.subtitleBackgroundIconStyle then v10.subtitleBackgroundIconStyle else v15.Color.System.Emphasis
                        }), 
                        ForegroundIcon = v1.createElement(l_Icon_0, {
                            size = if v10.subtitleIconSize then v10.subtitleIconSize else nil, 
                            variant = if v10.subtitleIconVariant then v10.subtitleIconVariant else nil, 
                            name = v10.subtitleIconName, 
                            style = v10.subtitleIconStyle
                        })
                    }) else if v10.subtitleIconName then v1.createElement(l_Icon_0, {
                        LayoutOrder = 2, 
                        size = if v10.subtitleIconSize then v10.subtitleIconSize else nil, 
                        name = v10.subtitleIconName, 
                        variant = if v10.subtitleIconVariant then v10.subtitleIconVariant else nil, 
                        style = if v10.subtitleIconStyle then v10.subtitleIconStyle else v15.Color.System.Emphasis
                    }) else nil
                }), 
                Caption = if v10.caption then v1.createElement(l_Text_0, {
                    LayoutOrder = 3, 
                    Text = v10.caption, 
                    textStyle = v10.captionTextColor or v15.Color.Content.Default, 
                    fontStyle = v10.captionFontStyle or v15.Typography.CaptionBody, 
                    tag = "auto-xy text-align-x-left text-truncate-split-word", 
                    Size = v10.textContainerSize
                }) else nil
            }), 
            RightButtonContent = v10.rightButtonContent and v1.createElement(l_View_0, {
                LayoutOrder = 3, 
                tag = "auto-xy row"
            }, {
                ButtonContent = v10.rightButtonContent
            })
        });
    else
        return v1.createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, v15.Size.Size_1000), 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v11, 
            ZIndex = v12, 
            Position = v13, 
            [v1.Event.Activated] = v10.onActivated, 
            Text = "", 
            Active = v10.onActivated ~= nil, 
            Selectable = false, 
            [v1.Tag] = if v10.testId then ("data-testid=%*"):format(v10.testId) else nil
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, v15.Gap.Medium), 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                ItemLineAlignment = Enum.ItemLineAlignment.Start
            }), 
            Image = v1.createElement("ImageLabel", {
                Image = v10.image, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, v15.Size.Size_1000, 0, v15.Size.Size_1000), 
                LayoutOrder = 1
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, v15.Radius.Medium)
                })
            }), 
            TextContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                UIFlexItem = v1.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                }), 
                Title = v1.createElement("TextLabel", {
                    Text = v10.title, 
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, v15.Size.Size_500), 
                    TextSize = l_TitleMedium_0.FontSize, 
                    Font = l_TitleMedium_0.Font, 
                    TextColor3 = v15.DarkMode.Content.Emphasis.Color3, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                }), 
                Subtitle = v1.createElement("TextLabel", {
                    Text = v10.subtitle, 
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, v15.Size.Size_500), 
                    TextSize = l_BodyMedium_0.FontSize, 
                    Font = l_BodyMedium_0.Font, 
                    TextColor3 = v15.DarkMode.Content.Emphasis.Color3, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.SplitWord
                })
            }), 
            ButtonContainer = v1.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                ButtonContent = v10.rightButtonContent
            })
        });
    end;
end);