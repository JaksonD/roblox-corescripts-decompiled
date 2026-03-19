local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Foundation);
local l_Radius_0 = v6.Enums.Radius;
local l_Skeleton_0 = v6.Skeleton;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_useTextSizeOffset_0 = v5.Core.Style.useTextSizeOffset;
local v11 = require(script.Parent.BaseCell);
local v12 = require(l_script_FirstAncestor_0.Components.Cells.ConversationFacePile);
local v13 = require(script.Parent.AvatarCircle);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v17 = {
    BackgroundColor3 = Color3.new(1, 1, 1), 
    BackgroundTransparency = 0, 
    onPressedBackgroundColor3 = Color3.new(0, 0.2, 0.3), 
    onPressedBackgroundTransparency = 1, 
    testId = nil, 
    avatarCircleCellWidth = 60, 
    avatarCircleSize = 36, 
    avatarCircleBackgroundColor3 = Color3.new(0.4, 0.4, 0.4), 
    avatarCircleDividerColor3 = Color3.new(0.2, 0.2, 0.2), 
    avatarCircleDividerTransparency = 0, 
    avatarCirclePresenceImage = nil, 
    subTitleText = nil, 
    subTitleTextFont = Enum.Font.Gotham, 
    subTitleTextTransparency = 0, 
    subTitleTextColor3 = Color3.new(0.1, 0.1, 0.1), 
    subTitleTextSize = 15, 
    subTitlePadding = 2, 
    subTitleIconColor3 = Color3.new(0.1, 0.1, 0.1), 
    subTitleIconTransparency = 0, 
    titleText = "titleText", 
    titleFont = Enum.Font.Gotham, 
    titleTextTransparency = 0, 
    titleTextColor3 = Color3.new(0, 0, 0), 
    titleTextSize = 20, 
    secondaryTitleText = nil, 
    secondaryTitleFont = Enum.Font.Gotham, 
    secondaryTitleTextTransparency = 0, 
    secondaryTitleTextColor3 = Color3.new(0.2, 0.2, 0.2), 
    secondaryTitleTextSize = 16, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227), 
    thumbnails = {}, 
    conversationId = nil, 
    childWidth = 0, 
    onActivated = nil, 
    onCircleActivated = nil, 
    Size = UDim2.new(1, 0, 1, 0), 
    isLoading = false, 
    hideLeftAvatarPadding = false, 
    paddingLeft = 0, 
    paddingRight = 0
};
return v2.memo(function(v18) --[[ Line: 144 ]] --[[ Name: PresenceBubbleCell ]]
    -- upvalues: v3 (copy), v17 (copy), v2 (copy), l_useTextSizeOffset_0 (copy), l_Text_0 (copy), v11 (copy), v15 (copy), v12 (copy), v13 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v6 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_ImageSetLabel_0 (copy)
    local v19 = v3.Dictionary.join(v17, v18);
    local v20, v21 = v2.useState(0);
    local v22 = l_useTextSizeOffset_0();
    local v23 = v19.subTitleTextSize + v22;
    local v24 = v19.titleTextSize + v22;
    local v25 = v19.subTitleTextSize + v22;
    local v26 = v2.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: l_Text_0 (ref), v19 (copy)
        return l_Text_0.GetTextWidth(v19.titleText, v19.titleFont, v19.titleTextSize);
    end, {
        v19.titleText, 
        v19.titleFont, 
        v19.titleTextSize, 
        v22
    });
    local v27 = v19.conversationId ~= nil;
    local v28 = {
        layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v29 = -(v19.paddingLeft + v19.paddingRight + v19.childWidth);
    v28 = v3.Dictionary.join(v28, v19.children or {});
    return v2.createElement(v11, {
        Size = v19.Size, 
        BackgroundTransparency = v19.BackgroundTransparency, 
        BackgroundColor3 = v19.BackgroundColor3, 
        dividerColor3 = v19.dividerColor3, 
        dividerTransparency = v19.dividerTransparency, 
        avatarCircleCellWidth = v19.avatarCircleCellWidth, 
        onPressedBackgroundColor3 = v19.onPressedBackgroundColor3, 
        onPressedBackgroundTransparency = v19.onPressedBackgroundTransparency, 
        testId = if v15 then v19.testId else nil, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v19.LayoutOrder, 
        onActivated = v19.onActivated, 
        showDivider = v19.showDivider
    }, {
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, v29, 1, 0), 
            BackgroundTransparency = 1
        }, {
            uiPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v19.paddingLeft)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            circleHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v19.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if v19.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
                }), 
                circleSizeContainer = not v19.isLoading and v2.createElement("Frame", {
                    Size = UDim2.new(0, v19.avatarCircleSize, 0, v19.avatarCircleSize), 
                    BackgroundTransparency = 1
                }, {
                    conversationFacePile = if v27 then v2.createElement(v12, {
                        conversationId = v19.conversationId, 
                        onActivated = v19.onCircleActivated or v19.onActivated, 
                        selectable = v19.onCircleActivated ~= nil and nil
                    }) else nil, 
                    avatarCircle = if not v27 then v2.createElement(v13, {
                        circleColor3 = v19.BackgroundColor3, 
                        circleTransparency = v19.BackgroundTransparency, 
                        circleInteriorBackgroundColor3 = v19.avatarCircleBackgroundColor3, 
                        circleDividerColor3 = v19.avatarCircleDividerColor3, 
                        circleDividerTransparency = v19.avatarCircleDividerTransparency, 
                        thumbnails = v19.thumbnails, 
                        presenceImage = v19.avatarCirclePresenceImage, 
                        presenceImageColor3 = v19.avatarCirclePresenceImageColor3, 
                        presenceImageTransparency = v19.avatarCirclePresenceImageTransparency, 
                        selectable = (not l_FFlagEnableAppChatFocusableFixes_0 or v19.onCircleActivated ~= nil) and nil, 
                        showNewPresenceImage = v19.showNewPresenceImage, 
                        onActivated = v19.onCircleActivated or v19.onActivated
                    }) else nil
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, v19.avatarCircleSize, 0, v19.avatarCircleSize), 
                    radius = l_Radius_0.Circle
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -v19.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 2)
                }), 
                titleContainer = not v19.isLoading and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v24), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = function(v30) --[[ Line: 267 ]]
                        -- upvalues: v21 (copy)
                        v21(v30.AbsoluteSize.X);
                    end
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    title = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.min(v26, v20), 0, v24), 
                        TextSize = v19.titleTextSize, 
                        TextColor3 = v19.titleTextColor3, 
                        TextTransparency = v19.titleTextTransparency, 
                        Font = v19.titleFont, 
                        Text = v19.titleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    subscriptionBadge = v2.createElement(v6.View, {
                        tag = "size-400-400", 
                        LayoutOrder = 2, 
                        Visible = v19.isRobloxSubscriber == true
                    }, {
                        Icon = v2.createElement(v6.Icon, {
                            name = v6.Enums.IconName.PaperAirplane, 
                            size = v6.Enums.IconSize.Small, 
                            style = {
                                Color3 = v19.titleTextColor3, 
                                Transparency = v19.titleTextTransparency
                            }
                        })
                    }), 
                    secondaryTitle = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.max(v20 - v26 - 4 - (l_FFlagEnableBlackbirdCheckDev_0 and v19.isRobloxSubscriber and 20 or 0), 0), 0, v19.secondaryTitleTextSize), 
                        TextSize = v19.secondaryTitleTextSize, 
                        TextColor3 = v19.secondaryTitleTextColor3, 
                        TextTransparency = v19.secondaryTitleTextTransparency, 
                        Font = v19.secondaryTitleFont, 
                        Text = v19.secondaryTitleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = l_FFlagEnableBlackbirdCheckDev_0 and 3 or 2
                    })
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v24), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                userPresenceLabelWithIcon = if v19.subTitleText then v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v23), 
                    LayoutOrder = 2
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v19.subTitlePadding)
                    }), 
                    subTitleIcon = if not v19.subTitleIcon or v19.isLoading then nil else v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v23, 0, v23), 
                        BackgroundTransparency = 1, 
                        Image = v19.subTitleIcon, 
                        ImageColor3 = v19.subTitleIconColor3, 
                        ImageTransparency = v19.subTitleIconTransparency, 
                        LayoutOrder = 1
                    }), 
                    userPresenceLabel = if v19.isLoading then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v25), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    }) else v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextSize = v19.subTitleTextSize + 1, 
                        TextColor3 = v19.subTitleTextColor3, 
                        TextTransparency = v19.subTitleTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v19.subTitleText, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Font = v19.subTitleTextFont, 
                        Size = UDim2.new(1, if v19.subTitleIcon then -v23 - v19.subTitlePadding else 0, 0, v25), 
                        LayoutOrder = 2
                    })
                }) else nil
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(0, v19.childWidth, 1, 0), 
            Position = UDim2.new(1, -v19.childWidth, 0, 0), 
            BackgroundTransparency = 1
        }, v3.Dictionary.join({
            uiPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v19.paddingRight)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, v28))
    });
end);