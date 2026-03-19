local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Constants_0 = v3.Constants;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.LuaApp.SearchUuid);
local l_CatalogCategories_0 = v3.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v3.Enums.CatalogSubcategories;
local l_CatalogCategoryIds_0 = v3.Enums.CatalogCategoryIds;
local l_CatalogSDUICategoryIds_0 = v3.Enums.CatalogSDUICategoryIds;
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v12.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogBodySuits_0 = v12.FFlagAXCatalogBodySuits;
local l_FFlagAXShowBodySuitsCategoryInCatalog_0 = v12.FFlagAXShowBodySuitsCategoryInCatalog;
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_AvatarEditorSubcategories_0 = v16.Enums.AvatarEditorSubcategories;
local l_AvatarEditorCategories_0 = v16.Enums.AvatarEditorCategories;
local v19 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategoryTaxonomyUUIDs);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAddNavigationKeyToEditorSubcategories);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXSwapOuterwearSubcategoryOrder);
local l_FFlagAXCatalogCategoriesSDUI_0 = v12.FFlagAXCatalogCategoriesSDUI;
local v24 = "JacketAccessory.ClassicShirts.ClassicTShirts.ClassicPants";
if v21() then
    v24 = "JacketAccessory.ClassicShirts.ClassicTShirts.ClassicPants.LeftShoeAccessory.RightShoeAccessory";
