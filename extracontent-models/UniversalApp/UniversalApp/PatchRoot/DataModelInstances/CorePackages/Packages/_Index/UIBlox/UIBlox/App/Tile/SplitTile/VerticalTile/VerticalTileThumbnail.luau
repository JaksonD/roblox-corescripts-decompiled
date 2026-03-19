local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Loading.LoadableImage);
local _ = require(l_Parent_0.Style.StyleTypes);
local v5 = UDim.new(0, 8);
return function(v6) --[[ Line: 27 ]] --[[ Name: VerticalTileThumbnail ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    local l_aspectRatio_0 = v6.aspectRatio;
    local l_isTopRounded_0 = v6.isTopRounded;
    local l_isBottomRounded_0 = v6.isBottomRounded;
    local l_thumbnail_0 = v6.thumbnail;
    local l_border_0 = v6.border;
    local v12 = l_isTopRounded_0 and l_isBottomRounded_0;
    local v13 = not v12 and (l_isTopRounded_0 or l_isBottomRounded_0);
    local v14 = if l_border_0 ~= nil then l_border_0.CornerRadius else v5;
    return v2.createElement("Frame", {
        Size = if l_aspectRatio_0 then UDim2.new(1, 0, l_aspectRatio_0, 0) else UDim2.new(1, 0, 1, 0), 
        SizeConstraint = if l_aspectRatio_0 then Enum.SizeConstraint.RelativeXX else nil, 
        BackgroundTransparency = 1
    }, {
        TopFrame = v2.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            Size = UDim2.fromScale(1, not v13 and 1 or 0.5), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            TopImage = v2.createElement(v3, {
                BackgroundTransparency = 1, 
                Image = l_thumbnail_0, 
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, not v13 and 1 or 2), 
                cornerRadius = if not not v12 or l_isTopRounded_0 then v14 else nil, 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            })
        }), 
        BottomFrame = if v13 then v2.createElement("Frame", {
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.fromScale(1, 0.5), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        }, {
            BottomImage = v2.createElement(v3, {
                BackgroundTransparency = 1, 
                Image = l_thumbnail_0, 
                Position = UDim2.fromScale(0, -1), 
                Size = UDim2.fromScale(1, 2), 
                cornerRadius = if not not v12 or l_isBottomRounded_0 then v14 else nil, 
                showFailedStateWhenLoadingFailed = true, 
                useShimmerAnimationWhileLoading = true
            })
        }) else nil
    });
end;