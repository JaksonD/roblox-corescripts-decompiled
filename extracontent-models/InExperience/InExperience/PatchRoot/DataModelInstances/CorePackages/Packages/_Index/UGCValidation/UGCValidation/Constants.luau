local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.util.ValidationRulesUtil);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationFixConstantsTypoLeg);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidateCheckHSROwner);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateCheckTexturePackOwner);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
local v9 = game:DefineFastFlag("UGCValidateMakeupDecalUVProperties", false);
local _ = function(v10) --[[ Line: 18 ]] --[[ Name: convertArrayToTable ]]
    local v11 = {};
    for _, v13 in pairs(v10) do
        v11[v13] = true;
    end;
    return v11;
end;
local v15 = {
    MAX_HAT_TRIANGLES = v2:getRules().MeshRules.AccessoryMaxTriangles, 
    MAX_TEXTURE_SIZE = v2:getRules().TextureRules.MaxTextureSize
};
local v16 = {
    Enum.Material.Plastic
};
local v17 = {};
for _, v19 in pairs(v16) do
    v17[v19] = true;
end;
v15.MATERIAL_WHITELIST = v17;
v15.BANNED_CLASS_NAMES = {
    "Script", 
    "LocalScript", 
    "ModuleScript", 
    "ParticleEmitter", 
    "Fire", 
    "Smoke", 
    "Sparkles"
};
v15.R6_BODY_PARTS = {
    "Torso", 
    "Left Leg", 
    "Right Leg", 
    "Left Arm", 
    "Right Arm"
};
v15.R15_BODY_PARTS = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "LeftUpperLeg", 
    "LeftLowerLeg", 
    "LeftFoot", 
    "RightUpperLeg", 
    "RightLowerLeg", 
    "RightFoot", 
    "LeftUpperArm", 
    "LeftLowerArm", 
    "LeftHand", 
    "RightUpperArm", 
    "RightLowerArm", 
    "RightHand"
};
v15.NAMED_R15_BODY_PARTS = {};
for _, v21 in v15.R15_BODY_PARTS do
    v15.NAMED_R15_BODY_PARTS[v21] = v21;
end;
v15.NAMED_R15_BODY_PARTS.Head = "Head";
setmetatable(v15.NAMED_R15_BODY_PARTS, {
    __index = function() --[[ Line: 84 ]] --[[ Name: __index ]]
        error("NAMED_R15_BODY_PARTS key does not exist");
        return nil;
    end
});
v15.R15_STANDARD_JOINT_NAMES = {
    Root = true, 
    HumanoidRootNode = true, 
    DynamicHead = true, 
    Head = true, 
    UpperTorso = true, 
    LowerTorso = true, 
    LeftUpperLeg = true, 
    LeftLowerLeg = true, 
    LeftFoot = true, 
    RightUpperLeg = true, 
    RightLowerLeg = true, 
    RightFoot = true, 
    LeftUpperArm = true, 
    LeftLowerArm = true, 
    LeftHand = true, 
    RightUpperArm = true, 
    RightLowerArm = true, 
    RightHand = true
};
for _, v23 in v15.R15_BODY_PARTS do
    v15.R15_STANDARD_JOINT_NAMES[v23] = true;
