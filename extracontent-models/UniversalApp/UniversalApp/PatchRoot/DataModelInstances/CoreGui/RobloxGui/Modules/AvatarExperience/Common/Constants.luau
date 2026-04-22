local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_ItemTypeEnum_0 = v5.Enums.ItemTypeEnum;
local l_FullView_0 = v5.Enums.FullView;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v9 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_Constants_0 = v5.Constants;
local l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0 = v9.GetFIntMaquettesAppPanelDistanceMultiplierPercentage;
local v12 = require(l_Modules_0.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile);
local v13 = require(l_Modules_0.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP);
local v14 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport);
local v16 = game:DefineFastInt("AXSponsoredItemsRow", 7);
local v17 = game:DefineFastFlag("AXEnableSearchLandingFocusedPageFullViewDefault", false);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXEditorSubcategoryFilters_0 = v18.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXSlotsInventoryLoadableGridView_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView;
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFPSForCatSubCat);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills);
local l_FFlagParseHeadShapeFromAPIResponse_0 = v18.FFlagParseHeadShapeFromAPIResponse;
local l_CatalogCategories_0 = v5.Enums.CatalogCategories;
local l_FFlagAXIncreaseDefaultPeekViewHeight_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight;
local v27 = game:DefineFastInt("AXCatalogMainNavHeight", 40);
local l_FFlagAXInventoryDurablesSupport_0 = v18.FFlagAXInventoryDurablesSupport;
local l_FFlagAXCustomizeMakeupSupport_0 = v18.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXCatalogCategoriesSDUI_0 = v18.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v18.FFlagAXMoveCatalogFilterToL1Navigation;
local l_FFlagAXEyebrowEyelashToMakeupCategory_0 = v18.FFlagAXEyebrowEyelashToMakeupCategory;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v9.FFlagLuaAppForceVrAppPanelWidthRollout;
local l_FFlagHeadRefinementFacialAnimationToggle_0 = v18.FFlagHeadRefinementFacialAnimationToggle;
local v35 = l_GetFIntMaquettesAppPanelDistanceMultiplierPercentage_0() / 100;
local v36 = {
    _150x150 = "w=150&h=150", 
    _420x420 = "w=420&h=420", 
    _300x450 = "w=300&h=450"
};
local v37 = {
    Asset = v36, 
    BundleThumbnail = v36, 
    Look = v36
};
local v38 = {
    WidgetListHorizontalMargin = 15, 
    WidgetListVerticalMargin = 10, 
    PageButtonCornerRadius = 12, 
    SponsoredItemsRow = v16, 
    CatalogThumbnailTypeToSize = v37, 
    DefaultCatalogCategoryId = l_CatalogCategories_0.Recommended:rawValue(), 
    DeviceType = {
        Android = "Android", 
        IOS = "iOS", 
        Other = "Other"
    }, 
    BlockyBundleId = 356, 
    NumRecommendedItems = 6, 
    AnalyticsTag = "LuaAvatarExperience", 
    ContentFeedAnalyticsTag = "ContentFeed", 
    ProfileAnalyticsTag = "LuaProfile", 
    DefaultRigPosition = Vector3.new(11.777738571166992, 6.766530990600586, 0.2743154764175415, 0), 
    AvatarType = {
        R6 = "R6", 
        R15 = "R15"
    }, 
    ItemPromptType = {
        OpenPurchasePrompt = "OpenPurchasePrompt", 
        OpenGoToAvatarEditorPrompt = "OpenGoToAvatarEditorPrompt", 
        OpenPremiumUpsellPrompt = "OpenPremiumUpsellPrompt", 
        Disabled = "Disabled", 
        SoldOut = "SoldOut"
    }, 
    ItemTilePadding = 10, 
    ItemTileTitleMaxLines = l_FFlagAXMigrateAXToGlobalAutofocus_0 and 1 or 2, 
    EditorItemTileTitleMaxLines = l_FFlagAXSlotsInventoryLoadableGridView_0 and 1 or nil, 
    ItemTileInnerPadding = 4, 
    ItemTileTallAspectRatio = 0.7, 
    ItemTileSquareAspectRatio = 1, 
    LookTileAspectRatio = 0.7, 
    CreatorNameItemTilePadding = 0, 
    CreatorNameItemTileTitleMaxLines = 1, 
    ImpressionsDetectionInterval = 1, 
    FocusType = {
        Legs = "Legs", 
        Face = "Face", 
        Arms = "Arms", 
        Head = "Head", 
        Neck = "Neck", 
        Waist = "Waist", 
        Shoulders = "Shoulders", 
        Makeup = "Makeup"
    }, 
    AssetCategories = {
        Animation = "Animation", 
        Body = "Body", 
        Clothing = "Clothing", 
        Accessory = "Accessory", 
        Emotes = "Emotes"
    }, 
    PageType = {
        Normal = "Normal", 
        Animation = "Animation", 
        BodyColors = "BodyColors", 
        BodyStyle = "BodyStyle", 
        Avatars = "Avatars", 
        MakeupLooks = l_FFlagAXCustomizeMakeupSupport_0 and "MakeupLooks" or nil, 
        Emotes = "Emotes", 
        Other = "Other", 
        AllAnimation = "AllAnimation"
    }, 
    ParticleType = {
        CatalogToAvatarEditor = "CatalogToAvatarEditor", 
        AvatarEditorToCatalog = "AvatarEditorToCatalog", 
        None = "None"
    }, 
    BackgroundType = {
        LargerShapes = "LargerShapes", 
        NoShapesNoWalls = "NoShapesNoWalls", 
        Walls = "Walls"
    }, 
    NavigationDirection = {
        IS_LEFT = "IS_LEFT", 
        IS_RIGHT = "IS_RIGHT"
    }, 
    ShimmerCardsToDisplay = 30, 
    UserInventoryKey = "avatar.inventory.", 
    OutfitsKey = "avatar.outfits.", 
    OutfitInfoKey = "avatar.outfit.info.", 
    RecommendedItemsKey = "avatar.recommendedItems.", 
    GetAvatarRulesKey = "avatareditor.getavatarrules", 
    SearchCatalogKey = "avatar.search.", 
    AvatarHomeRecKey = "avatar.home.recommendations", 
    NewOutfitNotificationKey = "avatar.newOutfitNotification", 
    NewDHOutfitNotificationKey = "avatar.newDHOutfitNotification", 
    PeekHeaderHeight = 25, 
    PeekHeaderMinHeight = 5, 
    MainNavHeight = 60, 
    CatalogMainNavHeight = if not not v23() or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v27 else nil, 
    SubNavHeight = 40, 
    MainNavPhotoboothHeight = 36, 
    PillBarHeight = 52, 
    FocusedWidgetTitleHeight = 52, 
    ScrollYPositionDetectableEpsilon = 1, 
    LooksDetailsTabBarHeight = 50, 
    LandscapeNavWidth = 0.6, 
    LandscapeUiMargin = 24, 
    LandscapeSceneWidth = 0.4, 
    LoadableGridViewCellPadding = 10, 
    PortraitSceneHeight = l_FFlagAXIncreaseDefaultPeekViewHeight_0 and 0.36 or 0.4, 
    LandingPagePortraitSceneHeight = 0.5, 
    LandingPagePortraitMinItemsHeightPix = 300, 
    LandingPageMinTopFrameHeightPix = 100, 
    LandingPageMinBottomFrameHeightPix = 65, 
    PageButtonForegroundMinHeightPix = 100, 
    SceneButtonSize = 44, 
    SceneButtonCornerRadius = UDim.new(0, 8), 
    SceneButtonHorizontalPadding = 24, 
    DynamicHeadSplashMaxViews = 3, 
    AccessoryAssetTypes = {
        [Enum.AccessoryType.Hat] = true, 
        [Enum.AccessoryType.Face] = true, 
        [Enum.AccessoryType.Neck] = true, 
        [Enum.AccessoryType.Shoulder] = true, 
        [Enum.AccessoryType.Front] = true, 
        [Enum.AccessoryType.Back] = true, 
        [Enum.AccessoryType.Waist] = true
    }, 
    BypassAccessoryLimitsAccessoryAssetTypeIdStrings = {
        [tostring(Enum.AssetType.Hat.Value)] = true, 
        [tostring(Enum.AssetType.FaceAccessory.Value)] = true, 
        [tostring(Enum.AssetType.NeckAccessory.Value)] = true, 
        [tostring(Enum.AssetType.ShoulderAccessory.Value)] = true, 
        [tostring(Enum.AssetType.FrontAccessory.Value)] = true, 
        [tostring(Enum.AssetType.BackAccessory.Value)] = true, 
        [tostring(Enum.AssetType.WaistAccessory.Value)] = true
    }, 
    ContextWidgetsAllowedRoutes = {
        l_AvatarScreen_0.Catalog
    }, 
    DraftLookId = "DraftLook", 
    WearAfterPurchasePostPurchaseActionKey = "wearAfterPurchase", 
    SaveAsCharacterPostPurchaseActionKey = "saveAsCharacter"
};
if l_FFlagAXCustomizeMakeupSupport_0 then
    v38.AssetCategories.Makeup = "Makeup";