end;
local v25 = game:DefineFastString("AXCategories", v24);
local v26 = v2.collectSet(string.split(v25, "."));
local v27 = require(l_Modules_0.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage);
local v28 = {
    Tops = "Tops", 
    Outerwear = "Outerwear", 
    Bottoms = "Bottoms", 
    LeftShoeAccessory = "LeftShoeAccessory", 
    RightShoeAccessory = "RightShoeAccessory", 
    Shoes = "Shoes", 
    DivisibleShoes = "DivisibleShoes", 
    ClassicShirts = "ClassicShirts", 
    ClassicTShirts = "ClassicTShirts", 
    ClassicPants = "ClassicPants", 
    ShirtAccessory = "ShirtAccessory", 
    TShirtAccessory = "TShirtAccessory", 
    SweaterAccessory = "SweaterAccessory", 
    PantsAccessory = "PantsAccessory", 
    JacketAccessory = "JacketAccessory", 
    ShortsAccessory = "ShortsAccessory", 
    DressSkirtAccessory = "DressSkirtAccessory", 
    Bodysuits = l_FFlagAXCatalogBodySuits_0 and "Bodysuits" or nil
};
local v29 = {
    ShirtAccessory = 59, 
    TShirtAccessory = 58, 
    SweaterAccessory = 62, 
    JacketAccessory = 61, 
    PantsAccessory = 60, 
    DressSkirtAccessory = 65, 
    ShortsAccessory = 63, 
    Shoes = 64, 
    ClassicShirts = 56, 
    ClassicTShirts = 55, 
    ClassicPants = 57
};
local function v31() --[[ Line: 100 ]] --[[ Name: createCatalogSubcategories ]]
    -- upvalues: v28 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogSubcategories_0 (copy), v5 (copy), l_Constants_0 (copy), v7 (copy), v27 (copy), v29 (copy), v19 (copy), l_FFlagAXCatalogBodySuits_0 (copy)
    local v30 = {
        [v28.ShirtAccessory] = {
            Name = "Shirts", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Shirts, 
            Title = "Feature.Avatar.Label.Shirts", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shirts, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.ShirtAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Shirts:rawValue(), 
            SubcategoryId = v29.ShirtAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Shirts:rawValue()
        }, 
        [v28.TShirtAccessory] = {
            Name = "TShirts", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.TShirts, 
            Title = "Feature.Catalog.LabelTShirts", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.TShirts, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.TShirtAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.TShirts:rawValue(), 
            SubcategoryId = v29.TShirtAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.TShirts:rawValue()
        }, 
        [v28.SweaterAccessory] = {
            Name = "Sweaters", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Sweaters, 
            Title = "Feature.Avatar.Label.Sweaters", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Sweaters, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.SweaterAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Sweaters:rawValue(), 
            SubcategoryId = v29.SweaterAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Sweaters:rawValue()
        }, 
        [v28.JacketAccessory] = {
            Name = "Jackets", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Jackets, 
            Title = "Feature.Avatar.Label.Jackets", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Jackets, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.JacketAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Jackets:rawValue(), 
            SubcategoryId = v29.JacketAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Jackets:rawValue()
        }, 
        [v28.PantsAccessory] = {
            Name = "Pants", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Pants, 
            Title = "Feature.Avatar.Label.Pants", 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Pants, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.PantsAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Pants:rawValue(), 
            SubcategoryId = v29.PantsAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Pants:rawValue()
        }, 
        [v28.DressSkirtAccessory] = {
            Name = "DressSkirt", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.DressesAndSkirts, 
            Title = "Feature.Avatar.Label.DressesAndSkirts", 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.DressSkirtAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.DressesAndSkirts:rawValue(), 
            SubcategoryId = v29.DressSkirtAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.DressesAndSkirts:rawValue()
        }, 
        [v28.ShortsAccessory] = {
            Name = "Shorts", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Shorts, 
            Title = "Feature.Avatar.Label.Shorts", 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shorts, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.ShortsAccessory
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Shorts:rawValue(), 
            SubcategoryId = v29.ShortsAccessory, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Shorts:rawValue()
        }, 
        [v28.Shoes] = {
            Name = "Shoes", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Shoes, 
            Title = "Feature.Avatar.Label.Shoes", 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shoes, 
            BundleTypes = {
                v5.BundleTypeIdStrings.Shoes
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Shoes:rawValue(), 
            SubcategoryId = v29.Shoes, 
            isSubcategory = true, 
            TaxonomyUuid = v19.Shoes:rawValue()
        }, 
        [v28.ClassicShirts] = {
            Name = "Classic Shirts", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicShirts, 
            Title = "Feature.Avatar.Label.ClassicShirts", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicShirts, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Shirt
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.ClassicShirts:rawValue(), 
            SubcategoryId = v29.ClassicShirts, 
            isSubcategory = true, 
            TaxonomyUuid = v19.ClassicShirts:rawValue()
        }, 
        [v28.ClassicTShirts] = {
            Name = "Classic T-Shirts", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicTShirts, 
            Title = "Feature.Avatar.Label.ClassicTShirts", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicTShirts, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.TShirt
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.ClassicTShirts:rawValue(), 
            SubcategoryId = v29.ClassicTShirts, 
            isSubcategory = true, 
            TaxonomyUuid = v19.ClassicTShirts:rawValue()
        }, 
        [v28.ClassicPants] = {
            Name = "Classic Pants", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicPants, 
            Title = "Feature.Avatar.Label.ClassicPants", 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicPants, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Pants
            }, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.ClassicPants:rawValue(), 
            SubcategoryId = v29.ClassicPants, 
            isSubcategory = true, 
            TaxonomyUuid = v19.ClassicPants:rawValue()
        }
    };
    if l_FFlagAXCatalogBodySuits_0 then
        v30[v28.Bodysuits] = {
            Name = "Bodysuits", 
            Title = "Feature.Avatar.Label.Bodysuits", 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            Id = l_CatalogSubcategories_0.Bodysuits:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = v19.Bodysuits:rawValue()
        };
    end;
    return v30;
