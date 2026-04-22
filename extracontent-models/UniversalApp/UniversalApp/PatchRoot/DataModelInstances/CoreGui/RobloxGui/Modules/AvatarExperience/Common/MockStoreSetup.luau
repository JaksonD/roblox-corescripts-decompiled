local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_createMockNavigationState_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).TestUtils.createMockNavigationState;
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v13 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v16 = {};
v16.__index = v16;
v16.DynamicHeadMoodAnimationAssetId = "10687293613";
v16.DylanDefaultHeadAssetId = "10687288296";
v16.DylanDefaultOutfitId = "11164330909";
v16.GeckoMoodAnimationAssetId = "10647852134";
v16.GeckoBundleId = "965";
v16.GeckoOutfitId = "11625687672";
v16.DylanDefaultBundleId = "945";
v16.YellowSciFiJacketAssetId = "11449307353";
v16.NinjaIdleAnimationAssetId = "658832408";
v16.DefaultLocalUserId = "129687796";
v16.BodybuilderEmoteAssetId = "3994130516";
v16.BodybuilderKeyframeSequenceAssetId = "10713990381";
v16.PirateAnimationBundleId = "55";
v16.PirateIdleAnimationAssetId = "837024662";
v16.PirateRunAnimationAssetId = "837023444";
v16.PirateJumpAnimationAssetId = "837024350";
v16.DummySearchUid = "test_uuid";
v16.DummyKeyword = "test";
v16.DunceHatAssetId = "12536385254";
v16.PirateOutfitId = "132923221";
v16.NumPirateAnimations = 0;
v16.UnusedItemId = "1011011010";
local v17 = {
    [v16.PirateRunAnimationAssetId] = {
        assetType = "53"
    }, 
    ["837023892"] = {
        assetType = "55"
    }, 
    ["837024147"] = {
        assetType = "50"
    }, 
    [v16.PirateJumpAnimationAssetId] = {
        assetType = "52"
    }, 
    [v16.PirateIdleAnimationAssetId] = {
        assetType = "51"
    }, 
    ["837025054"] = {
        assetType = "54"
    }, 
    ["837025325"] = {
        assetType = "48"
    }
};
for _, _ in v17 do
    v16.NumPirateAnimations = v16.NumPirateAnimations + 1;
end;
local v20 = {};
for v21, _ in v17 do
    table.insert(v20, {
        id = v21, 
        type = v4.ItemType.Asset
    });
