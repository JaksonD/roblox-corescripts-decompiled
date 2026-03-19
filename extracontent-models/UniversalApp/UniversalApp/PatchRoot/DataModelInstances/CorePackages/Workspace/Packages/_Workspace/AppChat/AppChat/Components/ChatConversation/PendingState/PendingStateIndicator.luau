local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_BidirectionalFlatList_0 = require(l_Parent_0.VirtualizedList).BidirectionalFlatList;
local v9 = require(script.Parent.PendingShimmerBubble);
local v10 = {
    itemList = {
        {
            addBottomPadding = true, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.5
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.6
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.75
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = false, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }, 
        {
            addBottomPadding = true, 
            heightFactor = 2, 
            isIncoming = true, 
            showAvatarCircle = true, 
            widthPercentage = 0.7
        }, 
        {
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.5
        }, 
        {
            addTopPadding = true, 
            addBottomPadding = false, 
            heightFactor = 1, 
            isIncoming = true, 
            showAvatarCircle = false, 
            widthPercentage = 0.2
        }
    }, 
    size = UDim2.new(1, 0, 1, 0), 
    minTransparency = 0.5, 
    maxTransparency = 0.9
};
return l_memo_0(function(v11) --[[ Line: 113 ]] --[[ Name: PendingStateIndicator ]]
    -- upvalues: v3 (copy), v10 (copy), l_useStyle_0 (copy), l_useCallback_0 (copy), v4 (copy), v9 (copy), l_BidirectionalFlatList_0 (copy)
    local v12 = v3.Dictionary.join(v10, v11);
    local v13 = l_useStyle_0();
    local v14 = v12.style or v13;
    local v15 = #v12.itemList;
    local v19 = l_useCallback_0(function(v16) --[[ Line: 119 ]]
        -- upvalues: v12 (copy), v4 (ref), v9 (ref), v3 (ref)
        local v17 = math.max(1, #v12.itemList);
        local v18 = v12.maxTransparency - (v12.maxTransparency - v12.minTransparency) * (v16.index - 1) / v17;
        return v4.createElement(v9, v3.Dictionary.join(v16.item, {
            backgroundTransparency = v18
        }));
    end, {
        v15
    });
    return v4.createElement("Frame", {
        BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        Size = v12.size, 
        Transparency = v14.Tokens.Global.Color.None.Transparency, 
        LayoutOrder = v12.layoutOrder
    }, {
        ShimmerMessageList = v4.createElement(l_BidirectionalFlatList_0, {
            data = v12.itemList, 
            renderItem = v19, 
            inverted = true, 
            style = {
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                Name = "ShimmerMessageList"
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            keyExtractor = function(_, v21) --[[ Line: 151 ]] --[[ Name: keyExtractor ]]
                return v21;
            end, 
            optimizeInvertedCanvasResize = true
        })
    });
end);