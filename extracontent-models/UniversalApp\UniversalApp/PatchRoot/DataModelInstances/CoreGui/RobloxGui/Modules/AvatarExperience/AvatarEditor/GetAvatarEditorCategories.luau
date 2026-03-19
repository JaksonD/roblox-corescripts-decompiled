local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Constants_0 = v2.Constants;
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v6 = require(l_Modules_0.LuaApp.SearchUuid);
local v7 = require(l_Modules_0.AvatarExperience.Common.getClothingCategories);
local v8 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local v9 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogCategories_0 = v10.Enums.CatalogCategories;
local l_CatalogSubcategories_0 = v10.Enums.CatalogSubcategories;
local l_CatalogSDUICategoryIds_0 = v10.Enums.CatalogSDUICategoryIds;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_IconName_0 = require(l_CorePackages_0.Packages.Foundation).Enums.IconName;
local v16 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v17 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_AvatarEditorSubcategories_0 = v18.Enums.AvatarEditorSubcategories;
local l_AvatarEditorCategories_0 = v18.Enums.AvatarEditorCategories;
local v21 = require(l_Modules_0.AvatarExperience.Flags.FFlagAEGetEditableOutfitsType);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXAddNavigationKeyToEditorSubcategories);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v25 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize);
local v26 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXTweakSlotsCameraPositioning);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v28 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagRemoveClassicHeadsAndFaces_0 = v28.FFlagRemoveClassicHeadsAndFaces;
local l_FFlagAXCustomizeMakeupSupport_0 = v28.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXInventoryDurablesSupport_0 = v28.FFlagAXInventoryDurablesSupport;
local l_FFlagAXCatalogCategoriesSDUI_0 = v28.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXCatalogMakeupSupport_0 = v28.FFlagAXCatalogMakeupSupport;
local v34 = game:DefineFastFlag("AXAvatarTabShopForMore", false);
local l_AXAvatarsTabIXP_0 = v2.Experiments.AXAvatarsTabIXP;
local v36 = nil;
local function v38() --[[ Line: 61 ]]
    -- upvalues: l_AXAvatarsTabIXP_0 (copy), v16 (copy), v5 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy), v21 (copy), v4 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), l_AvatarEditorCategories_0 (copy)
    local v37 = if l_AXAvatarsTabIXP_0.isEnabled() then v16.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil;
    return {
        Name = v5.CharacterKey, 
        Title = "Feature.Catalog.Label.Characters", 
        IconOn = "icons/menu/clothing/characters_on", 
        IconOff = "icons/menu/clothing/characters_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v37 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v37 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v37 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v37 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        SearchUuid = v5.CharacterKey, 
        OutfitType = if v21 then v4.OutfitTypes.Avatar else nil, 
        CanAnimateCameraBasedMood = true, 
        Subcategories = {
            [1] = {
                Name = "Creations", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.CreatedCharacters else nil, 
                Title = "Feature.Avatar.Label.Creations", 
                IconOn = "icons/menu/clothing/creations_on", 
                IconOff = "icons/menu/clothing/creations_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                ManageOutfitsEnabled = true, 
                RecommendationsType = v5.RecommendationsType.BodyParts, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = if v37 then l_CatalogCategories_0.Avatars else l_CatalogCategories_0.Characters
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = if v37 then l_CatalogSDUICategoryIds_0.Avatars:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue()
                } else nil, 
                SearchUuid = v5.EditableCharacterKey, 
                OutfitType = if v21 then v4.OutfitTypes.Avatar else nil, 
                BundleTypes = {
                    v4.BundleTypeIdStrings.BodyParts, 
                    v4.BundleTypeIdStrings.Animations
                }, 
                Id = l_AvatarEditorSubcategories_0.CreatedCharacters
            }, 
            [2] = {
                Name = "Purchased", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.PurchasedCharacters else nil, 
                Title = "Feature.Avatar.Label.Purchased", 
                IconOn = "icons/menu/clothing/purchased_on", 
                IconOff = "icons/menu/clothing/purchased_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                RecommendationsType = v5.RecommendationsType.BodyParts, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = if v37 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
                    SubcategoryKey = if v37 then l_CatalogSubcategories_0.FullBodies else nil
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = if v37 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
                    SubcategoryId = if v37 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
                } else nil, 
                SearchUuid = v5.PurchasedCharacterKey, 
                OutfitType = v4.OutfitTypes.Avatar, 
                Id = l_AvatarEditorSubcategories_0.PurchasedCharacters
            }
        } or nil, 
        Id = l_AvatarEditorCategories_0.Characters
    };