end;
local function v34(v32) --[[ Line: 304 ]] --[[ Name: buildCatalogClothingAssetTypes ]]
    -- upvalues: v28 (copy), v5 (copy)
    local v33 = {};
    if v32[v28.ShirtAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.ShirtAccessory);
    end;
    if v32[v28.TShirtAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.TShirtAccessory);
    end;
    if v32[v28.SweaterAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.SweaterAccessory);
    end;
    if v32[v28.JacketAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.JacketAccessory);
    end;
    if v32[v28.PantsAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.PantsAccessory);
    end;
    if v32[v28.ShortsAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.ShortsAccessory);
    end;
    if v32[v28.DressSkirtAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.DressSkirtAccessory);
    end;
    if v32[v28.LeftShoeAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.LeftShoeAccessory);
    end;
    if v32[v28.RightShoeAccessory] then
        table.insert(v33, v5.AssetTypeIdStrings.RightShoeAccessory);
    end;
    if v32[v28.ClassicShirts] then
        table.insert(v33, v5.AssetTypeIdStrings.Shirt);
    end;
    if v32[v28.ClassicTShirts] then
        table.insert(v33, v5.AssetTypeIdStrings.TShirt);
    end;
    if v32[v28.ClassicPants] then
        table.insert(v33, v5.AssetTypeIdStrings.Pants);
    end;
    return v33;
end;
local function v38(v35, v36) --[[ Line: 346 ]] --[[ Name: buildCatalogSubcategoriesToUse ]]
    -- upvalues: v28 (copy), l_FFlagAXCatalogBodySuits_0 (copy), l_FFlagAXShowBodySuitsCategoryInCatalog_0 (copy)
    local v37 = {};
    if v35[v28.ShirtAccessory] then
        table.insert(v37, v36[v28.ShirtAccessory]);
    end;
    if v35[v28.TShirtAccessory] then
        table.insert(v37, v36[v28.TShirtAccessory]);
    end;
    if v35[v28.SweaterAccessory] then
        table.insert(v37, v36[v28.SweaterAccessory]);
    end;
    if v35[v28.JacketAccessory] then
        table.insert(v37, v36[v28.JacketAccessory]);
    end;
    if v35[v28.PantsAccessory] then
        table.insert(v37, v36[v28.PantsAccessory]);
    end;
    if v35[v28.DressSkirtAccessory] then
        table.insert(v37, v36[v28.DressSkirtAccessory]);
    end;
    if l_FFlagAXCatalogBodySuits_0 and (v35[v28.Bodysuits] or l_FFlagAXShowBodySuitsCategoryInCatalog_0) then
        table.insert(v37, v36[v28.Bodysuits]);
    end;
    if v35[v28.ShortsAccessory] then
        table.insert(v37, v36[v28.ShortsAccessory]);
    end;
    if v35[v28.LeftShoeAccessory] then
        table.insert(v37, v36[v28.Shoes]);
    end;
    if v35[v28.ClassicShirts] then
        table.insert(v37, v36[v28.ClassicShirts]);
    end;
    if v35[v28.ClassicTShirts] then
        table.insert(v37, v36[v28.ClassicTShirts]);
    end;
    if v35[v28.ClassicPants] then
        table.insert(v37, v36[v28.ClassicPants]);
    end;
    return v37;
