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
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListRelativeTimestamps);
local v18 = {
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
return v2.memo(function(v19) --[[ Line: 146 ]] --[[ Name: PresenceBubbleCell ]]
    -- upvalues: v3 (copy), v18 (copy), v2 (copy), l_useTextSizeOffset_0 (copy), l_Text_0 (copy), v11 (copy), v15 (copy), v12 (copy), v13 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), v17 (copy), v6 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_ImageSetLabel_0 (copy)
    local v20 = v3.Dictionary.join(v18, v19);
    local v21, v22 = v2.useState(0);
    local v23 = l_useTextSizeOffset_0();
    local v24 = v20.subTitleTextSize + v23;
    local v25 = v20.titleTextSize + v23;
    local v26 = v20.subTitleTextSize + v23;
    local v27 = v2.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: l_Text_0 (ref), v20 (copy)
        return l_Text_0.GetTextWidth(v20.titleText, v20.titleFont, v20.titleTextSize);
    end, {
        v20.titleText, 
        v20.titleFont, 
        v20.titleTextSize, 
        v23
    });
    local v28 = v20.conversationId ~= nil;
    local v29 = {
        layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v30 = -(v20.paddingLeft + v20.paddingRight + v20.childWidth);
    v29 = v3.Dictionary.join(v29, v20.children or {});
    return v2.createElement(v11, {
        Size = v20.Size, 
        BackgroundTransparency = v20.BackgroundTransparency, 
        BackgroundColor3 = v20.BackgroundColor3, 
        dividerColor3 = v20.dividerColor3, 
        dividerTransparency = v20.dividerTransparency, 
        avatarCircleCellWidth = v20.avatarCircleCellWidth, 
        onPressedBackgroundColor3 = v20.onPressedBackgroundColor3, 
        onPressedBackgroundTransparency = v20.onPressedBackgroundTransparency, 
        testId = if v15 then v20.testId else nil, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v20.LayoutOrder, 
        onActivated = v20.onActivated, 
        showDivider = v20.showDivider
    }, {
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, v30, 1, 0), 
            BackgroundTransparency = 1
        }, {
            uiPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v20.paddingLeft)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            circleHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v20.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if v20.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
                }), 
                circleSizeContainer = not v20.isLoading and v2.createElement("Frame", {
                    Size = UDim2.new(0, v20.avatarCircleSize, 0, v20.avatarCircleSize), 
                    BackgroundTransparency = 1
                }, {
                    conversationFacePile = if v28 then v2.createElement(v12, {
                        conversationId = v20.conversationId, 
                        onActivated = v20.onCircleActivated or v20.onActivated, 
                        selectable = v20.onCircleActivated ~= nil and nil
                    }) else nil, 
                    avatarCircle = if not v28 then v2.createElement(v13, {
                        circleColor3 = v20.BackgroundColor3, 
                        circleTransparency = v20.BackgroundTransparency, 
                        circleInteriorBackgroundColor3 = v20.avatarCircleBackgroundColor3, 
                        circleDividerColor3 = v20.avatarCircleDividerColor3, 
                        circleDividerTransparency = v20.avatarCircleDividerTransparency, 
                        thumbnails = v20.thumbnails, 
                        presenceImage = v20.avatarCirclePresenceImage, 
                        presenceImageColor3 = v20.avatarCirclePresenceImageColor3, 
                        presenceImageTransparency = v20.avatarCirclePresenceImageTransparency, 
                        selectable = (not l_FFlagEnableAppChatFocusableFixes_0 or v20.onCircleActivated ~= nil) and nil, 
                        showNewPresenceImage = v20.showNewPresenceImage, 
                        onActivated = v20.onCircleActivated or v20.onActivated
                    }) else nil
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, v20.avatarCircleSize, 0, v20.avatarCircleSize), 
                    radius = l_Radius_0.Circle
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -v20.avatarCircleCellWidth, 1, 0), 
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
                titleContainer = not v20.isLoading and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v25), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = function(v31) --[[ Line: 269 ]]
                        -- upvalues: v22 (copy)
                        v22(v31.AbsoluteSize.X);
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
                        Size = UDim2.new(0, math.min(v27, v21), 0, v25), 
                        TextSize = v20.titleTextSize, 
                        TextColor3 = v20.titleTextColor3, 
                        TextTransparency = v20.titleTextTransparency, 
                        Font = v20.titleFont, 
                        Text = v20.titleText or "", 
                        TextTruncate = if v17 then Enum.TextTruncate.SplitWord else Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    subscriptionBadge = v2.createElement(v6.View, {
                        tag = "size-400-400", 
                        LayoutOrder = 2, 
                        Visible = v20.isRobloxSubscriber == true
                    }, {
                        Icon = v2.createElement(v6.Icon, {
                            name = v6.Enums.IconName.PaperAirplane, 
                            size = v6.Enums.IconSize.Small, 
                            style = {
                                Color3 = v20.titleTextColor3, 
                                Transparency = v20.titleTextTransparency
                            }
                        })
                    }), 
                    secondaryTitle = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.max(v21 - v27 - 4 - (l_FFlagEnableBlackbirdCheckDev_0 and v20.isRobloxSubscriber and 20 or 0), 0), 0, v20.secondaryTitleTextSize), 
                        TextSize = v20.secondaryTitleTextSize, 
                        TextColor3 = v20.secondaryTitleTextColor3, 
                        TextTransparency = v20.secondaryTitleTextTransparency, 
                        Font = v20.secondaryTitleFont, 
                        Text = v20.secondaryTitleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = l_FFlagEnableBlackbirdCheckDev_0 and 3 or 2
                    })
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v25), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                userPresenceLabelWithIcon = if v20.subTitleText then v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v24), 
                    LayoutOrder = 2
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v20.subTitlePadding)
                    }), 
                    subTitleIcon = if not v20.subTitleIcon or v20.isLoading then nil else v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v24, 0, v24), 
                        BackgroundTransparency = 1, 
                        Image = v20.subTitleIcon, 
                        ImageColor3 = v20.subTitleIconColor3, 
                        ImageTransparency = v20.subTitleIconTransparency, 
                        LayoutOrder = 1
                    }), 
                    userPresenceLabel = if v20.isLoading then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v26), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    }) else v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextSize = v20.subTitleTextSize + 1, 
                        TextColor3 = v20.subTitleTextColor3, 
                        TextTransparency = v20.subTitleTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v20.subTitleText, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Font = v20.subTitleTextFont, 
                        Size = UDim2.new(1, if v20.subTitleIcon then -v24 - v20.subTitlePadding else 0, 0, v26), 
                        LayoutOrder = 2
                    })
                }) else nil
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(0, v20.childWidth, 1, 0), 
            Position = UDim2.new(1, -v20.childWidth, 0, 0), 
            BackgroundTransparency = 1
        }, v3.Dictionary.join({
            uiPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v20.paddingRight)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, v29))
    });
end);