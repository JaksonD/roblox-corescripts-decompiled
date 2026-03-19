local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FIntScaleBrazilContentRatingBadge_0 = require(l_Parent_0.SharedFlags).FIntScaleBrazilContentRatingBadge;
local v4 = game:DefineFastFlag("BrazilBadgeDisableTextScaling", false);
local v5 = game:DefineFastFlag("BrazilBadgeDoNotCapitalizeHeader", false);
local v6 = game:DefineFastFlag("BrazilBadgeUseRobotoCondensedFont", false);
local v7 = 2.82 * l_FIntScaleBrazilContentRatingBadge_0;
local v8 = UDim.new(0, 0.08 * l_FIntScaleBrazilContentRatingBadge_0);
local v9 = 0.6 * l_FIntScaleBrazilContentRatingBadge_0;
local v10 = (v6 and 0.13 or 0.08) * l_FIntScaleBrazilContentRatingBadge_0;
local v11 = Color3.fromRGB(0, 0, 0);
local v12 = Color3.fromRGB(255, 255, 255);
local v13 = if v6 then Font.new("rbxasset://fonts/families/RobotoCondensed.json") else nil;
return function(v14) --[[ Line: 29 ]] --[[ Name: BrazilContentRatingBadge ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v7 (copy), v11 (copy), v8 (copy), l_FIntScaleBrazilContentRatingBadge_0 (copy), v5 (copy), v12 (copy), v10 (copy), v13 (copy), v4 (copy), v9 (copy)
    local v15 = l_useLocalization_0({
        ratingTitle = "Feature.Landing.Label.BrazilContentRatingLogoTitle", 
        violenceText = "Feature.Landing.Label.BrazilContentDescriptorViolence", 
        inappropriateLanguageText = "Feature.Landing.Label.BrazilContentDescriptorInappropriateLanguage", 
        usersInteractText = "Feature.Landing.Label.BrazilInteractiveElementDescriptorUsersInteract", 
        inGamePurchasesText = "Feature.Landing.Label.BrazilInteractiveElementDescriptorInGamePurchases"
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(0, v7, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v11, 
        BorderSizePixel = 0, 
        LayoutOrder = v14.LayoutOrder
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = v8
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0), 
            PaddingRight = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0), 
            PaddingBottom = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Header = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0.28 * l_FIntScaleBrazilContentRatingBadge_0), 
            BackgroundTransparency = 1, 
            Text = if v5 then v15.ratingTitle else string.upper(v15.ratingTitle), 
            TextColor3 = v12, 
            TextSize = v10, 
            FontFace = v13, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }, {
            UITextSizeConstraint = if v4 then v1.createElement("UITextSizeConstraint", {
                MaxTextSize = v10
            }) else nil
        }), 
        Content = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v9 + 0.04 * l_FIntScaleBrazilContentRatingBadge_0), 
            BackgroundColor3 = v12, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 0.06 * l_FIntScaleBrazilContentRatingBadge_0)
            }), 
            UIPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0), 
                PaddingRight = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0), 
                PaddingTop = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0), 
                PaddingBottom = UDim.new(0, 0.02 * l_FIntScaleBrazilContentRatingBadge_0)
            }), 
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 0.04 * l_FIntScaleBrazilContentRatingBadge_0)
            }), 
            Icon = v1.createElement("ImageLabel", {
                Size = UDim2.new(0, v9, 0, v9), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/classind_12.png", 
                ScaleType = Enum.ScaleType.Fit, 
                LayoutOrder = 1
            }), 
            TextContainer = v1.createElement("Frame", {
                Size = UDim2.new(1, -(v9 + 0.04 * l_FIntScaleBrazilContentRatingBadge_0), 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                ViolenceText = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0.16 * l_FIntScaleBrazilContentRatingBadge_0), 
                    BackgroundTransparency = 1, 
                    Text = v15.violenceText, 
                    TextColor3 = v11, 
                    TextSize = v10, 
                    FontFace = v13, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    LayoutOrder = 1
                }, {
                    UITextSizeConstraint = if v4 then v1.createElement("UITextSizeConstraint", {
                        MaxTextSize = v10
                    }) else nil
                }), 
                InappropriateLanguageText = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0.16 * l_FIntScaleBrazilContentRatingBadge_0), 
                    BackgroundTransparency = 1, 
                    Text = v15.inappropriateLanguageText, 
                    TextColor3 = v11, 
                    TextSize = v10, 
                    FontFace = v13, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    LayoutOrder = 2
                }, {
                    UITextSizeConstraint = if v4 then v1.createElement("UITextSizeConstraint", {
                        MaxTextSize = v10
                    }) else nil
                })
            })
        }), 
        Footer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0.36 * l_FIntScaleBrazilContentRatingBadge_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            UsersInteractText = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0.14 * l_FIntScaleBrazilContentRatingBadge_0), 
                BackgroundTransparency = 1, 
                Text = v15.usersInteractText, 
                TextColor3 = v12, 
                TextSize = v10, 
                FontFace = v13, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                LayoutOrder = 1
            }, {
                UITextSizeConstraint = if v4 then v1.createElement("UITextSizeConstraint", {
                    MaxTextSize = v10
                }) else nil
            }), 
            InGamePurchasesText = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0.14 * l_FIntScaleBrazilContentRatingBadge_0), 
                BackgroundTransparency = 1, 
                Text = v15.inGamePurchasesText, 
                TextColor3 = v12, 
                TextSize = v10, 
                FontFace = v13, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                LayoutOrder = 2
            }, {
                UITextSizeConstraint = if v4 then v1.createElement("UITextSizeConstraint", {
                    MaxTextSize = v10
                }) else nil
            })
        })
    });
end;