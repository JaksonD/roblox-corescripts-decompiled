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
local v29 = game:DefineFastString("AXBodyCategoryTooltipKey", "BodyCategoryCatalogTooltip");
local function v38() --[[ Line: 48 ]] --[[ Name: buildCategories ]]
    -- upvalues: l_CatalogCategories_0 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXCatalogSupportDisableFilters_0 (copy), v6 (copy), v17 (copy), l_CatalogCategoryIds_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_FFlagAXFixWidgetOnlyTabNoItemsFound_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v5 (copy), l_Constants_0 (copy), l_CatalogSubcategories_0 (copy), l_FFlagAXCatalogMakeupTaxonomy_0 (copy), v14 (copy), l_CatalogSubcategoryIds_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), l_AXAvatarsTabIXP_0 (copy), v15 (copy), l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), v29 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), v7 (copy)
    local v30 = {
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
        WidgetContext = (not not l_FFlagAXCatalogCategoriesSDUI_0 or l_FFlagAXFixWidgetOnlyTabNoItemsFound_0) and "catalog-tab:all" or nil
    };
    local v31 = nil;
    if l_FFlagAXCatalogMakeupSupport_0 then
        v31 = {
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
    local v32 = {
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
    local v33 = {
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
            }
        }
    };
    local v34 = {
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
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
                isSubcategory = true
            } else nil
        }
    };
    local v35 = {
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
                isSubcategory = true
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
                isSubcategory = true
            }
        }
    };
    if if l_AXAvatarsTabIXP_0.isEnabled() then v15.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil then
        local v36 = {
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
        local v37 = {
            Id = l_CatalogCategories_0.Body:rawValue(), 
            Name = "Body", 
            NavigationKey = if l_FFlagAXRemoveCatalogCategoryNavKey_0 then nil else l_CatalogCategories_0.Body, 
            Title = "Feature.Catalog.Label.Body", 
            TooltipKey = if l_FFlagAXMigrateCategoryTooltip_0 then v29 else l_FFlagAXCatalogCategoryTooltip_0 and "BodyCategoryCatalogTooltip" or nil, 
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
                    isSubcategory = true
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
                    isSubcategory = true
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
                    isSubcategory = true
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
                    isSubcategory = true
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
                    isSubcategory = true
                } else nil
            }
        };
        if l_FFlagAXCatalogMakeupSupport_0 then
            return {
                v30, 
                v36, 
                v37, 
                v31, 
                v7().catalogCategories, 
                v33, 
                v35
            };
        else
            return {
                v30, 
                v36, 
                v37, 
                v7().catalogCategories, 
                v33, 
                v35
            };
        end;
    elseif l_FFlagAXCatalogMakeupSupport_0 then
        return {
            v30, 
            v32, 
            v31, 
            v7().catalogCategories, 
            v33, 
            v34, 
            v35
        };
    else
        return {
            v30, 
            v32, 
            v7().catalogCategories, 
            v33, 
            v34, 
            v35
        };
    end;
end;
local v39 = nil;
local function _(v40) --[[ Line: 693 ]] --[[ Name: sanityCheckCat ]]
    -- upvalues: v8 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy)
    v8.isNotNil(v40.SearchUuid, "category  " .. v40.Name .. " is missing SearchUuid");
    v8.isNotNil(v40.Id, "category  " .. v40.Name .. " is missing Id");
    if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
        v8.isTypeOrNil(v40.NavigationKey, "nil", "NavigationKey");
    end;
end;
local function _(v42, v43) --[[ Line: 701 ]] --[[ Name: checkDuplicateId ]]
    if v42 then
        if v43[v42] then
            error("Duplicate Id found: " .. v42);
            return;
        else
            v43[v42] = true;
        end;
    end;
end;
local function v53(v45) --[[ Line: 711 ]] --[[ Name: sanityCheck ]]
    -- upvalues: v8 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy)
    local v46 = {};
    for _, v48 in v45 do
        v8.isNotNil(v48.SearchUuid, "category  " .. v48.Name .. " is missing SearchUuid");
        v8.isNotNil(v48.Id, "category  " .. v48.Name .. " is missing Id");
        if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
            v8.isTypeOrNil(v48.NavigationKey, "nil", "NavigationKey");
        end;
        local l_Id_0 = v48.Id;
        if l_Id_0 then
            if v46[l_Id_0] then
                error("Duplicate Id found: " .. l_Id_0);
            else
                v46[l_Id_0] = true;
            end;
        end;
        if v48.Subcategories then
            for _, v51 in v48.Subcategories do
                v8.isNotNil(v51.SearchUuid, "category  " .. v51.Name .. " is missing SearchUuid");
                v8.isNotNil(v51.Id, "category  " .. v51.Name .. " is missing Id");
                if l_FFlagAXRemoveCatalogCategoryNavKey_0 then
                    v8.isTypeOrNil(v51.NavigationKey, "nil", "NavigationKey");
                end;
                local l_Id_1 = v51.Id;
                if l_Id_1 then
                    if v46[l_Id_1] then
                        error("Duplicate Id found: " .. l_Id_1);
                    else
                        v46[l_Id_1] = true;
                    end;
                end;
                v8.isNotNil(v51.isSubcategory, "subcategory  " .. v51.Id .. " is missing isSubcategory");
            end;
        end;
    end;
end;
return function(v54) --[[ Line: 729 ]]
    -- upvalues: v38 (copy), v53 (copy), v39 (ref)
    if v54 then
        local v55 = v38();
        v53(v55);
        return v55;
    else
        if not v39 then
            v39 = v38();
            v53(v39);
        end;
        return v39;
    end;
end;