end;
table.insert(v20, {
    id = v16.PirateOutfitId, 
    type = v4.ItemType.Outfit
});
v16.new = function(v23) --[[ Line: 224 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy)
    local v24 = {};
    setmetatable(v24, v16);
    v24.state = v23 or {};
    v24.itemRecency = 0;
    return v24;
end;
v16.basicScales = {
    bodyType = 1, 
    depth = 1, 
    head = 1, 
    height = 1, 
    proportion = 0, 
    width = 1
};
v16.makeBodyColors = function(v25) --[[ Line: 243 ]] --[[ Name: makeBodyColors ]]
    return {
        headColorId = v25, 
        leftArmColorId = v25, 
        leftLegColorId = v25, 
        rightArmColorId = v25, 
        rightLegColorId = v25, 
        torsoColorId = v25
    };
end;
v16.makeBodyColor3s = function(v26) --[[ Line: 254 ]] --[[ Name: makeBodyColor3s ]]
    return {
        headColor3 = v26, 
        torsoColor3 = v26, 
        rightArmColor3 = v26, 
        leftArmColor3 = v26, 
        rightLegColor3 = v26, 
        leftLegColor3 = v26
    };
end;
v16.makeSkeletonOutfitInfo = function() --[[ Line: 265 ]] --[[ Name: makeSkeletonOutfitInfo ]]
    -- upvalues: v4 (copy), v16 (copy)
    return {
        assets = {}, 
        avatarType = "R15", 
        containsDynamicHead = false, 
        isEditable = false, 
        name = "SkeletonOutfit", 
        outfitId = "1234", 
        outfitType = v4.OutfitTypes.Avatar, 
        updateCounter = 0, 
        bodyColor3s = v16.basicBodyColor3s, 
        bodyColors = v16.basicBodyColors, 
        scales = v16.basicScales
    };
end;
v16.makeSkeletonTryOnItem = function() --[[ Line: 281 ]] --[[ Name: makeSkeletonTryOnItem ]]
    -- upvalues: v4 (copy)
    return {
        version = "1", 
        itemId = "dummy", 
        itemType = v4.ItemType.Asset, 
        itemSubType = v4.AssetTypeIdStrings.JacketAccessory, 
        selectedInTryOnManager = true, 
        isUnequipped = false, 
        receivedBundleInfo = false, 
        itemRecency = 0
    };
end;
v16.basicBodyColors = v16.makeBodyColors(v6.DefaultBodyColorBrickId);
v16.basicBodyColor3s = v16.makeBodyColor3s(v6.DefaultBodyColor3);
v16.getState = function(v27) --[[ Line: 297 ]] --[[ Name: getState ]]
    return v27.state;
end;
v16.addCameraButtonStatus = function(v28, v29) --[[ Line: 301 ]] --[[ Name: addCameraButtonStatus ]]
    -- upvalues: v1 (copy)
    local v30 = {
        AvatarExperience = {
            CameraButton = {
                enabled = v29
            }
        }
    };
    v28.state = v1.joinDeep(v30, v28.state);
    return v28;
end;
v16.addCameraButtonErrorOccurred = function(v31, v32) --[[ Line: 314 ]] --[[ Name: addCameraButtonErrorOccurred ]]
    -- upvalues: v1 (copy)
    local v33 = {
        AvatarExperience = {
            CameraButton = {
                errorOccurred = v32
            }
        }
    };
    v31.state = v1.joinDeep(v33, v31.state);
    return v31;
end;
v16.addFetchStatus = function(v34, v35, v36) --[[ Line: 327 ]] --[[ Name: addFetchStatus ]]
    -- upvalues: v1 (copy)
    local v37 = {
        AvatarExperience = {
            AvatarEditor = {
                UserInventoryRecommendationsFetchStatus = {
                    [v35] = v36
                }
            }
        }
    };
    v34.state = v1.joinDeep(v37, v34.state);
    return v34;
end;
v16.addCurrentCharacter = function(v38, v39, v40) --[[ Line: 341 ]] --[[ Name: addCurrentCharacter ]]
    -- upvalues: v10 (copy), v1 (copy)
    if not v39 then
        local l_Players_0 = game:GetService("Players");
        local v42 = nil;
        v42 = if v40 then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15;
        v39 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), v42) else l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), v42);
    end;
    assert(v39, "character is not nil.");
    v39.Parent = workspace;
    local v43 = {
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    AvatarType = if v40 then v10.AvatarType.R6 else v10.AvatarType.R15
                }
            }, 
            AvatarScene = {
                Character = {
                    CurrentCharacter = v39
                }
            }
        }
    };
    v38.state = v1.joinDeep(v43, v38.state);
    return v38;
end;
v16.addPPEStartState = function(v44) --[[ Line: 384 ]] --[[ Name: addPPEStartState ]]
    -- upvalues: v9 (copy), v1 (copy)
    local v45 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    ppeVersion = {
                        [v9.Closeup] = 0, 
                        [v9.FullBody] = 0
                    }, 
                    ppeEmoteLoadingCount = 0
                }
            }
        }
    };
    v44.state = v1.joinDeep(v45, v44.state);
    return v44;
end;
v16.addLocalUserId = function(v46, v47) --[[ Line: 402 ]] --[[ Name: addLocalUserId ]]
    -- upvalues: v16 (copy), v1 (copy)
    if not v47 then
        v47 = v16.DefaultLocalUserId;
    end;
    local v48 = {
        LocalUserId = v47
    };
    v46.state = v1.joinDeep(v48, v46.state);
    return v46;
end;
v16.addEquippedItem = function(v49, v50, v51) --[[ Line: 415 ]] --[[ Name: addEquippedItem ]]
    -- upvalues: v1 (copy)
    local v52 = {
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    EquippedAssets = {
                        [v50] = v51
                    }
                }
            }
        }
    };
    v49.state = v1.joinDeep(v52, v49.state);
    return v49;
