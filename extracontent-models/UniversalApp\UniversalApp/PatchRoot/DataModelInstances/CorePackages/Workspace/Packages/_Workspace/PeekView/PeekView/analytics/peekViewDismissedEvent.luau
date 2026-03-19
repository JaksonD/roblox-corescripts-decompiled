local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.t);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = v1.strictInterface({
    page = v1.string, 
    dismissMethod = v1.string
});
local v4 = v1.strictInterface({
    page = v1.string, 
    dismissMethod = v1.string, 
    locale = v1.optional(v1.string), 
    universeId = v1.string, 
    source = v1.string, 
    index = v1.number
});
local v5 = v1.union(v3, v4);
return {
    dismissMethodEnum = {
        topBarTap = "topBarTap", 
        scrimTap = "scrimTap", 
        swipe = "swipe", 
        handleTap = "handleTap"
    }, 
    logEvent = function(v6, v7, v8) --[[ Line: 31 ]] --[[ Name: logEvent ]]
        -- upvalues: v5 (copy), l_mutedError_0 (copy)
        local v9, v10 = v5(v8);
        if not v9 then
            l_mutedError_0(v10);
        end;
        v6:sendEventDeferred(v7, "uiPeekViewDismissed", v8);
    end
};