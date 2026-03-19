local l_Parent_0 = script:FindFirstAncestor("ItemDetails").Parent;
local v1 = require(l_Parent_0.React);
local l_Focusable_0 = require(l_Parent_0.RoactGamepad).Focusable;
local v3 = require(l_Parent_0.VerifiedBadges);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ShimmerPanel_0 = v4.App.Loading.ShimmerPanel;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v11 = l_Images_0["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small";
local v12 = Vector2.new(14, 14);
local v13 = UDim2.new(0.3, 0, 0.8, 0);
return (v1.forwardRef(function(v14, v15) --[[ Line: 45 ]]
    -- upvalues: l_useStyle_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v12 (copy), l_Focusable_0 (copy), v1 (copy), v3 (copy), l_ShimmerPanel_0 (copy), v13 (copy), l_ImageSetLabel_0 (copy), v11 (copy)
    local l_LayoutOrder_0 = v14.LayoutOrder;
    local l_infoName_0 = v14.infoName;
    local l_infoData_0 = v14.infoData;
    local l_onActivate_0 = v14.onActivate;
    local l_hasVerifiedBadge_0 = v14.hasVerifiedBadge;
    local l_isLoading_0 = v14.isLoading;
    local v22 = l_useStyle_0();
    local l_Theme_0 = v22.Theme;
    local l_Font_0 = v22.Font;
    local v25 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    local l_Color_0 = l_Theme_0.TextEmphasis.Color;
    local v27 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
    local v28 = -11 - v12.X;
    local v29 = v15 ~= nil;
    local v30 = if v29 then l_Focusable_0.ImageButton else "ImageButton";
    local v31 = not l_isLoading_0 and not l_hasVerifiedBadge_0;
    local v32 = not l_isLoading_0 and l_hasVerifiedBadge_0;
    return v1.createElement(v30, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, v14.hideDivider and 52 or 53), 
        [v1.Event.Activated] = l_onActivate_0, 
        NextSelectionUp = v14.NextSelectionUp, 
        NextSelectionDown = v14.NextSelectionDown, 
        NextSelectionLeft = v14.NextSelectionLeft, 
        NextSelectionRight = v14.NextSelectionRight, 
        ref = v15, 
        SelectionImageObject = v29 and v25 or nil, 
        Selectable = v14.Selectable
    }, {
        Container = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, v14.hideDivider and 0 or -1)
        }, {
            InfoNameTextLabel = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = l_infoName_0, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = v27, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            InfoDataWithEmoji = v32 and v1.createElement(v3.EmojiWrapper, {
                emoji = v3.emoji.verified, 
                font = if l_onActivate_0 then l_Font_0.Header2.Font else l_Font_0.Body.Font, 
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.new(1, if l_onActivate_0 then v28 else 0, 0, 0), 
                size = UDim2.new(0.5, 0, 1, 0), 
                automaticSize = Enum.AutomaticSize.None, 
                horizontalAlignment = Enum.HorizontalAlignment.Right, 
                verticalAlignment = Enum.VerticalAlignment.Center
            }, {
                InfoDataTextLabel = v1.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = l_onActivate_0 and l_Font_0.Header2.Font or l_Font_0.Body.Font, 
                    Size = UDim2.new(0, 0, 1, 0), 
                    Text = l_infoData_0, 
                    TextColor3 = if l_onActivate_0 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                    TextSize = v27, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextScaled = v14.TextScaled, 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            InfoDataTextLabel = v31 and v1.createElement("TextLabel", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, if l_onActivate_0 then v28 else 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = if l_onActivate_0 then l_Font_0.Header2.Font else l_Font_0.Body.Font, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = l_infoData_0, 
                TextColor3 = if l_onActivate_0 then l_Theme_0.TextEmphasis.Color else l_Theme_0.TextDefault.Color, 
                TextSize = v27, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextScaled = v14.TextScaled, 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                TextSizeConstraint = v14.TextScaled and v1.createElement("UITextSizeConstraint", {
                    MaxTextSize = v27
                })
            }), 
            LoadingShimmer = l_isLoading_0 and v1.createElement(l_ShimmerPanel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = v13
            }), 
            LinkIcon = l_onActivate_0 and v1.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.fromOffset(v12.X, v12.Y), 
                Image = v11, 
                ImageColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            })
        }), 
        Divider = not v14.hideDivider and v1.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, -1)
        })
    });
end));