end;
v16.addEquippedNinjaIdleAnimation = function(v53) --[[ Line: 435 ]] --[[ Name: addEquippedNinjaIdleAnimation ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v53:addEquippedItem(v4.AssetTypeIdStrings.IdleAnimation, {
        [v16.NinjaIdleAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v16.addEquippedYellowSciFiJacket = function(v54) --[[ Line: 444 ]] --[[ Name: addEquippedYellowSciFiJacket ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v54:addEquippedItem(v4.AssetTypeIdStrings.JacketAccessory, {
        [v16.YellowSciFiJacketAssetId] = {
            isLayered = true, 
            order = 12, 
            type = Enum.AccessoryType.Jacket, 
            version = "1"
        }
    });
end;
v16.addEquippedHat = function(v55) --[[ Line: 455 ]] --[[ Name: addEquippedHat ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v55:addEquippedItem(v4.AssetTypeIdStrings.Hat, {
        [v16.DunceHatAssetId] = {
            isLayered = false, 
            type = Enum.AccessoryType.Hat, 
            version = "1"
        }
    });
end;
v16.addEquippedShirt = function(v56) --[[ Line: 465 ]] --[[ Name: addEquippedShirt ]]
    -- upvalues: v4 (copy)
    return v56:addEquippedItem(v4.AssetTypeIdStrings.ShirtAccessory, {
        ["9512497883"] = {
            isLayered = true, 
            order = 10, 
            type = Enum.AccessoryType.Shirt, 
            version = "1"
        }
    });
end;
v16.addEquippedGear = function(v57) --[[ Line: 476 ]] --[[ Name: addEquippedGear ]]
    -- upvalues: v4 (copy)
    return v57:addEquippedItem(v4.AssetTypeIdStrings.Gear, {
        ["1132887630"] = {
            version = "1"
        }
    });
end;
v16.addEquippedDynamicHead = function(v58) --[[ Line: 484 ]] --[[ Name: addEquippedDynamicHead ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v58:addEquippedItem(v4.AssetTypeIdStrings.DynamicHead, {
        [v16.DylanDefaultHeadAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v16.addEquippedMoodAnimation = function(v59) --[[ Line: 493 ]] --[[ Name: addEquippedMoodAnimation ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v59:addEquippedItem(v4.AssetTypeIdStrings.MoodAnimation, {
        [v16.DynamicHeadMoodAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v16.addOutfitTryOnItem = function(v60, v61, v62) --[[ Line: 502 ]] --[[ Name: addOutfitTryOnItem ]]
    -- upvalues: v1 (copy)
    v62.itemRecency = v60.itemRecency;
    v60.itemRecency = v60.itemRecency + 1;
    local v63 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [("%*-%*"):format(v61, v62.itemType)] = v62
                    }
                }
            }
        }
    };
    v60.state = v1.joinDeep(v63, v60.state);
    return v60;
end;
v16.addOutfitTryOnLastToggledItem = function(v64, v65) --[[ Line: 522 ]] --[[ Name: addOutfitTryOnLastToggledItem ]]
    -- upvalues: v1 (copy)
    local v66 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    LastToggledItem = v65
                }
            }
        }
    };
    v64.state = v1.joinDeep(v66, v64.state);
    return v64;
end;
v16.addOutfitTryOnItemAsAsset = function(v67, v68, v69) --[[ Line: 537 ]] --[[ Name: addOutfitTryOnItemAsAsset ]]
    -- upvalues: v16 (copy), v4 (copy), v1 (copy)
    local v70 = v16.makeSkeletonTryOnItem();
    v70.itemId = v68;
    v70.itemType = v4.ItemType.Asset;
    v70.itemSubType = v69;
    v70.itemRecency = v67.itemRecency;
    v67.itemRecency = v67.itemRecency + 1;
    local v71 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v68] = v70
                    }
                }
            }
        }
    };
    v67.state = v1.joinDeep(v71, v67.state);
    return v67;
end;
v16.addOutfitTryOnItemAsPartsBundleAsset = function(v72, v73, v74, v75) --[[ Line: 565 ]] --[[ Name: addOutfitTryOnItemAsPartsBundleAsset ]]
    -- upvalues: v16 (copy), v4 (copy), v1 (copy)
    local v76 = v16.makeSkeletonTryOnItem();
    v76.itemId = v73;
    v76.itemType = v4.ItemType.Bundle;
    v76.itemSubType = v4.BundleTypeIdStrings.BodyParts;
    v76.itemRecency = v72.itemRecency;
    v76.bundleInfo = {
        [v74] = {
            assetType = v75
        }
    };
    v72.itemRecency = v72.itemRecency + 1;
    local v77 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v74] = v76
                    }
                }
            }
        }
    };
    v72.state = v1.joinDeep(v77, v72.state);
    return v72;
