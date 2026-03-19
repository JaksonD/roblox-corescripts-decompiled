local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Constants_0 = v2.Constants;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.LuaApp.SearchUuid);
local v7 = require(l_Modules_0.AvatarExperience.Common.getClothingCategories);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v9.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v9.Enums.CatalogSubcategories;
local l_CatalogCategoryIds_0 = v9.Enums.CatalogCategoryIds;
local l_CatalogSubcategoryIds_0 = v9.Enums.CatalogSubcategoryIds;
local v14 = require(l_Modules_0.AvatarExperience.Common.Enum.CatalogCategoryTaxonomyUUIDs);
local v15 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AXAvatarsTabIXP_0 = v2.Experiments.AXAvatarsTabIXP;
local v17 = require(l_Modules_0.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagRemoveClassicHeadsAndFaces_0 = v18.FFlagRemoveClassicHeadsAndFaces;
local l_FFlagAXCatalogCategoryTooltip_0 = v18.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXMigrateCategoryTooltip_0 = v18.FFlagAXMigrateCategoryTooltip;
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v18.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogSupportDisableFilters_0 = v18.FFlagAXCatalogSupportDisableFilters;
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = v18.FFlagAXLooksWidgetContextForOrganicContent;
local l_FFlagAXCatalogMakeupSupport_0 = v18.FFlagAXCatalogMakeupSupport;
local l_FFlagAXCatalogMakeupTaxonomy_0 = v18.FFlagAXCatalogMakeupTaxonomy;
local l_FFlagAXCatalogCategoriesSDUI_0 = v18.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 = v18.FFlagAXFixWidgetOnlyTabNoItemsFound;
local l_FFlagAXCatalogM41Props_0 = v18.FFlagAXCatalogM41Props;
local l_FFlagAXCatalogM41FullMasks_0 = v18.FFlagAXCatalogM41FullMasks;
local l_FFlagAXCatalogM41HandAndArm_0 = v18.FFlagAXCatalogM41HandAndArm;
local l_FFlagAXCatalogCategoriesFlaggedMap_0 = v18.FFlagAXCatalogCategoriesFlaggedMap;
local l_FFlagAXM41AllCategoriesToTaxonomy_0 = v18.FFlagAXM41AllCategoriesToTaxonomy;
local v34 = game:DefineFastString("AXBodyCategoryTooltipKey", "BodyCategoryCatalogTooltip");
local function v51() --[[ Line: 49 ]] --[[ Name: buildCategoriesMap ]]
    -- upvalues: l_FFlagAXCatalogCategoriesFlaggedMap_0 (copy), l_AXAvatarsTabIXP_0 (copy), v15 (copy), l_CatalogCategories_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), v6 (copy), v17 (copy), l_CatalogCategoryIds_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_FFlagAXM41AllCategoriesToTaxonomy_0 (copy), v14 (copy), v5 (copy), l_FFlagAXCatalogM41Props_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_CatalogSubcategories_0 (copy), l_Constants_0 (copy), l_FFlagAXCatalogMakeupTaxonomy_0 (copy), l_CatalogSubcategoryIds_0 (copy), l_FFlagAXCatalogM41FullMasks_0 (copy), l_FFlagAXCatalogM41HandAndArm_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), v34 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v7 (copy)
    if not l_FFlagAXCatalogCategoriesFlaggedMap_0 then
        return {};
    else
        local v35 = if l_AXAvatarsTabIXP_0.isEnabled() then v15.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil;
        local v36 = {
            Id = l_CatalogCategories_0.Recommended:rawValue(), 
            Name = "All", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Recommended, 
            Title = "Feature.Avatar.Heading.All", 
            CategoryFilter = "Recommended", 
            DisableFilters = not l_FFlagAXCatalogSupportDisableFilters_0 or nil, 
            ShowSponsored = true, 
            ShowWidgets = true, 
            ShowTopics = true, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.All:rawValue(), 
            WidgetContext = (not not l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0) and "catalog-tab:all" or nil, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.AllItems:rawValue() else nil
        };
        local v37 = {
            Id = l_CatalogCategories_0.Characters:rawValue(), 
            Name = "Characters", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Characters, 
            Title = "Feature.Catalog.Label.Characters", 
            BundleTypes = {
                v5.BundleTypeIdStrings.BodyParts
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.Characters:rawValue()
        };
        local v38 = if l_FFlagAXCatalogM41Props_0 then {
            Id = l_CatalogCategories_0.Props:rawValue(), 
            Name = "Props", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Props, 
            Title = "Feature.Avatar.Label.Props", 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            TaxonomyUuid = v14.Props:rawValue()
        } else nil;
        local v39 = {};
        local v40 = nil;
        if l_FFlagAXCatalogMakeupSupport_0 then
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.MakeupLooks:rawValue(), 
                Name = "Looks", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.MakeupLooks, 
                Title = "Feature.Catalog.Label.MakeupLooks", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup, 
                DisableFilters = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                LooksWidgetContextForOrganicContent = "makeup-tab", 
                isSubcategory = true
            });
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.EyeMakeup:rawValue(), 
                Name = "Eyes", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.EyeMakeup, 
                Title = "Feature.Catalog.Label.EyeMakeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.EyeMakeup
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.EyeMakeup:rawValue() else nil
            });
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.LipMakeup:rawValue(), 
                Name = "Lips", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.LipMakeup, 
                Title = "Feature.Catalog.Label.LipMakeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.LipMakeup
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.LipMakeup:rawValue() else nil
            });
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.FaceMakeup:rawValue(), 
                Name = "Face", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FaceMakeup, 
                Title = "Feature.Catalog.Label.FaceMakeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.FaceMakeup
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.FaceMakeup:rawValue() else nil
            });
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.Eyelashes:rawValue(), 
                Name = "Eyelashes", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Eyelashes, 
                Title = "Feature.Catalog.Label.EyelashMakeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.EyelashAccessory
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Eyelashes:rawValue() else nil
            });
            table.insert(v39, {
                Id = l_CatalogSubcategories_0.Eyebrows:rawValue(), 
                Name = "Eyebrows", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Eyebrows, 
                Title = "Feature.Catalog.Label.EyebrowMakeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.EyebrowAccessory
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Eyebrows:rawValue() else nil
            });
            v40 = {
                Id = l_CatalogCategories_0.Makeup:rawValue(), 
                Name = "Makeup", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Makeup, 
                Title = "Feature.Catalog.Label.Makeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Makeup, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.EyelashAccessory, 
                    v5.AssetTypeIdStrings.EyebrowAccessory, 
                    v5.AssetTypeIdStrings.FaceMakeup, 
                    v5.AssetTypeIdStrings.LipMakeup, 
                    v5.AssetTypeIdStrings.EyeMakeup
                }, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                Subcategories = v39, 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Makeup:rawValue() else nil
            };
        end;
        local v41 = {};
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Hats:rawValue(), 
            Name = "Hats", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hats, 
            Title = "Feature.Avatar.Label.Head", 
            CameraFocus = v5.FocusType.Head, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Hats, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Hat
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Hats:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.HeadAccessories:rawValue() else nil
        });
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Face:rawValue(), 
            Name = "Face", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Face, 
            Title = "Feature.Avatar.Label.Face", 
            CameraFocus = v5.FocusType.Face, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.FaceAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Face:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FaceAccessories:rawValue() else nil
        });
        if l_FFlagAXCatalogM41FullMasks_0 then
            table.insert(v41, {
                Id = l_CatalogSubcategories_0.FullMasks:rawValue(), 
                Name = "Full Masks", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FullMasks, 
                Title = "Feature.Avatar.Label.FullMasks", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = v14.FullMasks:rawValue()
            });
        end;
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Neck:rawValue(), 
            Name = "Neck", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Neck, 
            Title = "Feature.Avatar.Label.Neck", 
            CameraFocus = v5.FocusType.Neck, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Neck, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.NeckAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Neck:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.NeckAccessories:rawValue() else nil
        });
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Shoulder:rawValue(), 
            Name = "Shoulder", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Shoulder, 
            Title = "Feature.Avatar.Label.Shoulder", 
            CameraFocus = v5.FocusType.Shoulders, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.ShoulderAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Shoulder:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ShoulderAccessories:rawValue() else nil
        });
        if l_FFlagAXCatalogM41HandAndArm_0 then
            table.insert(v41, {
                Id = l_CatalogSubcategories_0.HandAndArm:rawValue(), 
                Name = "Hand & Arm", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.HandAndArm, 
                Title = "Feature.Avatar.Label.HandAndArm", 
                CameraFocus = v5.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = v14.HandAndArm:rawValue()
            });
        end;
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Front:rawValue(), 
            Name = "Front", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Front, 
            Title = "Feature.Avatar.Label.Front", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Front, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.FrontAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Front:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FrontAccessories:rawValue() else nil
        });
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Back:rawValue(), 
            Name = "Back", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Back, 
            Title = "Feature.Avatar.Label.Back", 
            CameraFocus = v5.FocusType.Arms, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Back, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.BackAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Back:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.BackAccessories:rawValue() else nil
        });
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Waist:rawValue(), 
            Name = "Waist", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Waist, 
            Title = "Feature.Avatar.Label.Waist", 
            CameraFocus = v5.FocusType.Waist, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Waist, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.WaistAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Waist:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.WaistAccessories:rawValue() else nil
        });
        table.insert(v41, {
            Id = l_CatalogSubcategories_0.Gear:rawValue(), 
            Name = "Gear", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Gear, 
            Title = "Feature.Catalog.Label.Gear", 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Gear
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Gear:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Gear:rawValue() else nil
        });
        local v42 = {
            Id = l_CatalogCategories_0.Accessories:rawValue(), 
            Name = "Accessories", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Accessories, 
            Title = "Feature.Catalog.LabelAccessories", 
            TimeToRefresh = v17(), 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Hat, 
                v5.AssetTypeIdStrings.FaceAccessory, 
                v5.AssetTypeIdStrings.NeckAccessory, 
                v5.AssetTypeIdStrings.ShoulderAccessory, 
                v5.AssetTypeIdStrings.FrontAccessory, 
                v5.AssetTypeIdStrings.BackAccessory, 
                v5.AssetTypeIdStrings.WaistAccessory, 
                v5.AssetTypeIdStrings.Gear
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            CategoryId = l_CatalogCategoryIds_0.Accessories:rawValue(), 
            Subcategories = v41, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Accessories:rawValue() else nil
        };
        local v43 = {};
        table.insert(v43, {
            Id = l_CatalogSubcategories_0.Heads:rawValue(), 
            Name = "Heads", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Heads, 
            Title = "Feature.Avatar.Label.Heads", 
            CameraFocus = v5.FocusType.Head, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Heads, 
            BundleTypes = {
                v5.BundleTypeIdStrings.DynamicHead
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.DynamicHeads:rawValue() else nil
        });
        table.insert(v43, {
            Id = l_CatalogSubcategories_0.Hair:rawValue(), 
            Name = "Hair", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hair, 
            Title = "Feature.Catalog.Label.Hair", 
            CameraFocus = v5.FocusType.Head, 
            CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Hair, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.HairAccessory
            }, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Hair:rawValue() else nil
        });
        if not l_FFlagRemoveClassicHeadsAndFaces_0 then
            table.insert(v43, {
                Id = l_CatalogSubcategories_0.ClassicHeads:rawValue(), 
                Name = "Classic Heads", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicHeads, 
                Title = "Feature.Avatar.Label.ClassicHeads", 
                CameraFocus = v5.FocusType.Head, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.Head
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicHeads:rawValue() else nil
            });
            table.insert(v43, {
                Id = l_CatalogSubcategories_0.ClassicFaces:rawValue(), 
                Name = "Classic Faces", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicFaces, 
                Title = "Feature.Avatar.Label.ClassicFaces", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.Face
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicFaces:rawValue() else nil
            });
        end;
        local v44 = {
            Id = l_CatalogCategories_0.Head:rawValue(), 
            Name = "Heads", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Head, 
            Title = "Feature.Avatar.Label.Heads", 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.HairAccessory, 
                v5.AssetTypeIdStrings.Head, 
                v5.AssetTypeIdStrings.Face, 
                v5.AssetTypeIdStrings.DynamicHead
            }, 
            BundleTypes = {
                v5.BundleTypeIdStrings.DynamicHead
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.Heads:rawValue(), 
            Subcategories = v43
        };
        local v45 = {};
        table.insert(v45, {
            Id = l_CatalogSubcategories_0.AnimationBundles:rawValue(), 
            Name = "AnimationBundles", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.AnimationBundles, 
            Title = "Feature.Catalog.Label.Bundles", 
            CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
            CanAnimateCameraBasedMood = true, 
            BundleTypes = {
                v5.BundleTypeIdStrings.Animations
            }, 
            PageType = v5.PageType.Animation, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.AnimationBundles:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.AnimationBundles:rawValue() else nil
        });
        table.insert(v45, {
            Id = l_CatalogSubcategories_0.Emotes:rawValue(), 
            Name = "Emotes", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Emotes, 
            Title = "Feature.Catalog.Label.Emotes", 
            CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
            CanAnimateCameraBasedMood = false, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.EmoteAnimation
            }, 
            PageType = v5.PageType.Emotes, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            SubcategoryId = l_CatalogSubcategoryIds_0.Emotes:rawValue(), 
            isSubcategory = true, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Emotes:rawValue() else nil
        });
        local v46 = {
            Id = l_CatalogCategories_0.AllAnimations:rawValue(), 
            Name = "AllAnimations", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.AllAnimations, 
            Title = "Feature.Avatar.Heading.Animations", 
            CategoryId = l_CatalogCategoryIds_0.AllAnimations:rawValue(), 
            CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.EmoteAnimation
            }, 
            BundleTypes = {
                v5.BundleTypeIdStrings.Animations
            }, 
            PageType = v5.PageType.AllAnimation, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            Subcategories = v45, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Animations:rawValue() else nil
        };
        local v47 = nil;
        local v48 = {};
        local v49 = nil;
        if v35 then
            v47 = {
                Id = l_CatalogCategories_0.Avatars:rawValue(), 
                Name = "Avatars", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Avatars, 
                Title = "Feature.Catalog.Label.Avatars", 
                ShowLooksAsOrganicContent = not l_FFlagAXLooksWidgetContextForOrganicContent_0 or nil, 
                LooksWidgetContextForOrganicContent = l_FFlagAXLooksWidgetContextForOrganicContent_0 and "avatarTab" or nil, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                DisableFilters = l_FFlagAXCatalogSupportDisableFilters_0 and true or nil
            };
            table.insert(v48, {
                Id = l_CatalogSubcategories_0.FullBodies:rawValue(), 
                Name = "Full Bodies", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FullBodies, 
                Title = "Feature.Catalog.Label.FullBodies", 
                BundleTypes = {
                    v5.BundleTypeIdStrings.BodyParts
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                SubcategoryId = l_CatalogSubcategoryIds_0.FullBodies:rawValue(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FullBodies:rawValue() else nil
            });
            table.insert(v48, {
                Id = l_CatalogSubcategories_0.Hair:rawValue(), 
                Name = "Hair", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hair, 
                Title = "Feature.Catalog.Label.Hair", 
                CameraFocus = v5.FocusType.Head, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Hair, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.HairAccessory
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                SubcategoryId = l_CatalogSubcategoryIds_0.Hair:rawValue(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Hair:rawValue() else nil
            });
            table.insert(v48, {
                Id = l_CatalogSubcategories_0.Heads:rawValue(), 
                Name = "Heads", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Heads, 
                Title = "Feature.Avatar.Label.Heads", 
                CameraFocus = v5.FocusType.Head, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Heads, 
                BundleTypes = {
                    v5.BundleTypeIdStrings.DynamicHead
                }, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                SubcategoryId = l_CatalogSubcategoryIds_0.Head:rawValue(), 
                isSubcategory = true, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.DynamicHeads:rawValue() else nil
            });
            if not l_FFlagRemoveClassicHeadsAndFaces_0 then
                table.insert(v48, {
                    Id = l_CatalogSubcategories_0.ClassicHeads:rawValue(), 
                    Name = "Classic Heads", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicHeads, 
                    Title = "Feature.Avatar.Label.ClassicHeads", 
                    CameraFocus = v5.FocusType.Head, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Head
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.ClassicHeads:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicHeads:rawValue() else nil
                });
                table.insert(v48, {
                    Id = l_CatalogSubcategories_0.ClassicFaces:rawValue(), 
                    Name = "Classic Faces", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicFaces, 
                    Title = "Feature.Avatar.Label.ClassicFaces", 
                    CameraFocus = v5.FocusType.Face, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Face
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.ClassicFaces:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicFaces:rawValue() else nil
                });
            end;
            v49 = {
                Id = l_CatalogCategories_0.Body:rawValue(), 
                Name = "Body", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Body, 
                Title = "Feature.Catalog.Label.Body", 
                TooltipKey = if l_FFlagAXMigrateCategoryTooltip_0 then v34 else l_FFlagAXCatalogCategoryTooltip_0 and "BodyCategoryCatalogTooltip" or nil, 
                TooltipLocalizationKey = l_FFlagAXMigrateCategoryTooltip_0 and "Feature.Catalog.Message.BodyCategoryTooltip" or nil, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.HairAccessory, 
                    v5.AssetTypeIdStrings.Head, 
                    v5.AssetTypeIdStrings.Face, 
                    v5.AssetTypeIdStrings.DynamicHead
                }, 
                BundleTypes = {
                    v5.BundleTypeIdStrings.BodyParts, 
                    v5.BundleTypeIdStrings.DynamicHead
                }, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                CategoryId = l_CatalogCategoryIds_0.Body:rawValue(), 
                Subcategories = v48, 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Body:rawValue() else nil
            };
        end;
        local v50 = {};
        table.insert(v50, v36);
        if v35 then
            table.insert(v50, v47);
            table.insert(v50, v49);
        else
            table.insert(v50, v37);
        end;
        if l_FFlagAXCatalogMakeupSupport_0 then
            table.insert(v50, v40);
        end;
        if l_FFlagAXCatalogM41Props_0 then
            table.insert(v50, v38);
        end;
        table.insert(v50, v7().catalogCategories);
        table.insert(v50, v42);
        if not v35 then
            table.insert(v50, v44);
        end;
        table.insert(v50, v46);
        return v50;
    end;
end;
local function v73() --[[ Line: 706 ]] --[[ Name: buildCategories ]]
    -- upvalues: l_FFlagAXCatalogCategoriesFlaggedMap_0 (copy), v51 (copy), l_CatalogCategories_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), v6 (copy), v17 (copy), l_CatalogCategoryIds_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_FFlagAXM41AllCategoriesToTaxonomy_0 (copy), v14 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v5 (copy), l_Constants_0 (copy), l_FFlagAXCatalogMakeupTaxonomy_0 (copy), l_CatalogSubcategories_0 (copy), l_FFlagAXCatalogM41Props_0 (copy), l_FFlagAXCatalogM41FullMasks_0 (copy), l_FFlagAXCatalogM41HandAndArm_0 (copy), l_CatalogSubcategoryIds_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), l_AXAvatarsTabIXP_0 (copy), v15 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), v34 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v7 (copy)
    if l_FFlagAXCatalogCategoriesFlaggedMap_0 then
        return (v51());
    else
        local v52 = {
            Id = l_CatalogCategories_0.Recommended:rawValue(), 
            Name = "All", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Recommended, 
            Title = "Feature.Avatar.Heading.All", 
            CategoryFilter = "Recommended", 
            DisableFilters = not l_FFlagAXCatalogSupportDisableFilters_0 or nil, 
            ShowSponsored = true, 
            ShowWidgets = true, 
            ShowTopics = true, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.All:rawValue(), 
            WidgetContext = (not not l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0) and "catalog-tab:all" or nil, 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.AllItems:rawValue() else nil
        };
        local v53 = nil;
        if l_FFlagAXCatalogMakeupSupport_0 then
            v53 = {
                Id = l_CatalogCategories_0.Makeup:rawValue(), 
                Name = "Makeup", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Makeup, 
                Title = "Feature.Catalog.Label.Makeup", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Makeup, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.EyelashAccessory, 
                    v5.AssetTypeIdStrings.EyebrowAccessory, 
                    v5.AssetTypeIdStrings.FaceMakeup, 
                    v5.AssetTypeIdStrings.LipMakeup, 
                    v5.AssetTypeIdStrings.EyeMakeup
                }, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Makeup:rawValue() else nil, 
                Subcategories = {
                    [1] = {
                        Id = l_CatalogSubcategories_0.MakeupLooks:rawValue(), 
                        Name = "Looks", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.MakeupLooks, 
                        Title = "Feature.Catalog.Label.MakeupLooks", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup, 
                        DisableFilters = true, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        LooksWidgetContextForOrganicContent = "makeup-tab", 
                        isSubcategory = true
                    }, 
                    [2] = {
                        Id = l_CatalogSubcategories_0.EyeMakeup:rawValue(), 
                        Name = "Eyes", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.EyeMakeup, 
                        Title = "Feature.Catalog.Label.EyeMakeup", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.EyeMakeup
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.EyeMakeup:rawValue() else nil
                    }, 
                    [3] = {
                        Id = l_CatalogSubcategories_0.LipMakeup:rawValue(), 
                        Name = "Lips", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.LipMakeup, 
                        Title = "Feature.Catalog.Label.LipMakeup", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.LipMakeup
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.LipMakeup:rawValue() else nil
                    }, 
                    [4] = {
                        Id = l_CatalogSubcategories_0.FaceMakeup:rawValue(), 
                        Name = "Face", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FaceMakeup, 
                        Title = "Feature.Catalog.Label.FaceMakeup", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.FaceMakeup
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.FaceMakeup:rawValue() else nil
                    }, 
                    [5] = {
                        Id = l_CatalogSubcategories_0.Eyelashes:rawValue(), 
                        Name = "Eyelashes", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Eyelashes, 
                        Title = "Feature.Catalog.Label.EyelashMakeup", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.EyelashAccessory
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Eyelashes:rawValue() else nil
                    }, 
                    [6] = {
                        Id = l_CatalogSubcategories_0.Eyebrows:rawValue(), 
                        Name = "Eyebrows", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Eyebrows, 
                        Title = "Feature.Catalog.Label.EyebrowMakeup", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.EyebrowAccessory
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXCatalogMakeupTaxonomy_0 then v14.Eyebrows:rawValue() else nil
                    }
                }
            };
        end;
        local v54 = {
            Id = l_CatalogCategories_0.Characters:rawValue(), 
            Name = "Characters", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Characters, 
            Title = "Feature.Catalog.Label.Characters", 
            BundleTypes = {
                v5.BundleTypeIdStrings.BodyParts
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.Characters:rawValue()
        };
        local v55 = nil;
        local v56 = nil;
        local v57 = nil;
        if l_FFlagAXCatalogM41Props_0 then
            v55 = {
                Id = l_CatalogCategories_0.Props:rawValue(), 
                Name = "Props", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Props, 
                Title = "Feature.Avatar.Label.Props", 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                TaxonomyUuid = v14.Props:rawValue()
            };
        end;
        if l_FFlagAXCatalogM41FullMasks_0 then
            v56 = {
                Id = l_CatalogSubcategories_0.FullMasks:rawValue(), 
                Name = "Full Masks", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FullMasks, 
                Title = "Feature.Avatar.Label.FullMasks", 
                CameraFocus = v5.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = v14.FullMasks:rawValue()
            };
        end;
        if l_FFlagAXCatalogM41HandAndArm_0 then
            v57 = {
                Id = l_CatalogSubcategories_0.HandAndArm:rawValue(), 
                Name = "Hand & Arm", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.HandAndArm, 
                Title = "Feature.Avatar.Label.HandAndArm", 
                CameraFocus = v5.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                isSubcategory = true, 
                TaxonomyUuid = v14.HandAndArm:rawValue()
            };
        end;
        local v58 = {
            Id = l_CatalogCategories_0.Accessories:rawValue(), 
            Name = "Accessories", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Accessories, 
            Title = "Feature.Catalog.LabelAccessories", 
            TimeToRefresh = v17(), 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.Hat, 
                v5.AssetTypeIdStrings.FaceAccessory, 
                v5.AssetTypeIdStrings.NeckAccessory, 
                v5.AssetTypeIdStrings.ShoulderAccessory, 
                v5.AssetTypeIdStrings.FrontAccessory, 
                v5.AssetTypeIdStrings.BackAccessory, 
                v5.AssetTypeIdStrings.WaistAccessory, 
                v5.AssetTypeIdStrings.Gear
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            CategoryId = l_CatalogCategoryIds_0.Accessories:rawValue(), 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Accessories:rawValue() else nil, 
            Subcategories = {
                [1] = {
                    Id = l_CatalogSubcategories_0.Hats:rawValue(), 
                    Name = "Hats", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hats, 
                    Title = "Feature.Avatar.Label.Head", 
                    CameraFocus = v5.FocusType.Head, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Hats, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Hat
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Hats:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.HeadAccessories:rawValue() else nil
                }, 
                [2] = {
                    Id = l_CatalogSubcategories_0.Face:rawValue(), 
                    Name = "Face", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Face, 
                    Title = "Feature.Avatar.Label.Face", 
                    CameraFocus = v5.FocusType.Face, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.FaceAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Face:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FaceAccessories:rawValue() else nil
                }, 
                [3] = {
                    Id = l_CatalogSubcategories_0.Neck:rawValue(), 
                    Name = "Neck", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Neck, 
                    Title = "Feature.Avatar.Label.Neck", 
                    CameraFocus = v5.FocusType.Neck, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Neck, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.NeckAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Neck:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.NeckAccessories:rawValue() else nil
                }, 
                [4] = {
                    Id = l_CatalogSubcategories_0.Shoulder:rawValue(), 
                    Name = "Shoulder", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Shoulder, 
                    Title = "Feature.Avatar.Label.Shoulder", 
                    CameraFocus = v5.FocusType.Shoulders, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.ShoulderAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Shoulder:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ShoulderAccessories:rawValue() else nil
                }, 
                [5] = {
                    Id = l_CatalogSubcategories_0.Front:rawValue(), 
                    Name = "Front", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Front, 
                    Title = "Feature.Avatar.Label.Front", 
                    CameraFocus = v5.FocusType.Arms, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Front, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.FrontAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Front:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FrontAccessories:rawValue() else nil
                }, 
                [6] = {
                    Id = l_CatalogSubcategories_0.Back:rawValue(), 
                    Name = "Back", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Back, 
                    Title = "Feature.Avatar.Label.Back", 
                    CameraFocus = v5.FocusType.Arms, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Back, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.BackAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Back:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.BackAccessories:rawValue() else nil
                }, 
                [7] = {
                    Id = l_CatalogSubcategories_0.Waist:rawValue(), 
                    Name = "Waist", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Waist, 
                    Title = "Feature.Avatar.Label.Waist", 
                    CameraFocus = v5.FocusType.Waist, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.CatalogAccessories.Waist, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.WaistAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Waist:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.WaistAccessories:rawValue() else nil
                }, 
                [8] = {
                    Id = l_CatalogSubcategories_0.Gear:rawValue(), 
                    Name = "Gear", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Gear, 
                    Title = "Feature.Catalog.Label.Gear", 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Gear
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Gear:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Gear:rawValue() else nil
                }
            }
        };
        if l_FFlagAXCatalogM41FullMasks_0 and v58.Subcategories then
            local v59 = 2;
            for v60, v61 in pairs(v58.Subcategories) do
                if v61.Name == "Face" then
                    v59 = v60;
                    break;
                end;
            end;
            table.insert(v58.Subcategories, v59 + 1, v56);
        end;
        if l_FFlagAXCatalogM41HandAndArm_0 and v58.Subcategories then
            local v62 = 5;
            for v63, v64 in pairs(v58.Subcategories) do
                if v64.Name == "Shoulder" then
                    v62 = v63;
                    break;
                end;
            end;
            table.insert(v58.Subcategories, v62 + 1, v57);
        end;
        local v65 = {
            Id = l_CatalogCategories_0.Head:rawValue(), 
            Name = "Heads", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Head, 
            Title = "Feature.Avatar.Label.Heads", 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.HairAccessory, 
                v5.AssetTypeIdStrings.Head, 
                v5.AssetTypeIdStrings.Face, 
                v5.AssetTypeIdStrings.DynamicHead
            }, 
            BundleTypes = {
                v5.BundleTypeIdStrings.DynamicHead
            }, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            CategoryId = l_CatalogCategoryIds_0.Heads:rawValue(), 
            Subcategories = {
                [1] = {
                    Id = l_CatalogSubcategories_0.Heads:rawValue(), 
                    Name = "Heads", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Heads, 
                    Title = "Feature.Avatar.Label.Heads", 
                    CameraFocus = v5.FocusType.Head, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Heads, 
                    BundleTypes = {
                        v5.BundleTypeIdStrings.DynamicHead
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.DynamicHeads:rawValue() else nil
                }, 
                [2] = {
                    Id = l_CatalogSubcategories_0.Hair:rawValue(), 
                    Name = "Hair", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hair, 
                    Title = "Feature.Catalog.Label.Hair", 
                    CameraFocus = v5.FocusType.Head, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Hair, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.HairAccessory
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Hair:rawValue() else nil
                }, 
                [3] = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
                    Id = l_CatalogSubcategories_0.ClassicHeads:rawValue(), 
                    Name = "Classic Heads", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicHeads, 
                    Title = "Feature.Avatar.Label.ClassicHeads", 
                    CameraFocus = v5.FocusType.Head, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Head
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicHeads:rawValue() else nil
                } else nil, 
                [4] = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
                    Id = l_CatalogSubcategories_0.ClassicFaces:rawValue(), 
                    Name = "Classic Faces", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicFaces, 
                    Title = "Feature.Avatar.Label.ClassicFaces", 
                    CameraFocus = v5.FocusType.Face, 
                    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.Face
                    }, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicFaces:rawValue() else nil
                } else nil
            }
        };
        local v66 = {
            Id = l_CatalogCategories_0.AllAnimations:rawValue(), 
            Name = "AllAnimations", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.AllAnimations, 
            Title = "Feature.Avatar.Heading.Animations", 
            CategoryId = l_CatalogCategoryIds_0.AllAnimations:rawValue(), 
            CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
            AssetTypeIdStrings = {
                v5.AssetTypeIdStrings.EmoteAnimation
            }, 
            BundleTypes = {
                v5.BundleTypeIdStrings.Animations
            }, 
            PageType = v5.PageType.AllAnimation, 
            CanAnimateCameraBasedMood = true, 
            SearchUuid = v6(), 
            TimeToRefresh = v17(), 
            TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Animations:rawValue() else nil, 
            Subcategories = {
                [1] = {
                    Id = l_CatalogSubcategories_0.AnimationBundles:rawValue(), 
                    Name = "AnimationBundles", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.AnimationBundles, 
                    Title = "Feature.Catalog.Label.Bundles", 
                    CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
                    CanAnimateCameraBasedMood = true, 
                    BundleTypes = {
                        v5.BundleTypeIdStrings.Animations
                    }, 
                    PageType = v5.PageType.Animation, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.AnimationBundles:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.AnimationBundles:rawValue() else nil
                }, 
                [2] = {
                    Id = l_CatalogSubcategories_0.Emotes:rawValue(), 
                    Name = "Emotes", 
                    NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Emotes, 
                    Title = "Feature.Catalog.Label.Emotes", 
                    CameraZoomRadius = v5.AnimationCategoryCameraZoomRadius, 
                    CanAnimateCameraBasedMood = false, 
                    AssetTypeIdStrings = {
                        v5.AssetTypeIdStrings.EmoteAnimation
                    }, 
                    PageType = v5.PageType.Emotes, 
                    SearchUuid = v6(), 
                    TimeToRefresh = v17(), 
                    SubcategoryId = l_CatalogSubcategoryIds_0.Emotes:rawValue(), 
                    isSubcategory = true, 
                    TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Emotes:rawValue() else nil
                }
            }
        };
        if if l_AXAvatarsTabIXP_0.isEnabled() then v15.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil then
            local v67 = {
                Id = l_CatalogCategories_0.Avatars:rawValue(), 
                Name = "Avatars", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Avatars, 
                Title = "Feature.Catalog.Label.Avatars", 
                ShowLooksAsOrganicContent = not l_FFlagAXLooksWidgetContextForOrganicContent_0 or nil, 
                LooksWidgetContextForOrganicContent = l_FFlagAXLooksWidgetContextForOrganicContent_0 and "avatarTab" or nil, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                DisableFilters = l_FFlagAXCatalogSupportDisableFilters_0 and true or nil
            };
            local v68 = {
                Id = l_CatalogCategories_0.Body:rawValue(), 
                Name = "Body", 
                NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Body, 
                Title = "Feature.Catalog.Label.Body", 
                TooltipKey = if l_FFlagAXMigrateCategoryTooltip_0 then v34 else l_FFlagAXCatalogCategoryTooltip_0 and "BodyCategoryCatalogTooltip" or nil, 
                TooltipLocalizationKey = l_FFlagAXMigrateCategoryTooltip_0 and "Feature.Catalog.Message.BodyCategoryTooltip" or nil, 
                AssetTypeIdStrings = {
                    v5.AssetTypeIdStrings.HairAccessory, 
                    v5.AssetTypeIdStrings.Head, 
                    v5.AssetTypeIdStrings.Face, 
                    v5.AssetTypeIdStrings.DynamicHead
                }, 
                BundleTypes = {
                    v5.BundleTypeIdStrings.BodyParts, 
                    v5.BundleTypeIdStrings.DynamicHead
                }, 
                CanAnimateCameraBasedMood = true, 
                SearchUuid = v6(), 
                TimeToRefresh = v17(), 
                CategoryId = l_CatalogCategoryIds_0.Body:rawValue(), 
                TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Body:rawValue() else nil, 
                Subcategories = {
                    [1] = {
                        Id = l_CatalogSubcategories_0.FullBodies:rawValue(), 
                        Name = "Full Bodies", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.FullBodies, 
                        Title = "Feature.Catalog.Label.FullBodies", 
                        BundleTypes = {
                            v5.BundleTypeIdStrings.BodyParts
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        SubcategoryId = l_CatalogSubcategoryIds_0.FullBodies:rawValue(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.FullBodies:rawValue() else nil
                    }, 
                    [2] = {
                        Id = l_CatalogSubcategories_0.Hair:rawValue(), 
                        Name = "Hair", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Hair, 
                        Title = "Feature.Catalog.Label.Hair", 
                        CameraFocus = v5.FocusType.Head, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Hair, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.HairAccessory
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        SubcategoryId = l_CatalogSubcategoryIds_0.Hair:rawValue(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.Hair:rawValue() else nil
                    }, 
                    [3] = {
                        Id = l_CatalogSubcategories_0.Heads:rawValue(), 
                        Name = "Heads", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.Heads, 
                        Title = "Feature.Avatar.Label.Heads", 
                        CameraFocus = v5.FocusType.Head, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Heads, 
                        BundleTypes = {
                            v5.BundleTypeIdStrings.DynamicHead
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        SubcategoryId = l_CatalogSubcategoryIds_0.Head:rawValue(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.DynamicHeads:rawValue() else nil
                    }, 
                    [4] = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
                        Id = l_CatalogSubcategories_0.ClassicHeads:rawValue(), 
                        Name = "Classic Heads", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicHeads, 
                        Title = "Feature.Avatar.Label.ClassicHeads", 
                        CameraFocus = v5.FocusType.Head, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.Head
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        SubcategoryId = l_CatalogSubcategoryIds_0.ClassicHeads:rawValue(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicHeads:rawValue() else nil
                    } else nil, 
                    [5] = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
                        Id = l_CatalogSubcategories_0.ClassicFaces:rawValue(), 
                        Name = "Classic Faces", 
                        NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogSubcategories_0.ClassicFaces, 
                        Title = "Feature.Avatar.Label.ClassicFaces", 
                        CameraFocus = v5.FocusType.Face, 
                        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces, 
                        AssetTypeIdStrings = {
                            v5.AssetTypeIdStrings.Face
                        }, 
                        SearchUuid = v6(), 
                        TimeToRefresh = v17(), 
                        SubcategoryId = l_CatalogSubcategoryIds_0.ClassicFaces:rawValue(), 
                        isSubcategory = true, 
                        TaxonomyUuid = if l_FFlagAXM41AllCategoriesToTaxonomy_0 then v14.ClassicFaces:rawValue() else nil
                    } else nil
                }
            };
            if l_FFlagAXCatalogMakeupSupport_0 then
                local v69 = {
                    v52, 
                    v67, 
                    v68, 
                    v53, 
                    v7().catalogCategories, 
                    v58, 
                    v66
                };
                if l_FFlagAXCatalogM41Props_0 then
                    table.insert(v69, 5, v55);
                end;
                return v69;
            else
                local v70 = {
                    v52, 
                    v67, 
                    v68, 
                    v7().catalogCategories, 
                    v58, 
                    v66
                };
                if l_FFlagAXCatalogM41Props_0 then
                    table.insert(v70, 4, v55);
                end;
                return v70;
            end;
        elseif l_FFlagAXCatalogMakeupSupport_0 then
            local v71 = {
                v52, 
                v54, 
                v53, 
                v7().catalogCategories, 
                v58, 
                v65, 
                v66
            };
            if l_FFlagAXCatalogM41Props_0 then
                table.insert(v71, 4, v55);
            end;
            return v71;
        else
            local v72 = {
                v52, 
                v54, 
                v7().catalogCategories, 
                v58, 
                v65, 
                v66
            };
            if l_FFlagAXCatalogM41Props_0 then
                table.insert(v72, 3, v55);
            end;
            return v72;
        end;
    end;
end;
local v74 = nil;
local function _(v75) --[[ Line: 1511 ]] --[[ Name: sanityCheckCat ]]
    -- upvalues: v8 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy)
    v8.isNotNil(v75.SearchUuid, "category  " .. v75.Name .. " is missing SearchUuid");
    v8.isNotNil(v75.Id, "category  " .. v75.Name .. " is missing Id");
    if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
        v8.isTypeOrNil(v75.NavigationKey, "nil", "NavigationKey");
    end;
end;
local function _(v77, v78) --[[ Line: 1519 ]] --[[ Name: checkDuplicateId ]]
    if v77 then
        if v78[v77] then
            error("Duplicate Id found: " .. v77);
            return;
        else
            v78[v77] = true;
        end;
    end;
end;
local function v88(v80) --[[ Line: 1529 ]] --[[ Name: sanityCheck ]]
    -- upvalues: v8 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy)
    local v81 = {};
    for _, v83 in v80 do
        v8.isNotNil(v83.SearchUuid, "category  " .. v83.Name .. " is missing SearchUuid");
        v8.isNotNil(v83.Id, "category  " .. v83.Name .. " is missing Id");
        if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
            v8.isTypeOrNil(v83.NavigationKey, "nil", "NavigationKey");
        end;
        local l_Id_0 = v83.Id;
        if l_Id_0 then
            if v81[l_Id_0] then
                error("Duplicate Id found: " .. l_Id_0);
            else
                v81[l_Id_0] = true;
            end;
        end;
        if v83.Subcategories then
            for _, v86 in v83.Subcategories do
                v8.isNotNil(v86.SearchUuid, "category  " .. v86.Name .. " is missing SearchUuid");
                v8.isNotNil(v86.Id, "category  " .. v86.Name .. " is missing Id");
                if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
                    v8.isTypeOrNil(v86.NavigationKey, "nil", "NavigationKey");
                end;
                local l_Id_1 = v86.Id;
                if l_Id_1 then
                    if v81[l_Id_1] then
                        error("Duplicate Id found: " .. l_Id_1);
                    else
                        v81[l_Id_1] = true;
                    end;
                end;
                v8.isNotNil(v86.isSubcategory, "subcategory  " .. v86.Id .. " is missing isSubcategory");
            end;
        end;
    end;
end;
return function(v89) --[[ Line: 1547 ]]
    -- upvalues: v73 (copy), v88 (copy), v74 (ref)
    if v89 then
        local v90 = v73();
        v88(v90);
        return v90;
    else
        if not v74 then
            v74 = v73();
            v88(v74);
        end;
        return v74;
    end;
end;