end;
local function v47() --[[ Line: 170 ]]
    -- upvalues: l_AXAvatarsTabIXP_0 (copy), v16 (copy), v23 (copy), l_AvatarEditorCategories_0 (copy), v6 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), v5 (copy), v4 (copy), l_Constants_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy)
    local v39 = if l_AXAvatarsTabIXP_0.isEnabled() then v16.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil;
    local v40 = {
        Name = "Body", 
        NavigationKey = if v23() then l_AvatarEditorCategories_0.Body else nil, 
        Title = "Feature.Catalog.Label.Body", 
        IconOn = "icons/menu/clothing/body_on", 
        IconOff = "icons/menu/clothing/body_off", 
        SearchUuid = v6(), 
        CanAnimateCameraBasedMood = true, 
        Subcategories = {}, 
        Id = l_AvatarEditorCategories_0.Body
    };
    local v41 = {
        Name = "Skin", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Skin else nil, 
        Title = "Feature.Avatar.Label.Skin", 
        IconOn = "icons/menu/clothing/skin_on", 
        IconOff = "icons/menu/clothing/skin_off", 
        RenderItemTiles = false, 
        RecommendationsType = v5.RecommendationsType.None, 
        PageType = v4.PageType.BodyColors, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Skin
    };
    local v42 = {
        Name = "Build", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Build else nil, 
        Title = "Feature.Avatar.Label.Build", 
        IconOn = "icons/menu/clothing/build_on", 
        IconOff = "icons/menu/clothing/build_off", 
        RenderItemTiles = false, 
        RecommendationsType = v5.RecommendationsType.None, 
        PageType = v4.PageType.BodyStyle, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Build
    };
    local v43 = {
        Name = "Hair", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Hair else nil, 
        Title = "Feature.Avatar.Label.Hair", 
        IconOn = "icons/menu/clothing/hair_on", 
        IconOff = "icons/menu/clothing/hair_off", 
        RenderItemTiles = true, 
        UseGetInventoryV2 = true, 
        CameraFocus = v4.FocusType.Head, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Hair, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v39 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = l_CatalogSubcategories_0.Hair
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v39 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_Hair:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.HairAccessory
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Hair
    };
    local v44 = {
        Name = "Heads", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Heads else nil, 
        Title = "Feature.Avatar.Label.Head", 
        IconOn = "icons/menu/clothing/type_on", 
        IconOff = "icons/menu/clothing/type_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        UseGetInventoryV2 = true, 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = if not l_FFlagRemoveClassicHeadsAndFaces_0 then l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads else l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.Heads, 
        RecommendationsType = v5.RecommendationsType.DynamicHeads, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v39 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = l_CatalogSubcategories_0.Heads
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v39 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_Heads:rawValue()
        } else nil, 
        AssetTypeIdStrings = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
            v4.AssetTypeIdStrings.Head
        } else nil, 
        BundleTypeIdStrings = {
            v4.BundleTypeIdStrings.DynamicHead
        }, 
        SubcategoryFiltersHeader = not l_FFlagRemoveClassicHeadsAndFaces_0 and "Feature.Catalog.Heading.ShowHeadType" or nil, 
        SubcategoryFilters = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
            {
                Name = "All Heads", 
                Title = "Feature.Avatar.Label.AllHeads", 
                NavigationKey = l_AvatarEditorSubcategories_0.AllHeads, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Head
                }, 
                BundleTypeIdStrings = {
                    v4.BundleTypeIdStrings.DynamicHead
                }, 
                RenderOutfitItemTiles = true, 
                SearchUuid = v6()
            }, 
            {
                Name = "Dynamic Heads", 
                Title = "Feature.Avatar.Label.DynamicHeads", 
                NavigationKey = l_AvatarEditorSubcategories_0.DynamicHeads, 
                BundleTypeIdStrings = {
                    v4.BundleTypeIdStrings.DynamicHead
                }, 
                RenderOutfitItemTiles = true, 
                SearchUuid = v6()
            }, 
            {
                Name = "Classic Heads", 
                Title = "Feature.Avatar.Label.ClassicHeads", 
                NavigationKey = l_AvatarEditorSubcategories_0.ClassicHeads, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Head
                }, 
                SearchUuid = v6()
            }
        } else nil, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Heads
    };
    local v45 = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
        Name = "Faces", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.ClassicFaces else nil, 
        Title = "Feature.Avatar.Label.Face", 
        IconOn = "icons/menu/clothing/faces_on", 
        IconOff = "icons/menu/clothing/faces_off", 
        RenderItemTiles = true, 
        UseGetInventoryV2 = true, 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v39 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = l_CatalogSubcategories_0.ClassicFaces
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v39 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_ClassicFaces:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.Face
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.ClassicFaces
    } else nil;
    local v46 = {
        Name = "Full Body", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.PurchasedCharacters else nil, 
        Title = "Feature.Catalog.Label.FullBody", 
        IconOn = "icons/menu/clothing/body_on", 
        IconOff = "icons/menu/clothing/body_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        UseGetInventoryV2 = true, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v39 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v39 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v39 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v39 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        SearchUuid = v5.PurchasedCharacterKey, 
        OutfitType = v4.OutfitTypes.Avatar, 
        BundleTypeIdStrings = {
            v4.BundleTypeIdStrings.BodyParts
        }, 
        SubcategoryFiltersHeader = "Feature.Catalog.Heading.ShowBodyParts", 
        SubcategoryFilters = {
            {
                Name = "Full Body", 
                Title = "Feature.Avatar.Label.FullBody", 
                NavigationKey = l_AvatarEditorSubcategories_0.FullBody, 
                BundleTypeIdStrings = {
                    v4.BundleTypeIdStrings.BodyParts
                }, 
                RenderOutfitItemTiles = true, 
                SearchUuid = v6()
            }, 
            {
                Name = "Torso", 
                Title = "Feature.Avatar.Label.Torso", 
                NavigationKey = l_AvatarEditorSubcategories_0.Torsos, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Torso
                }, 
                SearchUuid = v6()
            }, 
            {
                Name = "Right Arms", 
                Title = "Feature.Avatar.Label.RightArm", 
                NavigationKey = l_AvatarEditorSubcategories_0.RightArms, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.RightArm
                }, 
                SearchUuid = v6()
            }, 
            {
                Name = "Left Arms", 
                Title = "Feature.Avatar.Label.LeftArm", 
                NavigationKey = l_AvatarEditorSubcategories_0.LeftArms, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.LeftArm
                }, 
                SearchUuid = v6()
            }, 
            {
                Name = "Right Legs", 
                Title = "Feature.Avatar.Label.RightLeg", 
                NavigationKey = l_AvatarEditorSubcategories_0.RightLegs, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.RightLeg
                }, 
                SearchUuid = v6()
            }, 
            {
                Name = "Left Legs", 
                Title = "Feature.Avatar.Label.LeftLeg", 
                NavigationKey = l_AvatarEditorSubcategories_0.LeftLegs, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.LeftLeg
                }, 
                SearchUuid = v6()
            }
        }, 
        Id = l_AvatarEditorSubcategories_0.PurchasedCharacters
    };
    table.insert(v40.Subcategories, v46);
    table.insert(v40.Subcategories, v43);
    if not l_FFlagAXRootSlotBasedEditorFlag_0 then
        table.insert(v40.Subcategories, v42);
    end;
    table.insert(v40.Subcategories, v44);
    if not l_FFlagRemoveClassicHeadsAndFaces_0 then
        table.insert(v40.Subcategories, v45);
    end;
    if l_FFlagAXRootSlotBasedEditorFlag_0 then
        table.insert(v40.Subcategories, v42);
    end;
    table.insert(v40.Subcategories, v41);
    return v40;