end;
v15.UGC_BODY_PARTS = {
    "Head", 
    "UpperTorso", 
    "LowerTorso", 
    "LeftUpperLeg", 
    "LeftLowerLeg", 
    "LeftHand", 
    "RightUpperArm", 
    "RightLowerArm", 
    "RightHand", 
    "LeftUpperArm", 
    "LeftLowerArm", 
    "LeftFoot", 
    "RightUpperLeg", 
    "RightLowerLeg", 
    "RightFoot", 
    "EyebrowAccessory", 
    "EyelashAccessory", 
    "HairAccessory"
};
v15.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
    Head = Enum.AssetType.DynamicHead, 
    UpperTorso = Enum.AssetType.Torso, 
    LowerTorso = Enum.AssetType.Torso, 
    LeftUpperArm = Enum.AssetType.LeftArm, 
    LeftLowerArm = Enum.AssetType.LeftArm, 
    LeftHand = Enum.AssetType.LeftArm, 
    RightUpperArm = Enum.AssetType.RightArm, 
    RightLowerArm = Enum.AssetType.RightArm, 
    RightHand = Enum.AssetType.RightArm, 
    LeftUpperLeg = Enum.AssetType.LeftLeg, 
    LeftLowerLeg = Enum.AssetType.LeftLeg, 
    LeftFoot = Enum.AssetType.LeftLeg, 
    RightUpperLeg = Enum.AssetType.RightLeg, 
    RightLowerLeg = Enum.AssetType.RightLeg, 
    RightFoot = Enum.AssetType.RightLeg, 
    EyebrowAccessory = Enum.AssetType.EyebrowAccessory, 
    EyelashAccessory = Enum.AssetType.EyelashAccessory, 
    HairAccessory = Enum.AssetType.HairAccessory
};
v15.UGC_SHOE_NAMES_TO_ASSET_TYPE = {
    LeftShoeAccessory = Enum.AssetType.LeftShoeAccessory, 
    RightShoeAccessory = Enum.AssetType.RightShoeAccessory
};
v15.BUNDLE_TO_ASSET_MAPPING = {
    [Enum.BundleType.BodyParts] = v15.UGC_BODY_PART_NAMES_TO_ASSET_TYPE, 
    [Enum.BundleType.BodyParts] = v15.UGC_SHOE_NAMES_TO_ASSET_TYPE
};
v15.ASSET_TYPES_THAT_SKIP_FOLDER = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory, 
    Enum.AssetType.HairAccessory
};
v15.FOLDER_NAMES = {
    R6 = "R6", 
    R15ArtistIntent = "R15ArtistIntent", 
    R15Fixed = "R15Fixed"
};
v15.EXTRA_BANNED_NAMES = {
    "Head", 
    "HumanoidRootPart", 
    "Humanoid"
};
for _, v25 in ipairs({
    "Body Colors", 
    "Shirt Graphic", 
    "Shirt", 
    "Pants", 
    "Health", 
    "Animate"
}) do
    table.insert(v15.EXTRA_BANNED_NAMES, v25);
end;
v15.BANNED_NAMES = {};
for _, v27 in {
    v15.R6_BODY_PARTS, 
    v15.R15_BODY_PARTS, 
    v15.EXTRA_BANNED_NAMES
} do
    for _, v29 in v27 do
        v15.BANNED_NAMES[v29] = true;
    end;
end;
v15.ASSET_STATUS = {
    UNKNOWN = "Unknown", 
    REVIEW_PENDING = "ReviewPending", 
    MODERATED = "Moderated"
};
if v8() then
    v15.MAKEUP_INFO = v2:getMakeupRules();
end;
v15.ASSET_TYPE_INFO = {};
v2:getAccessoryRules(v15.ASSET_TYPE_INFO);
v15.FULL_BODY_BOUNDS = v2:getFullBodyRulesBounds();
v15.AvatarPartScaleTypes = {
    Classic = true, 
    ProportionsSlender = true, 
    ProportionsNormal = true
};
v2:getBodyPartRules(v15.ASSET_TYPE_INFO);
v15.BODYPART_TO_PARENT = {
    Head = nil, 
    LowerTorso = nil, 
    UpperTorso = "LowerTorso", 
    LeftUpperArm = nil, 
    LeftLowerArm = "LeftUpperArm", 
    LeftHand = "LeftLowerArm", 
    LeftUpperLeg = nil, 
    LeftLowerLeg = "LeftUpperLeg", 
    RightUpperArm = nil, 
    RightLowerArm = "RightUpperArm", 
    RightHand = "RightLowerArm", 
    RightUpperLeg = nil, 
    RightLowerLeg = "RightUpperLeg"
};
if v4() then
    v15.BODYPART_TO_PARENT.RightFoot = "RightLowerLeg";
    v15.BODYPART_TO_PARENT.LeftFoot = "LeftLowerLeg";
