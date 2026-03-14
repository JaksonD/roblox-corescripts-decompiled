local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v4 = require(l_Modules_0.LuaApp.Enum.DevSubPlanStatus);
local v5 = v2.union(v2.literal(v4.Open), v2.literal(v4.Closed), v2.literal(v4.Archived));
local v6 = v2.strictInterface({
    id = v2.number, 
    universeId = v2.number, 
    imageAssetId = v2.number, 
    status = v5, 
    name = v2.string, 
    description = v2.string, 
    priceInRobux = v2.number, 
    renewalPeriod = v2.literal("Monthly"), 
    created = v2.string, 
    updated = v2.string
});
local v7 = v2.strictInterface({
    id = v2.number, 
    name = v2.string
});
local v8 = v2.union(v2.literal(v3.Active), v2.literal(v3.Inactive));
local v9 = v2.strictInterface({
    id = v2.string, 
    planId = v2.number, 
    userId = v2.number, 
    status = v8, 
    isAutoRenewing = v2.boolean, 
    startDate = v2.string, 
    expirationDate = v2.string
});
local v10 = v2.strictInterface({
    data = v2.array(v9), 
    auxiliaryData = v2.strictInterface({
        plans = v2.map(v2.string, v6), 
        universes = v2.map(v2.string, v7)
    }), 
    previousPageCursor = v2.optional(v2.string), 
    nextPageCursor = v2.optional(v2.string)
});
local v11 = v2.interface({
    id = v2.string, 
    status = v8, 
    isAutoRenewing = v2.boolean, 
    expirationDate = v2.string, 
    planData = v6, 
    gameData = v7
});
return {
    PlanCheck = v6, 
    PlanStatusCheck = v5, 
    UniverseCheck = v7, 
    SubscriptionCheck = v9, 
    SubscriptionStatusCheck = v8, 
    SubscriptionsResponseCheck = v10, 
    DevSubJsonCheck = v11
};