end;
local v48 = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else function() --[[ Line: 467 ]]
    -- upvalues: v23 (copy), l_AvatarEditorCategories_0 (copy), l_IconName_0 (copy), v6 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), v4 (copy), l_Constants_0 (copy), v5 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy)
    return {
        Name = "Makeup", 
        NavigationKey = if v23() then l_AvatarEditorCategories_0.Makeup else nil, 
        Title = "Feature.Avatar.Label.Makeup", 
        IconOn = l_IconName_0.TwoMakeupBrushes, 
        IconOff = l_IconName_0.TwoMakeupBrushes, 
        SearchUuid = v6(), 
        CanAnimateCameraBasedMood = true, 
        ShowSubcategoriesAsSubnavigation = true, 
        Subcategories = {
            {
                Name = "MakeupLooks", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.MakeupLooks else nil, 
                Title = "Feature.Avatar.Label.Looks", 
                IconOn = "icons/menu/clothing/type_on", 
                IconOff = "icons/menu/clothing/type_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                UseGetInventoryV2 = true, 
                PageType = v4.PageType.MakeupLooks, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.MakeupLooks, 
                RecommendationsType = v5.RecommendationsType.None, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.MakeupLooks
                }, 
                AssetTypeIdStrings = {}, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.MakeupLooks
            }, 
            {
                Name = "EyeMakeup", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.EyeMakeup else nil, 
                Title = "Feature.Avatar.Label.EyeMakeup", 
                IconOn = "icons/menu/clothing/type_on", 
                IconOff = "icons/menu/clothing/type_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                UseGetInventoryV2 = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.EyeMakeup
                }, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.EyeMakeup
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.EyeMakeup
            }, 
            {
                Name = "LipMakeup", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.LipMakeup else nil, 
                Title = "Feature.Avatar.Label.LipMakeup", 
                IconOn = "icons/menu/clothing/type_on", 
                IconOff = "icons/menu/clothing/type_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                UseGetInventoryV2 = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.FaceMakeup
                }, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.LipMakeup
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.LipMakeup
            }, 
            {
                Name = "FaceMakeup", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.FaceMakeup else nil, 
                Title = "Feature.Avatar.Label.FaceMakeup", 
                IconOn = "icons/menu/clothing/type_on", 
                IconOff = "icons/menu/clothing/type_off", 
                RenderItemTiles = true, 
                RenderOutfitItemTiles = true, 
                UseGetInventoryV2 = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.LipMakeup
                }, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.FaceMakeup
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.FaceMakeup
            }, 
            {
                Name = "Eyelashes", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Eyelashes else nil, 
                Title = "Feature.Avatar.Label.Eyelashes", 
                IconOn = l_IconName_0.Eyelashes, 
                IconOff = l_IconName_0.Eyelashes, 
                RenderItemTiles = true, 
                UseGetInventoryV2 = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.Eyelashes
                }, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.EyelashAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Eyelashes
            }, 
            {
                Name = "Eyebrows", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Eyebrows else nil, 
                Title = "Feature.Avatar.Label.Eyebrows", 
                IconOn = l_IconName_0.Eyebrows, 
                IconOff = l_IconName_0.Eyebrows, 
                RenderItemTiles = true, 
                UseGetInventoryV2 = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if not l_FFlagAXCatalogMakeupSupport_0 or l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Makeup, 
                    SubcategoryKey = l_CatalogSubcategories_0.Eyebrows
                }, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.EyebrowAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Eyebrows
            }
        }, 
        Id = l_AvatarEditorCategories_0.Makeup
    };
