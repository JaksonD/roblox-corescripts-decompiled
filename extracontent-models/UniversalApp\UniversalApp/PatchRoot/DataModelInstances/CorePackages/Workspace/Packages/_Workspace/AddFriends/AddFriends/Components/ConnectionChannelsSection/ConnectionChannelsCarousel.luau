local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.CollectionViews);
local l_CollectionCarousel_0 = v2.CollectionCarousel;
local l_CollectionItemSize_0 = v2.CollectionViewTypes.CollectionItemSize;
local l_useCollectionLayoutParams_0 = v2.useCollectionLayoutParams;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v7) --[[ Line: 23 ]] --[[ Name: ConnectionChannelsCarousel ]]
    -- upvalues: v1 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_useTokens_0 (copy), l_CollectionCarousel_0 (copy)
    local l_layoutOrder_0 = v7.layoutOrder;
    local l_items_0 = v7.items;
    local l_renderItem_0 = v7.renderItem;
    local l_contextualInfoHeight_0 = v7.contextualInfoHeight;
    local v12, v13 = v1.useState(nil);
    local v14 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.XSmall, v12, true, {
        sideMargin = 0
    });
    local v15 = l_useTokens_0();
    return v1.createElement(l_CollectionCarousel_0, {
        LayoutOrder = l_layoutOrder_0, 
        containerRef = v13, 
        items = l_items_0, 
        numColumns = v14.numColumns, 
        fractionalItemAmount = v14.fractionalItemAmount, 
        columnGap = v14.columnGap, 
        renderItem = l_renderItem_0, 
        getItemHeight = function(v16) --[[ Line: 42 ]] --[[ Name: getItemHeight ]]
            -- upvalues: l_contextualInfoHeight_0 (copy), v15 (copy)
            return v16 + l_contextualInfoHeight_0 * v15.Config.UI.Scale;
        end
    });
end;