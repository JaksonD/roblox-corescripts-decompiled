local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.t);
local l_OmniFeedPropsKey_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedPropsKey;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
return {
    interface = v1.strictInterface({
        feedItemPosition = v1.number, 
        feedItemStartRow = v1.optional(v1.number), 
        scrollViewPositionChangedSignal = v1.table, 
        refreshSignal = v1.table, 
        appPage = v1.string, 
        verticalScrollingFrameRef = v1.table, 
        sduiContext = v1.table, 
        selectionOrderBase = v1.optional(v1.number), 
        defaultContainerSize = v1.optional(v1.Vector2), 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v1.optional(v1.boolean) else nil, 
        onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v1.optional(v1.callback) else nil
    }), 
    key = l_OmniFeedPropsKey_0, 
    new = function(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 26 ]]
        -- upvalues: l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
        return {
            feedItemPosition = v5, 
            feedItemStartRow = v6, 
            scrollViewPositionChangedSignal = v7, 
            refreshSignal = v8, 
            appPage = v9, 
            verticalScrollingFrameRef = v10, 
            sduiContext = v11, 
            selectionOrderBase = v12, 
            defaultContainerSize = v13, 
            appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v14 else nil, 
            onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v15 else nil
        };
    end
};