end;
local function v49() --[[ Line: 669 ]]
    -- upvalues: v23 (copy), l_AvatarEditorCategories_0 (copy), v6 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), v4 (copy), l_Constants_0 (copy), v5 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy)
    return {
        Name = "Accessories", 
        NavigationKey = if v23() then l_AvatarEditorCategories_0.Accessories else nil, 
        Title = "Feature.Catalog.LabelAccessories", 
        IconOn = "icons/menu/clothing/accessories_on", 
        IconOff = "icons/menu/clothing/accessories_off", 
        SearchUuid = v6(), 
        HideTextUnderTile = true, 
        CanAnimateCameraBasedMood = true, 
        Subcategories = if v23() then {
            [1] = {
                Name = "Hats", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Hats else nil, 
                Title = "Feature.Avatar.Label.Head", 
                IconOn = "icons/menu/clothing/hats_on", 
                IconOff = "icons/menu/clothing/hats_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Head, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Hats, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Hats
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Heads:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Hat
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Hats
            }, 
            [2] = {
                Name = "Face", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Face else nil, 
                Title = "Feature.Avatar.Label.Face", 
                IconOn = "icons/menu/clothing/face_on", 
                IconOff = "icons/menu/clothing/face_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Face, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Face
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Face:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.FaceAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Face
            }, 
            [3] = {
                Name = "Neck", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Neck else nil, 
                Title = "Feature.Avatar.Label.Neck", 
                IconOn = "icons/menu/clothing/neck_on", 
                IconOff = "icons/menu/clothing/neck_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Neck, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Neck, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Neck
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Neck:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.NeckAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Neck
            }, 
            [4] = {
                Name = "Back", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Back else nil, 
                Title = "Feature.Avatar.Label.Back", 
                IconOn = "icons/menu/clothing/back_on", 
                IconOff = "icons/menu/clothing/back_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Back, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Back
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Back:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.BackAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Back
            }, 
            [5] = {
                Name = "Waist", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Waist else nil, 
                Title = "Feature.Avatar.Label.Waist", 
                IconOn = "icons/menu/clothing/waist_on", 
                IconOff = "icons/menu/clothing/waist_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Waist, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Waist, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Waist
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Waist:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.WaistAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Waist
            }, 
            [6] = {
                Name = "Shoulder", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Shoulder else nil, 
                Title = "Feature.Avatar.Label.Shoulder", 
                IconOn = "icons/menu/clothing/shoulder_on", 
                IconOff = "icons/menu/clothing/shoulder_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Shoulders, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Shoulder, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Shoulder
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Shoulder:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.ShoulderAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Shoulder
            }, 
            [7] = {
                Name = "Front", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Front else nil, 
                Title = "Feature.Avatar.Label.Front", 
                IconOn = "icons/menu/clothing/front_on", 
                IconOff = "icons/menu/clothing/front_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Front, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Front
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Front:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.FrontAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Front
            }, 
            [8] = {
                Name = "Gear", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Gear else nil, 
                Title = "Feature.Avatar.Label.Gear", 
                IconOn = "icons/menu/clothing/gear_on", 
                IconOff = "icons/menu/clothing/gear_off", 
                RenderItemTiles = true, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Gear
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Gear:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Gear
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Gear
            }
        } else {
            [1] = {
                Name = "Hats", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Hats else nil, 
                Title = "Feature.Avatar.Label.Head", 
                IconOn = "icons/menu/clothing/hats_on", 
                IconOff = "icons/menu/clothing/hats_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Head, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Hats, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Hats
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Heads:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Hat
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Hats
            }, 
            [2] = {
                Name = "Face", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Face else nil, 
                Title = "Feature.Avatar.Label.Face", 
                IconOn = "icons/menu/clothing/face_on", 
                IconOff = "icons/menu/clothing/face_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Face, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Face, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Face
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Face:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.FaceAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Face
            }, 
            [3] = {
                Name = "Neck", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Neck else nil, 
                Title = "Feature.Avatar.Label.Neck", 
                IconOn = "icons/menu/clothing/neck_on", 
                IconOff = "icons/menu/clothing/neck_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Neck, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Neck, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Neck
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Neck:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.NeckAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Neck
            }, 
            [4] = {
                Name = "Shoulder", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Shoulder else nil, 
                Title = "Feature.Avatar.Label.Shoulder", 
                IconOn = "icons/menu/clothing/shoulder_on", 
                IconOff = "icons/menu/clothing/shoulder_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Shoulders, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Shoulder, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Shoulder
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Shoulder:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.ShoulderAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Shoulder
            }, 
            [5] = {
                Name = "Front", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Front else nil, 
                Title = "Feature.Avatar.Label.Front", 
                IconOn = "icons/menu/clothing/front_on", 
                IconOff = "icons/menu/clothing/front_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Front, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Front
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Front:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.FrontAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Front
            }, 
            [6] = {
                Name = "Back", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Back else nil, 
                Title = "Feature.Avatar.Label.Back", 
                IconOn = "icons/menu/clothing/back_on", 
                IconOff = "icons/menu/clothing/back_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Arms, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Back, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Back
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Back:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.BackAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Back
            }, 
            [7] = {
                Name = "Waist", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Waist else nil, 
                Title = "Feature.Avatar.Label.Waist", 
                IconOn = "icons/menu/clothing/waist_on", 
                IconOff = "icons/menu/clothing/waist_off", 
                RenderItemTiles = true, 
                CameraFocus = v4.FocusType.Waist, 
                CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.AvatarEditorAccessories.Waist, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Waist
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Waist:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.WaistAccessory
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Waist
            }, 
            [8] = {
                Name = "Gear", 
                NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Gear else nil, 
                Title = "Feature.Avatar.Label.Gear", 
                IconOn = "icons/menu/clothing/gear_on", 
                IconOff = "icons/menu/clothing/gear_off", 
                RenderItemTiles = true, 
                RecommendationsType = v5.RecommendationsType.Asset, 
                MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
                    CategoryKey = l_CatalogCategories_0.Accessories, 
                    SubcategoryKey = l_CatalogSubcategories_0.Gear
                }, 
                MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
                    CategoryId = l_CatalogSDUICategoryIds_0.Accessories:rawValue(), 
                    SubcategoryId = l_CatalogSDUICategoryIds_0.Accessories_Gear:rawValue()
                } else nil, 
                AssetTypeIdStrings = {
                    v4.AssetTypeIdStrings.Gear
                }, 
                SearchUuid = v6(), 
                Id = l_AvatarEditorSubcategories_0.Gear
            }
        }, 
        Id = l_AvatarEditorCategories_0.Accessories
    };
end;
local function v51() --[[ Line: 1179 ]]
    -- upvalues: l_AXAvatarsTabIXP_0 (copy), v16 (copy), v5 (copy), v23 (copy), l_AvatarEditorCategories_0 (copy), v6 (copy), v4 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v34 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy)
    local v50 = if l_AXAvatarsTabIXP_0.isEnabled() then v16.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil;
    return {
        Name = v5.CharacterKey, 
        NavigationKey = if v23() then l_AvatarEditorCategories_0.Avatars else nil, 
        Title = "Feature.Catalog.Label.Avatars", 
        IconOn = "icons/menu/clothing/avatars_on", 
        IconOff = "icons/menu/clothing/avatars_off", 
        SearchUuid = v6(), 
        PageType = v4.PageType.Avatars, 
        Id = l_AvatarEditorCategories_0.Avatars, 
        RecommendationsType = if v23() then v5.RecommendationsType.BodyParts else v5.RecommendationsType.All, 
        ShowName = v23() and true or nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.AvatarOutfit
        }, 
        BundleTypeIdStrings = if l_FFlagAXInventoryDurablesSupport_0 then {
            v4.BundleTypeIdStrings.Avatars
        } else nil, 
        MatchingCatalogPage = if not l_FFlagAXCatalogCategoriesSDUI_0 and v23() then if v34 then {
            CategoryKey = if v50 then l_CatalogCategories_0.Avatars else l_CatalogCategories_0.Characters
        } else {
            CategoryKey = l_CatalogCategories_0.Body, 
            SubcategoryKey = l_CatalogSubcategories_0.FullBodies
        } else nil, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 and v23() then if v34 then {
            CategoryId = if v50 then l_CatalogSDUICategoryIds_0.Avatars:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue()
        } else {
            CategoryId = l_CatalogSDUICategoryIds_0.Body:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue()
        } else nil
    };
