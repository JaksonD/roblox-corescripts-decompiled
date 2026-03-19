local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v4 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBundleRedirectFromCatalogForSlots);
local l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters;
local v6 = nil;
local function _(v7, v8) --[[ Line: 21 ]] --[[ Name: createCategorySubcategoryTable ]]
    return {
        category = v7, 
        subcategory = v8
    };
end;
local function v78() --[[ Line: 28 ]] --[[ Name: CreateAvatarEditorStructure ]]
    -- upvalues: l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 (copy), v4 (copy), v2 (copy), v3 (copy)
    local v10 = {};
    local v11 = if not not l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 or v4 then {} else nil;
    local v12 = {};
    local v13 = v2();
    if l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 then
        local function v14(v15, v16, v17, v18) --[[ Line: 43 ]] --[[ Name: handleCategoryInfo ]]
            -- upvalues: v10 (copy), v11 (ref), v14 (copy)
            local v19 = {
                category = v16, 
                subcategory = v17, 
                subcategoryFilter = v18
            };
            if v15.AssetTypeIdStrings then
                for _, v21 in v15.AssetTypeIdStrings do
                    v10[v21] = v19;
                end;
            end;
            if v15.BundleTypeIdStrings then
                for _, v23 in v15.BundleTypeIdStrings do
                    v11[v23] = v19;
                end;
            end;
            if v15.Subcategories then
                for v24, v25 in v15.Subcategories do
                    v14(v25, v16, v24, nil);
                end;
            end;
            if v15.SubcategoryFilters then
                for v26, v27 in v15.SubcategoryFilters do
                    v14(v27, v16, v17, v26);
                end;
            end;
        end;
        for v28, v29 in v13 do
            v14(v29, v28, nil, nil);
        end;
    else
        for _, v31 in v13 do
            local l_Subcategories_0 = v31.Subcategories;
            if l_Subcategories_0 then
                if v4 then
                    for _, v34 in l_Subcategories_0 do
                        if v34.AssetTypeIdStrings then
                            for _, v36 in v34.AssetTypeIdStrings do
                                local l_Category_0 = v34.Category;
                                local l_Subcategory_0 = v34.Subcategory;
                                v10[v36] = {
                                    category = l_Category_0, 
                                    subcategory = l_Subcategory_0
                                };
                            end;
                        end;
                        if v34.BundleTypeIdStrings then
                            for _, v40 in v34.BundleTypeIdStrings do
                                local l_Category_1 = v31.Category;
                                local l_Subcategory_1 = v34.Subcategory;
                                v11[v40] = {
                                    category = l_Category_1, 
                                    subcategory = l_Subcategory_1
                                };
                            end;
                        end;
                        if v34.OutfitType then
                            local l_OutfitType_0 = v34.OutfitType;
                            local l_Category_2 = v31.Category;
                            local l_Subcategory_2 = v31.Subcategory;
                            v12[l_OutfitType_0] = {
                                category = l_Category_2, 
                                subcategory = l_Subcategory_2
                            };
                        end;
                    end;
                else
                    for _, v47 in l_Subcategories_0 do
                        if v47.AssetTypeIdStrings then
                            for _, v49 in v47.AssetTypeIdStrings do
                                local l_Category_3 = v47.Category;
                                local l_Subcategory_3 = v47.Subcategory;
                                v10[v49] = {
                                    category = l_Category_3, 
                                    subcategory = l_Subcategory_3
                                };
                            end;
                        elseif v47.BundleTypes then
                            local l_Category_4 = v31.Category;
                            local l_Subcategory_4 = v31.Subcategory;
                            v11 = {
                                category = l_Category_4, 
                                subcategory = l_Subcategory_4
                            };
                        elseif v47.OutfitType then
                            local l_OutfitType_1 = v47.OutfitType;
                            local l_Category_5 = v31.Category;
                            local l_Subcategory_5 = v31.Subcategory;
                            v12[l_OutfitType_1] = {
                                category = l_Category_5, 
                                subcategory = l_Subcategory_5
                            };
                        end;
                    end;
                end;
            elseif v31.AssetTypeIdStrings then
                for _, v58 in v31.AssetTypeIdStrings do
                    local l_Category_6 = v31.Category;
                    local l_Subcategory_6 = v31.Subcategory;
                    v10[v58] = {
                        category = l_Category_6, 
                        subcategory = l_Subcategory_6
                    };
                end;
            elseif v31.OutfitType then
                local l_OutfitType_2 = v31.OutfitType;
                local l_Category_7 = v31.Category;
                local l_Subcategory_7 = v31.Subcategory;
                v12[l_OutfitType_2] = {
                    category = l_Category_7, 
                    subcategory = l_Subcategory_7
                };
            end;
        end;
    end;
    local v64 = {};
    local function v70(v65, v66) --[[ Line: 145 ]] --[[ Name: fillFromAssetTypes ]]
        -- upvalues: v64 (copy)
        for _, v68 in v66 do
            if not v64[v68] then
                v64[v68] = {};
            end;
            local v69 = v64[v68];
            v69[#v69 + 1] = v65;
        end;
    end;
    local function v71(v72) --[[ Line: 156 ]] --[[ Name: fillAssetTypeToSearchUuids ]]
        -- upvalues: v70 (copy), v71 (copy)
        for _, v74 in v72 do
            if v74.AssetTypeIdStrings and v74.SearchUuid then
                v70(v74.SearchUuid, v74.AssetTypeIdStrings);
            end;
            if v74.Subcategories then
                v71(v74.Subcategories);
            end;
        end;
    end;
    local function v77() --[[ Line: 168 ]] --[[ Name: fillAssetTypeNoCategories ]]
        -- upvalues: v3 (ref), v10 (copy), l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 (ref), v11 (ref), v12 (copy)
        for v75, _ in v3.DynamicHeadAssetTypes do
            if not v10[v75] then
                if l_FFlagAXLeaveCatalogToAvatarPromptHandleSubcategoryFilters_0 then
                    v10[v75] = v11[v3.BundleTypeIdStrings.DynamicHead];
                else
                    v10[v75] = v12[v3.OutfitTypes.DynamicHead];
                end;
            end;
        end;
    end;
    v71(v2());
    v77();
    return {
        AssetTypeToCategorySubcategory = v10, 
        AssetTypeToSearchUuids = v64, 
        BundleToCategorySubcategory = v11, 
        OutfitTypeToCategorySubcategory = v12
    };
end;
return function() --[[ Line: 193 ]] --[[ Name: GetAvatarEditorStructure ]]
    -- upvalues: v6 (ref), v78 (copy)
    if not v6 then
        v6 = v78();
    end;
    return v6;
end;