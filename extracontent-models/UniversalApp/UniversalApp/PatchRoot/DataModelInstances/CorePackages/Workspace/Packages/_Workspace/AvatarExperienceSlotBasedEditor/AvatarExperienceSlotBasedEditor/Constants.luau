local _ = require(script.Parent.Types);
local v1 = require(script.Parent.Enums.AvatarEditorSubcategories);
local v2 = require(script.Parent.Enums.SlotType);
local v3 = {};
local v4 = require(script.Parent.Enums.Categories);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v6 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagRemoveClassicHeadsAndFaces_0 = v6.FFlagRemoveClassicHeadsAndFaces;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXMigrateBuilderIcons_0 = v6.FFlagAXMigrateBuilderIcons;
local l_FFlagAXSlotsDesktopRedesign_0 = v6.FFlagAXSlotsDesktopRedesign;
local l_IconName_0 = require(l_Parent_0.Foundation).Enums.IconName;
local l_IconVariant_0 = require(l_Parent_0.Foundation).Enums.IconVariant;
local v13 = {
    FullBody = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonStanding, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/body_on", 
    ClassicHead = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.HeadBlank, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/classicHead_on", 
    Hair = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.HeadFemale, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/hair_on", 
    Faces = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.FaceWinking, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/faces_on", 
    Clothing = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ClothesHanger, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/clothing_on", 
    Jackets = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Jacket, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/jackets_on", 
    Shirts = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Shirt, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/shirts_on", 
    Pants = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Pants, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/pants_on", 
    Shoes = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Shoe, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/shoes_on", 
    ClassicTShirts = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Tshirt_2dText, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/classicTshirts_on", 
    ClassicShirts = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Shirt_2dText, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/classicShirts_on", 
    ClassicPants = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Pants_2dText, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/classicPants_on", 
    Accessories = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.BowTie, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/accessories_off", 
    Head = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.HatFedora, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/hats_on", 
    Face = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Glasses, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/eyes_on", 
    Neck = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Necklace, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/neck_off", 
    Shoulder = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Parrot, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/shoulder_on", 
    Front = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Purse, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/front_on", 
    Back = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ButterflyWings, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/back_on", 
    Waist = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Belt, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/waist_on", 
    Gear = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Sword, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/gear_on", 
    Animation = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonTeleport, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/animation_off", 
    Idle = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonStanding, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/idle_on", 
    Walk = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonWalking, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/walk_off", 
    Jump = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonJumping, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/jump_off", 
    Fall = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonFalling, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/fall_off", 
    Climb = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonClimbing, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/climb_off", 
    Swim = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonSwimming, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/swim_off", 
    Emote = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.SquareFaceWavingHand, 
        variant = l_IconVariant_0.Filled
    } else "icons/controls/emoteOn", 
    Reset = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ArrowSpinClockwise, 
        variant = l_IconVariant_0.Regular
    } else "icons/actions/reset", 
    Undo = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ArrowCurlToLeft, 
        variant = l_IconVariant_0.Regular
    } else "icons/actions/edit/undo", 
    Redo = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ArrowCurlToRight, 
        variant = l_IconVariant_0.Regular
    } else "icons/actions/edit/redo", 
    Torso = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Torso, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/torsos_on", 
    Arm = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Arm, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/arms_on", 
    Leg = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Leg, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/legs_on", 
    Inventory = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Backpack, 
        variant = l_IconVariant_0.Regular
    } else "icons/menu/inventoryOff", 
    Adjust = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.ThreeSlidersHorizontal, 
        variant = l_IconVariant_0.Regular
    } else "icons/actions/adjust", 
    Success = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.CheckLarge, 
        variant = l_IconVariant_0.Filled
    } else "icons/status/success_small", 
    Add = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.CirclePlus, 
        variant = l_IconVariant_0.Regular
    } else "icons/actions/edit/add", 
    Build = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.PersonStandingDualArrowsVertical, 
        variant = l_IconVariant_0.Filled
    } else "icons/menu/clothing/build_on", 
    Eyelashes = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Eyelashes, 
        variant = l_IconVariant_0.Regular
    } else l_IconName_0.Eyelashes, 
    Eyebrows = if l_FFlagAXMigrateBuilderIcons_0 then {
        name = l_IconName_0.Eyebrows, 
        variant = l_IconVariant_0.Regular
    } else l_IconName_0.Eyebrows
};
local v14 = {
    Enum.AssetType.LeftLeg, 
    Enum.AssetType.RightLeg, 
    Enum.AssetType.LeftArm, 
    Enum.AssetType.RightArm, 
    Enum.AssetType.Torso, 
    Enum.AssetType.Head, 
    Enum.AssetType.DynamicHead
};
local v15 = {
    [v4.All] = {
        name = "All", 
        nameTranslationKey = l_FFlagAXSlotsDesktopRedesign_0 and "Feature.Avatar.Heading.All" or "Feature.Catalog.Label.Avatars", 
        index = 0, 
        slots = {}, 
        hide = true
    }, 
    [v4.Avatars] = {
        name = "Avatars", 
        nameTranslationKey = "Feature.Catalog.Label.Avatars", 
        index = 1, 
        slots = {}
    }, 
    [v4.Body] = {
        name = "Body", 
        nameTranslationKey = "Feature.Catalog.Label.Body", 
        index = 2, 
        slots = if not l_FFlagRemoveClassicHeadsAndFaces_0 then {
            {
                name = "Body", 
                nameTranslationKey = "Feature.Catalog.Label.FullBody", 
                editorSubcategory = v1.PurchasedCharacters, 
                assetTypes = {}
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Hair", 
                icon = v13.Hair, 
                editorSubcategory = v1.Hair, 
                assetTypes = {
                    Enum.AvatarAssetType.HairAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Head", 
                icon = v13.ClassicHead, 
                editorSubcategory = v1.Heads, 
                assetTypes = {
                    Enum.AvatarAssetType.DynamicHead, 
                    Enum.AvatarAssetType.Head
                }
            }, 
            {
                name = "Classic Face", 
                nameTranslationKey = "Feature.Avatar.Label.Face", 
                icon = v13.Faces, 
                editorSubcategory = v1.ClassicFaces, 
                assetTypes = {
                    Enum.AvatarAssetType.Face
                }
            }, 
            {
                name = "Build", 
                nameTranslationKey = "Feature.Avatar.Label.Build", 
                assetTypes = {}, 
                icon = v13.Build, 
                editorSubcategory = v1.Build
            }, 
            {
                name = "Skin", 
                nameTranslationKey = "Feature.Avatar.Label.Skin", 
                editorSubcategory = v1.Skin, 
                assetTypes = {}
            }
        } else {
            {
                name = "Body", 
                nameTranslationKey = "Feature.Catalog.Label.FullBody", 
                editorSubcategory = v1.PurchasedCharacters, 
                assetTypes = {}
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Hair", 
                icon = v13.Hair, 
                editorSubcategory = v1.Hair, 
                assetTypes = {
                    Enum.AvatarAssetType.HairAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Head", 
                icon = v13.ClassicHead, 
                editorSubcategory = v1.Heads, 
                assetTypes = {
                    Enum.AvatarAssetType.DynamicHead
                }
            }, 
            {
                name = "Build", 
                nameTranslationKey = "Feature.Avatar.Label.Build", 
                assetTypes = {}, 
                icon = v13.Build, 
                editorSubcategory = v1.Build
            }, 
            {
                name = "Skin", 
                nameTranslationKey = "Feature.Avatar.Label.Skin", 
                editorSubcategory = v1.Skin, 
                assetTypes = {}
            }
        }
    }, 
    [v4.Makeup] = if not l_FFlagAXCustomizeMakeupSupport_0 then nil else {
        name = "Makeup", 
        nameTranslationKey = "Feature.Avatar.Label.Makeup", 
        index = 3, 
        resetSlotOnClearAll = true, 
        slots = {
            {
                nameTranslationKey = "Feature.Avatar.Label.Eyelashes", 
                icon = v13.Eyelashes, 
                editorSubcategory = v1.MakeupLooks, 
                eligibleSubcategories = {
                    v1.MakeupLooks, 
                    v1.EyeMakeup, 
                    v1.FaceMakeup, 
                    v1.LipMakeup
                }, 
                assetTypes = {}, 
                hide = true
            }, 
            {
                slotType = v2.LayeredSlot, 
                layerLimit = 6, 
                name = "Makeup", 
                nameTranslationKey = "Feature.Avatar.Label.MakeupLayer", 
                eligibleSubcategories = {
                    v1.EyeMakeup, 
                    v1.FaceMakeup, 
                    v1.LipMakeup
                }, 
                editorSubcategory = v1.EyeMakeup, 
                assetTypes = {
                    Enum.AvatarAssetType.EyeMakeup, 
                    Enum.AvatarAssetType.FaceMakeup, 
                    Enum.AvatarAssetType.LipMakeup
                }, 
                deselectable = true
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Eyelashes", 
                icon = v13.Eyelashes, 
                editorSubcategory = v1.Eyelashes, 
                assetTypes = {
                    Enum.AvatarAssetType.EyelashAccessory
                }, 
                deselectable = true
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Eyebrows", 
                icon = v13.Eyebrows, 
                editorSubcategory = v1.Eyebrows, 
                assetTypes = {
                    Enum.AvatarAssetType.EyebrowAccessory
                }, 
                deselectable = true
            }
        }
    }, 
    [v4.Clothing] = {
        name = "Clothing", 
        nameTranslationKey = "Feature.Catalog.Label.Clothing", 
        index = l_FFlagAXCustomizeMakeupSupport_0 and 4 or 3, 
        slots = {
            {
                nameTranslationKey = "Feature.Avatar.Label.Top", 
                icon = v13.Shirts, 
                editorSubcategory = v1.Tops, 
                assetTypes = {
                    Enum.AvatarAssetType.ShirtAccessory, 
                    Enum.AvatarAssetType.TShirtAccessory, 
                    Enum.AvatarAssetType.SweaterAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Outerwear", 
                icon = v13.Jackets, 
                editorSubcategory = v1.Outerwear, 
                assetTypes = {
                    Enum.AvatarAssetType.JacketAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Bottom", 
                icon = v13.Pants, 
                editorSubcategory = v1.Bottoms, 
                assetTypes = {
                    Enum.AvatarAssetType.PantsAccessory, 
                    Enum.AvatarAssetType.ShortsAccessory, 
                    Enum.AvatarAssetType.DressSkirtAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Shoes", 
                icon = v13.Shoes, 
                editorSubcategory = v1.Shoes, 
                assetTypes = {
                    Enum.AvatarAssetType.RightShoeAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.ShirtClassic", 
                icon = v13.ClassicShirts, 
                editorSubcategory = v1.ClassicShirts, 
                assetTypes = {
                    Enum.AvatarAssetType.Shirt
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.PantsClassic", 
                icon = v13.ClassicPants, 
                editorSubcategory = v1.ClassicPants, 
                assetTypes = {
                    Enum.AvatarAssetType.Pants
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.TShirtClassic", 
                icon = v13.ClassicTShirts, 
                editorSubcategory = v1.ClassicTShirts, 
                assetTypes = {
                    Enum.AvatarAssetType.TShirt
                }
            }
        }
    }, 
    [v4.Accessories] = {
        name = "Accessories", 
        nameTranslationKey = "Feature.Catalog.LabelAccessories", 
        index = l_FFlagAXCustomizeMakeupSupport_0 and 5 or 4, 
        slots = {
            {
                name = "Head", 
                nameTranslationKey = "Feature.Avatar.Label.Head", 
                icon = v13.Head, 
                editorSubcategory = v1.Hats, 
                assetTypes = {
                    Enum.AvatarAssetType.Hat
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Face", 
                icon = v13.Face, 
                editorSubcategory = v1.Face, 
                assetTypes = {
                    Enum.AvatarAssetType.FaceAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Neck", 
                icon = v13.Neck, 
                editorSubcategory = v1.Neck, 
                assetTypes = {
                    Enum.AvatarAssetType.NeckAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Back", 
                icon = v13.Back, 
                editorSubcategory = v1.Back, 
                assetTypes = {
                    Enum.AvatarAssetType.BackAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Waist", 
                icon = v13.Waist, 
                editorSubcategory = v1.Waist, 
                assetTypes = {
                    Enum.AvatarAssetType.WaistAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Shoulder", 
                icon = v13.Shoulder, 
                editorSubcategory = v1.Shoulder, 
                assetTypes = {
                    Enum.AvatarAssetType.ShoulderAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Front", 
                icon = v13.Front, 
                editorSubcategory = v1.Front, 
                assetTypes = {
                    Enum.AvatarAssetType.FrontAccessory
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Gear", 
                icon = v13.Gear, 
                editorSubcategory = v1.Gear, 
                assetTypes = {
                    Enum.AvatarAssetType.Gear
                }
            }
        }
    }, 
    [v4.Animations] = {
        name = "Animations", 
        nameTranslationKey = "Feature.Avatar.Heading.Animations", 
        index = l_FFlagAXCustomizeMakeupSupport_0 and 6 or 5, 
        slots = {
            {
                nameTranslationKey = "Feature.Avatar.Label.AnimationFullSet", 
                icon = v13.Animation, 
                editorSubcategory = v1.AnimationFullSets, 
                assetTypes = {
                    Enum.AvatarAssetType.IdleAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Idle", 
                icon = v13.Idle, 
                editorSubcategory = v1.IdleAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.IdleAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Walk", 
                icon = v13.Walk, 
                editorSubcategory = v1.WalkAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.WalkAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Run", 
                icon = v13.Animation, 
                editorSubcategory = v1.RunAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.RunAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Jump", 
                icon = v13.Jump, 
                editorSubcategory = v1.JumpAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.JumpAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Fall", 
                icon = v13.Fall, 
                editorSubcategory = v1.FallAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.FallAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Climb", 
                icon = v13.Climb, 
                editorSubcategory = v1.ClimbAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.ClimbAnimation
                }
            }, 
            {
                nameTranslationKey = "Feature.Avatar.Label.Swim", 
                icon = v13.Swim, 
                editorSubcategory = v1.SwimAnimations, 
                assetTypes = {
                    Enum.AvatarAssetType.SwimAnimation
                }
            }
        }
    }, 
    [v4.Emotes] = {
        name = "Emotes", 
        nameTranslationKey = "Feature.Catalog.Label.Emotes", 
        index = l_FFlagAXCustomizeMakeupSupport_0 and 7 or 6, 
        slots = {}
    }
};
v3.Categories = v4;
v3.SlotEditorCategories = v15;
v3.Icons = v13;
v3.BodyAssetTypes = v14;
return v3;