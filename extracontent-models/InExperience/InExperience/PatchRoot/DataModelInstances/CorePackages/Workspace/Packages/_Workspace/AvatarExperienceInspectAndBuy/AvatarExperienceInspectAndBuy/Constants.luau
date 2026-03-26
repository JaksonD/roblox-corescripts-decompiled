local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagAXInspectAndBuyMakeupSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport;
local v3 = {};
local v4 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
v3.AssetLocalizationKeys = {
    [tostring(Enum.AssetType.Hat.Value)] = "Feature.Avatar.Label.Hat", 
    [tostring(Enum.AssetType.HairAccessory.Value)] = "Feature.Avatar.Label.Hair", 
    [tostring(Enum.AssetType.FaceAccessory.Value)] = "Feature.Avatar.Label.Face", 
    [tostring(Enum.AssetType.NeckAccessory.Value)] = "Feature.Avatar.Label.Neck", 
    [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "Feature.Avatar.Label.Shoulder", 
    [tostring(Enum.AssetType.FrontAccessory.Value)] = "Feature.Avatar.Label.Front", 
    [tostring(Enum.AssetType.BackAccessory.Value)] = "Feature.Avatar.Label.Back", 
    [tostring(Enum.AssetType.WaistAccessory.Value)] = "Feature.Avatar.Label.Waist", 
    [tostring(Enum.AssetType.TShirtAccessory.Value)] = "Feature.Avatar.Label.TShirt", 
    [tostring(Enum.AssetType.ShirtAccessory.Value)] = "Feature.Avatar.Label.Shirt", 
    [tostring(Enum.AssetType.Shirt.Value)] = "Feature.Catalog.Feature.Catalog.Label.ClassicShirt", 
    [tostring(Enum.AssetType.TShirt.Value)] = "Feature.Catalog.Feature.Catalog.Label.ClassicTShirt", 
    [tostring(Enum.AssetType.PantsAccessory.Value)] = "Feature.Avatar.Label.Pants", 
    [tostring(Enum.AssetType.Pants.Value)] = "Feature.Avatar.Label.ClassicPants", 
    [tostring(Enum.AssetType.JacketAccessory.Value)] = "Feature.Avatar.Label.Jacket", 
    [tostring(Enum.AssetType.SweaterAccessory.Value)] = "Feature.Avatar.Label.Sweater", 
    [tostring(Enum.AssetType.ShortsAccessory.Value)] = "Feature.Avatar.Label.Shorts", 
    [tostring(Enum.AssetType.DressSkirtAccessory.Value)] = "Feature.Avatar.Label.DressesAndSkirts", 
    [tostring(Enum.AssetType.EmoteAnimation.Value)] = "Feature.Avatar.Label.Emote", 
    [tostring(Enum.AssetType.Face.Value)] = "Feature.Avatar.Label.ClassicFaces", 
    [tostring(Enum.AssetType.Head.Value)] = "Feature.Avatar.Label.ClassicHeads"
};
if l_FFlagAXInspectAndBuyMakeupSupport_0 then
    v3.AssetLocalizationKeys[tostring(Enum.AssetType.EyeMakeup.Value)] = "Feature.Catalog.Label.EyeMakeup";
    v3.AssetLocalizationKeys[tostring(Enum.AssetType.FaceMakeup.Value)] = "Feature.Catalog.Label.FaceMakeup";
    v3.AssetLocalizationKeys[tostring(Enum.AssetType.LipMakeup.Value)] = "Feature.Catalog.Label.LipMakeup";
end;
v3.BundleLocalizationKeys = {
    [tostring(Enum.BundleType.BodyParts.Value)] = "Feature.Catalog.Label.Body", 
    [tostring(Enum.BundleType.Animations.Value)] = "Feature.Catalog.Label.Animation", 
    [tostring(Enum.BundleType.Shoes.Value)] = "Feature.Avatar.Label.Shoes", 
    [tostring(Enum.BundleType.DynamicHead.Value)] = "Feature.Avatar.Label.DynamicHead"
};
local v5 = {
    [v4.Owned] = "Feature.Catalog.Label.Owned", 
    [v4.Free] = "Feature.Catalog.LabelFree", 
    [v4.QuantityLimitReached] = "InGame.InspectMenu.Action.LimitReached", 
    [v4.SoldOut] = "InGame.InspectMenu.Action.SoldOut", 
    [v4.OffSale] = "Feature.Catalog.LabelOffSale", 
    [v4.Unavailable] = "Feature.Catalog.Label.Checkout.Unavailable", 
    [v4.InExperienceOnly] = "Feature.Catalog.Label.InSingleExperience", 
    [v4.PurchaseFromRoblox] = "Feature.Catalog.Heading.BuyItem", 
    [v4.PurchaseFromResale] = "Feature.Catalog.Heading.BuyItem"
};
local v6 = {
    category = "Feature.Catalog.Label.Category", 
    quantitySold = "Feature.Catalog.Label.QuantitySold", 
    originalPrice = "Feature.Catalog.Label.OriginalPrice", 
    tryOn = "InGame.InspectMenu.Action.TryOn", 
    tradeable = "Feature.Catalog.Label.Tradable", 
    yes = "Feature.Catalog.Label.Yes", 
    no = "Feature.Catalog.Label.No", 
    ownedItems = "InGame.InspectMenu.Label.OwnedItems", 
    na = "Feature.Catalog.Label.NA", 
    includedParts = "Feature.Catalog.Label.IncludedParts", 
    madein = "Feature.Catalog.Label.Attribution"
};
v3.PriceStatusLocalizationKeys = v5;
v3.ItemDetailsLocalizationKeys = v6;
v3.BatchItemDetailsPerformFetchKey = "BatchItemDetailsV2";
v3.ShowPlayableAttributionMapper = {
    UnplayableOtherReason = true, 
    Playable = true, 
    GuestProhibited = true, 
    GameUnapproved = false, 
    IncorrectConfiguration = false, 
    UniverseRootPlaceIsPrivate = false, 
    InsufficientPermissionFriendsOnly = true, 
    InsufficientPermissionGroupOnly = true, 
    DeviceRestricted = true, 
    UnderReview = true, 
    PurchaseRequired = true, 
    AccountRestricted = true, 
    TemporarilyUnavailable = true, 
    ComplianceBlocked = true, 
    ContextualPlayabilityAgeRecommendationParentalControls = true, 
    ContextualPlayabilityRegionalAvailability = true, 
    ContextualPlayabilityRegionalCompliance = true, 
    ContextualPlayabilityUnverifiedSeventeenPlusUser = true
};
return v3;