end;
v38.BundleTypeIdStrings = {};
v38.BundleTypeIdStringToName = {};
local l_EnumItems_0 = Enum.BundleType:GetEnumItems();
for _, v41 in l_EnumItems_0 do
    v38.BundleTypeIdStrings[v41.Name] = tostring(v41.Value);
    v38.BundleTypeIdStringToName[tostring(v41.Value)] = v41.Name;
end;
if l_FFlagAXInventoryDurablesSupport_0 then
    v38.BundleTypeIdStrings.Avatars = tostring(#l_EnumItems_0 + 1);
    v38.BundleTypeIdStringToName[tostring(#l_EnumItems_0 + 1)] = "Avatars";
end;
v38.BundleTypeIdStringToNameForBackend = {
    ["1"] = "Body", 
    ["2"] = "AvatarAnimations", 
    ["3"] = "Shoes", 
    ["4"] = "DynamicHead"
};
v38.BundleTypeNameToIdStringForCatalogHydration = {
    BodyParts = "1", 
    AvatarAnimations = "2", 
    Shoes = "3", 
    DynamicHead = "4"
};
if l_FFlagAXInventoryDurablesSupport_0 and l_FFlagAXEditorSubcategoryFilters_0 then
    v38.BundleTypeIdStringsForBackend = {
        [v38.BundleTypeIdStrings.BodyParts] = "1", 
        [v38.BundleTypeIdStrings.DynamicHead] = "2", 
        [v38.BundleTypeIdStrings.Avatars] = "3", 
        [v38.BundleTypeIdStrings.Shoes] = "4", 
        [v38.BundleTypeIdStrings.Animations] = "5"
    };
elseif l_FFlagAXEditorSubcategoryFilters_0 then
    v38.BundleTypeIdStringsForBackend = {
        [v38.BundleTypeIdStrings.BodyParts] = "1", 
        [v38.BundleTypeIdStrings.DynamicHead] = "2", 
        [v38.BundleTypeIdStrings.Shoes] = "4", 
        [v38.BundleTypeIdStrings.Animations] = "5"
    };
else
    v38.BundleTypeIdStringsForBackend = {
        [v38.BundleTypeIdStrings.BodyParts] = "1", 
        [v38.BundleTypeIdStrings.DynamicHead] = "2", 
        [v38.BundleTypeIdStrings.Shoes] = "3", 
        [v38.BundleTypeIdStrings.Animations] = "4"
    };
end;
v38.AssetTypeIdStrings = l_Constants_0.ASSET_TYPE_NAME_TO_ID_STRING;
v38.AssetTypeIdStringToName = l_Constants_0.ASSET_TYPE_ID_STRING_TO_NAME;
v38.DynamicHeadAssetTypes = {
    [v38.AssetTypeIdStrings.EyebrowAccessory] = true, 
    [v38.AssetTypeIdStrings.EyelashAccessory] = true, 
    [v38.AssetTypeIdStrings.MoodAnimation] = true, 
    [v38.AssetTypeIdStrings.DynamicHead] = true
};
v38.OutfitTypes = v5.Enums.OutfitTypes;
v38.BundleTypeIdStringToOutfitType = {
    [v38.BundleTypeIdStrings.BodyParts] = v38.OutfitTypes.Avatar, 
    [v38.BundleTypeIdStrings.DynamicHead] = v38.OutfitTypes.DynamicHead, 
    [v38.BundleTypeIdStrings.Shoes] = v38.OutfitTypes.Shoes, 
    [v38.BundleTypeIdStrings.Animations] = if v14() then v38.OutfitTypes.Animations else nil
};
v38.InventoryTypeToBundleTypeId = {
    Body = v38.BundleTypeIdStrings.BodyParts, 
    DynamicHead = v38.BundleTypeIdStrings.DynamicHead, 
    Shoes = v38.BundleTypeIdStrings.Shoes, 
    Animations = v38.BundleTypeIdStrings.Animations
};
v38.ItemTileType = {
    AvatarEditorTile = "AvatarEditorTile", 
    BodyColorButton = "BodyColorButton", 
    BundleItemTile = "BundleItemTile", 
    BundleItemTileNoText = "BundleItemTileNoText", 
    CatalogItemTile = "CatalogItemTile", 
    RecommendedCatalogItemTile = "RecommendedCatalogItemTile", 
    TallCatalogItemTile = "TallCatalogItemTile", 
    LookItemTile = "LookItemTile"
};
v38.ItemType = l_ItemTypeEnum_0;
v38.LookType = {
    Avatar = "Avatar", 
    Outfit = "Outfit", 
    Makeup = "Makeup"
};
v38.confirmItemType = function(v42) --[[ Line: 387 ]]
    -- upvalues: v38 (copy)
    if v42 == v38.ItemType.Asset then
        return v38.ItemType.Asset;
    elseif v42 == v38.ItemType.Bundle then
        return v38.ItemType.Bundle;
    elseif v42 == v38.ItemType.Outfit then
        return v38.ItemType.Asset;
    else
        return nil;
    end;
end;
v38.AnalyticsContext = {
    [l_AvatarScreen_0.AvatarExperienceLandingPage] = l_AvatarScreen_0.AvatarExperienceLandingPage, 
    [l_AvatarScreen_0.Catalog] = l_AvatarScreen_0.Catalog, 
    [l_AvatarScreen_0.CatalogSearch] = l_AvatarScreen_0.CatalogSearch, 
    [l_AvatarScreen_0.AvatarEditor] = l_AvatarScreen_0.AvatarEditor, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = l_AvatarScreen_0.ProfilePictureEditorEmotes, 
    [l_AvatarScreen_0.AccessoryAdjustment] = l_AvatarScreen_0.AccessoryAdjustment, 
    [l_AvatarScreen_0.AvatarRefinement] = l_AvatarScreen_0.AvatarRefinement, 
    [l_AvatarScreen_0.AdjustAccessoryView] = l_AvatarScreen_0.AdjustAccessoryView, 
    [l_AvatarScreen_0.LayeredClothingSort] = l_AvatarScreen_0.LayeredClothingSort, 
    [l_AvatarScreen_0.LayeredMakeupSort] = if l_FFlagAXCustomizeMakeupSupport_0 then l_AvatarScreen_0.LayeredMakeupSort else nil, 
    [l_AvatarScreen_0.CatalogSearchLanding] = l_AvatarScreen_0.CatalogSearchLanding, 
    [l_AvatarScreen_0.MySharedAvatars] = l_AvatarScreen_0.MySharedAvatars, 
    [l_AvatarScreen_0.HeadRefinement] = l_AvatarScreen_0.HeadRefinement, 
    [l_AvatarScreen_0.SearchLandingFocusedWidgetPage] = l_AvatarScreen_0.SearchLandingFocusedWidgetPage, 
    [l_AvatarScreen_0.BodyShape] = if v14() then l_AvatarScreen_0.BodyShape else nil, 
    [l_AvatarScreen_0.AvatarSwitcher] = if v14() then l_AvatarScreen_0.AvatarSwitcher else nil, 
    [l_AvatarScreen_0.EditEmotes] = if v14() then l_AvatarScreen_0.EditEmotes else nil, 
    [l_AvatarScreen_0.TryOnItem] = l_AvatarScreen_0.TryOnItem, 
    [l_AvatarScreen_0.Photobooth] = if v18.FFlagAXPhotoboothFunctionality then l_AvatarScreen_0.Photobooth else nil
};
v38.PagePlayParticleType = {
    [l_AvatarScreen_0.AvatarEditor] = v38.ParticleType.CatalogToAvatarEditor, 
    [l_AvatarScreen_0.MySharedAvatars] = v38.ParticleType.CatalogToAvatarEditor, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = v38.ParticleType.CatalogToAvatarEditor, 
    [l_AvatarScreen_0.ProfilePictureEditorCamera] = v38.ParticleType.None, 
    [l_AvatarScreen_0.ProfilePictureEditorFinal] = v38.ParticleType.None, 
    [l_AvatarScreen_0.AvatarBackground] = v38.ParticleType.None, 
    [l_AvatarScreen_0.Catalog] = v38.ParticleType.AvatarEditorToCatalog
};
v38.PageBackgroundType = {
    [l_AvatarScreen_0.AvatarEditor] = v38.BackgroundType.LargerShapes, 
    [l_AvatarScreen_0.MySharedAvatars] = v38.BackgroundType.LargerShapes, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = v38.BackgroundType.LargerShapes, 
    [l_AvatarScreen_0.ProfilePictureEditorCamera] = v38.BackgroundType.NoShapesNoWalls, 
    [l_AvatarScreen_0.ProfilePictureEditorFinal] = v38.BackgroundType.NoShapesNoWalls, 
    [l_AvatarScreen_0.AvatarBackground] = v38.BackgroundType.Walls, 
    [l_AvatarScreen_0.Catalog] = if v12 then v38.BackgroundType.LargerShapes else v38.BackgroundType.Walls, 
    [l_AvatarScreen_0.AvatarExperienceLandingPage] = v38.BackgroundType.Walls
};
v38.AttachmentName = {
    BodyBackAttachment = "BodyBackAttachment", 
    BodyFrontAttachment = "BodyFrontAttachment", 
    Bone = "Bone", 
    FaceCenterAttachment = "FaceCenterAttachment", 
    FaceFrontAttachment = "FaceFrontAttachment", 
    HairAttachment = "HairAttachment", 
    HatAttachment = "HatAttachment", 
    LeftAnkleRigAttachment = "LeftAnkleRigAttachment", 
    LeftCollarAttachment = "LeftCollarAttachment", 
    LeftElbowRigAttachment = "LeftElbowRigAttachment", 
    LeftFootAttachment = "LeftFootAttachment", 
    LeftGripAttachment = "LeftGripAttachment", 
    LeftHipRigAttachment = "LeftHipRigAttachment", 
    LeftKneeRigAttachment = "LeftKneeRigAttachment", 
    LeftShoulderAttachment = "LeftShoulderAttachment", 
    LeftShoulderRigAttachment = "LeftShoulderRigAttachment", 
    LeftWristRigAttachment = "LeftWristRigAttachment", 
    NeckAttachment = "NeckAttachment", 
    NeckRigAttachment = "NeckRigAttachment", 
    RightAnkleRigAttachment = "RightAnkleRigAttachment", 
    RightCollarAttachment = "RightCollarAttachment", 
    RightElbowRigAttachment = "RightElbowRigAttachment", 
    RightFootAttachment = "RightFootAttachment", 
    RightGripAttachment = "RightGripAttachment", 
    RightHipRigAttachment = "RightHipRigAttachment", 
    RightKneeRigAttachment = "RightKneeRigAttachment", 
    RightShoulderAttachment = "RightShoulderAttachment", 
    RightShoulderRigAttachment = "RightShoulderRigAttachment", 
    RightWristRigAttachment = "RightWristRigAttachment", 
    RootRigAttachment = "RootRigAttachment", 
    WaistBackAttachment = "WaistBackAttachment", 
    WaistCenterAttachment = "WaistCenterAttachment", 
    WaistFrontAttachment = "WaistFrontAttachment", 
    WaistRigAttachment = "WaistRigAttachment"
};
v38.PartName = {
    Head = "Head", 
    Makeup = "Makeup", 
    R6_BODY_PARTS = {
        Torso = "Torso", 
        LeftLeg = "Left Leg", 
        RightLeg = "Right Leg", 
        LeftArm = "Left Arm", 
        RightArm = "Right Arm"
    }, 
    R15_BODY_PARTS = {
        UpperTorso = "UpperTorso", 
        LowerTorso = "LowerTorso", 
        LeftUpperLeg = "LeftUpperLeg", 
        LeftLowerLeg = "LeftLowerLeg", 
        LeftFoot = "LeftFoot", 
        RightUpperLeg = "RightUpperLeg", 
        RightLowerLeg = "RightLowerLeg", 
        RightFoot = "RightFoot", 
        LeftUpperArm = "LeftUpperArm", 
        LeftLowerArm = "LeftLowerArm", 
        LeftHand = "LeftHand", 
        RightUpperArm = "RightUpperArm", 
        RightLowerArm = "RightLowerArm", 
        RightHand = "RightHand"
    }
};
v38.AssetTypeIdToPartsAndAttachments = {
    [v38.AvatarType.R6] = {
        [v38.AssetTypeIdStrings.Hat] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HatAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.HairAccessory] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HairAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.FaceAccessory] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.NeckAccessory] = {
            {
                Part = v38.PartName.Head
            }
        }, 
        [v38.AssetTypeIdStrings.FrontAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.BackAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.WaistAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.Shirt] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftArm
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.TShirt] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftArm
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.Pants] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.AssetTypeIdStrings.Head] = {
            {
                Part = v38.PartName.Head
            }
        }, 
        [v38.AssetTypeIdStrings.Face] = {
            {
                Part = v38.PartName.Head
            }
        }, 
        [v38.AssetTypeIdStrings.Torso] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.RightArm] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightArm
            }
        }, 
        [v38.AssetTypeIdStrings.LeftArm] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftArm
            }
        }, 
        [v38.AssetTypeIdStrings.RightLeg] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }
        }, 
        [v38.AssetTypeIdStrings.LeftLeg] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.AssetTypeIdStrings.ClimbAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.FallAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.IdleAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.JumpAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.RunAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.SwimAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.WalkAnimation] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.TShirtAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.ShirtAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.PantsAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.AssetTypeIdStrings.JacketAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.SweaterAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.AssetTypeIdStrings.ShortsAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.AssetTypeIdStrings.LeftShoeAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.AssetTypeIdStrings.RightShoeAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }
        }, 
        [v38.AssetTypeIdStrings.DressSkirtAccessory] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }
    }, 
    [v38.AvatarType.R15] = {
        [v38.AssetTypeIdStrings.Hat] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HatAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.HairAccessory] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HairAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.FaceAccessory] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.NeckAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v38.AttachmentName.NeckAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.FrontAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v38.AttachmentName.BodyFrontAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.BackAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso, 
                Attachment = v38.AttachmentName.BodyBackAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.WaistAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.LowerTorso, 
                Attachment = v38.AttachmentName.WaistCenterAttachment
            }
        }, 
        [v38.AssetTypeIdStrings.Shirt] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.TShirt] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.Pants] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v38.AssetTypeIdStrings.Head] = {
            {
                Part = v38.PartName.Head
            }
        }, 
        [v38.AssetTypeIdStrings.Face] = {
            {
                Part = v38.PartName.Head
            }
        }, 
        [v38.AssetTypeIdStrings.Torso] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.RightArm] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightLowerArm
            }
        }, 
        [v38.AssetTypeIdStrings.LeftArm] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftLowerArm
            }
        }, 
        [v38.AssetTypeIdStrings.RightLeg] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightLowerLeg
            }
        }, 
        [v38.AssetTypeIdStrings.LeftLeg] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v38.AssetTypeIdStrings.ClimbAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.FallAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.IdleAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.JumpAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.RunAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.SwimAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.WalkAnimation] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.TShirtAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.ShirtAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.PantsAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v38.AssetTypeIdStrings.JacketAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.SweaterAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.AssetTypeIdStrings.ShortsAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }, 
        [v38.AssetTypeIdStrings.LeftShoeAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftFoot
            }
        }, 
        [v38.AssetTypeIdStrings.RightShoeAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightFoot
            }
        }, 
        [v38.AssetTypeIdStrings.DressSkirtAccessory] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }
    }
};
v38.AvatarTypeFocusGroups = {
    [v38.AvatarType.R15] = {
        [v38.FocusType.Legs] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightLowerLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftLowerLeg
            }
        }, 
        [v38.FocusType.Face] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v38.FocusType.Makeup] = {
            {
                Part = v38.PartName.Makeup
            }
        }, 
        [v38.FocusType.Arms] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.FocusType.Head] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HatAttachment
            }, 
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.NeckRigAttachment
            }
        }, 
        [v38.FocusType.Neck] = {
            {
                Part = v38.PartName.Head
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.UpperTorso
            }
        }, 
        [v38.FocusType.Waist] = {
            {
                Part = v38.PartName.R15_BODY_PARTS.LowerTorso
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperLeg
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperLeg
            }
        }, 
        [v38.FocusType.Shoulders] = {
            {
                Part = v38.PartName.Head
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.RightUpperArm
            }, 
            {
                Part = v38.PartName.R15_BODY_PARTS.LeftUpperArm
            }
        }
    }, 
    [v38.AvatarType.R6] = {
        [v38.FocusType.Legs] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.FocusType.Face] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.FaceFrontAttachment
            }
        }, 
        [v38.FocusType.Arms] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.FocusType.Head] = {
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.HatAttachment
            }, 
            {
                Part = v38.PartName.Head, 
                Attachment = v38.AttachmentName.NeckRigAttachment
            }
        }, 
        [v38.FocusType.Neck] = {
            {
                Part = v38.PartName.Head
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }
        }, 
        [v38.FocusType.Waist] = {
            {
                Part = v38.PartName.R6_BODY_PARTS.Torso
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.RightLeg
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftLeg
            }
        }, 
        [v38.FocusType.Shoulders] = {
            {
                Part = v38.PartName.Head
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.RightArm
            }, 
            {
                Part = v38.PartName.R6_BODY_PARTS.LeftArm
            }
        }
    }
};
v38.AssetTypeIdToCategory = {
    [v38.AssetTypeIdStrings.TShirt] = v38.AssetCategories.Clothing, 
    [v38.AssetTypeIdStrings.Hat] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.HairAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.FaceAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.NeckAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.ShoulderAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.FrontAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.BackAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.WaistAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.Shirt] = v38.AssetCategories.Clothing, 
    [v38.AssetTypeIdStrings.Pants] = v38.AssetCategories.Clothing, 
    [v38.AssetTypeIdStrings.Gear] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.Head] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.Face] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.Torso] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.RightArm] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.LeftArm] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.RightLeg] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.LeftLeg] = v38.AssetCategories.Body, 
    [v38.AssetTypeIdStrings.ClimbAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.FallAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.IdleAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.JumpAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.RunAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.SwimAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.WalkAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.EmoteAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.TShirtAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.ShirtAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.PantsAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.JacketAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.SweaterAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.ShortsAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.LeftShoeAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.RightShoeAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.DressSkirtAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.MoodAnimation] = v38.AssetCategories.Animation, 
    [v38.AssetTypeIdStrings.EyebrowAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.EyelashAccessory] = v38.AssetCategories.Accessory, 
    [v38.AssetTypeIdStrings.DynamicHead] = v38.AssetCategories.Body
};
if l_FFlagAXCustomizeMakeupSupport_0 then
    v38.AssetTypeIdToCategory[v38.AssetTypeIdStrings.FaceMakeup] = v38.AssetCategories.Makeup;
    v38.AssetTypeIdToCategory[v38.AssetTypeIdStrings.LipMakeup] = v38.AssetCategories.Makeup;
    v38.AssetTypeIdToCategory[v38.AssetTypeIdStrings.EyeMakeup] = v38.AssetCategories.Makeup;
