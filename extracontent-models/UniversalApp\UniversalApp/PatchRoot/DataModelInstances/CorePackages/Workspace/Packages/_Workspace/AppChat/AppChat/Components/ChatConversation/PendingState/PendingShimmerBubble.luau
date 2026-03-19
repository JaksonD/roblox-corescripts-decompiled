local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local l_useStyle_0 = v5.Core.Style.useStyle;
local v8 = {
    addTopPadding = false, 
    addBottomPadding = false, 
    backgroundTransparency = 0.4, 
    heightFactor = 1, 
    isIncoming = false, 
    showAvatarCircle = false, 
    widthPercentage = 0.5
};
return function(v9) --[[ Line: 39 ]] --[[ Name: PendingShimmerBubble ]]
    -- upvalues: v3 (copy), v8 (copy), l_useStyle_0 (copy), v6 (copy), v4 (copy)
    local v10 = v3.Dictionary.join(v8, v9);
    local v11 = l_useStyle_0();
    local v12 = v10.style or v11;
    local v13 = if v10.addBottomPadding then v12.Tokens.Global.Space_300 else v12.Tokens.Global.Space_50;
    local l_Size_450_0 = v12.Tokens.Global.Size_450;
    local l_Color_0 = v12.Theme.UIDefault.Color;
    local v16 = v6();
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = if v10.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v12.Tokens.Global.Space_50)
        }), 
        ContentPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v16.left), 
            PaddingRight = UDim.new(0, v16.right), 
            PaddingBottom = UDim.new(0, v13), 
            PaddingTop = if v10.addTopPadding then UDim.new(0, v12.Tokens.Global.Space_300) else nil
        }), 
        IncomingFrame = if v10.isIncoming then v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_Size_450_0, 0, l_Size_450_0), 
            LayoutOrder = 1
        }, {
            AvatarCircleShimmer = if v10.showAvatarCircle then v4.createElement("Frame", {
                BackgroundTransparency = v10.backgroundTransparency, 
                BackgroundColor3 = l_Color_0, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                UICorner = v4.createElement("UICorner", {
                    CornerRadius = UDim.new(1, v12.Tokens.Semantic.Radius.Circle)
                })
            }) else nil
        }) else nil, 
        ShimmerBubble = v4.createElement("Frame", {
            BackgroundTransparency = v10.backgroundTransparency, 
            BackgroundColor3 = l_Color_0, 
            BorderSizePixel = 0, 
            Size = UDim2.new(v10.widthPercentage, 0, 0, v10.heightFactor * v12.Tokens.Global.Size_250 + v12.Tokens.Global.Size_200), 
            LayoutOrder = 2
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v12.Tokens.Semantic.Radius.Large)
            }), 
            UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(800 * v10.widthPercentage, 1000)
            })
        })
    });
end;