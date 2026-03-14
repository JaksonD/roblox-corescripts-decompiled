local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v3 = require(l_CorePackages_0.Packages.Signals);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.GetCatalogCategories);
local l_FFlagAXCatalogCategoriesSDUI_0 = v2.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXCatalogCategoriesSDUILinks_0 = v2.FFlagAXCatalogCategoriesSDUILinks;
return function() --[[ Line: 32 ]] --[[ Name: createCatalogCategoriesStore ]]
    -- upvalues: v3 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v6 (copy), l_FFlagAXCatalogCategoriesSDUILinks_0 (copy)
    local v9, v10 = v3.createSignal(if l_FFlagAXCatalogCategoriesSDUI_0 then {
        v6()[1]
    } else v6());
    local v11, v12 = v3.createSignal({});
    local v13, v14 = v3.createSignal(false);
    local v15 = nil;
    local v16 = nil;
    if l_FFlagAXCatalogCategoriesSDUILinks_0 then
        local v17, v18 = v3.createSignal(nil);
        v15 = v17;
        v16 = v18;
    end;
    local function v27(v19) --[[ Line: 53 ]] --[[ Name: buildCategoryMap ]]
        local v20 = {};
        for _, v22 in v19 do
            if v22 and v22.Id then
                local l_Subcategories_0 = v22.Subcategories;
                if l_Subcategories_0 then
                    local v24 = {};
                    if l_Subcategories_0 then
                        for _, v26 in l_Subcategories_0 do
                            if v26.Id then
                                v24[v26.Id] = v26;
                            end;
                        end;
                    end;
                    v22.SubcategoriesMap = v24;
                end;
                v20[v22.Id] = v22;
            end;
        end;
        return v20;
    end;
    local function v30(v28) --[[ Line: 77 ]] --[[ Name: setCategoriesAction ]]
        -- upvalues: v10 (copy), v12 (copy), v27 (copy)
        local v29 = table.clone(v28);
        v10(v29);
        v12((v27(v29)));
    end;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if l_FFlagAXCatalogCategoriesSDUILinks_0 then
        v31 = function(v34) --[[ Line: 88 ]]
            -- upvalues: v16 (ref)
            if v16 then
                v16(v34);
            end;
        end;
        v32 = function() --[[ Line: 94 ]]
            -- upvalues: v16 (ref)
            if v16 then
                v16(nil);
            end;
        end;
        v33 = function(v35) --[[ Line: 100 ]]
            -- upvalues: v14 (copy), v15 (ref), v32 (ref)
            v14(v35);
            if v35 and v15 then
                local v36 = v15(false);
                if v36 then
                    if v32 then
                        v32();
                    end;
                    return v36;
                end;
            end;
            return nil;
        end;
    end;
    local v37 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v37 = function(v38, v39) --[[ Line: 119 ]]
            -- upvalues: v11 (copy)
            local v40 = v11(false)[v38];
            if v39 == nil then
                return v40;
            elseif v40 == nil or v40.SubcategoriesMap == nil then
                return nil;
            else
                return v40.SubcategoriesMap[v39];
            end;
        end;
    end;
    v12((v27(v9(false))));
    return {
        getCategories = v9, 
        getCategoriesMap = v11, 
        getCategoryOrSubcategory = v37, 
        getHasFetchedCategories = v13, 
        setCategories = v30, 
        setHasFetchedCategories = if l_FFlagAXCatalogCategoriesSDUILinks_0 then v33 else v14, 
        getPendingDeepLinkAction = v15, 
        setPendingDeepLinkAction = v31, 
        clearPendingDeepLinkAction = v32
    };
end;