end;
v16.addDylanDefaultOutfitTryOnItem = function(v78) --[[ Line: 599 ]] --[[ Name: addDylanDefaultOutfitTryOnItem ]]
    -- upvalues: v16 (copy), v4 (copy)
    return v78:addOutfitTryOnItem(v16.DylanDefaultBundleId, {
        bundleInfo = {
            [v16.DylanDefaultHeadAssetId] = {
                assetType = v4.AssetTypeIdStrings.DynamicHead
            }, 
            [v16.DynamicHeadMoodAnimationAssetId] = {
                assetType = v4.AssetTypeIdStrings.MoodAnimation
            }
        }, 
        isUnequipped = false, 
        itemId = v16.DylanDefaultBundleId, 
        itemRecency = 0, 
        itemSubType = v4.BundleTypeIdStrings.DynamicHead, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v16.addGeckoOutfitTryOnItem = function(v79) --[[ Line: 620 ]] --[[ Name: addGeckoOutfitTryOnItem ]]
    -- upvalues: v16 (copy), v4 (copy)
    return v79:addOutfitTryOnItem(v16.GeckoBundleId, {
        bundleInfo = {
            ["10407915508"] = {
                assetType = v4.AssetTypeIdStrings.DynamicHead
            }, 
            [v16.GeckoMoodAnimationAssetId] = {
                assetType = v4.AssetTypeIdStrings.MoodAnimation
            }, 
            ["2510230574"] = {
                assetType = "48"
            }, 
            ["2510233257"] = {
                assetType = "50"
            }, 
            ["2510235063"] = {
                assetType = "51"
            }, 
            ["2510236649"] = {
                assetType = "52"
            }, 
            ["2510238627"] = {
                assetType = "53"
            }, 
            ["2510240941"] = {
                assetType = "54"
            }, 
            ["2510242378"] = {
                assetType = "55"
            }, 
            ["7200822331"] = {
                assetType = "29"
            }, 
            ["7200822888"] = {
                assetType = "30"
            }, 
            ["7200823471"] = {
                assetType = "28"
            }, 
            ["7200824015"] = {
                assetType = "31"
            }, 
            ["7200824885"] = {
                assetType = "27"
            }, 
            ["7200826678"] = {
                assetType = "47"
            }
        }, 
        isUnequipped = false, 
        itemId = v16.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = v4.BundleTypeIdStrings.BodyParts, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v16.addPirateAnimationOutfitTryOnItem = function(v80) --[[ Line: 680 ]] --[[ Name: addPirateAnimationOutfitTryOnItem ]]
    -- upvalues: v16 (copy), v17 (copy), v4 (copy)
    return v80:addOutfitTryOnItem(v16.PirateAnimationBundleId, {
        bundleInfo = v17, 
        isUnequipped = false, 
        itemId = v16.PirateAnimationBundleId, 
        itemRecency = 0, 
        itemSubType = v4.BundleTypeIdStrings.Animations, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = true, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v16.addPirateAnimationOutfitTryOnLastToggledItem = function(v81) --[[ Line: 694 ]] --[[ Name: addPirateAnimationOutfitTryOnLastToggledItem ]]
    -- upvalues: v16 (copy), v4 (copy)
    local v82 = v16.makeSkeletonTryOnItem();
    v82.itemId = v16.PirateAnimationBundleId;
    v82.itemType = v4.ItemType.Bundle;
    return v81:addOutfitTryOnLastToggledItem(v82);
end;
v16.addDHWithNoMoodOutfitTryOnItem = function(v83) --[[ Line: 706 ]] --[[ Name: addDHWithNoMoodOutfitTryOnItem ]]
    -- upvalues: v16 (copy), v4 (copy)
    return v83:addOutfitTryOnItem(v16.GeckoBundleId, {
        bundleInfo = {
            ["10407915508"] = {
                assetType = v4.AssetTypeIdStrings.DynamicHead
            }, 
            ["2510230574"] = {
                assetType = "48"
            }, 
            ["2510233257"] = {
                assetType = "50"
            }, 
            ["2510235063"] = {
                assetType = "51"
            }, 
            ["2510236649"] = {
                assetType = "52"
            }, 
            ["2510238627"] = {
                assetType = "53"
            }, 
            ["2510240941"] = {
                assetType = "54"
            }, 
            ["2510242378"] = {
                assetType = "55"
            }, 
            ["7200822331"] = {
                assetType = "29"
            }, 
            ["7200822888"] = {
                assetType = "30"
            }, 
            ["7200823471"] = {
                assetType = "28"
            }, 
            ["7200824015"] = {
                assetType = "31"
            }, 
            ["7200824885"] = {
                assetType = "27"
            }, 
            ["7200826678"] = {
                assetType = "47"
            }
        }, 
        isUnequipped = false, 
        itemId = v16.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = "1", 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v16.addTryOnAnimation = function(v84, v85) --[[ Line: 763 ]] --[[ Name: addTryOnAnimation ]]
    -- upvalues: v1 (copy)
    local v86 = {
        AvatarExperience = {
            AvatarScene = {
                TryOn = {
                    AnimationPreview = v85
                }
            }
        }
    };
    v84.state = v1.joinDeep(v86, v84.state);
    return v84;
end;
v16.addPirateTryOnAnimation = function(v87) --[[ Line: 778 ]] --[[ Name: addPirateTryOnAnimation ]]
    -- upvalues: v16 (copy)
    return v87:addTryOnAnimation(v16.PirateIdleAnimationAssetId);
end;
v16.addAssetInfo = function(v88, v89) --[[ Line: 782 ]] --[[ Name: addAssetInfo ]]
    -- upvalues: v1 (copy)
    local l_id_0 = v89.id;
    assert(l_id_0 ~= nil, "assetInfo should have an id");
    local v91 = {
        AvatarExperience = {
            Common = {
                AssetInfos = {
                    [l_id_0] = v89
                }
            }
        }
    };
    v88.state = v1.joinDeep(v91, v88.state);
    return v88;
end;
v16.addBundleInfo = function(v92, v93) --[[ Line: 799 ]] --[[ Name: addBundleInfo ]]
    -- upvalues: v1 (copy)
    local l_id_1 = v93.id;
    assert(l_id_1 ~= nil, "bundleInfo should have an id");
    local v95 = {
        AvatarExperience = {
            Common = {
                BundleInfos = {
                    [l_id_1] = v93
                }
            }
        }
    };
    v92.state = v1.joinDeep(v95, v92.state);
    return v92;
end;
v16.addPirateAnimationAssetInfos = function(v96) --[[ Line: 816 ]] --[[ Name: addPirateAnimationAssetInfos ]]
    -- upvalues: v17 (copy), v13 (copy)
    for v97, v98 in v17 do
        local v99 = v13.mock();
        v99.id = v97;
        v99.assetType = v98.assetType;
        v96 = v96:addAssetInfo(v99);
    end;
    return v96;
end;
v16.addDunceHatAssetInfo = function(v100) --[[ Line: 826 ]] --[[ Name: addDunceHatAssetInfo ]]
    -- upvalues: v13 (copy), v16 (copy)
    return v100:addAssetInfo((v13.fromGetCatalogItemData({
        receivedCatalogData = true, 
        id = v16.DunceHatAssetId, 
        assetType = Enum.AvatarAssetType.Hat.Name, 
        name = "Dunce Hat", 
        description = "Go sit in the corner", 
        product = {
            id = "1379526016"
        }, 
        creator = {
            id = "13805545", 
            name = "BRICK UGC", 
            type = "Group", 
            hasVerifiedBadge = true
        }, 
        price = 69, 
        favoriteCount = 7486, 
        isOwned = false, 
        isPurchasable = true, 
        itemStatus = {}, 
        itemRestrictions = {}
    })));
end;
v16.addDylanDefaultBundleInfo = function(v101) --[[ Line: 852 ]] --[[ Name: addDylanDefaultBundleInfo ]]
    -- upvalues: v16 (copy), v4 (copy)
    return v101:addBundleInfo({
        bundleType = tostring(Enum.BundleType.DynamicHead.Value), 
        description = "A look that never goes out of style.", 
        expectedSellerId = "1", 
        favoriteCount = 196358, 
        id = v16.DylanDefaultBundleId, 
        isOwned = true, 
        isPublicDomain = true, 
        isPurchasable = false, 
        itemStatus = {}, 
        itemType = v4.ItemType.Bundle, 
        items = {
            [1] = {
                id = v16.DylanDefaultHeadAssetId, 
                type = v4.ItemType.Asset
            }, 
            [2] = {
                id = v16.DynamicHeadMoodAnimationAssetId, 
                type = v4.ItemType.Asset
            }, 
            [3] = {
                id = v16.DylanDefaultOutfitId, 
                type = v4.ItemType.Outfit
            }
        }, 
        name = "Dylan Default", 
        priceInRobux = 0, 
        priceStatus = "Free", 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v16.addGeckoBundleInfo = function(v102) --[[ Line: 887 ]] --[[ Name: addGeckoBundleInfo ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v102:addBundleInfo({
        bundleType = v4.BundleTypeIdStrings.BodyParts, 
        creator = {
            hasVerifiedBadge = true, 
            id = "1", 
            name = "Roblox", 
            type = "User"
        }, 
        description = "Some geckos have been seen running across the surface of water. Other geckos refer to them as \"overachievers.\"", 
        expectedSellerId = "1", 
        favoriteCount = 24889, 
        id = v16.GeckoBundleId, 
        isOwned = false, 
        isPublicDomain = false, 
        isPurchasable = true, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = v4.ItemType.Bundle, 
        items = {
            [1] = {
                id = "7200822331", 
                type = v4.ItemType.Asset
            }, 
            [2] = {
                id = "7200822888", 
                type = v4.ItemType.Asset
            }, 
            [3] = {
                id = "7200823471", 
                type = v4.ItemType.Asset
            }, 
            [4] = {
                id = "7200824015", 
                type = v4.ItemType.Asset
            }, 
            [5] = {
                id = "7200824885", 
                type = v4.ItemType.Asset
            }, 
            [6] = {
                id = "10407915508", 
                type = v4.ItemType.Asset
            }, 
            [7] = {
                id = "7200826678", 
                type = v4.ItemType.Asset
            }, 
            [8] = {
                id = "2510230574", 
                type = v4.ItemType.Asset
            }, 
            [9] = {
                id = "2510233257", 
                type = v4.ItemType.Asset
            }, 
            [10] = {
                id = "2510235063", 
                type = v4.ItemType.Asset
            }, 
            [11] = {
                id = "2510236649", 
                type = v4.ItemType.Asset
            }, 
            [12] = {
                id = "2510238627", 
                type = v4.ItemType.Asset
            }, 
            [13] = {
                id = "2510240941", 
                type = v4.ItemType.Asset
            }, 
            [14] = {
                id = "2510242378", 
                type = v4.ItemType.Asset
            }, 
            [15] = {
                id = v16.GeckoMoodAnimationAssetId, 
                type = v4.ItemType.Asset
            }, 
            [16] = {
                id = v16.GeckoOutfitId, 
                type = v4.ItemType.Outfit
            }, 
            [17] = {
                id = "11625698220", 
                type = v4.ItemType.Outfit
            }
        }, 
        name = "Galloping Gecko", 
        priceInRobux = 500, 
        product = {
            id = "1324726369", 
            isForSale = true, 
            type = "productType"
        }, 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v16.addPirateAnimationBundleInfo = function(v103) --[[ Line: 989 ]] --[[ Name: addPirateAnimationBundleInfo ]]
    -- upvalues: v4 (copy), v20 (copy)
    return v103:addBundleInfo({
        bundleType = "2", 
        creator = {
            hasVerifiedBadge = true, 
            id = "1", 
            name = "Roblox", 
            type = "User"
        }, 
        description = "This animation pack only works with R15 avatars. Arr, I'll wipe the deck with ya blasted swabbies!", 
        expectedSellerId = "1", 
        favoriteCount = 99606, 
        id = "55", 
        isOwned = true, 
        isPublicDomain = false, 
        isPurchasable = false, 
        itemRestrictions = {}, 
        itemStatus = {}, 
        itemType = v4.ItemType.Bundle, 
        items = v20, 
        name = "Pirate Animation Package", 
        priceInRobux = 750, 
        product = {
            id = "1324726369", 
            isForSale = true, 
            type = "productType"
        }, 
        receivedBundleDetails = true, 
        receivedCatalogData = true, 
        receivedFromSortResults = true
    });
end;
v16.addOutfitInfo = function(v104, v105, v106) --[[ Line: 1022 ]] --[[ Name: addOutfitInfo ]]
    -- upvalues: v1 (copy)
    local v107 = {
        AvatarExperience = {
            AvatarEditor = {
                OutfitInfos = {
                    [v105] = v106
                }
            }
        }
    };
    v104.state = v1.joinDeep(v107, v104.state);
    return v104;
end;
v16.addDylanDefaultOutfitInfo = function(v108) --[[ Line: 1037 ]] --[[ Name: addDylanDefaultOutfitInfo ]]
    -- upvalues: v16 (copy), v4 (copy)
    local v109 = v16.makeSkeletonOutfitInfo();
    v109.assets = {
        [v4.AssetTypeIdStrings.MoodAnimation] = {
            [v16.DynamicHeadMoodAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v4.AssetTypeIdStrings.DynamicHead] = {
            [v16.DylanDefaultHeadAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v109.containsDynamicHead = true;
    v109.name = "Dylan Default";
    v109.outfitId = v16.DylanDefaultOutfitId;
    v109.outfitType = v4.OutfitTypes.DynamicHead;
    return v108:addOutfitInfo(v16.DylanDefaultOutfitId, v109);
end;
v16.addGeckoOutfitInfo = function(v110) --[[ Line: 1061 ]] --[[ Name: addGeckoOutfitInfo ]]
    -- upvalues: v16 (copy), v4 (copy)
    local v111 = v16.makeSkeletonOutfitInfo();
    v111.assets = {
        ["27"] = {
            ["7200824885"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["28"] = {
            ["7200823471"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["29"] = {
            ["7200822331"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["30"] = {
            ["7200822888"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["31"] = {
            ["7200824015"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["47"] = {
            ["7200826678"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["48"] = {
            ["2510230574"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["50"] = {
            ["2510233257"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["51"] = {
            ["2510235063"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["52"] = {
            ["2510236649"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["53"] = {
            ["2510238627"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["54"] = {
            ["2510240941"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["55"] = {
            ["2510242378"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v4.AssetTypeIdStrings.MoodAnimation] = {
            [v16.GeckoMoodAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v4.AssetTypeIdStrings.DynamicHead] = {
            ["10407915508"] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v111.outfitType = v4.OutfitTypes.Avatar;
    v111.name = "Galloping Gecko";
    v111.outfitId = v16.GeckoOutfitId;
    v111.containsDynamicHead = true;
    return v110:addOutfitInfo(v16.GeckoOutfitId, v111);
end;
v16.addPirateAnimationOutfitInfo = function(v112) --[[ Line: 1162 ]] --[[ Name: addPirateAnimationOutfitInfo ]]
    -- upvalues: v16 (copy)
    local v113 = v16.makeSkeletonOutfitInfo();
    v113.assets = {
        ["48"] = {
            ["837025325"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["50"] = {
            ["837024147"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["51"] = {
            [v16.PirateIdleAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["52"] = {
            [v16.PirateJumpAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["53"] = {
            [v16.PirateRunAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["54"] = {
            ["837025054"] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["55"] = {
            ["837023892"] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v113.name = "Pirate Animation Package";
    v113.outfitId = v16.PirateOutfitId;
    return v112:addOutfitInfo(v16.PirateOutfitId, v113);
end;
v16.addCategory = function(v114, v115) --[[ Line: 1214 ]] --[[ Name: addCategory ]]
    -- upvalues: v1 (copy)
    local v116 = {
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v115
                }
            }
        }
    };
    v114.state = v1.joinDeep(v116, v114.state);
    return v114;
end;
v16.addEquippedEmote = function(v117, v118, v119) --[[ Line: 1228 ]] --[[ Name: addEquippedEmote ]]
    -- upvalues: v1 (copy)
    local v120 = {
        AvatarExperience = {
            AvatarEditor = {
                EquippedEmotes = {
                    selectedSlot = v118, 
                    slotInfo = {
                        {
                            assetId = v119
                        }
                    }
                }
            }
        }
    };
    v117.state = v1.joinDeep(v120, v117.state);
    return v117;
end;
v16.addBodybuilderEquippedEmote = function(v121) --[[ Line: 1247 ]] --[[ Name: addBodybuilderEquippedEmote ]]
    -- upvalues: v16 (copy)
    return v121:addEquippedEmote(1, v16.BodybuilderEmoteAssetId);
end;
v16.addIsInAx = function(v122) --[[ Line: 1251 ]] --[[ Name: addIsInAx ]]
    -- upvalues: l_createMockNavigationState_0 (copy), l_AvatarScreen_0 (copy), v1 (copy)
    local v123 = {
        Navigation = l_createMockNavigationState_0(l_AvatarScreen_0.AvatarExperienceRoot)
    };
    v122.state = v1.joinDeep(v123, v122.state);
    return v122;
end;
v16.addPPEFinalPageFullView = function(v124) --[[ Line: 1259 ]] --[[ Name: addPPEFinalPageFullView ]]
    -- upvalues: v9 (copy), v1 (copy)
    local v125 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                FinalPageViewMode = {
                    finalPageViewMode = v9.FullBody
                }
            }
        }
    };
    v124.state = v1.joinDeep(v125, v124.state);
    return v124;
end;
v16.addSelectedPPEEmote = function(v126, v127) --[[ Line: 1273 ]] --[[ Name: addSelectedPPEEmote ]]
    -- upvalues: v1 (copy)
    local v128 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    emoteAssetId = v127
                }
            }
        }
    };
    v126.state = v1.joinDeep(v128, v126.state);
    return v126;
end;
v16.addBodyBuilderSelectedPPEEmote = function(v129) --[[ Line: 1287 ]] --[[ Name: addBodyBuilderSelectedPPEEmote ]]
    -- upvalues: v16 (copy)
    return v129:addSelectedPPEEmote(v16.BodybuilderEmoteAssetId);
end;
v16.addAvatarEditorCategoryAndSubcategory = function(v130, v131, v132) --[[ Line: 1291 ]] --[[ Name: addAvatarEditorCategoryAndSubcategory ]]
    -- upvalues: v1 (copy)
    local v133 = {
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v131, 
                    subcategory = v132
                }
            }
        }
    };
    v130.state = v1.joinDeep(v133, v130.state);
    return v130;
end;
v16.addAvatarEditorCategoryAndSubcategoryByName = function(v134, v135, v136) --[[ Line: 1309 ]] --[[ Name: addAvatarEditorCategoryAndSubcategoryByName ]]
    -- upvalues: v11 (copy)
    local v137 = false;
    local v138 = nil;
    local v139 = nil;
    for v140, v141 in (v11()) do
        if v141.Name == v135 then
            v138 = v140;
            if v136 then
                assert(v141.Subcategories, "category.Subcategories should be non-nil");
                for v142, v143 in v141.Subcategories do
                    if v143.Name == v136 then
                        v139 = v142;
                        v137 = true;
                    end;
                    if v137 then
                        break;
                    end;
                end;
                if not v137 then
                    break;
                end;
            else
                break;
            end;
        end;
        if v137 then
            break;
        end;
    end;
    v137 = false;
    assert(v138, "categoryIndex should be non-nil");
    if v136 then
        assert(v139, "subcategoryIndex should be non-nil");
    end;
    return v134:addAvatarEditorCategoryAndSubcategory(v138, v139);
end;
v16.addSortAndFilters = function(v144) --[[ Line: 1339 ]] --[[ Name: addSortAndFilters ]]
    -- upvalues: v12 (copy), v1 (copy)
    local v145 = {
        AvatarExperience = {
            Catalog = {
                SortAndFilters = v12(nil, {})
            }
        }
    };
    v144.state = v1.joinDeep(v145, v144.state);
    return v144;
end;
v16.addSearchInCatalog = function(v146, v147) --[[ Line: 1351 ]] --[[ Name: addSearchInCatalog ]]
    -- upvalues: v16 (copy), v1 (copy)
    local v148 = {
        AvatarExperience = {
            Search = {
                SearchesInCatalog = {
                    [v16.DummySearchUid] = {
                        keyword = v16.DummyKeyword, 
                        items = v147
                    }
                }
            }
        }
    };
    v146.state = v1.joinDeep(v148, v146.state);
    return v146;
end;
v16.addItemDetailsPeekViewState = function(v149, v150) --[[ Line: 1369 ]] --[[ Name: addItemDetailsPeekViewState ]]
    -- upvalues: v1 (copy)
    local v151 = {
        AvatarExperience = {
            Common = {
                ItemDetailsPeekView = {
                    viewState = v150
                }
            }
        }
    };
    v149.state = v1.joinDeep(v151, v149.state);
    return v149;
end;
v16.addFetchingStatus = function(v152, v153, v154) --[[ Line: 1384 ]] --[[ Name: addFetchingStatus ]]
    -- upvalues: v1 (copy)
    local v155 = {
        FetchingStatus = {
            [v153] = v154
        }
    };
    v152.state = v1.joinDeep(v155, v152.state);
    return v152;
end;
return v16;