end;
local v39 = nil;
local function v51() --[[ Line: 388 ]] --[[ Name: createClothingCategories ]]
    -- upvalues: v25 (ref), v26 (ref), v2 (copy), v31 (copy), v34 (copy), v38 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_CatalogCategories_0 (copy), v7 (copy), v27 (copy), l_CatalogCategoryIds_0 (copy), v19 (copy), v28 (copy), v5 (copy), v20 (copy), l_AvatarEditorSubcategories_0 (copy), l_Constants_0 (copy), v6 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v21 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy), v22 (copy), l_AvatarEditorCategories_0 (copy)
    v25 = game:GetFastString("AXCategories");
    v26 = v2.collectSet(string.split(v25, "."));
    local v40 = v31();
    local v41 = v34(v26);
    local v42 = v38(v26, v40);
    local v43 = {
        Name = "Clothing", 
        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Clothing, 
        Title = "Feature.Catalog.Label.Clothing", 
        CanAnimateCameraBasedMood = true, 
        AssetTypeIdStrings = v41, 
        SearchUuid = v7(), 
        Subcategories = v42, 
        TimeToRefresh = v27(), 
        Id = l_CatalogCategories_0.Clothing:rawValue(), 
        CategoryId = l_CatalogCategoryIds_0.Clothing:rawValue(), 
        TaxonomyUuid = v19.Clothing:rawValue()
    };
    local v44 = {};
    if v26[v28.ShirtAccessory] then
        table.insert(v44, v5.AssetTypeIdStrings.ShirtAccessory);
    end;
    if v26[v28.TShirtAccessory] then
        table.insert(v44, v5.AssetTypeIdStrings.TShirtAccessory);
    end;
    if v26[v28.SweaterAccessory] then
        table.insert(v44, v5.AssetTypeIdStrings.SweaterAccessory);
    end;
    local v45 = if v26[v28.TShirtAccessory] then v5.AssetTypeIdStrings.TShirtAccessory else v44[1];
    local v46 = {};
    if v26[v28.PantsAccessory] then
        table.insert(v46, v5.AssetTypeIdStrings.PantsAccessory);
    end;
    if v26[v28.ShortsAccessory] then
        table.insert(v46, v5.AssetTypeIdStrings.ShortsAccessory);
    end;
    if v26[v28.DressSkirtAccessory] then
        table.insert(v46, v5.AssetTypeIdStrings.DressSkirtAccessory);
    end;
    local v47 = if v26[v28.PantsAccessory] then v5.AssetTypeIdStrings.PantsAccessory else v46[1];
    local v48 = {
        Tops = {
            Name = "Tops", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.Tops else nil, 
            Title = "Feature.Catalog.Label.Tops", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            RecommendedAssetTypeIdString = v45, 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Tops, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = if v21() then l_CatalogSubcategories_0.Shirts else l_CatalogSubcategories_0.TShirts
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = if v21() then l_CatalogSDUICategoryIds_0.Clothing_Shirts:rawValue() else l_CatalogSDUICategoryIds_0.Clothing_TShirts:rawValue()
            } else nil, 
            AssetTypeIdStrings = v44, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.Tops
        }, 
        Outerwear = {
            Name = "Outerwear", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.Outerwear else nil, 
            Title = "Feature.Avatar.Label.Outerwear", 
            IconOn = "icons/menu/clothing/jackets_on", 
            IconOff = "icons/menu/clothing/jackets_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Outerwear, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Jackets
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_Jackets:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.JacketAccessory
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.Outerwear
        }, 
        Bottoms = {
            Name = "Bottoms", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.Bottoms else nil, 
            Title = "Feature.Avatar.Label.Bottoms", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            RecommendedAssetTypeIdString = v47, 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Bottoms, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Pants
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_Pants:rawValue()
            } else nil, 
            AssetTypeIdStrings = v46, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.Bottoms
        }, 
        Shoes = if v21() then {
            Name = "Shoes", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.Shoes else nil, 
            Title = "Feature.Avatar.Label.Shoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            RenderItemTiles = true, 
            RenderOutfitItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shoes, 
            RecommendationsType = v6.RecommendationsType.Shoes, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Shoes
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = if l_FFlagAXCatalogCategoriesSDUI_0 then l_CatalogSDUICategoryIds_0.Clothing_Shoes:rawValue() else l_CatalogSubcategories_0.Shoes:rawValue()
            } else nil, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            BundleTypeIdStrings = {
                v5.BundleTypeIdStrings.Shoes
            }, 
            SubcategoryFiltersHeader = "Feature.Catalog.Heading.ShowShoes", 
            SubcategoryFilters = {
                {
                    Name = "Full Pairs", 
                    Title = "Feature.Avatar.Label.FullPair", 
                    NavigationKey = l_AvatarEditorSubcategories_0.ShoesPairs, 
                    BundleTypeIdStrings = {
                        v5.BundleTypeIdStrings.Shoes
                    }, 
                    RenderOutfitItemTiles = true, 
                    SearchUuid = v7()
                }, 
                {
                    Name = "Left Shoes", 
                    Title = "Feature.Avatar.Label.LeftShoe", 
                    NavigationKey = l_AvatarEditorSubcategories_0.LeftShoes, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.LeftShoeAccessory
                    }, 
                    SearchUuid = v7()
                }, 
                {
                    Name = "Right Shoes", 
                    Title = "Feature.Avatar.Label.RightShoe", 
                    NavigationKey = l_AvatarEditorSubcategories_0.RightShoes, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.RightShoeAccessory
                    }, 
                    SearchUuid = v7()
                }
            }, 
            Id = l_AvatarEditorSubcategories_0.Shoes
        } else nil, 
        LeftShoes = if v21() then nil else {
            Name = "Left Shoes", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.LeftShoes else nil, 
            Title = "Feature.Avatar.Label.LeftShoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shoes, 
            RecommendationsType = v6.RecommendationsType.Shoes, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Shoes
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_Shoes:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.LeftShoeAccessory
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.LeftShoes
        }, 
        RightShoes = if v21() then nil else {
            Name = "Right Shoes", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.RightShoes else nil, 
            Title = "Feature.Avatar.Label.RightShoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shoes, 
            RecommendationsType = v6.RecommendationsType.Shoes, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Shoes
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_Shoes:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.RightShoeAccessory
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.RightShoes
        }, 
        DivisibleShoes = if v21() then nil else {
            Name = "Divisible Shoes", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.DivisibleShoes else nil, 
            Title = "Feature.Avatar.Label.Shoes", 
            IconOn = "icons/menu/clothing/shoes_on", 
            IconOff = "icons/menu/clothing/shoes_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.Shoes, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            SubButtons = {
                [1] = {
                    Name = "Left", 
                    Title = "Feature.Avatar.Label.LeftInitial", 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.LeftShoeAccessory
                    }, 
                    SearchUuid = v7(), 
                    TimeToRefresh = v27()
                }, 
                [2] = {
                    Name = "Right", 
                    Title = "Feature.Avatar.Label.RightInitial", 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.RightShoeAccessory
                    }, 
                    SearchUuid = v7(), 
                    TimeToRefresh = v27()
                }
            }, 
            RecommendationsType = v6.RecommendationsType.Shoes, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.Shoes
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_Shoes:rawValue()
            } else nil, 
            Category = 2, 
            Id = l_AvatarEditorSubcategories_0.DivisibleShoes
        }, 
        ClassicShirts = {
            Name = "Classic Shirts", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.ClassicShirts else nil, 
            Title = "Feature.Avatar.Label.ClassicShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicShirts, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.ClassicShirts
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.ClothingClassicShirts:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Shirt
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.ClassicShirts
        }, 
        ClassicTShirts = {
            Name = "Classic T-Shirts", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.ClassicTShirts else nil, 
            Title = "Feature.Avatar.Label.ClassicTShirts", 
            IconOn = "icons/menu/clothing/shirts_on", 
            IconOff = "icons/menu/clothing/shirts_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicTShirts, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.ClassicTShirts
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_ClassicTShirts:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.TShirt
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.ClassicTShirts
        }, 
        ClassicPants = {
            Name = "Classic Pants", 
            NavigationKey = if v20() then l_AvatarEditorSubcategories_0.ClassicPants else nil, 
            Title = "Feature.Avatar.Label.ClassicPants", 
            IconOn = "icons/menu/clothing/pants_on", 
            IconOff = "icons/menu/clothing/pants_off", 
            RenderItemTiles = true, 
            CameraFocus = v5.FocusType.Legs, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Clothing.ClassicPants, 
            RecommendationsType = v6.RecommendationsType.Asset, 
            MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                CategoryKey = l_CatalogCategories_0.Clothing, 
                SubcategoryKey = l_CatalogSubcategories_0.ClassicPants
            }, 
            MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                CategoryId = l_CatalogSDUICategoryIds_0.Clothing:rawValue(), 
                SubcategoryId = l_CatalogSDUICategoryIds_0.Clothing_ClassicPants:rawValue()
            } else nil, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Pants
            }, 
            SearchUuid = v7(), 
            Category = 2, 
            TimeToRefresh = v27(), 
            Id = l_AvatarEditorSubcategories_0.ClassicPants
        }
    };
    local v49 = {};
    local v50 = 0;
    if v22 then
        if v26[v28.Outerwear] or v26[v28.JacketAccessory] then
            v50 = v50 + 1;
            v48.Outerwear.Subcategory = v50;
            table.insert(v49, v48.Outerwear);
        end;
        if v26[v28.Tops] then
            v50 = v50 + 1;
            v48.Tops.Subcategory = v50;
            table.insert(v49, v48.Tops);
        end;
    else
        if v26[v28.Tops] then
            v50 = v50 + 1;
            v48.Tops.Subcategory = v50;
            table.insert(v49, v48.Tops);
        end;
        if v26[v28.Outerwear] or v26[v28.JacketAccessory] then
            v50 = v50 + 1;
            v48.Outerwear.Subcategory = v50;
            table.insert(v49, v48.Outerwear);
        end;
    end;
    if v26[v28.Bottoms] then
        v50 = v50 + 1;
        v48.Bottoms.Subcategory = v50;
        table.insert(v49, v48.Bottoms);
    end;
    if v21() then
        v50 = v50 + 1;
        v48.Shoes.Subcategory = v50;
        table.insert(v49, v48.Shoes);
    else
        if v26[v28.LeftShoeAccessory] then
            v50 = v50 + 1;
            v48.LeftShoes.Subcategory = v50;
            table.insert(v49, v48.LeftShoes);
        end;
        if v26[v28.RightShoeAccessory] then
            v50 = v50 + 1;
            v48.RightShoes.Subcategory = v50;
            table.insert(v49, v48.RightShoes);
        end;
    end;
    if v26[v28.ClassicShirts] then
        v50 = v50 + 1;
        v48.ClassicShirts.Subcategory = v50;
        table.insert(v49, v48.ClassicShirts);
    end;
    if v21() then
        if v26[v28.ClassicPants] then
            v50 = v50 + 1;
            v48.ClassicPants.Subcategory = v50;
            table.insert(v49, v48.ClassicPants);
        end;
        if v26[v28.ClassicTShirts] then
            v50 = v50 + 1;
            v48.ClassicTShirts.Subcategory = v50;
            table.insert(v49, v48.ClassicTShirts);
        end;
    else
        if v26[v28.ClassicTShirts] then
            v50 = v50 + 1;
            v48.ClassicTShirts.Subcategory = v50;
            table.insert(v49, v48.ClassicTShirts);
        end;
        if v26[v28.ClassicPants] then
            v50 = v50 + 1;
            v48.ClassicPants.Subcategory = v50;
            table.insert(v49, v48.ClassicPants);
        end;
    end;
    return {
        avatarEditorCategories = {
            Name = "Clothing", 
            NavigationKey = if v21() then l_AvatarEditorCategories_0.Clothing else nil, 
            Title = "Feature.Catalog.Label.Clothing", 
            IconOn = "icons/menu/clothing/clothing_on", 
            IconOff = "icons/menu/clothing/clothing_off", 
            Category = 2, 
            Subcategory = nil, 
            Subcategories = v49, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v7(), 
            TimeToRefresh = v27(), 
            HideTextUnderTile = true, 
            Id = l_AvatarEditorCategories_0.Clothing
        }, 
        catalogCategories = v43
    };
end;
return function(v52) --[[ Line: 958 ]] --[[ Name: getClothingCategories ]]
    -- upvalues: v39 (ref), v51 (copy)
    if not v39 or v52 then
        v39 = v51();
    end;
    return v39;
end;