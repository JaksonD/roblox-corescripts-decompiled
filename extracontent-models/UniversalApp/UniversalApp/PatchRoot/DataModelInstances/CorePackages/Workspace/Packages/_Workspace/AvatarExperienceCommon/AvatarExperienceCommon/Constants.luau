local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCatalogBodySuits_0 = v1.FFlagAXCatalogBodySuits;
local l_FFlagAXCustomizeMakeupSupport_0 = v1.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMakeupEquipping_0 = v1.FFlagAXMakeupEquipping;
local l_FFlagAXCatalogMakeupSupport_0 = v1.FFlagAXCatalogMakeupSupport;
local v6 = {};
local v7 = {};
for _, v9 in (Enum.AvatarAssetType:GetEnumItems()) do
    v6[v9.Name] = tostring(v9.Value);
    v7[tostring(v9.Value)] = v9.Name;
end;
local v10 = {
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
local v11 = {};
for v12, v13 in v10 do
    v11[v13] = v12;
end;
local v14 = {
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
local v15 = {
    bodyType = "BodyTypeScale", 
    head = "HeadScale", 
    height = "HeightScale", 
    proportion = "ProportionScale", 
    depth = "DepthScale", 
    width = "WidthScale"
};
local v16 = {
    headColor3 = "HeadColor", 
    leftArmColor3 = "LeftArmColor", 
    leftLegColor3 = "LeftLegColor", 
    rightArmColor3 = "RightArmColor", 
    rightLegColor3 = "RightLegColor", 
    torsoColor3 = "TorsoColor"
};
local v17 = {
    IS_LEFT = "IS_LEFT", 
    IS_RIGHT = "IS_RIGHT"
};
local v18 = game:DefineFastInt("AXMakeupZoomRadius", 7);
local v19 = game:DefineFastInt("AXMakeupLooksZoomRadius", 7);
local v20 = game:DefineFastInt("AXEyelashesZoomRadius", 7);
local v21 = game:DefineFastInt("AXEyebrowsZoomRadius", 7);
local v22 = game:DefineFastInt("AXFaceMakeupZoomRadius", 7);
local v23 = game:DefineFastInt("AXLipMakeupZoomRadius", 7);
local v24 = game:DefineFastInt("AXEyeMakeupZoomRadius", 7);
local v25 = {
    BodyCategories = {
        Heads = 8.5, 
        Hair = 8.5, 
        ClassicHeads = 6.5, 
        ClassicFaces = 7
    }, 
    DynamicBodyCategories = {
        Style = 6.5, 
        Hair = 8.5, 
        ClassicHeads = 6.5, 
        ClassicFaces = 7, 
        Torsos = 9, 
        Arms = 13, 
        Legs = 13.5
    }, 
    CatalogAccessories = {
        Hats = 11, 
        Face = 4.5, 
        Neck = 9, 
        Shoulder = 11, 
        Front = 9.5, 
        Back = 21, 
        Waist = 17
    }, 
    AvatarEditorAccessories = {
        Hats = 11, 
        Face = 7, 
        Neck = 9, 
        Shoulder = 11, 
        Front = 9.5, 
        Back = 21, 
        Waist = 17
    }, 
    AccessoryAdjustment = {
        Hat = 11, 
        Face = 7, 
        Neck = 9, 
        Shoulder = 11, 
        Front = 21, 
        Back = 21, 
        Waist = 17
    }, 
    Clothing = {
        Shirts = 12, 
        TShirts = 12, 
        Sweaters = 12, 
        Jackets = 12, 
        Pants = 12, 
        Shorts = 12, 
        Shoes = 12, 
        ClassicShirts = 12, 
        ClassicTShirts = 12, 
        ClassicPants = 12, 
        Tops = 12, 
        Outerwear = 12, 
        Bottoms = 12, 
        Bodysuits = l_FFlagAXCatalogBodySuits_0 and 12 or nil
    }, 
    Makeup = if not not l_FFlagAXCustomizeMakeupSupport_0 or l_FFlagAXCatalogMakeupSupport_0 then {
        Makeup = v18, 
        MakeupLooks = v19, 
        Eyelashes = v20, 
        Eyebrows = v21, 
        FaceMakeup = v22, 
        LipMakeup = v23, 
        EyeMakeup = v24
    } else nil, 
    Special = {
        HeadRefinement = 7
    }
};
local v26 = {
    Seen = "AXTooltipSeen", 
    TimeDismiss = "AXTooltipTimeDismiss", 
    ClickDismiss = "AXTooltipClickDismiss", 
    CallbackDismiss = "AXTooltipCallbackDismiss"
};
local v27 = {
    CreateOutfitKey = "avatar.createOutfit", 
    CreateMakeupLookKey = l_FFlagAXCatalogMakeupSupport_0 and "avatar.createMakeupLook" or nil
};
local v28 = {
    [v6.EyebrowAccessory] = 0, 
    [v6.EyelashAccessory] = 1, 
    [v6.Pants] = 2, 
    [v6.Shirt] = 3, 
    [v6.TShirt] = 4, 
    [v6.LeftShoeAccessory] = 5, 
    [v6.RightShoeAccessory] = 5, 
    [v6.PantsAccessory] = 6, 
    [v6.ShortsAccessory] = 7, 
    [v6.DressSkirtAccessory] = 8, 
    [v6.TShirtAccessory] = 9, 
    [v6.ShirtAccessory] = 10, 
    [v6.SweaterAccessory] = 11, 
    [v6.JacketAccessory] = 12, 
    [v6.HairAccessory] = 13
};
local v29 = {
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
local v30 = if not not l_FFlagAXMakeupEquipping_0 or l_FFlagAXCustomizeMakeupSupport_0 then {
    [v6.EyeMakeup] = Enum.MakeupType.Eye, 
    [v6.FaceMakeup] = Enum.MakeupType.Face, 
    [v6.LipMakeup] = Enum.MakeupType.Lip
} else nil;
local v31 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [Enum.MakeupType.Eye] = v6.EyeMakeup, 
    [Enum.MakeupType.Face] = v6.FaceMakeup, 
    [Enum.MakeupType.Lip] = v6.LipMakeup
} else nil;
local v32 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [v6.FaceMakeup] = 0, 
    [v6.LipMakeup] = 1, 
    [v6.EyeMakeup] = 2
} else nil;
return {
    BODY_BUNDLE_TYPE_ID = "1", 
    AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2", 
    SHOES_BUNDLE_TYPE_ID = "3", 
    DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4", 
    ASSET_TYPE_TO_ACCESSORY_TYPE = v10, 
    ACCESSORY_TYPE_TO_ASSET_TYPE = v11, 
    ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = v14, 
    HUMANOID_DESCRIPTION_SCALE_TO_NAME = v15, 
    BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = v16, 
    ASSET_TYPE_NAME_TO_ID_STRING = v6, 
    ASSET_TYPE_ID_STRING_TO_NAME = v7, 
    NAVIGATION_DIRECTION = v17, 
    LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6, 
    LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4, 
    CAMERA_ZOOM_RADIUS = v25, 
    AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356", 
    AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey", 
    AX_TOOLTIP_COUNTERS = v26, 
    AVATAR_EDITOR_CONSTANTS = v27, 
    LAYERED_CLOTHING_ORDER = v28, 
    LAYERED_ASSET_TYPES = v29, 
    ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = v30, 
    MAKEUP_TYPE_TO_ASSET_TYPE_ID = v31, 
    LAYERED_MAKEUP_ORDER = v32, 
    MAX_MAKEUP_LAYERS = 6, 
    MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2
};