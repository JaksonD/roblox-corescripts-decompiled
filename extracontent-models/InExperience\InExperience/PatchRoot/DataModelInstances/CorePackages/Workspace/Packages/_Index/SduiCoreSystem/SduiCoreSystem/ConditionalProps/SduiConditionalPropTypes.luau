local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {
    friendInGame = "friendInGame", 
    imageQualityLevel = "imageQualityLevel", 
    isPortrait = "isPortrait", 
    lastInput = "lastInput", 
    maxScreenWidth = "maxScreenWidth", 
    minScreenWidth = "minScreenWidth", 
    performanceLevel = "performanceLevel", 
    preferredInput = "preferredInput", 
    isSpatial = "isSpatial"
};
local v3 = {
    imageQualityLevel = "imageQualityLevel", 
    isPortrait = "isPortrait", 
    lastInput = "lastInput", 
    maxScreenWidth = "maxScreenWidth", 
    minScreenWidth = "minScreenWidth", 
    performanceLevel = "performanceLevel", 
    preferredInput = "preferredInput", 
    isSpatial = "isSpatial"
};
local v4 = v1.union(v1.literal("Touch"), v1.literal("Pointer"), v1.literal("Directional"));
local v5 = v1.interface({
    imageQualityLevel = v1.optional(v1.string), 
    isPortrait = v1.optional(v1.boolean), 
    isSpatial = v1.optional(v1.boolean), 
    lastInput = v1.optional(v4), 
    maxScreenWidth = v1.optional(v1.number), 
    minScreenWidth = v1.optional(v1.number), 
    performanceLevel = v1.optional(v1.string), 
    preferredInput = v1.optional(v4)
});
local v6 = {
    propOverrides = v1.table, 
    conditions = v1.optional(v5)
};
return {
    SduiConditionKey = v2, 
    SduiResponsiveKey = v3, 
    ConditionalPropsInterface = v6
};