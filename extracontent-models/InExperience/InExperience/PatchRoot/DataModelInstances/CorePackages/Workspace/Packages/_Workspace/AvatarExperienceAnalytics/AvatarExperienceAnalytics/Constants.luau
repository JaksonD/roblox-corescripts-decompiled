local v0 = {
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
local v1 = {
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
return {
    AVATAR_EVENT_COUNTER_NAME = v0, 
    AVATAR_EDITOR_SERVICE_ERRORS = v1
};