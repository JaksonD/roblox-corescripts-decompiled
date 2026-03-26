local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXInspectAndBuyMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport;
local v2 = {
    NotificationKeys = {
        MultipleBundleNoticeKey = "InGame.InspectMenu.Description.MultipleBundlesNotice", 
        SingleBundleNoticeKey = "InGame.InspectMenu.Description.SingleBundleNotice", 
        LimitedItemNoticeKey = "InGame.InspectMenu.Description.LimitedNotice", 
        LayeredClothingOnR6Key = "InGame.InspectMenu.Description.LayeredClothingR6"
    }, 
    ItemType = {
        Asset = "Asset", 
        Bundle = "Bundle"
    }, 
    View = {
        Compact = 0, 
        Wide = 1, 
        WideLandscape = 2
    }, 
    AssetCategories = {
        Animation = "Animation", 
        Body = "Body", 
        Clothing = "Clothing", 
        Accessory = "Accessory", 
        Emotes = "Emotes", 
        Makeup = l_FFlagAXInspectAndBuyMakeupSupport_0 and "Makeup" or nil
    }, 
    AssetTypeIdStringToHumanoidDescriptionProp = {
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
        [tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
    }, 
    AnimationAssetTypes = {
        ["48"] = 48, 
        ["50"] = 50, 
        ["51"] = 51, 
        ["52"] = 52, 
        ["53"] = 53, 
        ["54"] = 54, 
        ["55"] = 55, 
        ["61"] = 61, 
        ["78"] = 78
    }, 
    AssetTypeIdToAccessoryTypeEnum = {
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
    }, 
    LayeredAssetTypes = {
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
    }, 
    AssetCategory = {
        Tops = "Tops", 
        Bottoms = "Bottoms"
    }
};
v2.AssetTypeIdToCategory = {
    [tostring(Enum.AssetType.TShirt.Value)] = v2.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Hat.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.BackAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.Shirt.Value)] = v2.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Pants.Value)] = v2.AssetCategories.Clothing, 
    [tostring(Enum.AssetType.Gear.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.Head.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.Face.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.Torso.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.RightArm.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.LeftArm.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.LeftLeg.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.RightLeg.Value)] = v2.AssetCategories.Body, 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.FallAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.RunAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.EmoteAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = v2.AssetCategories.Accessory, 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = v2.AssetCategories.Animation, 
    [tostring(Enum.AssetType.DynamicHead.Value)] = v2.AssetCategories.Body
};
if l_FFlagAXInspectAndBuyMakeupSupport_0 then
    v2.AssetTypeIdToCategory[tostring(Enum.AssetType.EyeMakeup.Value)] = v2.AssetCategories.Makeup;
    v2.AssetTypeIdToCategory[tostring(Enum.AssetType.FaceMakeup.Value)] = v2.AssetCategories.Makeup;
    v2.AssetTypeIdToCategory[tostring(Enum.AssetType.LipMakeup.Value)] = v2.AssetCategories.Makeup;
