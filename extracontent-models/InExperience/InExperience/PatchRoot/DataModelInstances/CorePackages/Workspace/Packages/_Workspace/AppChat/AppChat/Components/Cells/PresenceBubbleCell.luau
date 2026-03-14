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
local v16 = {
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
return v2.memo(function(v17) --[[ Line: 140 ]] --[[ Name: PresenceBubbleCell ]]
    -- upvalues: v3 (copy), v16 (copy), v2 (copy), l_useTextSizeOffset_0 (copy), l_Text_0 (copy), v11 (copy), v15 (copy), v12 (copy), v13 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy)
    local v18 = v3.Dictionary.join(v16, v17);
    local v19, v20 = v2.useState(0);
    local v21 = l_useTextSizeOffset_0();
    local v22 = v18.subTitleTextSize + v21;
    local v23 = v18.titleTextSize + v21;
    local v24 = v18.subTitleTextSize + v21;
    local v25 = v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: l_Text_0 (ref), v18 (copy)
        return l_Text_0.GetTextWidth(v18.titleText, v18.titleFont, v18.titleTextSize);
    end, {
        v18.titleText, 
        v18.titleFont, 
        v18.titleTextSize, 
        v21
    });
    local v26 = v18.conversationId ~= nil;
    local v27 = {
        layout = v2.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v28 = -(v18.paddingLeft + v18.paddingRight + v18.childWidth);
    v27 = v3.Dictionary.join(v27, v18.children or {});
    return v2.createElement(v11, {
        Size = v18.Size, 
        BackgroundTransparency = v18.BackgroundTransparency, 
        BackgroundColor3 = v18.BackgroundColor3, 
        dividerColor3 = v18.dividerColor3, 
        dividerTransparency = v18.dividerTransparency, 
        avatarCircleCellWidth = v18.avatarCircleCellWidth, 
        onPressedBackgroundColor3 = v18.onPressedBackgroundColor3, 
        onPressedBackgroundTransparency = v18.onPressedBackgroundTransparency, 
        testId = if v15 then v18.testId else nil, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        LayoutOrder = v18.LayoutOrder, 
        onActivated = v18.onActivated, 
        showDivider = v18.showDivider
    }, {
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, v28, 1, 0), 
            BackgroundTransparency = 1
        }, {
            uiPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v18.paddingLeft)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            circleHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v18.avatarCircleCellWidth, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = if v18.hideLeftAvatarPadding then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center
                }), 
                circleSizeContainer = not v18.isLoading and v2.createElement("Frame", {
                    Size = UDim2.new(0, v18.avatarCircleSize, 0, v18.avatarCircleSize), 
                    BackgroundTransparency = 1
                }, {
                    conversationFacePile = if v26 then v2.createElement(v12, {
                        conversationId = v18.conversationId, 
                        onActivated = v18.onCircleActivated or v18.onActivated, 
                        selectable = v18.onCircleActivated ~= nil and nil
                    }) else nil, 
                    avatarCircle = if not v26 then v2.createElement(v13, {
                        circleColor3 = v18.BackgroundColor3, 
                        circleTransparency = v18.BackgroundTransparency, 
                        circleInteriorBackgroundColor3 = v18.avatarCircleBackgroundColor3, 
                        circleDividerColor3 = v18.avatarCircleDividerColor3, 
                        circleDividerTransparency = v18.avatarCircleDividerTransparency, 
                        thumbnails = v18.thumbnails, 
                        presenceImage = v18.avatarCirclePresenceImage, 
                        presenceImageColor3 = v18.avatarCirclePresenceImageColor3, 
                        presenceImageTransparency = v18.avatarCirclePresenceImageTransparency, 
                        selectable = (not l_FFlagEnableAppChatFocusableFixes_0 or v18.onCircleActivated ~= nil) and nil, 
                        showNewPresenceImage = v18.showNewPresenceImage, 
                        onActivated = v18.onCircleActivated or v18.onActivated
                    }) else nil
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, v18.avatarCircleSize, 0, v18.avatarCircleSize), 
                    radius = l_Radius_0.Circle
                })
            }), 
            conversationInfo = v2.createElement("Frame", {
                Size = UDim2.new(1, -v18.avatarCircleCellWidth, 1, 0), 
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
                titleContainer = not v18.isLoading and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v23), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = function(v29) --[[ Line: 263 ]]
                        -- upvalues: v20 (copy)
                        v20(v29.AbsoluteSize.X);
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
                        Size = UDim2.new(0, math.min(v25, v19), 0, v23), 
                        TextSize = v18.titleTextSize, 
                        TextColor3 = v18.titleTextColor3, 
                        TextTransparency = v18.titleTextTransparency, 
                        Font = v18.titleFont, 
                        Text = v18.titleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1
                    }), 
                    secondaryTitle = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, math.max(v19 - v25 - 4, 0), 0, v18.secondaryTitleTextSize), 
                        TextSize = v18.secondaryTitleTextSize, 
                        TextColor3 = v18.secondaryTitleTextColor3, 
                        TextTransparency = v18.secondaryTitleTextTransparency, 
                        Font = v18.secondaryTitleFont, 
                        Text = v18.secondaryTitleText or "", 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 2
                    })
                }) or v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v23), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                userPresenceLabelWithIcon = if v18.subTitleText then v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v22), 
                    LayoutOrder = 2
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v18.subTitlePadding)
                    }), 
                    subTitleIcon = if not v18.subTitleIcon or v18.isLoading then nil else v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, v22, 0, v22), 
                        BackgroundTransparency = 1, 
                        Image = v18.subTitleIcon, 
                        ImageColor3 = v18.subTitleIconColor3, 
                        ImageTransparency = v18.subTitleIconTransparency, 
                        LayoutOrder = 1
                    }), 
                    userPresenceLabel = if v18.isLoading then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.6, 0, 0, v24), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    }) else v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        TextSize = v18.subTitleTextSize + 1, 
                        TextColor3 = v18.subTitleTextColor3, 
                        TextTransparency = v18.subTitleTextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v18.subTitleText, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Font = v18.subTitleTextFont, 
                        Size = UDim2.new(1, if v18.subTitleIcon then -v22 - v18.subTitlePadding else 0, 0, v24), 
                        LayoutOrder = 2
                    })
                }) else nil
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(0, v18.childWidth, 1, 0), 
            Position = UDim2.new(1, -v18.childWidth, 0, 0), 
            BackgroundTransparency = 1
        }, v3.Dictionary.join({
            uiPadding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v18.paddingRight)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        }, v27))
    });
end);