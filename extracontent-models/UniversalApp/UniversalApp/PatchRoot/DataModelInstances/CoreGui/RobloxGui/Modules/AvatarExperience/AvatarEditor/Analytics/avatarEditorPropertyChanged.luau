local l_CorePackages_0 = game:GetService("CorePackages");
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
return function(v2, v3, v4, v5, v6, v7, v8) --[[ Line: 9 ]] --[[ Name: analyticsImpl ]]
    -- upvalues: l_ImpressionEnums_0 (copy)
    assert(type(v3) == "string", "Expected eventContext to be a string");
    assert(type(v4) == "string", "Expected propertyName to be a string");
    local v9 = true;
    if type(v5) ~= "string" then
        v9 = type(v5) == "number";
    end;
    assert(v9, "Expected propertyValue to be a string");
    assert(type(v6) == "number", "Expected currentCategoryIndex to be a number");
    assert(type(v7) == "number", "Expected tabIndex to be a number");
    local v10 = nil;
    if v3 == "EquipAsset" then
        v10 = l_ImpressionEnums_0.ActionType.ITEM_CLICK;
    elseif v3 == "UnequipAsset" then
        v10 = l_ImpressionEnums_0.ActionType.ITEM_DESELECTED;
    end;
    v2:sendTelemetryEvent(v3, "marketplaceOrganicFELog", {
        requestId = v8, 
        itemId = v5, 
        actionType = v10, 
        surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY
    });
end;