end;
v2.AssetCategoriesLocalized = {
    [v2.AssetCategories.Animation] = "Feature.Catalog.Label.Animation", 
    [v2.AssetCategories.Body] = "Feature.Catalog.Label.Body", 
    [v2.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing", 
    [v2.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory", 
    [v2.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
};
if l_FFlagAXInspectAndBuyMakeupSupport_0 then
    v2.AssetCategoriesLocalized[v2.AssetCategories.Makeup] = "Feature.Catalog.Label.Makeup";
end;
v2.AssetTypeIdToTypeLocalized = {
    [tostring(Enum.AssetType.TShirt.Value)] = "Feature.Avatar.Label.ClassicTShirts", 
    [tostring(Enum.AssetType.Hat.Value)] = "Feature.Avatar.Label.Hat", 
    [tostring(Enum.AssetType.HairAccessory.Value)] = "Feature.Avatar.Label.Hair", 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = "Feature.Avatar.Label.Face", 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = "Feature.Avatar.Label.Neck", 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "Feature.Avatar.Label.Shoulder", 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = "Feature.Avatar.Label.Front", 
    [tostring(Enum.AssetType.BackAccessory.Value)] = "Feature.Avatar.Label.Back", 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = "Feature.Avatar.Label.Waist", 
    [tostring(Enum.AssetType.Shirt.Value)] = "Feature.Avatar.Label.ClassicShirts", 
    [tostring(Enum.AssetType.Pants.Value)] = "Feature.Avatar.Label.ClassicPants", 
    [tostring(Enum.AssetType.Gear.Value)] = "Feature.Avatar.Label.Gear", 
    [tostring(Enum.AssetType.Head.Value)] = "Feature.Avatar.Label.Head", 
    [tostring(Enum.AssetType.Face.Value)] = "Feature.Avatar.Label.Face", 
    [tostring(Enum.AssetType.Torso.Value)] = "Feature.Avatar.Label.Torso", 
    [tostring(Enum.AssetType.RightArm.Value)] = "Feature.Avatar.Label.RightArms", 
    [tostring(Enum.AssetType.LeftArm.Value)] = "Feature.Avatar.Label.LeftArms", 
    [tostring(Enum.AssetType.LeftLeg.Value)] = "Feature.Avatar.Label.LeftLegs", 
    [tostring(Enum.AssetType.RightLeg.Value)] = "Feature.Avatar.Label.RightLegs", 
    [tostring(Enum.AssetType.ClimbAnimation.Value)] = "Feature.Avatar.Label.Climb", 
    [tostring(Enum.AssetType.FallAnimation.Value)] = "Feature.Avatar.Label.Fall", 
    [tostring(Enum.AssetType.IdleAnimation.Value)] = "Feature.Avatar.Label.Idle", 
    [tostring(Enum.AssetType.JumpAnimation.Value)] = "Feature.Avatar.Label.Jump", 
    [tostring(Enum.AssetType.RunAnimation.Value)] = "Feature.Avatar.Label.Run", 
    [tostring(Enum.AssetType.SwimAnimation.Value)] = "Feature.Avatar.Label.Swim", 
    [tostring(Enum.AssetType.WalkAnimation.Value)] = "Feature.Avatar.Label.Walk", 
    [tostring(Enum.AssetType.EmoteAnimation.Value)] = "Feature.Avatar.Label.Emote", 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = "Feature.Avatar.Label.TShirt", 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = "Feature.Avatar.Label.Shirt", 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = "Feature.Avatar.Label.Pants", 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = "Feature.Avatar.Label.Jacket", 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = "Feature.Avatar.Label.Sweater", 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = "Feature.Avatar.Label.Shorts", 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = "Feature.Avatar.Label.LeftShoe", 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = "Feature.Avatar.Label.RightShoe", 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "Feature.Avatar.Label.DressesAndSkirts", 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = "Feature.Catalog.Label.Eyelash", 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = "Feature.Catalog.Label.Eyebrow", 
    [tostring(Enum.AssetType.MoodAnimation.Value)] = "Feature.Avatar.Label.Mood", 
    [tostring(Enum.AssetType.DynamicHead.Value)] = "Feature.Avatar.Label.DynamicHead"
};
if l_FFlagAXInspectAndBuyMakeupSupport_0 then
    v2.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.EyeMakeup.Value)] = "Feature.Catalog.Label.EyeMakeup";
    v2.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.FaceMakeup.Value)] = "Feature.Catalog.Label.FaceMakeup";
    v2.AssetTypeIdToTypeLocalized[tostring(Enum.AssetType.LipMakeup.Value)] = "Feature.Catalog.Label.LipMakeup";
end;
v2.MoodAnimationAssetTypeId = "78";
v2.DynamicHeadAssetTypeId = "79";
v2.DetailsThumbnailFrameHeight = 250;
v2.LimitedIconFrameSizeXOffset = 9;
v2.LimitedIconFrameSizeYOffset = 4;
v2.DynamicHeadAssetTypes = {
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = true, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = true, 
    [v2.MoodAnimationAssetTypeId] = true, 
    [v2.DynamicHeadAssetTypeId] = true
};
v2.AccessoryTypeEnumToAssetTypeId = {};
for v3, v4 in pairs(v2.AssetTypeIdToAccessoryTypeEnum) do
    v2.AccessoryTypeEnumToAssetTypeId[v4] = v3;
end;
v2.AssetCategoryToAssetType = {
    [v2.AssetCategory.Tops] = {
        tostring(Enum.AssetType.ShirtAccessory.Value), 
        tostring(Enum.AssetType.TShirtAccessory.Value), 
        (tostring(Enum.AssetType.SweaterAccessory.Value))
    }, 
    [v2.AssetCategory.Bottoms] = {
        tostring(Enum.AssetType.PantsAccessory.Value), 
        tostring(Enum.AssetType.ShortsAccessory.Value), 
        (tostring(Enum.AssetType.DressSkirtAccessory.Value))
    }
};
v2.AssetTypeToAssetCategory = {};
for v5, v6 in pairs(v2.AssetCategoryToAssetType) do
    for _, v8 in ipairs(v6) do
        v2.AssetTypeToAssetCategory[v8] = v5;
    end;