end;
local function v54() --[[ Line: 1232 ]]
    -- upvalues: l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogSDUICategoryIds_0 (copy), v23 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AvatarEditorCategories_0 (copy), v6 (copy), v4 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), v5 (copy)
    local v52 = {
        CategoryKey = l_CatalogCategories_0.AllAnimations, 
        SubcategoryKey = l_CatalogSubcategories_0.AnimationBundles
    };
    local v53 = nil;
    if l_FFlagAXCatalogCategoriesSDUI_0 then
        v53 = {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.AnimationBundles:rawValue()
        };
    end;
    if v23() then
        return {
            Id = if l_FFlagAXCustomizeMakeupSupport_0 then l_AvatarEditorCategories_0.Animations else l_AvatarEditorCategories_0.Animation, 
            Name = "Animation", 
            NavigationKey = if v23() then if l_FFlagAXCustomizeMakeupSupport_0 then l_AvatarEditorCategories_0.Animations else l_AvatarEditorCategories_0.Animation else nil, 
            Title = "Feature.Avatar.Heading.Animations", 
            IconOn = "icons/menu/clothing/animation_on", 
            IconOff = "icons/menu/clothing/animation_off", 
            SearchUuid = v6(), 
            CameraZoomRadius = v4.AnimationCategoryCameraZoomRadius, 
            PageType = v4.PageType.Animation, 
            CanAnimateCameraBasedMood = true, 
            ShowName = v23() and true or nil, 
            Subcategories = {
                {
                    Name = "Animation Full Sets", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.AnimationFullSets else nil, 
                    Title = "Feature.Avatar.Label.AnimationFullSet", 
                    IconOn = "icons/menu/clothing/animation_on", 
                    IconOff = "icons/menu/clothing/animation_off", 
                    EmptyString = "Feature.Avatar.Heading.Animations", 
                    RenderItemTiles = true, 
                    RenderOutfitItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    BundleTypeIdStrings = {
                        v4.BundleTypeIdStrings.Animations
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.AnimationFullSets
                }, 
                {
                    Name = "Idle Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.IdleAnimations else nil, 
                    Title = "Feature.Avatar.Label.Idle", 
                    IconOn = "icons/menu/clothing/idle_on", 
                    IconOff = "icons/menu/clothing/idle_off", 
                    EmptyString = "Feature.Avatar.Label.IdleAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.IdleAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.IdleAnimations
                }, 
                {
                    Name = "Walk Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.WalkAnimations else nil, 
                    Title = "Feature.Avatar.Label.Walk", 
                    IconOn = "icons/menu/clothing/walk_on", 
                    IconOff = "icons/menu/clothing/walk_off", 
                    EmptyString = "Feature.Avatar.Label.WalkAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.WalkAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.WalkAnimations
                }, 
                {
                    Name = "Run Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.RunAnimations else nil, 
                    Title = "Feature.Avatar.Label.Run", 
                    IconOn = "icons/menu/clothing/animation_on", 
                    IconOff = "icons/menu/clothing/animation_off", 
                    EmptyString = "Feature.Avatar.Label.RunAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.RunAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.RunAnimations
                }, 
                {
                    Name = "Jump Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.JumpAnimations else nil, 
                    Title = "Feature.Avatar.Label.Jump", 
                    IconOn = "icons/menu/clothing/jump_on", 
                    IconOff = "icons/menu/clothing/jump_off", 
                    EmptyString = "Feature.Avatar.Label.JumpAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.JumpAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.JumpAnimations
                }, 
                {
                    Name = "Fall Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.FallAnimations else nil, 
                    Title = "Feature.Avatar.Label.Fall", 
                    IconOn = "icons/menu/clothing/fall_on", 
                    IconOff = "icons/menu/clothing/fall_off", 
                    EmptyString = "Feature.Avatar.Label.FallAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.FallAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.FallAnimations
                }, 
                {
                    Name = "Climb Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.ClimbAnimations else nil, 
                    Title = "Feature.Avatar.Label.Climb", 
                    IconOn = "icons/menu/clothing/climb_on", 
                    IconOff = "icons/menu/clothing/climb_off", 
                    EmptyString = "Feature.Avatar.Label.ClimbAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.ClimbAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.ClimbAnimations
                }, 
                {
                    Name = "Swim Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.SwimAnimations else nil, 
                    Title = "Feature.Avatar.Label.Swim", 
                    IconOn = "icons/menu/clothing/swim_on", 
                    IconOff = "icons/menu/clothing/swim_off", 
                    EmptyString = "Feature.Avatar.Label.SwimAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.SwimAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.SwimAnimations
                }
            }
        };
    else
        return {
            Id = l_AvatarEditorCategories_0.Animation, 
            Name = "Animation", 
            NavigationKey = if v23() then l_AvatarEditorCategories_0.Animation else nil, 
            Title = "Feature.Catalog.Label.Animation", 
            IconOn = "icons/menu/clothing/animation_on", 
            IconOff = "icons/menu/clothing/animation_off", 
            SearchUuid = v6(), 
            CameraZoomRadius = v4.AnimationCategoryCameraZoomRadius, 
            PageType = v4.PageType.Animation, 
            CanAnimateCameraBasedMood = true, 
            Subcategories = {
                [1] = {
                    Name = "Idle Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.IdleAnimations else nil, 
                    Title = "Feature.Avatar.Label.Idle", 
                    IconOn = "icons/menu/clothing/idle_on", 
                    IconOff = "icons/menu/clothing/idle_off", 
                    EmptyString = "Feature.Avatar.Label.IdleAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.IdleAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.IdleAnimations
                }, 
                [2] = {
                    Name = "Walk Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.WalkAnimations else nil, 
                    Title = "Feature.Avatar.Label.Walk", 
                    IconOn = "icons/menu/clothing/walk_on", 
                    IconOff = "icons/menu/clothing/walk_off", 
                    EmptyString = "Feature.Avatar.Label.WalkAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.WalkAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.WalkAnimations
                }, 
                [3] = {
                    Name = "Run Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.RunAnimations else nil, 
                    Title = "Feature.Avatar.Label.Run", 
                    IconOn = "icons/menu/clothing/animation_on", 
                    IconOff = "icons/menu/clothing/animation_off", 
                    EmptyString = "Feature.Avatar.Label.RunAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.RunAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.RunAnimations
                }, 
                [4] = {
                    Name = "Jump Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.JumpAnimations else nil, 
                    Title = "Feature.Avatar.Label.Jump", 
                    IconOn = "icons/menu/clothing/jump_on", 
                    IconOff = "icons/menu/clothing/jump_off", 
                    EmptyString = "Feature.Avatar.Label.JumpAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.JumpAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.JumpAnimations
                }, 
                [5] = {
                    Name = "Fall Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.FallAnimations else nil, 
                    Title = "Feature.Avatar.Label.Fall", 
                    IconOn = "icons/menu/clothing/fall_on", 
                    IconOff = "icons/menu/clothing/fall_off", 
                    EmptyString = "Feature.Avatar.Label.FallAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.FallAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.FallAnimations
                }, 
                [6] = {
                    Name = "Climb Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.ClimbAnimations else nil, 
                    Title = "Feature.Avatar.Label.Climb", 
                    IconOn = "icons/menu/clothing/climb_on", 
                    IconOff = "icons/menu/clothing/climb_off", 
                    EmptyString = "Feature.Avatar.Label.ClimbAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.ClimbAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.ClimbAnimations
                }, 
                [7] = {
                    Name = "Swim Animations", 
                    NavigationKey = if v22() then l_AvatarEditorSubcategories_0.SwimAnimations else nil, 
                    Title = "Feature.Avatar.Label.Swim", 
                    IconOn = "icons/menu/clothing/swim_on", 
                    IconOff = "icons/menu/clothing/swim_off", 
                    EmptyString = "Feature.Avatar.Label.SwimAnimations", 
                    RenderItemTiles = true, 
                    RecommendationsType = v5.RecommendationsType.AvatarAnimations, 
                    MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else v52, 
                    MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then v53 else nil, 
                    AssetTypeIdStrings = {
                        v4.AssetTypeIdStrings.SwimAnimation
                    }, 
                    SearchUuid = v6(), 
                    Id = l_AvatarEditorSubcategories_0.SwimAnimations
                }
            }
        };
    end;
end;
local function v78() --[[ Line: 1573 ]]
    -- upvalues: v17 (copy), v16 (copy), l_AXAvatarsTabIXP_0 (copy), v38 (copy), v6 (copy), l_AvatarEditorCategories_0 (copy), v22 (copy), l_AvatarEditorSubcategories_0 (copy), v4 (copy), l_Constants_0 (copy), v5 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_CatalogCategories_0 (copy), l_CatalogSubcategories_0 (copy), l_CatalogSDUICategoryIds_0 (copy), l_FFlagRemoveClassicHeadsAndFaces_0 (copy), l_IsVRAppBuild_0 (copy), v49 (copy), v54 (copy), v24 (copy), v8 (copy), v23 (copy), v36 (ref), v7 (copy)
    local v55 = if v17.isEnabled() then v16.readTestVariable(v17.EnableHeadCategoryCombination) else nil;
    local v56 = if l_AXAvatarsTabIXP_0.isEnabled() then v16.readTestVariable(l_AXAvatarsTabIXP_0.EnabledForUser) else nil;
    local v57 = v38();
    local v58 = {
        Name = "HeadAndBody", 
        Title = "Feature.Avatar.Label.HeadBody", 
        IconOn = "icons/menu/clothing/body_on", 
        IconOff = "icons/menu/clothing/body_off", 
        SearchUuid = v6(), 
        CanAnimateCameraBasedMood = true, 
        Id = l_AvatarEditorCategories_0.Body
    };
    local v59 = {
        Name = "Style", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Heads else nil, 
        Title = "Feature.Avatar.Label.Heads", 
        IconOn = "icons/menu/clothing/type_on", 
        IconOff = "icons/menu/clothing/type_off", 
        RenderItemTiles = true, 
        RenderOutfitItemTiles = true, 
        UseGetInventoryV2 = v17.isEnabled() and v55 and true or nil, 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Style, 
        RecommendationsType = v5.RecommendationsType.DynamicHeads, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = l_CatalogSubcategories_0.Heads
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_Heads:rawValue()
        } else nil, 
        OutfitType = v4.OutfitTypes.DynamicHead, 
        OutfitFilter = Enum.OutfitSource.Purchased, 
        AssetTypeIdStrings = if v17.isEnabled() and v55 then {
            v4.AssetTypeIdStrings.Head, 
            v4.AssetTypeIdStrings.Face
        } else nil, 
        OutfitTypeIdStrings = if v17.isEnabled() and v55 then {
            v4.BundleTypeIdStrings.DynamicHead
        } else nil, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Heads
    };
    local v60 = {
        Name = "Hair", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Hair else nil, 
        Title = "Feature.Avatar.Label.Hair", 
        IconOn = "icons/menu/clothing/hair_on", 
        IconOff = "icons/menu/clothing/hair_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Head, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Hair, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = l_CatalogSubcategories_0.Hair
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Body_Hair:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.HairAccessory
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Hair
    };
    local v61 = {
        Name = "Skin", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Skin else nil, 
        Title = "Feature.Avatar.Label.Skin", 
        IconOn = "icons/menu/clothing/skin_on", 
        IconOff = "icons/menu/clothing/skin_off", 
        RenderItemTiles = false, 
        RecommendationsType = v5.RecommendationsType.None, 
        PageType = v4.PageType.BodyColors, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Skin
    };
    local v62 = {
        Name = "Classic Heads", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.ClassicHeads else nil, 
        Title = "Feature.Avatar.Label.ClassicHeads", 
        IconOn = "icons/menu/clothing/classicHead_on", 
        IconOff = "icons/menu/clothing/classicHead_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.ClassicHeads, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = if v17.isEnabled() and v55 then l_CatalogSubcategories_0.Heads else if l_FFlagRemoveClassicHeadsAndFaces_0 then l_CatalogSubcategories_0.Heads else l_CatalogSubcategories_0.ClassicHeads
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Head:rawValue(), 
            SubcategoryId = if v17.isEnabled() and v55 then l_CatalogSDUICategoryIds_0.Body_Heads:rawValue() else if l_FFlagRemoveClassicHeadsAndFaces_0 then l_CatalogSDUICategoryIds_0.Body_Heads:rawValue() else l_CatalogSDUICategoryIds_0.Body_ClassicHeads:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.Head
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.ClassicHeads
    };
    local v63 = {
        Name = "Classic Faces", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.ClassicFaces else nil, 
        Title = "Feature.Avatar.Label.ClassicFaces", 
        IconOn = "icons/menu/clothing/faces_on", 
        IconOff = "icons/menu/clothing/faces_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Face, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.ClassicFaces, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Head, 
            SubcategoryKey = if v17.isEnabled() and v55 then l_CatalogSubcategories_0.Heads else if l_FFlagRemoveClassicHeadsAndFaces_0 then l_CatalogSubcategories_0.Face else l_CatalogSubcategories_0.ClassicFaces
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v17.isEnabled() and v55 then l_CatalogSDUICategoryIds_0.Body_Heads:rawValue() else if l_FFlagRemoveClassicHeadsAndFaces_0 then l_CatalogSDUICategoryIds_0.Accessories_Face:rawValue() else l_CatalogSDUICategoryIds_0.Body_ClassicFaces:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.Face
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.ClassicFaces
    };
    local v64 = {
        Name = "Torsos", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Torsos else nil, 
        Title = "Feature.Avatar.Label.Torsos", 
        IconOn = "icons/menu/clothing/torsos_on", 
        IconOff = "icons/menu/clothing/torsos_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Arms, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Torsos, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v56 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.Torso
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Torsos
    };
    local v65 = {
        Name = "Left Arms", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.LeftArms else nil, 
        Title = "Feature.Avatar.Label.LeftArms", 
        IconOn = "icons/menu/clothing/arms_on", 
        IconOff = "icons/menu/clothing/arms_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Arms, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Arms, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v56 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.LeftArm
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.LeftArms
    };
    local v66 = {
        Name = "Right Arms", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.RightArms else nil, 
        Title = "Feature.Avatar.Label.RightArms", 
        IconOn = "icons/menu/clothing/arms_on", 
        IconOff = "icons/menu/clothing/arms_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Arms, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Arms, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v56 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.RightArm
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.RightArms
    };
    local v67 = {
        Name = "Left Legs", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.LeftLegs else nil, 
        Title = "Feature.Avatar.Label.LeftLegs", 
        IconOn = "icons/menu/clothing/legs_on", 
        IconOff = "icons/menu/clothing/legs_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Legs, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Legs, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v56 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.LeftLeg
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.LeftLegs
    };
    local v68 = {
        Name = "Right Legs", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.RightLegs else nil, 
        Title = "Feature.Avatar.Label.RightLegs", 
        IconOn = "icons/menu/clothing/legs_on", 
        IconOff = "icons/menu/clothing/legs_off", 
        RenderItemTiles = true, 
        CameraFocus = v4.FocusType.Legs, 
        CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.DynamicBodyCategories.Legs, 
        RecommendationsType = v5.RecommendationsType.BodyParts, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = if v56 then l_CatalogCategories_0.Body else l_CatalogCategories_0.Characters, 
            SubcategoryKey = if v56 then l_CatalogSubcategories_0.FullBodies else nil
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body:rawValue() else l_CatalogSDUICategoryIds_0.Characters:rawValue(), 
            SubcategoryId = if v56 then l_CatalogSDUICategoryIds_0.Body_FullBodies:rawValue() else nil
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.RightLeg
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.RightLegs
    };
    local v69 = {
        Name = "Build", 
        NavigationKey = if v22() then l_AvatarEditorSubcategories_0.Build else nil, 
        Title = "Feature.Avatar.Label.Build", 
        IconOn = "icons/menu/clothing/build_on", 
        IconOff = "icons/menu/clothing/build_off", 
        RenderItemTiles = false, 
        RecommendationsType = v5.RecommendationsType.None, 
        PageType = v4.PageType.BodyStyle, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorSubcategories_0.Build
    };
    local v70 = {};
    table.insert(v70, v59);
    table.insert(v70, v60);
    table.insert(v70, v61);
    if (not v17.isEnabled() or not v55) and not l_FFlagRemoveClassicHeadsAndFaces_0 then
        table.insert(v70, v62);
        table.insert(v70, v63);
    end;
    table.insert(v70, v64);
    table.insert(v70, v65);
    table.insert(v70, v66);
    table.insert(v70, v67);
    table.insert(v70, v68);
    if not l_IsVRAppBuild_0() then
        table.insert(v70, v69);
    end;
    v58.Subcategories = v70;
    local v71 = v49();
    local v72 = v54();
    local v73 = if v24() then v8() else {
        Name = v4.AssetCategories.Emotes, 
        Title = "Feature.Avatar.Heading.Emotes", 
        IconOn = "icons/menu/clothing/emotes_on", 
        IconOff = "icons/menu/clothing/emotes_off", 
        CameraZoomRadius = v4.AnimationCategoryCameraZoomRadius, 
        EquipSlotsCount = 8, 
        RenderItemTiles = true, 
        PageType = v4.PageType.Emotes, 
        CanAnimateCameraBasedMood = false, 
        RecommendationsType = v5.RecommendationsType.Asset, 
        MatchingCatalogPage = if l_FFlagAXCatalogCategoriesSDUI_0 then nil else {
            CategoryKey = l_CatalogCategories_0.AllAnimations, 
            SubcategoryKey = l_CatalogSubcategories_0.Emotes
        }, 
        MatchingCatalogPageIds = if l_FFlagAXCatalogCategoriesSDUI_0 then {
            CategoryId = l_CatalogSDUICategoryIds_0.AllAnimations:rawValue(), 
            SubcategoryId = l_CatalogSDUICategoryIds_0.Emotes:rawValue()
        } else nil, 
        AssetTypeIdStrings = {
            v4.AssetTypeIdStrings.EmoteAnimation
        }, 
        SearchUuid = v6(), 
        Id = l_AvatarEditorCategories_0.Emotes, 
        ShowName = v23() and true or nil
    };
    v36 = {
        v57, 
        v58, 
        v7().avatarEditorCategories, 
        v71, 
        v73, 
        v72
    };
    for v74, v75 in v36 do
        v75.Category = v74;
        v75.Subcategory = nil;
        if v75.Subcategories then
            for v76, v77 in v75.Subcategories do
                v77.Category = v74;
                v77.Subcategory = v76;
            end;
        end;
    end;
