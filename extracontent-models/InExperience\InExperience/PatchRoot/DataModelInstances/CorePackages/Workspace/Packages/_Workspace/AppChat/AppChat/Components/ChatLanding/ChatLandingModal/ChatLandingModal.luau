local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.types);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_ButtonStack_0 = v6.App.Button.ButtonStack;
local l_Enum_0 = v6.App.Button.Enum;
local v10 = require(l_script_FirstAncestor_0.Components.Label.Label);
local v11 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v12 = require(l_Parent_0.AppChatNetworking);
local v13 = require(l_Parent_0.Foundation);
local v14 = v6.App.ImageSet.Images["icons/actions/favoriteOn"];
local l_X_0 = v13.Enums.IconName.X;
local v20 = {
    [v12.Constants.ModalContentType.Link] = function(v16) --[[ Line: 32 ]]
        -- upvalues: l_useStyle_0 (copy), v5 (copy)
        local v17 = l_useStyle_0();
        return v5.createElement("TextButton", {
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = v16.layoutOrder, 
            Font = v17.Font.Body.Font, 
            BorderSizePixel = 0, 
            Text = ("<u>%*</u>"):format(v16.content.text), 
            RichText = true, 
            TextColor3 = v17.Theme.TextDefault.Color, 
            TextSize = v17.Font.CaptionBody.RelativeSize * v17.Font.BaseSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v5.Event.Activated] = v16.content.onActivated
        });
    end, 
    [v12.Constants.ModalContentType.Text] = function(v18) --[[ Line: 50 ]]
        -- upvalues: l_useStyle_0 (copy), v5 (copy)
        local v19 = l_useStyle_0();
        return v5.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            LayoutOrder = v18.layoutOrder, 
            Font = v19.Font.Body.Font, 
            BorderSizePixel = 0, 
            Text = v18.content.text, 
            TextColor3 = v19.Theme.TextDefault.Color, 
            TextSize = v19.Font.CaptionBody.RelativeSize * v19.Font.BaseSize, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y
        });
    end
};
local v21 = {
    titleText = "", 
    bodyText = "", 
    actionText = "", 
    additionalContent = {}, 
    buttonType = l_Enum_0.ButtonType.PrimarySystem, 
    paddingX = 12, 
    hideActionButton = false, 
    onActivated = function() --[[ Line: 99 ]] --[[ Name: onActivated ]]

    end, 
    onDismissed = function() --[[ Line: 100 ]] --[[ Name: onDismissed ]]

    end
};
return v5.forwardRef(function(v22, v23) --[[ Line: 103 ]]
    -- upvalues: v4 (copy), v21 (copy), l_useStyle_0 (copy), v11 (copy), v13 (copy), v5 (copy), v20 (copy), v2 (copy), v10 (copy), v14 (copy), l_X_0 (copy), l_ButtonStack_0 (copy)
    local v24 = v4.Dictionary.join(v21, v22);
    local v25 = l_useStyle_0();
    local v26 = v24.style or v25;
    local v27 = v11();
    local l_Space_100_0 = v26.Tokens.Global.Space_100;
    local l_Size_500_0 = v26.Tokens.Global.Size_500;
    local l_Size_600_0 = v13.Hooks.useTokens().Size.Size_600;
    local v37, v38 = v5.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v4 (ref), v24 (copy), v20 (ref), v5 (ref), v2 (ref)
        local v36 = v4.Dictionary.map(v24.additionalContent, function(v31, v32) --[[ Line: 115 ]]
            -- upvalues: v20 (ref), v5 (ref), v2 (ref)
            local v33 = v20[v31.type];
            local v34 = v32 + 2;
            local v35 = if v33 then v5.createElement(v33, {
                layoutOrder = v34, 
                content = v31
            }) else nil;
            if v35 then
                return v35, (("additionalContent_%*"):format(v32));
            else
                v2:warning((("Unsupported additional content type: %*"):format(v31.type)));
                return nil, nil;
            end;
        end);
        return v36, not v4.isEmpty(v36);
    end, {
        v24.additionalContent
    });
    return v5.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v24.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v23
    }, {
        ContentPadding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_100_0), 
            PaddingBottom = UDim.new(0, l_Space_100_0), 
            PaddingLeft = UDim.new(0, v27.left), 
            PaddingRight = UDim.new(0, v27.right)
        }), 
        Content = v5.createElement("Frame", {
            BackgroundTransparency = v26.Theme.SystemPrimaryContent.Transparency, 
            BackgroundColor3 = v26.Theme.SystemPrimaryContent.Color, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Layout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_100_0 * 2)
            }), 
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, v26.Tokens.Semantic.Radius.Medium)
            }), 
            UIStroke = v5.createElement("UIStroke", {
                Thickness = v26.Tokens.Global.Stroke_100, 
                Color = v26.Theme.Divider.Color, 
                Transparency = v26.Theme.Divider.Transparency
            }), 
            ContentPadding = v5.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_Space_100_0), 
                PaddingBottom = UDim.new(0, l_Space_100_0), 
                PaddingLeft = UDim.new(0, l_Space_100_0), 
                PaddingRight = UDim.new(0, l_Space_100_0)
            }), 
            IconAndTextFrame = v5.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                HorizontalLayout = v5.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, l_Space_100_0)
                }), 
                TextFrame = v5.createElement("Frame", {
                    Size = UDim2.new(1, -l_Size_600_0 - l_Space_100_0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Layout = v5.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, l_Space_100_0)
                    }), 
                    LabelAndTextFrame = v5.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        Layout = v5.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, l_Space_100_0)
                        }), 
                        TitleLabelWithIcon = if not v24.titleLabelText then nil else v5.createElement(v10, {
                            bodyText = v24.titleLabelText, 
                            iconImage = v14, 
                            layoutOrder = 1
                        }), 
                        TitleTextLabel = v5.createElement("TextLabel", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            LayoutOrder = 2, 
                            Font = v26.Font.Title.Font, 
                            BorderSizePixel = 0, 
                            Text = v24.titleText, 
                            TextColor3 = v26.Theme.TextEmphasis.Color, 
                            TextSize = v26.Font.Header2.RelativeSize * v26.Font.BaseSize, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            UIFlexItem = v5.createElement("UIFlexItem", {
                                FlexMode = Enum.UIFlexMode.Fill
                            })
                        })
                    }), 
                    BodyTextLabel = v5.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, 0), 
                        LayoutOrder = 2, 
                        Font = v26.Font.Body.Font, 
                        BorderSizePixel = 0, 
                        Text = v24.bodyText, 
                        TextColor3 = v26.Theme.TextDefault.Color, 
                        TextSize = v26.Font.CaptionBody.RelativeSize * v26.Font.BaseSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    AdditionalContent = if v38 then v5.createElement(v5.Fragment, {}, v37) else nil
                }), 
                ImageIcon = v5.createElement(v13.View, {
                    onActivated = v24.onDismissed, 
                    LayoutOrder = 2, 
                    tag = "auto-xy x-default-transparent radius-xsmall"
                }, {
                    Icon = v5.createElement(v13.Icon, {
                        size = l_Size_600_0, 
                        name = l_X_0
                    })
                })
            }), 
            Buttons = if v24.hideActionButton then nil else v5.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_Size_500_0)
            }, {
                ButtonStack = v5.createElement(l_ButtonStack_0, {
                    forcedFillDirection = Enum.FillDirection.Horizontal, 
                    buttons = {
                        {
                            buttonType = v24.buttonType, 
                            props = {
                                onActivated = v24.onActivated, 
                                text = v24.actionText
                            }
                        }
                    }
                })
            })
        })
    });
end);