end;
if l_FFlagAXEyebrowEyelashToMakeupCategory_0 then
    v38.AssetTypeIdToCategory[v38.AssetTypeIdStrings.EyebrowAccessory] = v38.AssetCategories.Makeup;
    v38.AssetTypeIdToCategory[v38.AssetTypeIdStrings.EyelashAccessory] = v38.AssetCategories.Makeup;
end;
v38.GradientBackgroundAssetTypeIds = {
    [v38.AssetTypeIdStrings.TShirtAccessory] = true, 
    [v38.AssetTypeIdStrings.ShirtAccessory] = true, 
    [v38.AssetTypeIdStrings.PantsAccessory] = true, 
    [v38.AssetTypeIdStrings.JacketAccessory] = true, 
    [v38.AssetTypeIdStrings.SweaterAccessory] = true, 
    [v38.AssetTypeIdStrings.ShortsAccessory] = true, 
    [v38.AssetTypeIdStrings.LeftShoeAccessory] = true, 
    [v38.AssetTypeIdStrings.RightShoeAccessory] = true, 
    [v38.AssetTypeIdStrings.DressSkirtAccessory] = true
};
v38.AssetCategoriesLocalized = {
    [v38.AssetCategories.Animation] = "Feature.Catalog.Label.Animation", 
    [v38.AssetCategories.Body] = "Feature.Catalog.Label.Body", 
    [v38.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing", 
    [v38.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory", 
    [v38.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
};
if l_FFlagAXCustomizeMakeupSupport_0 then
    v38.AssetCategoriesLocalized[v38.AssetCategories.Makeup] = "Feature.Catalog.Label.Makeup";
end;
v38.AssetTypeLocalized = {
    [v38.AssetTypeIdStrings.TShirt] = "Feature.Avatar.Label.ClassicTShirts", 
    [v38.AssetTypeIdStrings.Hat] = "Feature.Avatar.Label.Hat", 
    [v38.AssetTypeIdStrings.HairAccessory] = "Feature.Avatar.Label.Hair", 
    [v38.AssetTypeIdStrings.FaceAccessory] = "Feature.Avatar.Label.Face", 
    [v38.AssetTypeIdStrings.NeckAccessory] = "Feature.Avatar.Label.Neck", 
    [v38.AssetTypeIdStrings.ShoulderAccessory] = "Feature.Avatar.Label.Shoulder", 
    [v38.AssetTypeIdStrings.FrontAccessory] = "Feature.Avatar.Label.Front", 
    [v38.AssetTypeIdStrings.BackAccessory] = "Feature.Avatar.Label.Back", 
    [v38.AssetTypeIdStrings.WaistAccessory] = "Feature.Avatar.Label.Waist", 
    [v38.AssetTypeIdStrings.Shirt] = "Feature.Avatar.Label.ClassicShirts", 
    [v38.AssetTypeIdStrings.Pants] = "Feature.Avatar.Label.ClassicPants", 
    [v38.AssetTypeIdStrings.Gear] = "Feature.Avatar.Label.Gear", 
    [v38.AssetTypeIdStrings.Head] = "Feature.Avatar.Label.Head", 
    [v38.AssetTypeIdStrings.Face] = "Feature.Avatar.Label.Face", 
    [v38.AssetTypeIdStrings.Torso] = "Feature.Avatar.Label.Torso", 
    [v38.AssetTypeIdStrings.RightArm] = "Feature.Avatar.Label.RightArms", 
    [v38.AssetTypeIdStrings.LeftArm] = "Feature.Avatar.Label.LeftArms", 
    [v38.AssetTypeIdStrings.LeftLeg] = "Feature.Avatar.Label.LeftLegs", 
    [v38.AssetTypeIdStrings.RightLeg] = "Feature.Avatar.Label.RightLegs", 
    [v38.AssetTypeIdStrings.ClimbAnimation] = "Feature.Avatar.Label.Climb", 
    [v38.AssetTypeIdStrings.FallAnimation] = "Feature.Avatar.Label.Fall", 
    [v38.AssetTypeIdStrings.IdleAnimation] = "Feature.Avatar.Label.Idle", 
    [v38.AssetTypeIdStrings.JumpAnimation] = "Feature.Avatar.Label.Jump", 
    [v38.AssetTypeIdStrings.RunAnimation] = "Feature.Avatar.Label.Run", 
    [v38.AssetTypeIdStrings.SwimAnimation] = "Feature.Avatar.Label.Swim", 
    [v38.AssetTypeIdStrings.WalkAnimation] = "Feature.Avatar.Label.Walk", 
    [v38.AssetTypeIdStrings.EmoteAnimation] = "Feature.Avatar.Label.Emote", 
    [v38.AssetTypeIdStrings.TShirtAccessory] = "Feature.Avatar.Label.TShirt", 
    [v38.AssetTypeIdStrings.ShirtAccessory] = "Feature.Avatar.Label.Shirt", 
    [v38.AssetTypeIdStrings.PantsAccessory] = "Feature.Avatar.Label.Pants", 
    [v38.AssetTypeIdStrings.JacketAccessory] = "Feature.Avatar.Label.Jacket", 
    [v38.AssetTypeIdStrings.SweaterAccessory] = "Feature.Avatar.Label.Sweater", 
    [v38.AssetTypeIdStrings.ShortsAccessory] = "Feature.Avatar.Label.Shorts", 
    [v38.AssetTypeIdStrings.LeftShoeAccessory] = "Feature.Avatar.Label.LeftShoe", 
    [v38.AssetTypeIdStrings.RightShoeAccessory] = "Feature.Avatar.Label.RightShoe", 
    [v38.AssetTypeIdStrings.DressSkirtAccessory] = "Feature.Avatar.Label.DressesAndSkirts", 
    [v38.AssetTypeIdStrings.EyelashAccessory] = "Feature.Catalog.Label.Eyelash", 
    [v38.AssetTypeIdStrings.EyebrowAccessory] = "Feature.Catalog.Label.Eyebrow", 
    [v38.AssetTypeIdStrings.MoodAnimation] = "Feature.Avatar.Label.Mood", 
    [v38.AssetTypeIdStrings.DynamicHead] = "Feature.Avatar.Label.DynamicHead"
};
if l_FFlagAXCustomizeMakeupSupport_0 then
    v38.AssetTypeLocalized[v38.AssetTypeIdStrings.FaceMakeup] = "Feature.Catalog.Label.FaceMakeup";
    v38.AssetTypeLocalized[v38.AssetTypeIdStrings.LipMakeup] = "Feature.Catalog.Label.LipMakeup";
    v38.AssetTypeLocalized[v38.AssetTypeIdStrings.EyeMakeup] = "Feature.Catalog.Label.EyeMakeup";
end;
if l_FFlagHeadRefinementFacialAnimationToggle_0 then
    v38.StaticFacialAnimation = "StaticFacialAnimation";
end;
v38.AssetTypeIdStringToHumanoidDescriptionProp = {
    [tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt", 
    [tostring(Enum.AssetType.Hat.Value)] = "HatAccessory", 
    [tostring(Enum.AssetType.Shirt.Value)] = "Shirt", 
    [tostring(Enum.AssetType.Pants.Value)] = "Pants", 
    [tostring(Enum.AssetType.Head.Value)] = "Head", 
    [tostring(Enum.AssetType.Face.Value)] = "Face", 
    [tostring(Enum.AssetType.Torso.Value)] = "Torso", 
    [tostring(Enum.AssetType.RightArm.Value)] = "RightArm", 
    [tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm", 
    [tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg", 
    [tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg", 
    [tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory", 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory", 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory", 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory", 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory", 
    [tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory", 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory", 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation", 
    [tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation", 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation", 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation", 
    [tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation", 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation", 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation", 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = "MoodAnimation", 
    [tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
};
v38.HumanoidDescriptionScaleToName = {
    bodyType = "BodyTypeScale", 
    head = "HeadScale", 
    height = "HeightScale", 
    proportion = "ProportionScale", 
    depth = "DepthScale", 
    width = "WidthScale"
};
v38.BodyPartForSkinColoringIdToHumanoidDescription = {
    headColor3 = "HeadColor", 
    leftArmColor3 = "LeftArmColor", 
    leftLegColor3 = "LeftLegColor", 
    rightArmColor3 = "RightArmColor", 
    rightLegColor3 = "RightLegColor", 
    torsoColor3 = "TorsoColor"
};
if l_FFlagParseHeadShapeFromAPIResponse_0 then
    v38.BodyPartNameToEnum = {
        Head = Enum.BodyPart.Head, 
        LeftArm = Enum.BodyPart.LeftArm, 
        LeftLeg = Enum.BodyPart.LeftLeg, 
        RightArm = Enum.BodyPart.RightArm, 
        RightLeg = Enum.BodyPart.RightLeg, 
        Torso = Enum.BodyPart.Torso
    };
end;
v38.GamepadInputTypes = {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
v38.ThumbstickDeadzone = 0.2;
v38.SceneGamepad = {
    FullViewIndicatorTag = l_Symbol_0.named("FullViewIndicatorTag")
};
v38.AnimationCategoryCameraZoomRadius = 5;
v38.SceneRowHeight = 28;
v38.LayeredClothingOrder = {
    [v38.AssetTypeIdStrings.EyebrowAccessory] = 0, 
    [v38.AssetTypeIdStrings.EyelashAccessory] = 1, 
    [v38.AssetTypeIdStrings.Pants] = 2, 
    [v38.AssetTypeIdStrings.Shirt] = 3, 
    [v38.AssetTypeIdStrings.TShirt] = 4, 
    [v38.AssetTypeIdStrings.LeftShoeAccessory] = 5, 
    [v38.AssetTypeIdStrings.RightShoeAccessory] = 5, 
    [v38.AssetTypeIdStrings.PantsAccessory] = 6, 
    [v38.AssetTypeIdStrings.ShortsAccessory] = 7, 
    [v38.AssetTypeIdStrings.DressSkirtAccessory] = 8, 
    [v38.AssetTypeIdStrings.TShirtAccessory] = 9, 
    [v38.AssetTypeIdStrings.ShirtAccessory] = 10, 
    [v38.AssetTypeIdStrings.SweaterAccessory] = 11, 
    [v38.AssetTypeIdStrings.JacketAccessory] = 12, 
    [v38.AssetTypeIdStrings.HairAccessory] = 13
};
v38.LCIgnoredForSorting = {
    [v38.AssetTypeIdStrings.HairAccessory] = true, 
    [v38.AssetTypeIdStrings.EyebrowAccessory] = true, 
    [v38.AssetTypeIdStrings.EyelashAccessory] = true
};
v38.AssetTypeIdToAccessoryTypeEnum = {
    [tostring(Enum.AssetType.Hat.Value)] = Enum.AccessoryType.Hat, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = Enum.AccessoryType.Face, 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = Enum.AccessoryType.Neck, 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = Enum.AccessoryType.Shoulder, 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = Enum.AccessoryType.Front, 
    [tostring(Enum.AssetType.BackAccessory.Value)] = Enum.AccessoryType.Back, 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = Enum.AccessoryType.Waist, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
};
v38.AccessoryTypeEnumToAssetTypeId = {};
for v43, v44 in v38.AssetTypeIdToAccessoryTypeEnum do
    v38.AccessoryTypeEnumToAssetTypeId[v44] = v43;
end;
v38.LayeredAssetTypes = {
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = Enum.AccessoryType.TShirt, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = Enum.AccessoryType.Shirt, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = Enum.AccessoryType.Pants, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = Enum.AccessoryType.Jacket, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = Enum.AccessoryType.Sweater, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = Enum.AccessoryType.Shorts, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = Enum.AccessoryType.LeftShoe, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = Enum.AccessoryType.RightShoe, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = Enum.AccessoryType.DressSkirt, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = Enum.AccessoryType.Hair, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = Enum.AccessoryType.Eyebrow, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = Enum.AccessoryType.Eyelash
};
v38.AssetCategory = {
    LCTops = "LCTops", 
    LCBottoms = "LCBottoms"
};
v38.NavOuterPadding = 6;
v38.NavInnerPadding = 6;
v38.NavButtonElementPadding = 4;
v38.NavButtonElementMargin = 4;
v38.NavCornerSize = 8;
v38.NavButtonBorderSize = 2;
v38.NavSubButtonInnerPadding = 4;
v38.MinTileWidthToFontHeightRatio = 6;
v38.SmallRadioButtonHeight = 56;
v38.SortAndFiltersRowHeight = 45;
v38.SortAndFiltersSmallRowHeight = 32;
v38.SortAndFiltersSectionPadding = 8;
v38.FullViewPageDefaults = {
    [l_AvatarScreen_0.AccessoryAdjustment] = l_FullView_0.None, 
    [l_AvatarScreen_0.LayeredClothingSort] = l_FullView_0.None, 
    [l_AvatarScreen_0.LayeredMakeupSort] = if l_FFlagAXCustomizeMakeupSupport_0 then l_FullView_0.None else nil, 
    [l_AvatarScreen_0.AvatarEditor] = l_FullView_0.None, 
    [l_AvatarScreen_0.AvatarExperienceLandingPage] = l_FullView_0.None, 
    [l_AvatarScreen_0.Catalog] = l_FullView_0.None, 
    [l_AvatarScreen_0.CatalogSearch] = l_FullView_0.None, 
    [l_AvatarScreen_0.ProfilePictureEditorEmotes] = l_FullView_0.None, 
    [l_AvatarScreen_0.MySharedAvatars] = l_FullView_0.None, 
    [l_AvatarScreen_0.SearchLandingFocusedWidgetPage] = if v17 then l_FullView_0.None else nil, 
    [l_AvatarScreen_0.BodyShape] = if v14() then l_FullView_0.None else nil, 
    [l_AvatarScreen_0.AvatarSwitcher] = if v14() then l_FullView_0.None else nil, 
    [l_AvatarScreen_0.EditEmotes] = if v14() then l_FullView_0.None else nil, 
    [l_AvatarScreen_0.Photobooth] = if v18.FFlagAXPhotoboothFunctionality then l_FullView_0.SceneFullView else nil
};
local v45 = l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and 0.9 or nil;
local v46 = l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and -1.2 or nil;
local v47 = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then -2 * v35 + v46 else -2 * v35;
local v48 = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then -4.4 * v35 + v46 else -4.4 * v35;
local v49 = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then 3.2 * v35 * v45 else 3.2 * v35;
local v50 = (3.52 * v35 - 3.52) / 2;
v38.VR = {
    SPACE_BETWEEN_STACKED_PANELS = 0.01, 
    PANELS_HEIGHT_OFFSET = 4.6, 
    PanelInfo = {
        Left = {
            PartSize = Vector2.new(2.2, 3.52) * v35, 
            Offset = CFrame.lookAt(Vector3.new(-v49, 4.6, v47), (Vector3.new(0, 4.599999904632568, 0, 0))), 
            VirtualScreenSize = Vector2.new(360, 704)
        }, 
        Right = {
            PartSize = Vector2.new(2.2, 3.52) * v35, 
            Offset = CFrame.lookAt(Vector3.new(v49, 4.6, v47), (Vector3.new(0, 4.599999904632568, 0, 0))), 
            VirtualScreenSize = Vector2.new(360, 704)
        }, 
        Center = {
            PartSize = Vector2.new(3, 3.52) * v35, 
            Offset = CFrame.lookAt(Vector3.new(0, 4.6, v48), (Vector3.new(0, 4.599999904632568, 0, 0))), 
            VirtualScreenSize = Vector2.new(600, 704)
        }
    }, 
    AvatarEditorNavBarSize = Vector2.new(2.5, 0.3) * v35, 
    AvatarEditorNavBarPosition = Vector3.new(0, 6.9 + v50, v48), 
    AvatarEditorNavBarOrientation = Vector3.new(0, 7 + v50, 0), 
    AvatarEditorNavBarResolution = Vector2.new(650, 75)
};
v38.Counter = {
    PREFIX = "AvatarExperience_", 
    TopLevelViews = "TopLevelViews", 
    CatalogView = "CatalogView", 
    SearchView = "SearchView", 
    EditorView = "EditorView", 
    CatalogItemDetailsView = "CatalogItemDetailsView", 
    SearchItemDetailsView = "SearchItemDetailsView", 
    CatalogFiltersView = "CatalogFiltersView", 
    SearchFiltersView = "SearchFiltersView", 
    SearchLandingView = "SearchLandingView", 
    TryOnItemView = "TryOnItemView", 
    OthersView = "OthersView", 
    TopLevelErrors = {
        CatalogViewError = "CatalogViewError", 
        SearchViewError = "SearchViewError", 
        EditorViewError = "EditorViewError", 
        CatalogItemDetailsViewError = "CatalogItemDetailsViewError", 
        SearchItemDetailsViewError = "SearchItemDetailsViewError", 
        CatalogFiltersViewError = "CatalogFiltersViewError", 
        SearchFiltersViewError = "SearchFiltersViewError", 
        UnknownViewError = "UnknownViewError"
    }, 
    TopLevelLatency = {
        Name = "TopLevelLatency", 
        CatalogViewLatency = "CatalogViewLatency", 
        SearchViewLatency = "SearchViewLatency", 
        EditorViewLatency = "EditorViewLatency", 
        CatalogItemDetailsViewLatency = "CatalogItemDetailsViewLatency", 
        SearchItemDetailsViewLatency = "SearchItemDetailsViewLatency", 
        CatalogFiltersViewLatency = "CatalogFiltersViewLatency", 
        SearchFiltersViewLatency = "SearchFiltersViewLatency", 
        UnknownViewLatency = "UnknownViewLatency"
    }, 
    TopLevelFPS = {
        Catalog = "tracking-pattern:catalog-view", 
        Search = "tracking-pattern:search-view", 
        Editor = "tracking-pattern:editor-view", 
        CatalogItemDetails = "tracking-pattern:catalog-item-details-view", 
        SearchItemDetails = "tracking-pattern:search-item-details-view", 
        CatalogFilters = "tracking-pattern:catalog-filters-view", 
        SearchFilters = "tracking-pattern:search-filters-view", 
        Unknown = "tracking-pattern:unknown-view-latency"
    }, 
    TopLevelFPSForCatSubCat = if v22 then {
        Catalog = "catalog-category-changed", 
        Editor = "editor-category-changed"
    } else nil, 
    TopLevelPageInitialView = {
        Catalog = "Catalog", 
        Editor = "Editor", 
        SlotBasedEditor = "SlotBasedEditor"
    }, 
    PopularLooksWidgetHomeView = "PopularLooksWidgetHomeView", 
    PopularLooksWidgetHomeTileClicked = "PopularLooksWidgetHomeTileClicked", 
    PopularLooksWidgetSearchTileClicked = "PopularLooksWidgetSearchTileClicked", 
    PopularLooksWidgetHomeBuyClicked = "PopularLooksWidgetHomeBuyClicked", 
    PopularLooksWidgetSearchBuyClicked = "PopularLooksWidgetSearchBuyClicked", 
    AvatarWidget = {
        AvatarsWidgetSearchBuyClicked = "AvatarsWidgetSearchBuyClicked", 
        AvatarsWidgetHomeBuyClicked = "AvatarsWidgetHomeBuyClicked", 
        AvatarsWidgetBuyClickedInsufficientRobux = "AvatarsWidgetBuyClickedInsufficientRobux", 
        AvatarsWidgetBuyClickedNoItemsToPurchase = "AvatarsWidgetBuyClickedNoItemsToPurchase", 
        AvatarsWidgetBuyClickedMissingLookId = "AvatarsWidgetBuyClickedMissingLookId"
    }, 
    CatalogRefresh = {
        StaleResults = "CatalogRefreshStaleResults"
    }, 
    AvatarEditorServiceErrors = {
        GetRecommendedAssets = "AvatarEditorServiceGetRecommendedAssetsError", 
        GetOutfits = "AvatarEditorServiceGetOutfitsError", 
        CreateOutfit = "AvatarEditorServiceCreateOutfitError", 
        GetAvatarRules = "AvatarEditorServiceGetAvatarRulesError", 
        GetInventory = "AvatarEditorServiceGetInventoryError", 
        SearchCatalog = "AvatarEditorServiceSearchCatalogError", 
        GetBatchItemDetails = "AvatarEditorServiceGetBatchItemDetailsError", 
        GetRecommendedBundles = "AvatarEditorServiceGetRecommendedBundlesError", 
        NoPromptSetFavorite = "AvatarEditorServiceNoPromptSetFavoriteError", 
        NoPromptSaveAvatarThumbnailCustomization = "AvatarEditorServiceNoPromptSaveAvatarThumbnailCustomizationError", 
        NoPromptCreateOutfit = "AvatarEditorServiceNoPromptCreateOutfitError", 
        GetOutfitDetails = "AvatarEditorServiceGetOutfitDetailsError", 
        FetchAssetOrBundleInfo = "AvatarEditorServiceFetchAssetOrBundleInfoError", 
        FetchBundleInfo = "AvatarEditorServiceFetchBundleInfoError", 
        GetAssetFavorite = "AvatarEditorServiceGetAssetFavoriteError", 
        GetBundleFavorite = "AvatarEditorServiceGetBundleFavoriteError", 
        SetBundleFavorite = "AvatarEditorServiceSetBundleFavoriteError", 
        SetAssetFavorite = "AvatarEditorServiceSetAssetFavoriteError", 
        ConformToAvatarRules = "AvatarEditorServiceConformToAvatarRulesError", 
        NoPromptSaveAvatar = "AvatarEditorServiceNoPromptSaveAvatarError", 
        PromptSaveAvatarCompleted = "AvatarEditorServicePromptSaveAvatarCompletedError"
    }, 
    LookComposer = {
        PreviewLook = "LookComposerPreviewLook", 
        CreateLook = "LookComposerCreateLook"
    }, 
    MySharedAvatars = {
        ReloadTriggedInPage = "MySharedAvatarsReloadTriggedInPage", 
        FetchMySharedAvatarsError = "MySharedAvatarsFetchMySharedAvatarsError", 
        FetchMySharedAvatarsNewPage = "MySharedAvatarsFetchMySharedAvatarsNewPage", 
        MySharedAvatarsDeleteAvatarError = "MySharedAvatarsDeleteAvatarError"
    }, 
    ShareButtonProfileration = {
        ShareButtonClicked = "ShareButtonProliferationButtonClicked", 
        Experiment = "ShareButtonProliferationExperiment"
    }, 
    Errors = {
        NoInternetConnectionErrorSearchView = "NoInternetConnectionErrorSearchView", 
        NoInternetConnectionErrorCatalogView = "NoInternetConnectionErrorCatalogView", 
        PurchaseLooksProductError = "PurchaseLooksProductError"
    }, 
    GetOrGenerateShortShareLink = {
        Success = "GetOrGenerateShortShareLinkSuccess", 
        Invalid = "GetOrGenerateShortShareLinkInvalid", 
        Failure = "GetOrGenerateShortShareLinkFailure", 
        HookSuccess = "GetOrGenerateShortShareLinkSuccessFromHook", 
        HookInvalid = "GetOrGenerateShortShareLinkInvalidFromHook", 
        HookFailure = "GetOrGenerateShortShareLinkFailureFromHook", 
        LinkCopied = "GetOrGenerateShortShareLinkLinkCopied"
    }, 
    ContextFrame = {
        Open = "ContextFrameOpen", 
        ViewDetailsPageClick = "ContextFrameViewDetailsPageClick", 
        DeleteAvatarClick = "ContextFrameDeleteAvatarClick"
    }, 
    Toasts = {
        NoFaceHead = "ToastsNoFaceHead"
    }, 
    Latency = {
        Organic = {
            Thumbnails = "OrganicThumbnailLatency", 
            Tiles = "OrganicTilesLatency"
        }, 
        Widget = {
            Thumbnails = "WidgetThumbnailLatency", 
            Tiles = "WidgetTilesLatency"
        }, 
        Network = {
            FetchWidgetInfo = "NetworkFetchWidgetInfoLatency", 
            ApiFetchCatalogSearch = "NetworkApiFetchCatalogSearchLatency", 
            FetchSponsoredItems = "NetworkFetchSponsoredItemsLatency"
        }
    }, 
    AvatarInventory = {
        ReceivedDuplicateItem = "AvatarInventoryReceivedDuplicateItem"
    }, 
    SaveManager = {
        Attempt = "SaveManagerAttempt", 
        Success = "SaveManagerSuccess", 
        BlockedByOngoingSave = "SaveManagerBlockedByOngoingSave", 
        Failure = "SaveManagerFailure"
    }, 
    CategoryButtonTooltip = {
        Seen = "CategoryButtonTooltipSeen", 
        AutoDismiss = "CategoryButtonTooltipAutoDismiss", 
        ClickDismiss = "CategoryButtonTooltipClickDismiss"
    }, 
    AvatarsTabError = "AvatarsTabError", 
    FetchCatalogSearchForLooksError = "FetchCatalogSearchForLooksError", 
    PrefetchMarketplace = {
        appLaunched = "PrefetchMarketplaceAppLaunched", 
        isRecentMarketplaceUser = "PrefetchIsRecentMarketplaceUser", 
        enteredMarketplaceAndIsRecentUser = "PrefetchEnteredMarketplaceAndIsRecentUser", 
        inExperimentAndIsRecentUserAndEnteredMarketplace = "PrefetchInExperimentAndIsRecentUserAndEnteredMarketplace", 
        inTreatmentAndHasPrefetchedMarketplace = "PrefetchInTreatmentAndHasPrefetchedMarketplace", 
        enteredMarketplaceButPrefetchFailed = "PrefetchEnteredMarketplaceButPrefetchFailed"
    }, 
    FetchMarketplace = {
        ExitAndReEnterRefreshCounter = "FetchMarketplaceExitAndReEnterRefreshCounter", 
        ExitAndReEnterRefreshTreatment = "FetchMarketplaceExitAndReEnterRefreshTreatment"
    }, 
    LayerExposure = {
        CatalogView = "CatalogViewLayerExposure"
    }, 
    Catalog = if l_FFlagAXCatalogCategoriesSDUI_0 then {
        Errors = {
            FetchCatalogCategoriesError = "FetchCatalogCategoriesError"
        }
    } else nil
};
v38.MemStorageKeys = {
    ColdStart = {
        CatalogAndCatalogSearch = "AXColdStartCatalogAndSearch"
    }
};
v38.ModerationStatus = {
    PendingModeration = "Pending", 
    Moderated = "Moderated"
};
v38.HeadRefinementCameraCategory = {
    Name = "Head", 
    Title = "Head", 
    CameraFocus = v38.FocusType.Head, 
    CameraZoomRadius = l_Constants_0.CAMERA_ZOOM_RADIUS.Special.HeadRefinement
};
v38.LayeredMakeupCameraCategory = {
    Name = "Makeup", 
    Title = "Makeup", 
    CameraFocus = v38.FocusType.Makeup, 
    CameraZoomRadius = 4
};
if v13.isEnabled() then
    v38.ItemViewportAssetTypes = {
        [v38.AssetTypeIdStrings.Hat] = true, 
        [v38.AssetTypeIdStrings.HairAccessory] = true, 
        [v38.AssetTypeIdStrings.FaceAccessory] = true, 
        [v38.AssetTypeIdStrings.NeckAccessory] = true, 
        [v38.AssetTypeIdStrings.ShoulderAccessory] = true, 
        [v38.AssetTypeIdStrings.FrontAccessory] = true, 
        [v38.AssetTypeIdStrings.BackAccessory] = true, 
        [v38.AssetTypeIdStrings.WaistAccessory] = true, 
        [v38.AssetTypeIdStrings.TShirtAccessory] = true, 
        [v38.AssetTypeIdStrings.ShirtAccessory] = true, 
        [v38.AssetTypeIdStrings.PantsAccessory] = true, 
        [v38.AssetTypeIdStrings.JacketAccessory] = true, 
        [v38.AssetTypeIdStrings.SweaterAccessory] = true, 
        [v38.AssetTypeIdStrings.ShortsAccessory] = true, 
        [v38.AssetTypeIdStrings.LeftShoeAccessory] = true, 
        [v38.AssetTypeIdStrings.RightShoeAccessory] = true, 
        [v38.AssetTypeIdStrings.DressSkirtAccessory] = true, 
        [v38.AssetTypeIdStrings.EyebrowAccessory] = not l_FFlagAXEyebrowEyelashToMakeupCategory_0 or nil, 
        [v38.AssetTypeIdStrings.EyelashAccessory] = not l_FFlagAXEyebrowEyelashToMakeupCategory_0 or nil
    };
    v38.ItemViewportBundleTypes = {
        [v38.BundleTypeIdStrings.BodyParts] = true, 
        [v38.BundleTypeIdStrings.DynamicHead] = true, 
        [v38.BundleTypeIdStrings.Shoes] = v15() and true or nil
    };
end;
v38.RobloxCreatorName = "Roblox";
v38.NavigationParams = {
    fromSurface = "fromSurface"
};
return v38;