else
    v15.BODYPART_TO_PARENT.RightLeg = "RightLowerLeg";
    v15.BODYPART_TO_PARENT.LeftLeg = "LeftLowerLeg";
end;
v15.RenderVsWrapMeshMaxDiff = v2:getRules().MeshRules.CageMeshMaxDistanceFromRenderMesh;
v15.COMPARISON_METHODS = {
    SMALLER = "<", 
    SMALLER_EQ = "<=", 
    FUZZY_EQ = "=", 
    EXACT_EQ = "==", 
    GREATER_EQ = ">=", 
    GREATER = ">", 
    FOUND_IN = "one of the following:"
};
setmetatable(v15.COMPARISON_METHODS, {
    __index = function(_, v31) --[[ Line: 280 ]] --[[ Name: __index ]]
        return error("Invalid COMPARISON_METHOD " .. tostring(v31));
    end
});
v15.INCLUSION_METHODS = {
    RUN_ON_ALL = "RUN_ON_ALL", 
    INCLUSION_LIST = "INCLUSION_LIST", 
    EXCLUSION_LIST = "EXCLUSION_LIST"
};
setmetatable(v15.INCLUSION_METHODS, {
    __index = function(_, v33) --[[ Line: 295 ]] --[[ Name: __index ]]
        return error("Invalid INCLUSION_METHOD " .. tostring(v33));
    end
});
v15.PROPERTIES = {
    Instance = {
        Archivable = true
    }, 
    Attachment = {
        Visible = false
    }, 
    Decal = if v8() then {
        Color3 = Color3.new(1, 1, 1), 
        Transparency = 0, 
        UVOffset = if v9 then Vector2.new(0, 0) else nil, 
        UVScale = if v9 then Vector2.new(1, 1) else nil
    } else nil, 
    SpecialMesh = {
        MeshType = Enum.MeshType.FileMesh, 
        Offset = Vector3.new(0, 0, 0, 0), 
        VertexColor = Vector3.new(1, 1, 1, 0)
    }, 
    BasePart = {
        Anchored = false, 
        CollisionGroupId = 0, 
        CustomPhysicalProperties = v1.None, 
        Elasticity = 0.5, 
        Friction = 0.3, 
        LocalTransparencyModifier = 0, 
        Massless = false, 
        Reflectance = 0, 
        RootPriority = 0, 
        RotVelocity = Vector3.new(0, 0, 0, 0), 
        Velocity = Vector3.new(0, 0, 0, 0), 
        BackParamA = -0.5, 
        BackParamB = 0.5, 
        BackSurfaceInput = Enum.InputType.NoInput, 
        BottomParamA = -0.5, 
        BottomParamB = 0.5, 
        BottomSurfaceInput = Enum.InputType.NoInput, 
        FrontParamA = -0.5, 
        FrontParamB = 0.5, 
        FrontSurfaceInput = Enum.InputType.NoInput, 
        LeftParamA = -0.5, 
        LeftParamB = 0.5, 
        LeftSurfaceInput = Enum.InputType.NoInput, 
        RightParamA = -0.5, 
        RightParamB = 0.5, 
        RightSurfaceInput = Enum.InputType.NoInput, 
        TopParamA = -0.5, 
        TopParamB = 0.5, 
        TopSurfaceInput = Enum.InputType.NoInput, 
        BackSurface = Enum.SurfaceType.Smooth, 
        BottomSurface = Enum.SurfaceType.Smooth, 
        FrontSurface = Enum.SurfaceType.Smooth, 
        LeftSurface = Enum.SurfaceType.Smooth, 
        RightSurface = Enum.SurfaceType.Smooth, 
        TopSurface = Enum.SurfaceType.Smooth, 
        Transparency = {
            [v15.COMPARISON_METHODS.EXACT_EQ] = 0
        }, 
        Color = {
            [v15.COMPARISON_METHODS.FUZZY_EQ] = BrickColor.new("Medium stone grey").Color, 
            [v15.INCLUSION_METHODS.EXCLUSION_LIST] = {
                Enum.AssetType.DynamicHead, 
                Enum.AssetType.Torso, 
                Enum.AssetType.LeftArm, 
                Enum.AssetType.RightArm, 
                Enum.AssetType.LeftLeg, 
                Enum.AssetType.RightLeg
            }
        }
    }, 
    Part = {
        Shape = Enum.PartType.Block
    }, 
    SurfaceAppearance = {
        AlphaMode = if v5() then {
            {
                [v15.COMPARISON_METHODS.FOUND_IN] = {
                    Enum.AlphaMode.Overlay, 
                    Enum.AlphaMode.Transparency
                }, 
                [v15.INCLUSION_METHODS.INCLUSION_LIST] = {
                    Enum.AssetType.EyelashAccessory, 
                    Enum.AssetType.EyebrowAccessory
                }
            }, 
            {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Enum.AlphaMode.Overlay, 
                [v15.INCLUSION_METHODS.EXCLUSION_LIST] = {
                    Enum.AssetType.EyelashAccessory, 
                    Enum.AssetType.EyebrowAccessory
                }
            }
        } else Enum.AlphaMode.Overlay, 
        EmissiveMaskContent = Content.none, 
        EmissiveStrength = 1, 
        EmissiveTint = Color3.new(1, 1, 1)
    }, 
    WrapLayer = {
        Enabled = true, 
        CageOrigin = {
            PositionMagnitude = {
                [v15.COMPARISON_METHODS.SMALLER_EQ] = 10
            }, 
            Orientation = {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0, 0)
            }
        }, 
        ReferenceOrigin = {
            PositionMagnitude = {
                [v15.COMPARISON_METHODS.SMALLER_EQ] = 10
            }, 
            Orientation = {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0, 0)
            }
        }, 
        ImportOrigin = {
            PositionMagnitude = {
                [v15.COMPARISON_METHODS.SMALLER_EQ] = 8
            }
        }, 
        BindOffset = {
            Position = {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0, 0)
            }, 
            Orientation = {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0, 0)
            }
        }
    }, 
    WrapTarget = {
        CageOrigin = {
            PositionMagnitude = {
                [v15.COMPARISON_METHODS.SMALLER_EQ] = 10
            }, 
            Orientation = {
                [v15.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0, 0)
            }
        }, 
        ImportOrigin = {
            PositionMagnitude = {
                [v15.COMPARISON_METHODS.SMALLER_EQ] = 8
            }
        }
    }
};
v15.CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "MeshId", 
        "TextureId"
    }, 
    MeshPart = {
        "MeshId", 
        "TextureID"
    }, 
    SurfaceAppearance = {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    }, 
    Decal = if v8() then {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    } else nil, 
    WrapLayer = {
        "CageMeshId", 
        "ReferenceMeshId"
    }, 
    WrapTarget = {
        "CageMeshId"
    }, 
    Animation = {
        "AnimationId"
    }
};
if v7() then
    table.insert(v15.CONTENT_ID_FIELDS.SurfaceAppearance, "TexturePack");