end;
v2.LayeredClothingOrder = {
    [tostring(Enum.AssetType.Pants.Value)] = 0, 
    [tostring(Enum.AssetType.Shirt.Value)] = 1, 
    [tostring(Enum.AssetType.TShirt.Value)] = 2, 
    [tostring(Enum.AssetType.LeftShoeAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.RightShoeAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = 4, 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = 5, 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = 6, 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = 7, 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = 8, 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = 9, 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = 10, 
    [tostring(Enum.AssetType.HairAccessory.Value)] = 11, 
    [tostring(Enum.AssetType.EyebrowAccessory.Value)] = 3, 
    [tostring(Enum.AssetType.EyelashAccessory.Value)] = 3
};
v2.ProductType = {
    CollectibleItem = "Collectible Item"
};
v2.ItemRestrictions = {
    Limited = "Limited", 
    LimitedUnique = "LimitedUnique", 
    Collectible = "Collectible"
};
v2.SaleStatus = {
    OnSale = "OnSale"
};
v2.SaleLocationType = {
    Invalid = 0, 
    ShopOnly = 1, 
    MyExperiencesOnly = 2, 
    ShopAndMyExperiences = 3, 
    ExperiencesById = 4, 
    ShopAndAllExperiences = 5, 
    ExperiencesDevApiOnly = 6, 
    ShopAndExperiencesById = 7
};
v2.CounterSuffix = {
    RequestSucceeded = "RequestSucceeded", 
    RequestRejected = "RequestRejected", 
    RequestFailed = "RequestFailed"
};
v2.Counters = {
    CreateFavoriteForAsset = "CreateFavoriteForAsset", 
    CreateFavoriteForBundle = "CreateFavoriteForBundle", 
    DeleteFavoriteForAsset = "DeleteFavoriteForAsset", 
    DeleteFavoriteForBundle = "DeleteFavoriteForBundle", 
    GetAssetBundles = "GetAssetBundles", 
    GetAssetFavoriteCount = "GetAssetFavoriteCount", 
    GetBundleFavoriteCount = "GetBundleFavoriteCount", 
    GetCharacterModelFromUserId = "GetCharacterModelFromUserId", 
    GetCollectibleResellableInstances = "GetCollectibleResellableInstances", 
    GetCollectibleResellableInstancesRequestSucceededWithoutResult = "GetCollectibleResellableInstancesRequestSucceededWithoutResult", 
    GetEconomyProductInfo = "GetEconomyV1DeprecatedProductInfo", 
    GetExperienceInfo = "GetExperienceInfo", 
    GetExperiencePlayability = "GetExperiencePlayability", 
    GetFavoriteForAsset = "GetFavoriteForAsset", 
    GetFavoriteForBundle = "GetFavoriteForBundle", 
    GetItemDetails = "GetItemDetails", 
    GetItemDetailsRespondedWithUnknownItemType = "GetItemDetailsRespondedWithUnknownItemType", 
    GetPlayerName = "GetPlayerName", 
    GetProductInfo = "MarketplaceServiceGetProductInfo", 
    GetVersionInfo = "GetVersionInfo", 
    PromptLimitedCollectiblesPurchase = "PromptLimitedCollectiblesPurchase", 
    PromptBundlePurchase = "PromptBundlePurchase", 
    PromptUnlimitedCollectiblePurchase = "PromptUnlimitedCollectiblePurchase", 
    PromptRobloxPurchase = "PromptRobloxPurchase", 
    PromptPurchaseUnknownItemType = "PromptPurchaseUnknownItemType", 
    PurchaseSucceededBundle = "PurchaseSucceededBundle", 
    PurchaseSucceededAsset = "PurchaseSucceededAsset", 
    PurchaseSucceededOther = "PurchaseSucceededOther", 
    PurchaseFinished = "PurchaseFinished", 
    ItemDetailPageOpened = "ItemDetailPageOpened", 
    TryOnButtonClicked = "TryOnButtonClicked", 
    GetAvatarPreview = "GetAvatarPreview", 
    BatchGetAssets = "BatchGetAssets", 
    BatchGetItemDetails = "BatchGetItemDetails"
};
return v2;