end;
local function v91() --[[ Line: 2063 ]] --[[ Name: buildSlotBasedEditorCategories ]]
    -- upvalues: v23 (copy), l_AvatarEditorCategories_0 (copy), v6 (copy), v26 (copy), v4 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v25 (copy), l_CatalogCategories_0 (copy), v5 (copy), v47 (copy), v48 (copy), v49 (copy), v54 (copy), v51 (copy), v8 (copy), v7 (copy)
    local v79 = {
        Name = "All", 
        NavigationKey = if v23() then l_AvatarEditorCategories_0.All else nil, 
        Title = "Feature.Avatar.Heading.All", 
        SearchUuid = v6(), 
        CanAnimateCameraBasedMood = true, 
        RenderOutfitItemTiles = true, 
        CameraFocus = if v26 then v4.FocusType.Neck else v4.FocusType.Arms, 
        CameraZoomRadius = v26 and 15 or 13, 
        AssetTypeIdStrings = if l_FFlagAXCustomizeMakeupSupport_0 then {
            v4.AssetTypeIdStrings.TShirt, 
            v4.AssetTypeIdStrings.Shirt, 
            v4.AssetTypeIdStrings.Pants, 
            v4.AssetTypeIdStrings.Hat, 
            v4.AssetTypeIdStrings.Face, 
            v4.AssetTypeIdStrings.Gear, 
            v4.AssetTypeIdStrings.HairAccessory, 
            v4.AssetTypeIdStrings.FaceAccessory, 
            v4.AssetTypeIdStrings.NeckAccessory, 
            v4.AssetTypeIdStrings.ShoulderAccessory, 
            v4.AssetTypeIdStrings.FrontAccessory, 
            v4.AssetTypeIdStrings.BackAccessory, 
            v4.AssetTypeIdStrings.WaistAccessory, 
            v4.AssetTypeIdStrings.TShirtAccessory, 
            v4.AssetTypeIdStrings.ShirtAccessory, 
            v4.AssetTypeIdStrings.PantsAccessory, 
            v4.AssetTypeIdStrings.JacketAccessory, 
            v4.AssetTypeIdStrings.SweaterAccessory, 
            v4.AssetTypeIdStrings.ShortsAccessory, 
            v4.AssetTypeIdStrings.DressSkirtAccessory, 
            v4.AssetTypeIdStrings.Head, 
            v4.AssetTypeIdStrings.EyelashAccessory, 
            v4.AssetTypeIdStrings.EyebrowAccessory, 
            v4.AssetTypeIdStrings.FaceMakeup, 
            v4.AssetTypeIdStrings.EyeMakeup, 
            v4.AssetTypeIdStrings.LipMakeup
        } else {
            v4.AssetTypeIdStrings.TShirt, 
            v4.AssetTypeIdStrings.Shirt, 
            v4.AssetTypeIdStrings.Pants, 
            v4.AssetTypeIdStrings.Hat, 
            v4.AssetTypeIdStrings.Face, 
            v4.AssetTypeIdStrings.Gear, 
            v4.AssetTypeIdStrings.HairAccessory, 
            v4.AssetTypeIdStrings.FaceAccessory, 
            v4.AssetTypeIdStrings.NeckAccessory, 
            v4.AssetTypeIdStrings.ShoulderAccessory, 
            v4.AssetTypeIdStrings.FrontAccessory, 
            v4.AssetTypeIdStrings.BackAccessory, 
            v4.AssetTypeIdStrings.WaistAccessory, 
            v4.AssetTypeIdStrings.TShirtAccessory, 
            v4.AssetTypeIdStrings.ShirtAccessory, 
            v4.AssetTypeIdStrings.PantsAccessory, 
            v4.AssetTypeIdStrings.JacketAccessory, 
            v4.AssetTypeIdStrings.SweaterAccessory, 
            v4.AssetTypeIdStrings.ShortsAccessory, 
            v4.AssetTypeIdStrings.DressSkirtAccessory, 
            v4.AssetTypeIdStrings.Head
        }, 
        BundleTypeIdStrings = {
            v4.BundleTypeIdStrings.BodyParts, 
            v4.BundleTypeIdStrings.DynamicHead, 
            v4.BundleTypeIdStrings.Shoes, 
            v4.BundleTypeIdStrings.Animations
        }, 
        MatchingCatalogPage = if v25() then {
            CategoryKey = l_CatalogCategories_0.Recommended
        } else nil, 
        RecommendationsType = if v25() then v5.RecommendationsType.All else nil, 
        IconOn = "icons/menu/clothing/purchased_on", 
        IconOff = "icons/menu/clothing/purchased_off", 
        RenderItemTiles = true, 
        UseGetInventoryV2 = true, 
        Id = l_AvatarEditorCategories_0.All
    };
    local v80 = v47();
    local v81 = if l_FFlagAXCustomizeMakeupSupport_0 then v48() else nil;
    local v82 = v49();
    local v83 = v54();
    local v84 = v51();
    local v85 = v8();
    local v86 = if l_FFlagAXCustomizeMakeupSupport_0 then {
        v79, 
        v84, 
        v80, 
        v81, 
        v7().avatarEditorCategories, 
        v82, 
        v83, 
        v85
    } else {
        v79, 
        v84, 
        v80, 
        v7().avatarEditorCategories, 
        v82, 
        v83, 
        v85
    };
    for v87, v88 in v86 do
        v88.Category = v87;
        v88.Subcategory = nil;
        if v88.Subcategories then
            for v89, v90 in v88.Subcategories do
                v90.Category = v87;
                v90.Subcategory = v89;
                v90.UseGetInventoryV2 = true;
            end;
        end;
    end;
    return v86;
