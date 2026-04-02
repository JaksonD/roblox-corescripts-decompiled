local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local v6 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v7 = require(l_Parent_0.Foundation);
local v8 = require(script.Parent.Utils.getBoldTextTheme);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v13 = l_Images_0["icons/navigation/pushRight"];
CustomConversationListEntry = function(v14) --[[ Line: 31 ]] --[[ Name: CustomConversationListEntry ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), l_useTextSizeOffset_0 (copy), v6 (copy), l_IconSize_0 (copy), v7 (copy), v2 (copy), v12 (copy), l_ImageSetLabel_0 (copy), v13 (copy)
    local v15 = l_useStyle_0();
    local v16 = v8(v15);
    local v17 = l_useTextSizeOffset_0();
    local v18 = v6();
    local l_onActivated_0 = v14.onActivated;
    local l_titleText_0 = v14.titleText;
    local l_Font_0 = v16.Font.Header2.Font;
    local l_Transparency_0 = v16.Theme.TextEmphasis.Transparency;
    local l_Color_0 = v16.Theme.TextEmphasis.Color;
    local v24 = v16.Font.Header2.RelativeSize * v16.Font.BaseSize;
    local v25 = v24 + v17;
    local l_subTitleText_0 = v14.subTitleText;
    local l_Font_1 = v15.Font.CaptionBody.Font;
    local l_Transparency_1 = v15.Theme.TextDefault.Transparency;
    local l_Color_1 = v15.Theme.TextDefault.Color;
    local v30 = v15.Font.CaptionBody.RelativeSize * v15.Font.BaseSize;
    local v31 = v30 + v17;
    local v32 = l_IconSize_0.Regular + 12;
    local v33 = 60 - (60 - l_IconSize_0.Regular) / 2;
    local l_View_0 = v7.View;
    return v2.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v14.entryHeight), 
        BackgroundColor3 = v15.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v15.Theme.BackgroundDefault.Transparency, 
        onActivated = l_onActivated_0, 
        testId = if v12 then v14.testId else nil
    }, {
        leftAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, -v32, 1, 0), 
            BackgroundTransparency = 1
        }, {
            padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v18.left)
            }), 
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            iconHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, v33, 1, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 0
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }), 
                icon = v2.createElement(l_ImageSetLabel_0, {
                    BackgroundColor3 = v16.Theme.BackgroundUIDefault.Color, 
                    BackgroundTransparency = v16.Theme.BackgroundUIDefault.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                    ScaleType = Enum.ScaleType.Stretch, 
                    Image = v14.entryIcon, 
                    ImageColor3 = v15.Theme.IconEmphasis.Color, 
                    ImageTransparency = v15.Theme.IconEmphasis.Transparency
                }, {
                    corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    })
                })
            }), 
            centerContent = v2.createElement("Frame", {
                Size = UDim2.new(1, -60, 1, 0), 
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
                title = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v25), 
                    TextSize = v24, 
                    TextColor3 = l_Color_0, 
                    TextTransparency = l_Transparency_0, 
                    Font = l_Font_0, 
                    Text = l_titleText_0 or "", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }), 
                subTitle = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v31), 
                    TextSize = v30, 
                    TextColor3 = l_Color_1, 
                    TextTransparency = l_Transparency_1, 
                    Font = l_Font_1, 
                    Text = l_subTitleText_0, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                })
            })
        }), 
        rightAlign = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v18.right)
            }), 
            icon = v2.createElement(l_ImageSetLabel_0, {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                ScaleType = Enum.ScaleType.Stretch, 
                Image = v13, 
                ImageColor3 = v15.Theme.IconEmphasis.Color, 
                ImageTransparency = v15.Theme.IconEmphasis.Transparency
            })
        }), 
        divider = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            divider = v2.createElement("Frame", {
                BackgroundTransparency = v15.Theme.Divider.Transparency, 
                BackgroundColor3 = v15.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -v33, 0, 1)
            })
        })
    });
end;
return CustomConversationListEntry;