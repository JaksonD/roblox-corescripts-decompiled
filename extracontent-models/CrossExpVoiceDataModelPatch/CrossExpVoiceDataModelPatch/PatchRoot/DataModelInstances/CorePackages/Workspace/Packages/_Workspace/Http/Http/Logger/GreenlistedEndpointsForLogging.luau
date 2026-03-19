local v0 = {
    ["catalog/sponsored-items"] = "avatar_experience_sponsored_items", 
    ["marketplace-widgets/v1/widgets?requestId"] = "avatar_experience_marketplace_widgets", 
    ["v3/outfits"] = "avatar_experience_outfits", 
    ["catalog/items/details"] = "avatar_experience_item_details", 
    ["recommendations/user-inventory"] = "avatar_experience_recommended_user_inventory", 
    ["v1/purchases/products"] = "avatar_experience_purchase_product", 
    ["autocomplete-avatar/v2/suggest"] = "avatar_experience_auto_complete", 
    ["topic/get-topics"] = "avatar_experience_get_topics", 
    ["widgets/search"] = "avatar_experience_widget_search", 
    ["widgets/hydrate"] = "avatar_experience_widget_hydrate", 
    ["marketplace-widgets/v1/pills"] = "avatar_experience_catalog_categories"
};
local v4 = {
    isSuccessStatusCode = function(_, v2) --[[ Line: 25 ]] --[[ Name: isSuccessStatusCode ]]
        local v3 = false;
        if v2 >= 200 then
            v3 = v2 < 300;
        end;
        return v3;
    end
};
v4.getMatchingName = function(v5, v6) --[[ Line: 32 ]] --[[ Name: getMatchingName ]]
    -- upvalues: v4 (copy), v0 (copy)
    local v7 = nil;
    local v8 = tostring(v6);
    local v9 = v4:isSuccessStatusCode(v6) and "api_success_" or "api_error_";
    for v10, v11 in v0 do
        if string.find(v5, v10, 1, true) then
            return v9 .. v11 .. "_" .. v8;
        end;
    end;
    return v7;
end;
v4.sendStatusCodeCounter = function(v12, v13, v14) --[[ Line: 49 ]] --[[ Name: sendStatusCodeCounter ]]
    -- upvalues: v4 (copy)
    if not v14 then
        v14 = game:GetService("RbxAnalyticsService");
    end;
    local v15 = v4.getMatchingName(v12, v13);
    if v15 and v14 then
        v14:ReportCounter(v15, 1);
    end;
end;
return v4;