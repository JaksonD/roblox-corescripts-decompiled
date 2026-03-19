local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v2 = {
    SHOW_SPONSORED = "ShowSponsored", 
    SHOW_TOPICS = "ShowTopics", 
    CATEGORY_FILTER = "CategoryFilter", 
    WIDGET_CONTEXT = "WidgetContext", 
    LOCALIZED_TITLE = "LocalizedTitle", 
    CATEGORY_ID = "CategoryId", 
    SUBCATEGORY_ID = "SubcategoryId", 
    IS_SUBCATEGORY = "isSubcategory", 
    CAN_ANIMATE_CAMERA_BASED_MOOD = "CanAnimateCameraBasedMood", 
    DISABLE_FILTERS = "DisableFilters", 
    SHOW_LOOKS_AS_ORGANIC_CONTENT = "ShowLooksAsOrganicContent", 
    SUBCATEGORIES = "Subcategories"
};
local v3 = {
    ALL = "All", 
    ANIMATIONS = "Animations", 
    ALL_ANIMATIONS = "AllAnimations"
};
local v4 = {
    BUNDLES = "Bundles", 
    T_SHIRTS = "T-Shirts", 
    DRESSES_PANTS = "Dresses & Pants", 
    HEADS = "Heads", 
    ANIMATION_BUNDLES = "AnimationBundles", 
    TSHIRTS = "TShirts", 
    DRESS_SKIRT = "DressSkirt", 
    HATS = "Hats"
};
local v5 = {
    HEADS = "22"
};
local function v6(v7, v8, v9) --[[ Line: 79 ]] --[[ Name: deepCompareTables ]]
    -- upvalues: v6 (copy), v3 (copy), v2 (copy)
    local v10 = {};
    if type(v7) ~= type(v8) then
        table.insert(v10, string.format("%s: type mismatch (SDUI: %s, Legacy: %s)", v9, type(v7), (type(v8))));
        return v10;
    elseif type(v7) == "table" then
        local v11 = false;
        if #v7 > 0 or #v8 > 0 then
            v11 = true;
        end;
        if v11 then
            if #v7 ~= #v8 then
                table.insert(v10, string.format("%s: array length mismatch (SDUI: %d, Legacy: %d)", v9, #v7, #v8));
            end;
            for v12 = 1, math.max(#v7, #v8) do
                local v13 = v7[v12];
                local v14 = v8[v12];
                local v15 = string.format("%s[%d]", v9, v12);
                if v13 == nil and v14 ~= nil then
                    table.insert(v10, string.format("%s: missing in SDUI", v15));
                elseif v13 ~= nil and v14 == nil then
                    table.insert(v10, string.format("%s: missing in Legacy", v15));
                elseif v13 ~= nil and v14 ~= nil then
                    for _, v17 in (v6(v13, v14, v15)) do
                        table.insert(v10, v17);
                    end;
                end;
            end;
            return v10;
        else
            local v18 = {};
            for v19 in v7 do
                v18[v19] = true;
            end;
            for v20 in v8 do
                v18[v20] = true;
            end;
            for v21 in v18 do
                local v22 = v7[v21];
                local v23 = v8[v21];
                local v24 = string.format("%s.%s", v9, (tostring(v21)));
                if v22 == nil and v23 ~= nil then
                    local v25 = string.match(v9, "^" .. v3.ALL .. "%.") or v9 == v3.ALL;
                    local v26 = true;
                    if v21 ~= v2.SHOW_SPONSORED then
                        v26 = true;
                        if v21 ~= v2.SHOW_TOPICS then
                            v26 = v21 == v2.CATEGORY_FILTER;
                        end;
                    end;
                    local v27 = false;
                    if v21 == v2.CAN_ANIMATE_CAMERA_BASED_MOOD then
                        v27 = v23 == false;
                    end;
                    local v28 = true;
                    if v21 ~= v2.CATEGORY_ID then
                        v28 = true;
                        if v21 ~= v2.SUBCATEGORY_ID then
                            v28 = v21 == v2.IS_SUBCATEGORY;
                        end;
                    end;
                    if (not v25 or not v26) and not v27 and not v28 then
                        table.insert(v10, string.format("%s: missing in SDUI (Legacy has: %s)", v24, (tostring(v23))));
                    end;
                elseif v22 ~= nil and v23 == nil then
                    local v29 = true;
                    if v21 ~= v2.WIDGET_CONTEXT then
                        v29 = v21 == v2.LOCALIZED_TITLE;
                    end;
                    local v30 = false;
                    if v21 == v2.DISABLE_FILTERS then
                        v30 = v22 == false;
                    end;
                    local v31 = false;
                    if v21 == v2.CAN_ANIMATE_CAMERA_BASED_MOOD then
                        v31 = v22 == false;
                    end;
                    local v32 = false;
                    if v21 == v2.SHOW_LOOKS_AS_ORGANIC_CONTENT then
                        v32 = v22 == false;
                    end;
                    local v33 = true;
                    if v21 ~= v2.CATEGORY_ID then
                        v33 = true;
                        if v21 ~= v2.SUBCATEGORY_ID then
                            v33 = v21 == v2.IS_SUBCATEGORY;
                        end;
                    end;
                    if not v29 and not v30 and not v31 and not v32 and not v33 then
                        table.insert(v10, string.format("%s: missing in Legacy (SDUI has: %s)", v24, (tostring(v22))));
                    end;
                elseif v22 ~= nil and v23 ~= nil then
                    for _, v35 in (v6(v22, v23, v24)) do
                        table.insert(v10, v35);
                    end;
                end;
            end;
            return v10;
        end;
    else
        return v10;
    end;
end;
local function v44(v36, v37) --[[ Line: 238 ]] --[[ Name: compareCategories ]]
    -- upvalues: v2 (copy), v6 (copy)
    local v38 = {};
    local v39 = {};
    for v40, v41 in v36 do
        if v40 ~= v2.SUBCATEGORIES then
            v38[v40] = v41;
        end;
    end;
    for v42, v43 in v37 do
        if v42 ~= v2.SUBCATEGORIES then
            v39[v42] = v43;
        end;
    end;
    return (v6(v38, v39, v36.Name or "Unknown"));
end;
local function _(v45, v46) --[[ Line: 264 ]] --[[ Name: compareSubcategories ]]
    -- upvalues: v6 (copy)
    print("compareSubcategories", v45, v46);
    return (v6(v45, v46, v45.Name or "Unknown"));
end;
local function v65(v48, v49, v50) --[[ Line: 270 ]] --[[ Name: logSubcategoryDifferences ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy)
    for _, v52 in v48 do
        local v53 = nil;
        for _, v55 in v49 do
            local v56 = v52.Name == v55.Id;
            local v57 = false;
            if v52.Name == v4.BUNDLES then
                v57 = v55.Id == v4.ANIMATION_BUNDLES;
            end;
            local v58 = false;
            if v52.Name == v4.T_SHIRTS then
                v58 = v55.Id == v4.TSHIRTS;
            end;
            local v59 = false;
            if v52.Name == v4.DRESSES_PANTS then
                v59 = v55.Id == v4.DRESS_SKIRT;
            end;
            local v60 = false;
            if v52.Name == v4.HEADS then
                v60 = false;
                if v52.Id == v5.HEADS then
                    v60 = v55.Id == v4.HATS;
                end;
            end;
            if v56 or v57 or v58 or v59 or v60 then
                v53 = v55;
                break;
            end;
        end;
        if v53 then
            local l_v53_0 = v53;
            print("compareSubcategories", v52, l_v53_0);
            local v62 = v6(v52, l_v53_0, v52.Name or "Unknown");
            if #v62 > 0 then
                warn(string.format("[GetCatalogCategoriesSDUI] Differences found for subcategory '%s' in category '%s':", v52.Name, v50));
                for _, v64 in v62 do
                    warn(string.format("  - %s", v64));
                end;
            end;
        else
            warn(string.format("[GetCatalogCategoriesSDUI] No matching legacy subcategory found for SDUI subcategory '%s' in category '%s'", v52.Name, v50));
        end;
    end;
end;
return {
    logCategoryDifferences = function(v66, v67) --[[ Line: 334 ]] --[[ Name: logCategoryDifferences ]]
        -- upvalues: v3 (copy), v44 (copy), v65 (copy)
        for _, v69 in v66 do
            print("sduiCategory", v69);
            local v70 = nil;
            for _, v72 in v67 do
                local v73 = true;
                if v69.Name ~= v72.Id then
                    v73 = v69.Name == v72.Name;
                end;
                local v74 = v69.Name == v3.ANIMATIONS and (v72.Id == v3.ALL_ANIMATIONS or v72.Name == v3.ALL_ANIMATIONS) or v69.Name == v3.ALL_ANIMATIONS and (v72.Id == v3.ANIMATIONS or v72.Name == v3.ANIMATIONS);
                if v73 or v74 then
                    v70 = v72;
                    print("matchingLegacyCategory", v70);
                    break;
                end;
            end;
            if v70 then
                local v75 = v44(v69, v70);
                if #v75 > 0 then
                    warn(string.format("[GetCatalogCategoriesSDUI] Differences found for category '%s':", v69.Name));
                    for _, v77 in v75 do
                        warn(string.format("  - %s", v77));
                    end;
                end;
                if v69.Subcategories and v70.Subcategories then
                    v65(v69.Subcategories, v70.Subcategories, v69.Name);
                elseif v69.Subcategories and not v70.Subcategories then
                    warn(string.format("[GetCatalogCategoriesSDUI] SDUI category '%s' has subcategories but legacy category does not", v69.Name));
                elseif not v69.Subcategories and v70.Subcategories then
                    warn(string.format("[GetCatalogCategoriesSDUI] Legacy category '%s' has subcategories but SDUI category does not", v69.Name));
                end;
            else
                warn(string.format("[GetCatalogCategoriesSDUI] No matching legacy category found for SDUI category '%s'", v69.Name));
            end;
        end;
    end
};