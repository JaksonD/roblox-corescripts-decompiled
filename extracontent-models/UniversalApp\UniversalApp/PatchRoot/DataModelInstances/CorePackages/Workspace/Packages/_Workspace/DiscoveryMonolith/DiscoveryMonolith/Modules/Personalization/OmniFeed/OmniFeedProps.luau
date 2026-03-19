local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.t);
local l_OmniFeedPropsKey_0 = require(l_Parent_0.DiscoveryTypes).OmniFeedPropsKey;
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
        defaultContainerSize = v1.optional(v1.Vector2)
    }), 
    key = l_OmniFeedPropsKey_0, 
    new = function(v3, v4, v5, v6, v7, v8, v9, v10, v11) --[[ Line: 20 ]]
        return {
            feedItemPosition = v3, 
            feedItemStartRow = v4, 
            scrollViewPositionChangedSignal = v5, 
            refreshSignal = v6, 
            appPage = v7, 
            verticalScrollingFrameRef = v8, 
            sduiContext = v9, 
            selectionOrderBase = v10, 
            defaultContainerSize = v11
        };
    end
};