local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v6 = require(script.Parent.BaseCell);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local _ = require(l_script_FirstAncestor_0.types);
local v9 = {
    Text = "titleText", 
    primaryIconSize = 32, 
    isDisabled = false, 
    topPadding = 8, 
    bottomPadding = 8, 
    widthScale = 1, 
    widthOffset = 0, 
    onActivated = function() --[[ Line: 54 ]] --[[ Name: onActivated ]]
        print("FlexIconWithTextCell onActivated");
    end, 
    secondaryIcon = "", 
    secondaryIconSize = 24, 
    iconCellWidth = 60, 
    LayoutOrder = 0, 
    style = l_TestStyle_0, 
    BackgroundTransparency = nil, 
    showDivider = true
};
return l_memo_0(function(v10) --[[ Line: 70 ]] --[[ Name: FlexIconWithTextCell ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), v6 (copy), l_ImageSetLabel_0 (copy)
    local v11 = v2.Dictionary.union(v9, v10);
    local l_style_0 = v11.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v15 = v11.primaryIcon == nil;
    return v3.createElement(v6, {
        Size = UDim2.new(1, v11.widthOffset, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = v11.BackgroundTransparency or l_Theme_0.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        LayoutOrder = v11.LayoutOrder, 
        onActivated = v11.onActivated, 
        showDivider = v11.showDivider, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        isDisabled = v11.isDisabled, 
        avatarCircleCellWidth = v11.iconCellWidth
    }, {
        leftFrame = v3.createElement("Frame", {
            Size = UDim2.new(1, -v11.iconCellWidth, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            leftListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            leftFramePadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v11.topPadding), 
                PaddingBottom = UDim.new(0, v11.bottomPadding)
            }), 
            imageFrame = if not v15 then v3.createElement("Frame", {
                Size = UDim2.new(0, v11.iconCellWidth, 0, v11.primaryIconSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                primaryIcon = v3.createElement(l_ImageSetLabel_0, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v11.primaryIcon, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v11.primaryIconSize, 0, v11.primaryIconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1
                })
            }) else nil, 
            textFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                uiListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                titleText = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, v15 and 0 or -v11.iconCellWidth, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v11.Text, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }), 
                subTitleText = if v11.SubTitleText then v3.createElement("TextLabel", {
                    Size = UDim2.new(1, v15 and 0 or -v11.iconCellWidth, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v11.SubTitleText, 
                    TextSize = l_Font_0.BodySmall.RelativeSize * l_Font_0.BaseSize, 
                    Font = l_Font_0.BodySmall.Font, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }) else nil
            })
        }), 
        rightFrame = if v11.secondaryIcon then v3.createElement("Frame", {
            Size = UDim2.fromOffset(v11.iconCellWidth, v11.iconCellWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            secondaryIcon = v3.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v11.secondaryIcon, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v11.secondaryIconSize, v11.secondaryIconSize)
            })
        }) else nil
    });
end);