end;
local function v93(v92) --[[ Line: 2201 ]] --[[ Name: sanityCheckCat ]]
    -- upvalues: v9 (copy)
    v9.isNotNil(v92.IconOn, (("category %* is missing iconOn"):format(v92.Name)));
    v9.isNotNil(v92.IconOff, (("category %* is missing IconOff"):format(v92.Name)));
    v9.isNotNil(v92.SearchUuid, (("category %* is missing SearchUuid"):format(v92.Name)));
    v9.isNotNil(v92.Id, "category  " .. v92.Name .. " is missing Id");
end;
local function _(v94, v95) --[[ Line: 2208 ]] --[[ Name: checkDuplicateId ]]
    if v94 then
        if v95[v94] then
            error("Duplicate Id found: " .. v94);
            return;
        else
            v95[v94] = true;
        end;
    end;
end;
local function v105(v97) --[[ Line: 2218 ]] --[[ Name: sanityCheck ]]
    -- upvalues: v93 (copy)
    local v98 = {};
    for _, v100 in v97 do
        v93(v100);
        local l_Id_0 = v100.Id;
        if l_Id_0 then
            if v98[l_Id_0] then
                error("Duplicate Id found: " .. l_Id_0);
            else
                v98[l_Id_0] = true;
            end;
        end;
        if v100.Subcategories then
            for _, v103 in v100.Subcategories do
                v93(v103);
                local l_Id_1 = v103.Id;
                if l_Id_1 then
                    if v98[l_Id_1] then
                        error("Duplicate Id found: " .. l_Id_1);
                    else
                        v98[l_Id_1] = true;
                    end;
                end;
            end;
        end;
    end;
end;
local v106 = nil;
return function() --[[ Line: 2234 ]]
    -- upvalues: v23 (copy), v106 (ref), v91 (copy), v105 (copy), v36 (ref), v78 (copy)
    if v23() then
        if not v106 then
            v106 = v91();
            v105(v106);
        end;
        return v106;
    else
        if not v36 then
            v78();
            v105(v36);
        end;
        return v36;
    end;
end;