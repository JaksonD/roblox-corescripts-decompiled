local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(script.Parent.LabelAbuseTypeMapping);
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXCatalogBodySuits_0 = v2.FFlagAXCatalogBodySuits;
local l_FFlagAXCustomizeMakeupSupport_0 = v2.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMakeupEquipping_0 = v2.FFlagAXMakeupEquipping;
local l_FFlagAXCatalogMakeupSupport_0 = v2.FFlagAXCatalogMakeupSupport;
local l_FFlagAXAvatarTimeoutFlow_0 = v2.FFlagAXAvatarTimeoutFlow;
local l_FFlagAXAvatarTimeoutFlowIE_0 = v2.FFlagAXAvatarTimeoutFlowIE;
local v9 = {};
local v10 = {};
for _, v12 in (Enum.AvatarAssetType:GetEnumItems()) do
    v9[v12.Name] = tostring(v12.Value);
    v10[tostring(v12.Value)] = v12.Name;
end;
local v13 = {
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
local v14 = {};
for v15, v16 in v13 do
    v14[v16] = v15;
end;
local v17 = {
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
local v18 = {
    bodyType = "BodyTypeScale", 
    head = "HeadScale", 
    height = "HeightScale", 
    proportion = "ProportionScale", 
    depth = "DepthScale", 
    width = "WidthScale"
};
local v19 = {
    headColor3 = "HeadColor", 
    leftArmColor3 = "LeftArmColor", 
    leftLegColor3 = "LeftLegColor", 
    rightArmColor3 = "RightArmColor", 
    rightLegColor3 = "RightLegColor", 
    torsoColor3 = "TorsoColor"
};
local v20 = {
    IS_LEFT = "IS_LEFT", 
    IS_RIGHT = "IS_RIGHT"
};
local v21 = game:DefineFastInt("AXMakeupZoomRadius", 7);
local v22 = game:DefineFastInt("AXMakeupLooksZoomRadius", 7);
local v23 = game:DefineFastInt("AXEyelashesZoomRadius", 7);
local v24 = game:DefineFastInt("AXEyebrowsZoomRadius", 7);
local v25 = game:DefineFastInt("AXFaceMakeupZoomRadius", 7);
local v26 = game:DefineFastInt("AXLipMakeupZoomRadius", 7);
local v27 = game:DefineFastInt("AXEyeMakeupZoomRadius", 7);
local v28 = {
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
        Makeup = v21, 
        MakeupLooks = v22, 
        Eyelashes = v23, 
        Eyebrows = v24, 
        FaceMakeup = v25, 
        LipMakeup = v26, 
        EyeMakeup = v27
    } else nil, 
    Special = {
        HeadRefinement = 7
    }
};
local v29 = {
    Seen = "AXTooltipSeen", 
    TimeDismiss = "AXTooltipTimeDismiss", 
    ClickDismiss = "AXTooltipClickDismiss", 
    CallbackDismiss = "AXTooltipCallbackDismiss"
};
local v30 = {
    CreateOutfitKey = "avatar.createOutfit", 
    CreateMakeupLookKey = l_FFlagAXCatalogMakeupSupport_0 and "avatar.createMakeupLook" or nil
};
local v31 = {
    [v9.EyebrowAccessory] = 0, 
    [v9.EyelashAccessory] = 1, 
    [v9.Pants] = 2, 
    [v9.Shirt] = 3, 
    [v9.TShirt] = 4, 
    [v9.LeftShoeAccessory] = 5, 
    [v9.RightShoeAccessory] = 5, 
    [v9.PantsAccessory] = 6, 
    [v9.ShortsAccessory] = 7, 
    [v9.DressSkirtAccessory] = 8, 
    [v9.TShirtAccessory] = 9, 
    [v9.ShirtAccessory] = 10, 
    [v9.SweaterAccessory] = 11, 
    [v9.JacketAccessory] = 12, 
    [v9.HairAccessory] = 13
};
local v32 = {
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
local v33 = {
    [v9.EyeMakeup] = true, 
    [v9.FaceMakeup] = true, 
    [v9.LipMakeup] = true, 
    [v9.EyebrowAccessory] = true, 
    [v9.EyelashAccessory] = true
};
local v34 = {
    Avatar = "Avatar", 
    Makeup = "Makeup"
};
local v35 = if not not l_FFlagAXMakeupEquipping_0 or l_FFlagAXCustomizeMakeupSupport_0 then {
    [v9.EyeMakeup] = Enum.MakeupType.Eye, 
    [v9.FaceMakeup] = Enum.MakeupType.Face, 
    [v9.LipMakeup] = Enum.MakeupType.Lip
} else nil;
local v36 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [Enum.MakeupType.Eye] = v9.EyeMakeup, 
    [Enum.MakeupType.Face] = v9.FaceMakeup, 
    [Enum.MakeupType.Lip] = v9.LipMakeup
} else nil;
local v37 = if l_FFlagAXCustomizeMakeupSupport_0 then {
    [v9.FaceMakeup] = 0, 
    [v9.LipMakeup] = 1, 
    [v9.EyeMakeup] = 2
} else nil;
return {
    BODY_BUNDLE_TYPE_ID = "1", 
    AVATAR_ANIMATIONS_BUNDLE_TYPE_ID = "2", 
    SHOES_BUNDLE_TYPE_ID = "3", 
    DYNAMIC_HEAD_BUNDLE_TYPE_ID = "4", 
    ASSET_TYPE_TO_ACCESSORY_TYPE = v13, 
    ACCESSORY_TYPE_TO_ASSET_TYPE = v14, 
    ASSET_TYPE_ID_STRING_TO_HUMANOID_DESCRIPTION_PROP = v17, 
    HUMANOID_DESCRIPTION_SCALE_TO_NAME = v18, 
    BODY_PART_FOR_SKIN_COLORING_ID_TO_HUMANOID_DESCRIPTION = v19, 
    ASSET_TYPE_NAME_TO_ID_STRING = v9, 
    ASSET_TYPE_ID_STRING_TO_NAME = v10, 
    NAVIGATION_DIRECTION = v20, 
    LANDSCAPE_UI_WIDTH_PERCENTAGE = 0.6, 
    LANDSCAPE_SCENE_WIDTH_PERCENTAGE = 0.4, 
    CAMERA_ZOOM_RADIUS = v28, 
    AVATAR_BLOCKY_DEFAULT_BUNDLE_ID = "356", 
    AX_TOOLTIP_STORAGE_KEY = "AXTooltipStorageKey", 
    AX_TOOLTIP_COUNTERS = v29, 
    AVATAR_EDITOR_CONSTANTS = v30, 
    LAYERED_CLOTHING_ORDER = v31, 
    LAYERED_ASSET_TYPES = v32, 
    ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = v35, 
    MAKEUP_TYPE_TO_ASSET_TYPE_ID = v36, 
    LAYERED_MAKEUP_ORDER = v37, 
    MAKEUP_LOOK_ASSET_TYPES = v33, 
    MAX_MAKEUP_LAYERS = 6, 
    LOOK_TYPE = v34, 
    MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON = 2, 
    LabelAbuseTypeMapping = if not not l_FFlagAXAvatarTimeoutFlow_0 or l_FFlagAXAvatarTimeoutFlowIE_0 then v1 else nil
};