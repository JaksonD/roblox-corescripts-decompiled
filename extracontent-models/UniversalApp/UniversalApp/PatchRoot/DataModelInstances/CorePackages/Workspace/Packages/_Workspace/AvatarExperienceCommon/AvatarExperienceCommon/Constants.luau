local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(script.Parent.LabelAbuseTypeMapping);
local _ = require(script.Parent.Types.CategoryTypes.CategoryTypes);
local v3 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCatalogBodySuits_0 = v3.FFlagAXCatalogBodySuits;
local l_FFlagAXCustomizeMakeupSupport_0 = v3.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMakeupEquipping_0 = v3.FFlagAXMakeupEquipping;
local l_FFlagAXCatalogMakeupSupport_0 = v3.FFlagAXCatalogMakeupSupport;
local v8 = {};
local v9 = {};
for _, v11 in (Enum.AvatarAssetType:GetEnumItems()) do
    v8[v11.Name] = tostring(v11.Value);
    v9[tostring(v11.Value)] = v11.Name;
end;
local v12 = {
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
local v13 = {};
for v14, v15 in v12 do
    v13[v15] = v14;
end;
local v16 = {
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
local v17 = {
    bodyType = "BodyTypeScale", 
    head = "HeadScale", 
    height = "HeightScale", 
    proportion = "ProportionScale", 
    depth = "DepthScale", 
    width = "WidthScale"
};
local v18 = {
    headColor3 = "HeadColor", 
    leftArmColor3 = "LeftArmColor", 
    leftLegColor3 = "LeftLegColor", 
    rightArmColor3 = "RightArmColor", 
    rightLegColor3 = "RightLegColor", 
    torsoColor3 = "TorsoColor"
};
local v19 = {
    IS_LEFT = "IS_LEFT", 
    IS_RIGHT = "IS_RIGHT"
};
local v20 = game:DefineFastInt("AXMakeupZoomRadius", 7);
local v21 = game:DefineFastInt("AXMakeupLooksZoomRadius", 7);
local v22 = game:DefineFastInt("AXEyelashesZoomRadius", 7);
local v23 = game:DefineFastInt("AXEyebrowsZoomRadius", 7);
local v24 = game:DefineFastInt("AXFaceMakeupZoomRadius", 7);
local v25 = game:DefineFastInt("AXLipMakeupZoomRadius", 7);
local v26 = game:DefineFastInt("AXEyeMakeupZoomRadius", 7);
local v27 = {
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
        Makeup = v20, 
        MakeupLooks = v21, 
        Eyelashes = v22, 
        Eyebrows = v23, 
        FaceMakeup = v24, 
        LipMakeup = v25, 
        EyeMakeup = v26
    } else nil, 
    Special = {
        HeadRefinement = 7
    }
};
local v28 = {
    Seen = "AXTooltipSeen", 
    TimeDismiss = "AXTooltipTimeDismiss", 
    ClickDismiss = "AXTooltipClickDismiss", 
    CallbackDismiss = "AXTooltipCallbackDismiss"
};
local v29 = {
    CreateOutfitKey = "avatar.createOutfit", 
    CreateMakeupLookKey = l_FFlagAXCatalogMakeupSupport_0 and "avatar.createMakeupLook" or nil
};
local v30 = {
    [v8.EyebrowAccessory] = 0, 
    [v8.EyelashAccessory] = 1, 
    [v8.Pants] = 2, 
    [v8.Shirt] = 3, 
    [v8.TShirt] = 4, 
    [v8.LeftShoeAccessory] = 5, 
    [v8.RightShoeAccessory] = 5, 
    [v8.PantsAccessory] = 6, 
    [v8.ShortsAccessory] = 7, 
    [v8.DressSkirtAccessory] = 8, 
    [v8.TShirtAccessory] = 9, 
    [v8.ShirtAccessory] = 10, 
    [v8.SweaterAccessory] = 11, 
    [v8.JacketAccessory] = 12, 
    [v8.HairAccessory] = 13
};
local v31 = {
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
local v32 = {
    [v8.EyeMakeup] = true, 
    [v8.FaceMakeup] = true, 
    [v8.LipMakeup] = true, 
    [v8.EyebrowAccessory] = true, 
    [v8.EyelashAccessory] = true
};
local v33 = {
    Avatar = "Avatar", 
    Makeup = "Makeup", 
    Outfit = "Outfit"
};
local v34 = if not not l_FFlagAXMakeupEquipping_0 or l_FFlagAXCustomizeMakeupSupport_0 then {
    [v8.EyeMakeup] = Enum.MakeupType.Eye, 
    [v8.FaceMakeup] = Enum.MakeupType.Face, 
    [v8.LipMakeup] = Enum.MakeupType.Lip
} else nil;
local v35 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [Enum.MakeupType.Eye] = v8.EyeMakeup, 
    [Enum.MakeupType.Face] = v8.FaceMakeup, 
    [Enum.MakeupType.Lip] = v8.LipMakeup
} else nil;
local v36 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [v8.FaceMakeup] = 0, 
    [v8.LipMakeup] = 1, 
    [v8.EyeMakeup] = 2
} else nil;
return {
    BODY_BUNDLE_TYPE_ID = "1", 
    AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2", 
    SHOES_BUNDLE_TYPE_ID = "3", 
    DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4", 
    ASSET_TYPE_TO_ACCESSORY_TYPE = v12, 
    ACCESSORY_TYPE_TO_ASSET_TYPE = v13, 
    ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = v16, 
    HUMANOID_DESCRIPTION_SCALE_TO_NAME = v17, 
    BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = v18, 
    ASSET_TYPE_NAME_TO_ID_STRING = v8, 
    ASSET_TYPE_ID_STRING_TO_NAME = v9, 
    NAVIGATION_DIRECTION = v19, 
    LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6, 
    LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4, 
    CAMERA_ZOOM_RADIUS = v27, 
    AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356", 
    AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey", 
    AX_TOOLTIP_COUNTERS = v28, 
    AVATAR_EDITOR_CONSTANTS = v29, 
    LAYERED_CLOTHING_ORDER = v30, 
    LAYERED_ASSET_TYPES = v31, 
    ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = v34, 
    MAKEUP_TYPE_TO_ASSET_TYPE_ID = v35, 
    LAYERED_MAKEUP_ORDER = v36, 
    MAKEUP_LOOK_ASSET_TYPES = v32, 
    MAX_MAKEUP_LAYERS = 6, 
    LOOK_TYPE = v33, 
    MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2, 
    LabelAbuseTypeMapping = v1
};