end;
if v6() then
    table.insert(v15.CONTENT_ID_FIELDS.WrapLayer, "HSRAssetId");
end;
v15.CONTENT_ID_REQUIRED_FIELDS = {
    SpecialMesh = {
        MeshId = true, 
        TextureId = true
    }, 
    MeshPart = {
        MeshId = true
    }, 
    WrapTarget = {
        CageMeshId = true
    }, 
    Animation = {
        AnimationId = true
    }
};
v15.MESH_CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "MeshId"
    }, 
    MeshPart = {
        "MeshId"
    }, 
    WrapTarget = {
        "CageMeshId"
    }, 
    WrapLayer = {
        "CageMeshId", 
        "ReferenceMeshId"
    }
};
v15.TEXTURE_CONTENT_ID_FIELDS = {
    SpecialMesh = {
        "TextureId"
    }, 
    MeshPart = {
        "TextureID"
    }, 
    SurfaceAppearance = {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    }, 
    Decal = if v8() then {
        "ColorMap", 
        "MetalnessMap", 
        "NormalMap", 
        "RoughnessMap"
    } else nil
};
v15.ASSET_RENDER_MESH_MAX_TRIANGLES = {
    DynamicHead = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.DynamicHead), 
    LeftArm = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftArm), 
    RightArm = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.RightArm), 
    Torso = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.Torso), 
    LeftLeg = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftLeg), 
    RightLeg = v2:getBodyPartMaxTrianglesRule(Enum.AssetType.RightLeg)
};
v15.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
    Head = 343, 
    LeftUpperArm = 77, 
    LeftLowerArm = 77, 
    LeftHand = 86, 
    RightUpperArm = 77, 
    RightLowerArm = 77, 
    RightHand = 86, 
    UpperTorso = 257, 
    LowerTorso = 105, 
    LeftUpperLeg = 88, 
    LeftLowerLeg = 88, 
    LeftFoot = 86, 
    RightUpperLeg = 88, 
    RightLowerLeg = 88, 
    RightFoot = 86
};
v15.PACKAGE_CONTENT_ID_FIELDS = v1.Dictionary.join(v15.CONTENT_ID_FIELDS, {
    Sound = {
        "SoundId"
    }, 
    Decal = {
        "Texture"
    }, 
    VideoFrame = {
        "Video"
    }, 
    PackageLink = {
        "PackageId"
    }, 
    CharacterMesh = {
        "baseTextureAssetId", 
        "overlayTextureAssetId", 
        "meshAssetId"
    }, 
    Tool = {
        "TextureId"
    }, 
    Sky = {
        "SkyUp", 
        "SkyLf", 
        "SkyRt", 
        "SkyBk", 
        "SkyFt", 
        "SkyDn", 
        "Sun", 
        "Moon"
    }, 
    Trail = {
        "texture"
    }, 
    Beam = {
        "texture"
    }, 
    ShirtGraphic = {
        "Graphic"
    }, 
    Shirt = {
        "ShirtTemplate"
    }, 
    Pants = {
        "PantsTemplate"
    }, 
    AdGui = {
        "FallbackImage"
    }
});
v15.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization";
v15.ContentType = "Content-Type";
v15.ApplicationJson = "application/json";
v15.GUIDAttributeName = "RBXGUID";
v15.GUIDAttributeMaxLength = 100;
v15.AlternateMeshIdAttributeName = "RBX_ALT_MESH_ID";
v15.MESH_CONTENT_TYPE = {
    RENDER_MESH = "RenderMesh", 
    OUTER_CAGE = "OuterCage", 
    INNER_CAGE = "InnerCage"
};
v15.MESH_CONTENT_TYPE_TO_FIELD_NAME = {
    [v15.MESH_CONTENT_TYPE.RENDER_MESH] = "MeshId", 
    [v15.MESH_CONTENT_TYPE.OUTER_CAGE] = "CageMeshId", 
    [v15.MESH_CONTENT_TYPE.INNER_CAGE] = "ReferenceMeshId"
};
v15.AllAssetUploadCategories = {
    v3.UploadCategory.TORSO_AND_LIMBS, 
    v3.UploadCategory.DYNAMIC_HEAD, 
    v3.UploadCategory.LAYERED_CLOTHING, 
    v3.UploadCategory.RIGID_ACCESSORY, 
    v3.UploadCategory.EMOTE_ANIMATION
};
v15.AllBundleUploadCategories = {
    v3.UploadCategory.FULL_BODY, 
    v3.UploadCategory.BOTH_SHOES
};
v15.AllUploadCategories = {};
for _, v35 in v3.UploadCategory do
    table.insert(v15.AllUploadCategories, v35);
end;
v15.AssetUploadsWithFolderStructure = {
    [Enum.AssetType.Torso] = true, 
    [Enum.AssetType.LeftArm] = true, 
    [Enum.AssetType.RightArm] = true, 
    [Enum.AssetType.LeftLeg] = true, 
    [Enum.AssetType.RightLeg] = true
};
v15.SkinningTransferRequiredTypes = {
    [Enum.AssetType.EyebrowAccessory] = true, 
    [Enum.AssetType.EyelashAccessory] = true
};
return v15;