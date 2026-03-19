local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v5 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v5.Skeleton;
local l_Radius_0 = v5.Enums.Radius;
local l_View_0 = v5.View;
local l_useTextSizeOffset_0 = v5.Hooks.useTextSizeOffset;
local v10 = require(l_Parent_0.GameCollections);
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local l_useGetGameTileHeight_0 = v10.useGetGameTileHeight;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function(v14) --[[ Line: 21 ]] --[[ Name: EventsSkeleton ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), l_useTextSizeOffset_0 (copy), l_useDesignTokens_0 (copy), l_useGetGameTileHeight_0 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_CollectionCarousel_0 (copy)
    local v15 = l_useLocalization_0({
        events = v4.EventsListTitle
    });
    local v16 = l_useTextSizeOffset_0();
    local v17 = l_useDesignTokens_0();
    local v18 = l_useGetGameTileHeight_0(false, "Event", true, false, false, v16, v17.Global.Size_350 + v17.Global.Space_100);
    local v22 = v2.useCallback(function(_, v20, v21) --[[ Line: 38 ]]
        -- upvalues: v2 (ref), l_View_0 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        return v2.createElement(l_View_0, {
            tag = "col gap-medium radius-medium", 
            LayoutOrder = v20, 
            Size = v21
        }, {
            ThumbnailSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0.6), 
                radius = l_Radius_0.Medium
            }), 
            NameSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 2, 
                Size = UDim2.fromScale(0.8, 0.15), 
                radius = l_Radius_0.Medium
            }), 
            ButtonSkeleton = v2.createElement(l_Skeleton_0, {
                LayoutOrder = 3, 
                Size = UDim2.fromScale(1, 0.1), 
                radius = l_Radius_0.Medium
            })
        }), "Skeleton_" .. v20;
    end, {});
    local v25 = v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v14 (copy)
        local v23 = {};
        for v24 = 1, v14.numSkeletons do
            table.insert(v23, v24);
        end;
        return v23;
    end, {
        v14.numSkeletons
    });
    return v2.createElement(l_CollectionCarousel_0, {
        scrollingFrameRef = nil, 
        title = v15.events, 
        hideHeaderButton = true, 
        items = v25, 
        renderItem = v22, 
        getItemHeight = v18, 
        numColumns = 1, 
        columnGap = v17.Global.Space_150, 
        fractionalItemAmount = 0.33, 
        sideMargin = 0
    });
end;