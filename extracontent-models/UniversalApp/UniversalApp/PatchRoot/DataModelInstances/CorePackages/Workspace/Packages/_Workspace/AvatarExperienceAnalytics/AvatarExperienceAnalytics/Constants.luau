local v0 = require(script.Parent.UnifiedEventLogEnums);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent;
local l_FFlagAXExportTimedOptionsConstant_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXExportTimedOptionsConstant;
local v3 = {
    AXEquipAsset = "AXEquipAsset", 
    AXUnequipAsset = "AXUnequipAsset", 
    AXCreateCostume = "AXCreateCostume", 
    AXCreateMakeupLook = "AXCreateMakeupLook", 
    AXColorPickerChanged = "AXColorPickerChanged", 
    AXCameraEnabled = "AXCameraEnabled", 
    AXCameraDisabled = "AXCameraDisabled", 
    AXUpdateProfilePicture = "AXUpdateProfilePicture", 
    AXPurchaseAsset = "AXPurchaseAsset", 
    AXPurchaseBundle = "AXPurchaseBundle", 
    CatalogPurchaseShownEnableTwoStepAuth = "CatalogPurchaseShownEnableTwoStepAuth", 
    CatalogPurchaseShownTwoStepAuth = "CatalogPurchaseShownTwoStepAuth", 
    CatalogPurchaseFailedShowTwoStepAuth = "CatalogPurchaseFailedShowTwoStepAuth", 
    CatalogPurchaseCompletedTwoStepAuth = "CatalogPurchaseCompletedTwoStepAuth", 
    CatalogPurchaseInvalidatedTwoStepAuth = "CatalogPurchaseInvalidatedTwoStepAuth", 
    CatalogPurchaseAbandonedTwoStepAuth = "CatalogPurchaseAbandonedTwoStepAuth", 
    CatalogPurchaseLoadFailedTwoStepAuth = "CatalogPurchaseLoadFailedTwoStepAuth"
};
local v4 = {
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
};
local v5 = {
    AvatarItems = "avatarItemImpressions", 
    AvatarItemsCatalog = "avatarItemImpressionsCatalog"
};
local v6 = if l_FFlagAXExportTimedOptionsConstant_0 then {
    [3] = v0.MarketplaceTimedOption.DAYS_3, 
    [7] = v0.MarketplaceTimedOption.DAYS_7, 
    [14] = v0.MarketplaceTimedOption.DAYS_14
} else nil;
return {
    AVATAR_EVENT_COUNTER_NAME = v3, 
    AVATAR_EDITOR_SERVICE_ERRORS = v4, 
    IMPRESSIONS_EVENTS = v5, 
    TIMED_OPTION_BY_DAYS = if l_FFlagAXExportTimedOptionsConstant_0 then v6 else nil
};