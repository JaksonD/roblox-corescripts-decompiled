local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.enumerate);
local v3 = require(l_Parent_0.Utility.strict);
local v4 = v2("ItemIconType", {
    "AnimationBundle", 
    "Bundle", 
    "DynamicHead"
});
local v5 = v2("Restriction", {
    "Limited", 
    "LimitedUnique", 
    "Collectible"
});
local v6 = v2("StatusStyle", {
    "Alert", 
    "Info", 
    "PendingIcon", 
    "AlertIcon"
});
return v3({
    ItemIconType = v4, 
    Restriction = v5, 
    StatusStyle = v6
}, script.Name);