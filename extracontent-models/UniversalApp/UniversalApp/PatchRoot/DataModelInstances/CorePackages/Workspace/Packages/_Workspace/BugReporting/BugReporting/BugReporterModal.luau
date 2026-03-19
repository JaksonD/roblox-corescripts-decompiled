local l_Parent_0 = script:FindFirstAncestor("BugReporting").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.UIBlox);
local _ = require(l_Parent_0.SystemInfoProtocol);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_VerticalScrollView_0 = v3.App.Container.VerticalScrollView;
local _ = require(script.Parent.BugReporterTypes);
return function(v9) --[[ Line: 40 ]] --[[ Name: BugReporterModal ]]
    -- upvalues: v1 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_VerticalScrollView_0 (copy)
    local l_localizedStrings_0 = v9.localizedStrings;
    local l_localizedDeviceSummary_0 = v9.localizedDeviceSummary;
    local l_screenSize_0 = v9.screenSize;
    local l_bottomInset_0 = v9.bottomInset;
    local l_designTokens_0 = v9.designTokens;
    local v15 = {
        modalTitleHeight = l_designTokens_0.Global.Size_600, 
        modalPadding = l_designTokens_0.Global.Size_600, 
        modalButtonHeight = l_designTokens_0.Global.Size_450, 
        contentPadding = l_designTokens_0.Global.Size_300, 
        labelPadding = l_designTokens_0.Global.Size_150, 
        screenShotHeight = l_designTokens_0.Global.Size_1100
    };
    local l_screenshotContentId_0 = v9.screenshotContentId;
    local l_scrollContentHeight_0 = v9.scrollContentHeight;
    local l_onListLayoutSizeChange_0 = v9.onListLayoutSizeChange;
    local l_commentText_0 = v9.commentText;
    local l_commentErrorMessage_0 = v9.commentErrorMessage;
    local l_onCommentTextChange_0 = v9.onCommentTextChange;
    local l_canSubmit_0 = v9.canSubmit;
    local l_onSubmit_0 = v9.onSubmit;
    local l_onClose_0 = v9.onClose;
    local l_Y_0 = v9.onScreenKeyboardSize.Y;
    local v26 = l_Y_0 > 0;
    local v27 = -l_Y_0 + l_bottomInset_0;
    local v28 = v26 and 0 or v15.modalPadding;
    local v29 = l_screenSize_0.Y - l_Y_0 - v15.modalTitleHeight - v15.modalPadding * 2 - v15.modalButtonHeight - v28;
    local v30 = v15.screenShotHeight + v15.contentPadding * 2 + v15.labelPadding;
    local v31 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v31 (copy), v26 (copy), v30 (copy)
        local l_current_0 = v31.current;
        if l_current_0 and v26 then
            l_current_0.CanvasPosition = Vector2.new(0, v30);
        end;
    end, {
        v26, 
        v30
    });
    v1.useEffect(function() --[[ Line: 87 ]]
        -- upvalues: v9 (copy)
        v9.onLoad();
    end, {});
    return v1.createElement(l_PartialPageModal_0, {
        title = l_localizedStrings_0.title, 
        screenSize = l_screenSize_0, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        onActivated = l_onSubmit_0, 
                        isDisabled = l_canSubmit_0 == false, 
                        text = l_localizedStrings_0.submit
                    }
                }
            }
        }, 
        onCloseClicked = l_onClose_0, 
        position = v26 and UDim2.new(0.5, 0, 1, v27) or nil, 
        anchorPoint = v26 and Vector2.new(0.5, 1) or nil, 
        marginSize = 0
    }, {
        Content = v1.createElement(l_VerticalScrollView_0, {
            size = UDim2.new(1, 0, 0, (math.min(l_scrollContentHeight_0 + 2 * v15.contentPadding, v29))), 
            useAutomaticCanvasSize = true, 
            canvasSizeY = UDim.new(), 
            elasticBehavior = Enum.ElasticBehavior.Never, 
            scrollingFrameRef = v31
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v15.contentPadding), 
                [v1.Change.AbsoluteContentSize] = l_onListLayoutSizeChange_0
            }), 
            ContentPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v15.contentPadding), 
                PaddingBottom = UDim.new(0, v15.contentPadding), 
                PaddingLeft = UDim.new(0, v15.contentPadding), 
                PaddingRight = UDim.new(0, v15.contentPadding)
            }), 
            ScreenshotContainer = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    Padding = UDim.new(0, v15.labelPadding), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    ItemLineAlignment = Enum.ItemLineAlignment.End
                }), 
                Screenshot = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 0, 
                    Size = UDim2.new(1, 0, 0, v15.screenShotHeight), 
                    Image = l_screenshotContentId_0, 
                    ScaleType = Enum.ScaleType.Tile, 
                    SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                    LayoutOrder = 1
                }, {
                    UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                        AspectRatio = math.max(1, l_screenSize_0.X) / math.max(1, l_screenSize_0.Y)
                    })
                }), 
                ScreenshotAnnotation = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Font = l_designTokens_0.Semantic.Typography.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Text = l_localizedStrings_0.screenshotAnnotation, 
                    TextSize = l_designTokens_0.Semantic.Typography.Body.FontSize, 
                    TextColor3 = l_designTokens_0.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = l_designTokens_0.Semantic.Color.Text.Default.Transparency, 
                    LineHeight = l_designTokens_0.Global.LineHeight_200, 
                    LayoutOrder = 2
                })
            }), 
            CommentContainer = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, v15.labelPadding)
                }), 
                CommmentLabel = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = l_localizedStrings_0.commentLabel, 
                    TextSize = l_designTokens_0.Semantic.Typography.Body.FontSize, 
                    TextColor3 = l_designTokens_0.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = l_designTokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                    Font = l_designTokens_0.Semantic.Typography.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 1
                }), 
                Commment = v1.createElement("Frame", {
                    BorderSizePixel = 1, 
                    BackgroundColor3 = l_designTokens_0.Semantic.Color.Background.Muted.Color3, 
                    BackgroundTransparency = l_designTokens_0.Semantic.Color.Background.Muted.Transparency, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    UICorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, l_designTokens_0.Semantic.Radius.Small)
                    }), 
                    UIPadding = v1.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, l_designTokens_0.Global.Size_100), 
                        PaddingBottom = UDim.new(0, l_designTokens_0.Global.Size_100), 
                        PaddingLeft = UDim.new(0, l_designTokens_0.Global.Size_100), 
                        PaddingRight = UDim.new(0, l_designTokens_0.Global.Size_100)
                    }), 
                    TextBox = v1.createElement("TextBox", {
                        Text = l_commentText_0, 
                        PlaceholderText = l_localizedStrings_0.commentPlaceholder, 
                        PlaceholderColor3 = l_designTokens_0.Semantic.Color.Text.Default.Color3, 
                        Size = UDim2.new(1, 0, 0, l_designTokens_0.Global.Size_1200), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        ClearTextOnFocus = false, 
                        MultiLine = true, 
                        TextWrapped = true, 
                        ClipsDescendants = true, 
                        OverlayNativeInput = true, 
                        TextColor3 = l_designTokens_0.Semantic.Color.Text.Emphasis.Color3, 
                        TextTransparency = l_designTokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                        BackgroundColor3 = l_designTokens_0.Semantic.Color.Background.Muted.Color3, 
                        BackgroundTransparency = l_designTokens_0.Semantic.Color.Background.Muted.Transparency, 
                        Font = l_designTokens_0.Semantic.Typography.Body.Font, 
                        TextSize = l_designTokens_0.Semantic.Typography.Body.FontSize, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BorderSizePixel = 0, 
                        [v1.Change.Text] = l_onCommentTextChange_0
                    })
                }), 
                CharacterCount = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = l_localizedStrings_0.commentCharacterCount, 
                    TextSize = l_designTokens_0.Semantic.Typography.Body.FontSize, 
                    TextColor3 = l_designTokens_0.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = l_designTokens_0.Semantic.Color.Text.Emphasis.Transparency, 
                    Font = l_designTokens_0.Semantic.Typography.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    LayoutOrder = 3
                })
            }), 
            HelperText = if l_commentErrorMessage_0 ~= nil then v1.createElement("TextLabel", {
                Text = l_commentErrorMessage_0, 
                TextTransparency = l_designTokens_0.Component.HelperText.Error.ContentColor.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = l_designTokens_0.Component.HelperText.Error.ContentColor.Color3, 
                Font = l_designTokens_0.Component.HelperText.Base.Typography.Font, 
                TextSize = l_designTokens_0.Component.HelperText.Base.Typography.FontSize, 
                LineHeight = l_designTokens_0.Component.HelperText.Base.Typography.FontSize, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3
            }) else nil, 
            DeviceSummary = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Font = l_designTokens_0.Semantic.Typography.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Text = l_localizedDeviceSummary_0, 
                TextSize = l_designTokens_0.Semantic.Typography.Body.FontSize, 
                TextColor3 = l_designTokens_0.Semantic.Color.Text.Muted.Color3, 
                TextTransparency = l_designTokens_0.Semantic.Color.Text.Muted.Transparency, 
                LineHeight = l_designTokens_0.Global.LineHeight_200, 
                LayoutOrder = 4
            })
        })
    });
end;