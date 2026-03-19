local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.mutedError);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local _ = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore.createCatalogCategoriesStore);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXCatalogCategoriesSDUI_0 = v9.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXInferCategorySelection_0 = v9.FFlagAXInferCategorySelection;
return function(v12) --[[ Line: 41 ]] --[[ Name: createCategorySelectionStore ]]
    -- upvalues: l_FFlagAXCatalogCategoriesSDUI_0 (copy), v8 (copy), l_createSignal_0 (copy), l_createComputed_0 (copy), l_FFlagAXInferCategorySelection_0 (copy), v5 (copy)
    local v13 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        local v14 = v12.getCategories(false);
        v13 = #v14 > 0 and v14[1].Id or v8.DefaultCatalogCategoryId;
    end;
    local v15, v16 = l_createSignal_0({
        categoryId = if l_FFlagAXCatalogCategoriesSDUI_0 then v13 else v8.DefaultCatalogCategoryId, 
        subcategoryId = nil
    });
    local v18 = l_createComputed_0(function(v17) --[[ Line: 53 ]]
        -- upvalues: v15 (copy)
        return v15(v17).categoryId;
    end);
    local v20 = l_createComputed_0(function(v19) --[[ Line: 57 ]]
        -- upvalues: v15 (copy)
        return v15(v19).subcategoryId;
    end);
    local v23 = l_createComputed_0(function(v21) --[[ Line: 61 ]]
        -- upvalues: v18 (copy), v8 (ref), v12 (copy)
        local v22 = v18(v21);
        if v22 == nil then
            v22 = v8.DefaultCatalogCategoryId;
        end;
        return v12.getCategoriesMap(v21)[v22];
    end);
    local v30 = l_createComputed_0(function(v24) --[[ Line: 72 ]]
        -- upvalues: v20 (copy), v23 (copy)
        local v25 = v20(v24);
        if v25 == nil then
            return nil;
        else
            local v26 = v23(v24);
            if v26 == nil then
                return nil;
            else
                local l_Subcategories_0 = v26.Subcategories;
                if l_Subcategories_0 ~= nil then
                    for _, v29 in l_Subcategories_0 do
                        if v29.Id == v25 then
                            return v29;
                        end;
                    end;
                end;
                return nil;
            end;
        end;
    end);
    local v33 = l_createComputed_0(function(v31) --[[ Line: 95 ]]
        -- upvalues: v30 (copy), v23 (copy)
        local v32 = v30(v31);
        if v32 then
            return v32;
        else
            return v23(v31);
        end;
    end);
    local function v48(v34, v35) --[[ Line: 106 ]] --[[ Name: changeCategory ]]
        -- upvalues: l_FFlagAXInferCategorySelection_0 (ref), v5 (ref), v12 (copy), v16 (copy), v23 (copy)
        if l_FFlagAXInferCategorySelection_0 then
            if v35 == nil then
                if v34 == nil then
                    v5("[Category Selection Store] changeCategory received both categoryId and subcategoryId as nil");
                    return false;
                elseif not v12.getCategoriesMap(false)[v34] then
                    return false;
                else
                    v16({
                        categoryId = v34, 
                        subcategoryId = nil
                    });
                    return true;
                end;
            else
                local v36 = nil;
                if v34 ~= nil then
                    v36 = v12.getCategoriesMap(false)[v34];
                else
                    for _, v38 in (v12.getCategories(false)) do
                        if v38 and v38.SubcategoriesMap and v38.SubcategoriesMap[v35] then
                            v36 = v38;
                            break;
                        end;
                    end;
                end;
                if not v36 then
                    return false;
                else
                    local v39 = false;
                    local l_Subcategories_1 = v36.Subcategories;
                    if l_Subcategories_1 ~= nil then
                        for _, v42 in l_Subcategories_1 do
                            if v42.Id == v35 then
                                v39 = true;
                                break;
                            end;
                        end;
                    end;
                    if not v39 then
                        return false;
                    else
                        v16({
                            categoryId = v36.Id, 
                            subcategoryId = v35
                        });
                        return true;
                    end;
                end;
            end;
        else
            local v43 = nil;
            if v34 ~= nil then
                v43 = v12.getCategoriesMap(false)[v34];
                if not v43 then
                    return false;
                end;
            else
                v43 = v23(false);
            end;
            if v35 ~= nil then
                if v43 == nil then
                    return false;
                else
                    local v44 = false;
                    local l_Subcategories_2 = v43.Subcategories;
                    if l_Subcategories_2 ~= nil then
                        for _, v47 in l_Subcategories_2 do
                            if v47.Id == v35 then
                                v44 = true;
                                break;
                            end;
                        end;
                    end;
                    if not v44 then
                        return false;
                    end;
                end;
            end;
            v16({
                categoryId = v43.Id, 
                subcategoryId = v35
            });
            return true;
        end;
    end;
    return {
        selectedCategoryId = v18, 
        selectedCategory = v23, 
        selectedSubcategoryId = v20, 
        selectedSubcategory = v30, 
        selectedCategoryInfo = v33, 
        changeCategory = v48
    };
end;