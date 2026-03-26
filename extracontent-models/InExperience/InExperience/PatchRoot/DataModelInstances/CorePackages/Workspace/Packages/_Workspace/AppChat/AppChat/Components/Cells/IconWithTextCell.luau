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
    Size = UDim2.new(1, 0, 1, 0), 
    onActivated = function() --[[ Line: 44 ]] --[[ Name: onActivated ]]
        print("IconWithTextCell onActivated");
    end, 
    secondaryIcon = "", 
    secondaryIconSize = 24, 
    iconCellWidth = 60, 
    LayoutOrder = 0, 
    style = v2.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    }), 
    showDivider = true
};
return l_memo_0(function(v10) --[[ Line: 67 ]] --[[ Name: IconWithTextCell ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy), v6 (copy), l_ImageSetLabel_0 (copy)
    local v11 = v2.Dictionary.join(v9, v10);
    local l_style_0 = v11.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    local v15 = v11.primaryIcon == nil;
    return v3.createElement(v6, {
        Size = v11.Size, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_style_0.Tokens.Global.Color.None.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        LayoutOrder = v11.LayoutOrder, 
        onActivated = v11.onActivated, 
        showDivider = v11.showDivider, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        dividerTransparency = l_Theme_0.Divider.Transparency, 
        isDisabled = v11.isDisabled, 
        avatarCircleCellWidth = v11.iconCellWidth, 
        testId = v10.testId
    }, {
        leftFrame = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.new(1, -v11.iconCellWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            leftListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
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
            text = v3.createElement("TextLabel", {
                Size = UDim2.new(1, v15 and 0 or -v11.iconCellWidth, 1, 0), 
                Text = v11.Text, 
                TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        rightFrame = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(v11.iconCellWidth, v11.iconCellWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            secondaryIcon = v11.secondaryIcon and v3.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v11.secondaryIcon, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v11.secondaryIconSize, v11.secondaryIconSize)
            })
        })
    });
end);