local l_Parent_0 = script:FindFirstAncestor("Impressions").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ImpressionsTracker);
local v3 = require(script.Parent.useViewportBounds);
return function(v4) --[[ Line: 21 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = v3(v4.parentRef);
    return v1.createElement(v2, {
        pageContext = v4.pageContext, 
        parentRef = v4.parentRef, 
        impressionsTag = v4.impressionsTag, 
        scrollViewPositionChangedSignal = v4.scrollViewPositionChangedSignal, 
        sendImpressions = v4.sendImpressions, 
        dataUpdatedTimestamp = v4.dataUpdatedTimestamp, 
        viewPortBounds = v5
    });
end;