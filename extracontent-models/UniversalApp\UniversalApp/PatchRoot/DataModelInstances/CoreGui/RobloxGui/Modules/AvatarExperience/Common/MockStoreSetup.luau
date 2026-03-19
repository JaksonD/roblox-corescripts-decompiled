local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Reducers.SortAndFilters);
local v12 = require(l_Modules_0.AvatarExperience.Common.Models.AssetInfo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v15 = {};
v15.__index = v15;
v15.DynamicHeadMoodAnimationAssetId = "10687293613";
v15.DylanDefaultHeadAssetId = "10687288296";
v15.DylanDefaultOutfitId = "11164330909";
v15.GeckoMoodAnimationAssetId = "10647852134";
v15.GeckoBundleId = "965";
v15.GeckoOutfitId = "11625687672";
v15.DylanDefaultBundleId = "945";
v15.YellowSciFiJacketAssetId = "11449307353";
v15.NinjaIdleAnimationAssetId = "658832408";
v15.DefaultLocalUserId = "129687796";
v15.BodybuilderEmoteAssetId = "3994130516";
v15.BodybuilderKeyframeSequenceAssetId = "10713990381";
v15.PirateAnimationBundleId = "55";
v15.PirateIdleAnimationAssetId = "837024662";
v15.PirateRunAnimationAssetId = "837023444";
v15.PirateJumpAnimationAssetId = "837024350";
v15.DummySearchUid = "test_uuid";
v15.DummyKeyword = "test";
v15.DunceHatAssetId = "12536385254";
v15.PirateOutfitId = "132923221";
v15.NumPirateAnimations = 0;
v15.UnusedItemId = "1011011010";
local v16 = {
    [v15.PirateRunAnimationAssetId] = {
        assetType = "53"
    }, 
    ["837023892"] = {
        assetType = "55"
    }, 
    ["837024147"] = {
        assetType = "50"
    }, 
    [v15.PirateJumpAnimationAssetId] = {
        assetType = "52"
    }, 
    [v15.PirateIdleAnimationAssetId] = {
        assetType = "51"
    }, 
    ["837025054"] = {
        assetType = "54"
    }, 
    ["837025325"] = {
        assetType = "48"
    }
};
for _, _ in v16 do
    v15.NumPirateAnimations = v15.NumPirateAnimations + 1;
end;
local v19 = {};
for v20, _ in v16 do
    table.insert(v19, {
        id = v20, 
        type = v4.ItemType.Asset
    });
end;
table.insert(v19, {
    id = v15.PirateOutfitId, 
    type = v4.ItemType.Outfit
});
v15.new = function(v22) --[[ Line: 222 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v23 = {};
    setmetatable(v23, v15);
    v23.state = v22 or {};
    v23.itemRecency = 0;
    return v23;
end;
v15.basicScales = {
    bodyType = 1, 
    depth = 1, 
    head = 1, 
    height = 1, 
    proportion = 0, 
    width = 1
};
v15.makeBodyColors = function(v24) --[[ Line: 241 ]] --[[ Name: makeBodyColors ]]
    return {
        headColorId = v24, 
        leftArmColorId = v24, 
        leftLegColorId = v24, 
        rightArmColorId = v24, 
        rightLegColorId = v24, 
        torsoColorId = v24
    };
end;
v15.makeBodyColor3s = function(v25) --[[ Line: 252 ]] --[[ Name: makeBodyColor3s ]]
    return {
        headColor3 = v25, 
        torsoColor3 = v25, 
        rightArmColor3 = v25, 
        leftArmColor3 = v25, 
        rightLegColor3 = v25, 
        leftLegColor3 = v25
    };
end;
v15.makeSkeletonOutfitInfo = function() --[[ Line: 263 ]] --[[ Name: makeSkeletonOutfitInfo ]]
    -- upvalues: v4 (copy), v15 (copy)
    return {
        assets = {}, 
        avatarType = "R15", 
        containsDynamicHead = false, 
        isEditable = false, 
        name = "SkeletonOutfit", 
        outfitId = "1234", 
        outfitType = v4.OutfitTypes.Avatar, 
        updateCounter = 0, 
        bodyColor3s = v15.basicBodyColor3s, 
        bodyColors = v15.basicBodyColors, 
        scales = v15.basicScales
    };
end;
v15.makeSkeletonTryOnItem = function() --[[ Line: 279 ]] --[[ Name: makeSkeletonTryOnItem ]]
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
v15.basicBodyColors = v15.makeBodyColors(v6.DefaultBodyColorBrickId);
v15.basicBodyColor3s = v15.makeBodyColor3s(v6.DefaultBodyColor3);
v15.getState = function(v26) --[[ Line: 295 ]] --[[ Name: getState ]]
    return v26.state;
end;
v15.addCameraButtonStatus = function(v27, v28) --[[ Line: 299 ]] --[[ Name: addCameraButtonStatus ]]
    -- upvalues: v1 (copy)
    local v29 = {
        AvatarExperience = {
            CameraButton = {
                enabled = v28
            }
        }
    };
    v27.state = v1.joinDeep(v29, v27.state);
    return v27;
end;
v15.addCameraButtonErrorOccurred = function(v30, v31) --[[ Line: 312 ]] --[[ Name: addCameraButtonErrorOccurred ]]
    -- upvalues: v1 (copy)
    local v32 = {
        AvatarExperience = {
            CameraButton = {
                errorOccurred = v31
            }
        }
    };
    v30.state = v1.joinDeep(v32, v30.state);
    return v30;
end;
v15.addFetchStatus = function(v33, v34, v35) --[[ Line: 325 ]] --[[ Name: addFetchStatus ]]
    -- upvalues: v1 (copy)
    local v36 = {
        AvatarExperience = {
            AvatarEditor = {
                UserInventoryRecommendationsFetchStatus = {
                    [v34] = v35
                }
            }
        }
    };
    v33.state = v1.joinDeep(v36, v33.state);
    return v33;
end;
v15.addCurrentCharacter = function(v37, v38, v39) --[[ Line: 339 ]] --[[ Name: addCurrentCharacter ]]
    -- upvalues: v9 (copy), v1 (copy)
    if not v38 then
        local l_Players_0 = game:GetService("Players");
        local v41 = nil;
        v41 = if v39 then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15;
        v38 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), v41) else l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), v41);
    end;
    assert(v38, "character is not nil.");
    v38.Parent = workspace;
    local v42 = {
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    AvatarType = if v39 then v9.AvatarType.R6 else v9.AvatarType.R15
                }
            }, 
            AvatarScene = {
                Character = {
                    CurrentCharacter = v38
                }
            }
        }
    };
    v37.state = v1.joinDeep(v42, v37.state);
    return v37;
end;
v15.addPPEStartState = function(v43) --[[ Line: 382 ]] --[[ Name: addPPEStartState ]]
    -- upvalues: v8 (copy), v1 (copy)
    local v44 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    ppeVersion = {
                        [v8.Closeup] = 0, 
                        [v8.FullBody] = 0
                    }, 
                    ppeEmoteLoadingCount = 0
                }
            }
        }
    };
    v43.state = v1.joinDeep(v44, v43.state);
    return v43;
end;
v15.addLocalUserId = function(v45, v46) --[[ Line: 400 ]] --[[ Name: addLocalUserId ]]
    -- upvalues: v15 (copy), v1 (copy)
    if not v46 then
        v46 = v15.DefaultLocalUserId;
    end;
    local v47 = {
        LocalUserId = v46
    };
    v45.state = v1.joinDeep(v47, v45.state);
    return v45;
end;
v15.addEquippedItem = function(v48, v49, v50) --[[ Line: 413 ]] --[[ Name: addEquippedItem ]]
    -- upvalues: v1 (copy)
    local v51 = {
        AvatarExperience = {
            AvatarEditor = {
                Character = {
                    EquippedAssets = {
                        [v49] = v50
                    }
                }
            }
        }
    };
    v48.state = v1.joinDeep(v51, v48.state);
    return v48;
end;
v15.addEquippedNinjaIdleAnimation = function(v52) --[[ Line: 433 ]] --[[ Name: addEquippedNinjaIdleAnimation ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v52:addEquippedItem(v4.AssetTypeIdStrings.IdleAnimation, {
        [v15.NinjaIdleAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v15.addEquippedYellowSciFiJacket = function(v53) --[[ Line: 442 ]] --[[ Name: addEquippedYellowSciFiJacket ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v53:addEquippedItem(v4.AssetTypeIdStrings.JacketAccessory, {
        [v15.YellowSciFiJacketAssetId] = {
            isLayered = true, 
            order = 12, 
            type = Enum.AccessoryType.Jacket, 
            version = "1"
        }
    });
end;
v15.addEquippedHat = function(v54) --[[ Line: 453 ]] --[[ Name: addEquippedHat ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v54:addEquippedItem(v4.AssetTypeIdStrings.Hat, {
        [v15.DunceHatAssetId] = {
            isLayered = false, 
            type = Enum.AccessoryType.Hat, 
            version = "1"
        }
    });
end;
v15.addEquippedShirt = function(v55) --[[ Line: 463 ]] --[[ Name: addEquippedShirt ]]
    -- upvalues: v4 (copy)
    return v55:addEquippedItem(v4.AssetTypeIdStrings.ShirtAccessory, {
        ["9512497883"] = {
            isLayered = true, 
            order = 10, 
            type = Enum.AccessoryType.Shirt, 
            version = "1"
        }
    });
end;
v15.addEquippedGear = function(v56) --[[ Line: 474 ]] --[[ Name: addEquippedGear ]]
    -- upvalues: v4 (copy)
    return v56:addEquippedItem(v4.AssetTypeIdStrings.Gear, {
        ["1132887630"] = {
            version = "1"
        }
    });
end;
v15.addEquippedDynamicHead = function(v57) --[[ Line: 482 ]] --[[ Name: addEquippedDynamicHead ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v57:addEquippedItem(v4.AssetTypeIdStrings.DynamicHead, {
        [v15.DylanDefaultHeadAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v15.addEquippedMoodAnimation = function(v58) --[[ Line: 491 ]] --[[ Name: addEquippedMoodAnimation ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v58:addEquippedItem(v4.AssetTypeIdStrings.MoodAnimation, {
        [v15.DynamicHeadMoodAnimationAssetId] = {
            isLayered = false, 
            version = "nil"
        }
    });
end;
v15.addOutfitTryOnItem = function(v59, v60, v61) --[[ Line: 500 ]] --[[ Name: addOutfitTryOnItem ]]
    -- upvalues: v1 (copy)
    v61.itemRecency = v59.itemRecency;
    v59.itemRecency = v59.itemRecency + 1;
    local v62 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [("%*-%*"):format(v60, v61.itemType)] = v61
                    }
                }
            }
        }
    };
    v59.state = v1.joinDeep(v62, v59.state);
    return v59;
end;
v15.addOutfitTryOnLastToggledItem = function(v63, v64) --[[ Line: 520 ]] --[[ Name: addOutfitTryOnLastToggledItem ]]
    -- upvalues: v1 (copy)
    local v65 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    LastToggledItem = v64
                }
            }
        }
    };
    v63.state = v1.joinDeep(v65, v63.state);
    return v63;
end;
v15.addOutfitTryOnItemAsAsset = function(v66, v67, v68) --[[ Line: 535 ]] --[[ Name: addOutfitTryOnItemAsAsset ]]
    -- upvalues: v15 (copy), v4 (copy), v1 (copy)
    local v69 = v15.makeSkeletonTryOnItem();
    v69.itemId = v67;
    v69.itemType = v4.ItemType.Asset;
    v69.itemSubType = v68;
    v69.itemRecency = v66.itemRecency;
    v66.itemRecency = v66.itemRecency + 1;
    local v70 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v67] = v69
                    }
                }
            }
        }
    };
    v66.state = v1.joinDeep(v70, v66.state);
    return v66;
end;
v15.addOutfitTryOnItemAsPartsBundleAsset = function(v71, v72, v73, v74) --[[ Line: 563 ]] --[[ Name: addOutfitTryOnItemAsPartsBundleAsset ]]
    -- upvalues: v15 (copy), v4 (copy), v1 (copy)
    local v75 = v15.makeSkeletonTryOnItem();
    v75.itemId = v72;
    v75.itemType = v4.ItemType.Bundle;
    v75.itemSubType = v4.BundleTypeIdStrings.BodyParts;
    v75.itemRecency = v71.itemRecency;
    v75.bundleInfo = {
        [v73] = {
            assetType = v74
        }
    };
    v71.itemRecency = v71.itemRecency + 1;
    local v76 = {
        AvatarExperience = {
            AvatarScene = {
                OutfitTryOn = {
                    TryOnItems = {
                        [v73] = v75
                    }
                }
            }
        }
    };
    v71.state = v1.joinDeep(v76, v71.state);
    return v71;
end;
v15.addDylanDefaultOutfitTryOnItem = function(v77) --[[ Line: 597 ]] --[[ Name: addDylanDefaultOutfitTryOnItem ]]
    -- upvalues: v15 (copy), v4 (copy)
    return v77:addOutfitTryOnItem(v15.DylanDefaultBundleId, {
        bundleInfo = {
            [v15.DylanDefaultHeadAssetId] = {
                assetType = v4.AssetTypeIdStrings.DynamicHead
            }, 
            [v15.DynamicHeadMoodAnimationAssetId] = {
                assetType = v4.AssetTypeIdStrings.MoodAnimation
            }
        }, 
        isUnequipped = false, 
        itemId = v15.DylanDefaultBundleId, 
        itemRecency = 0, 
        itemSubType = v4.BundleTypeIdStrings.DynamicHead, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v15.addGeckoOutfitTryOnItem = function(v78) --[[ Line: 618 ]] --[[ Name: addGeckoOutfitTryOnItem ]]
    -- upvalues: v15 (copy), v4 (copy)
    return v78:addOutfitTryOnItem(v15.GeckoBundleId, {
        bundleInfo = {
            ["10407915508"] = {
                assetType = v4.AssetTypeIdStrings.DynamicHead
            }, 
            [v15.GeckoMoodAnimationAssetId] = {
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
        itemId = v15.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = v4.BundleTypeIdStrings.BodyParts, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v15.addPirateAnimationOutfitTryOnItem = function(v79) --[[ Line: 678 ]] --[[ Name: addPirateAnimationOutfitTryOnItem ]]
    -- upvalues: v15 (copy), v16 (copy), v4 (copy)
    return v79:addOutfitTryOnItem(v15.PirateAnimationBundleId, {
        bundleInfo = v16, 
        isUnequipped = false, 
        itemId = v15.PirateAnimationBundleId, 
        itemRecency = 0, 
        itemSubType = v4.BundleTypeIdStrings.Animations, 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = true, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v15.addPirateAnimationOutfitTryOnLastToggledItem = function(v80) --[[ Line: 692 ]] --[[ Name: addPirateAnimationOutfitTryOnLastToggledItem ]]
    -- upvalues: v15 (copy), v4 (copy)
    local v81 = v15.makeSkeletonTryOnItem();
    v81.itemId = v15.PirateAnimationBundleId;
    v81.itemType = v4.ItemType.Bundle;
    return v80:addOutfitTryOnLastToggledItem(v81);
end;
v15.addDHWithNoMoodOutfitTryOnItem = function(v82) --[[ Line: 704 ]] --[[ Name: addDHWithNoMoodOutfitTryOnItem ]]
    -- upvalues: v15 (copy), v4 (copy)
    return v82:addOutfitTryOnItem(v15.GeckoBundleId, {
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
        itemId = v15.GeckoBundleId, 
        itemRecency = 7, 
        itemSubType = "1", 
        itemType = v4.ItemType.Bundle, 
        receivedBundleInfo = false, 
        selectedInTryOnManager = true, 
        version = "1"
    });
end;
v15.addTryOnAnimation = function(v83, v84) --[[ Line: 761 ]] --[[ Name: addTryOnAnimation ]]
    -- upvalues: v1 (copy)
    local v85 = {
        AvatarExperience = {
            AvatarScene = {
                TryOn = {
                    AnimationPreview = v84
                }
            }
        }
    };
    v83.state = v1.joinDeep(v85, v83.state);
    return v83;
end;
v15.addPirateTryOnAnimation = function(v86) --[[ Line: 776 ]] --[[ Name: addPirateTryOnAnimation ]]
    -- upvalues: v15 (copy)
    return v86:addTryOnAnimation(v15.PirateIdleAnimationAssetId);
end;
v15.addAssetInfo = function(v87, v88) --[[ Line: 780 ]] --[[ Name: addAssetInfo ]]
    -- upvalues: v1 (copy)
    local l_id_0 = v88.id;
    assert(l_id_0 ~= nil, "assetInfo should have an id");
    local v90 = {
        AvatarExperience = {
            Common = {
                AssetInfos = {
                    [l_id_0] = v88
                }
            }
        }
    };
    v87.state = v1.joinDeep(v90, v87.state);
    return v87;
end;
v15.addBundleInfo = function(v91, v92) --[[ Line: 797 ]] --[[ Name: addBundleInfo ]]
    -- upvalues: v1 (copy)
    local l_id_1 = v92.id;
    assert(l_id_1 ~= nil, "bundleInfo should have an id");
    local v94 = {
        AvatarExperience = {
            Common = {
                BundleInfos = {
                    [l_id_1] = v92
                }
            }
        }
    };
    v91.state = v1.joinDeep(v94, v91.state);
    return v91;
end;
v15.addPirateAnimationAssetInfos = function(v95) --[[ Line: 814 ]] --[[ Name: addPirateAnimationAssetInfos ]]
    -- upvalues: v16 (copy), v12 (copy)
    for v96, v97 in v16 do
        local v98 = v12.mock();
        v98.id = v96;
        v98.assetType = v97.assetType;
        v95 = v95:addAssetInfo(v98);
    end;
    return v95;
end;
v15.addDunceHatAssetInfo = function(v99) --[[ Line: 824 ]] --[[ Name: addDunceHatAssetInfo ]]
    -- upvalues: v12 (copy), v15 (copy)
    return v99:addAssetInfo((v12.fromGetCatalogItemData({
        receivedCatalogData = true, 
        id = v15.DunceHatAssetId, 
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
v15.addDylanDefaultBundleInfo = function(v100) --[[ Line: 850 ]] --[[ Name: addDylanDefaultBundleInfo ]]
    -- upvalues: v15 (copy), v4 (copy)
    return v100:addBundleInfo({
        bundleType = tostring(Enum.BundleType.DynamicHead.Value), 
        description = "A look that never goes out of style.", 
        expectedSellerId = "1", 
        favoriteCount = 196358, 
        id = v15.DylanDefaultBundleId, 
        isOwned = true, 
        isPublicDomain = true, 
        isPurchasable = false, 
        itemStatus = {}, 
        itemType = v4.ItemType.Bundle, 
        items = {
            [1] = {
                id = v15.DylanDefaultHeadAssetId, 
                type = v4.ItemType.Asset
            }, 
            [2] = {
                id = v15.DynamicHeadMoodAnimationAssetId, 
                type = v4.ItemType.Asset
            }, 
            [3] = {
                id = v15.DylanDefaultOutfitId, 
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
v15.addGeckoBundleInfo = function(v101) --[[ Line: 885 ]] --[[ Name: addGeckoBundleInfo ]]
    -- upvalues: v4 (copy), v15 (copy)
    return v101:addBundleInfo({
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
        id = v15.GeckoBundleId, 
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
                id = v15.GeckoMoodAnimationAssetId, 
                type = v4.ItemType.Asset
            }, 
            [16] = {
                id = v15.GeckoOutfitId, 
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
v15.addPirateAnimationBundleInfo = function(v102) --[[ Line: 987 ]] --[[ Name: addPirateAnimationBundleInfo ]]
    -- upvalues: v4 (copy), v19 (copy)
    return v102:addBundleInfo({
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
        items = v19, 
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
v15.addOutfitInfo = function(v103, v104, v105) --[[ Line: 1020 ]] --[[ Name: addOutfitInfo ]]
    -- upvalues: v1 (copy)
    local v106 = {
        AvatarExperience = {
            AvatarEditor = {
                OutfitInfos = {
                    [v104] = v105
                }
            }
        }
    };
    v103.state = v1.joinDeep(v106, v103.state);
    return v103;
end;
v15.addDylanDefaultOutfitInfo = function(v107) --[[ Line: 1035 ]] --[[ Name: addDylanDefaultOutfitInfo ]]
    -- upvalues: v15 (copy), v4 (copy)
    local v108 = v15.makeSkeletonOutfitInfo();
    v108.assets = {
        [v4.AssetTypeIdStrings.MoodAnimation] = {
            [v15.DynamicHeadMoodAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        [v4.AssetTypeIdStrings.DynamicHead] = {
            [v15.DylanDefaultHeadAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }
    };
    v108.containsDynamicHead = true;
    v108.name = "Dylan Default";
    v108.outfitId = v15.DylanDefaultOutfitId;
    v108.outfitType = v4.OutfitTypes.DynamicHead;
    return v107:addOutfitInfo(v15.DylanDefaultOutfitId, v108);
end;
v15.addGeckoOutfitInfo = function(v109) --[[ Line: 1059 ]] --[[ Name: addGeckoOutfitInfo ]]
    -- upvalues: v15 (copy), v4 (copy)
    local v110 = v15.makeSkeletonOutfitInfo();
    v110.assets = {
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
            [v15.GeckoMoodAnimationAssetId] = {
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
    v110.outfitType = v4.OutfitTypes.Avatar;
    v110.name = "Galloping Gecko";
    v110.outfitId = v15.GeckoOutfitId;
    v110.containsDynamicHead = true;
    return v109:addOutfitInfo(v15.GeckoOutfitId, v110);
end;
v15.addPirateAnimationOutfitInfo = function(v111) --[[ Line: 1160 ]] --[[ Name: addPirateAnimationOutfitInfo ]]
    -- upvalues: v15 (copy)
    local v112 = v15.makeSkeletonOutfitInfo();
    v112.assets = {
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
            [v15.PirateIdleAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["52"] = {
            [v15.PirateJumpAnimationAssetId] = {
                isLayered = false, 
                version = "nil"
            }
        }, 
        ["53"] = {
            [v15.PirateRunAnimationAssetId] = {
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
    v112.name = "Pirate Animation Package";
    v112.outfitId = v15.PirateOutfitId;
    return v111:addOutfitInfo(v15.PirateOutfitId, v112);
end;
v15.addCategory = function(v113, v114) --[[ Line: 1212 ]] --[[ Name: addCategory ]]
    -- upvalues: v1 (copy)
    local v115 = {
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v114
                }
            }
        }
    };
    v113.state = v1.joinDeep(v115, v113.state);
    return v113;
end;
v15.addEquippedEmote = function(v116, v117, v118) --[[ Line: 1226 ]] --[[ Name: addEquippedEmote ]]
    -- upvalues: v1 (copy)
    local v119 = {
        AvatarExperience = {
            AvatarEditor = {
                EquippedEmotes = {
                    selectedSlot = v117, 
                    slotInfo = {
                        {
                            assetId = v118
                        }
                    }
                }
            }
        }
    };
    v116.state = v1.joinDeep(v119, v116.state);
    return v116;
end;
v15.addBodybuilderEquippedEmote = function(v120) --[[ Line: 1245 ]] --[[ Name: addBodybuilderEquippedEmote ]]
    -- upvalues: v15 (copy)
    return v120:addEquippedEmote(1, v15.BodybuilderEmoteAssetId);
end;
v15.addIsInAx = function(v121) --[[ Line: 1249 ]] --[[ Name: addIsInAx ]]
    -- upvalues: l_AvatarScreen_0 (copy), v1 (copy)
    local v122 = {
        Navigation = {
            history = {
                {
                    {
                        name = l_AvatarScreen_0.AvatarExperienceRoot
                    }
                }
            }
        }
    };
    v121.state = v1.joinDeep(v122, v121.state);
    return v121;
end;
v15.addPPEFinalPageFullView = function(v123) --[[ Line: 1263 ]] --[[ Name: addPPEFinalPageFullView ]]
    -- upvalues: v8 (copy), v1 (copy)
    local v124 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                FinalPageViewMode = {
                    finalPageViewMode = v8.FullBody
                }
            }
        }
    };
    v123.state = v1.joinDeep(v124, v123.state);
    return v123;
end;
v15.addSelectedPPEEmote = function(v125, v126) --[[ Line: 1277 ]] --[[ Name: addSelectedPPEEmote ]]
    -- upvalues: v1 (copy)
    local v127 = {
        AvatarExperience = {
            ProfilePictureEditor = {
                ProfilePictureParams = {
                    emoteAssetId = v126
                }
            }
        }
    };
    v125.state = v1.joinDeep(v127, v125.state);
    return v125;
end;
v15.addBodyBuilderSelectedPPEEmote = function(v128) --[[ Line: 1291 ]] --[[ Name: addBodyBuilderSelectedPPEEmote ]]
    -- upvalues: v15 (copy)
    return v128:addSelectedPPEEmote(v15.BodybuilderEmoteAssetId);
end;
v15.addAvatarEditorCategoryAndSubcategory = function(v129, v130, v131) --[[ Line: 1295 ]] --[[ Name: addAvatarEditorCategoryAndSubcategory ]]
    -- upvalues: v1 (copy)
    local v132 = {
        AvatarExperience = {
            AvatarEditor = {
                Categories = {
                    category = v130, 
                    subcategory = v131
                }
            }
        }
    };
    v129.state = v1.joinDeep(v132, v129.state);
    return v129;
end;
v15.addAvatarEditorCategoryAndSubcategoryByName = function(v133, v134, v135) --[[ Line: 1313 ]] --[[ Name: addAvatarEditorCategoryAndSubcategoryByName ]]
    -- upvalues: v10 (copy)
    local v136 = false;
    local v137 = nil;
    local v138 = nil;
    for v139, v140 in (v10()) do
        if v140.Name == v134 then
            v137 = v139;
            if v135 then
                assert(v140.Subcategories, "category.Subcategories should be non-nil");
                for v141, v142 in v140.Subcategories do
                    if v142.Name == v135 then
                        v138 = v141;
                        v136 = true;
                    end;
                    if v136 then
                        break;
                    end;
                end;
                if not v136 then
                    break;
                end;
            else
                break;
            end;
        end;
        if v136 then
            break;
        end;
    end;
    v136 = false;
    assert(v137, "categoryIndex should be non-nil");
    if v135 then
        assert(v138, "subcategoryIndex should be non-nil");
    end;
    return v133:addAvatarEditorCategoryAndSubcategory(v137, v138);
end;
v15.addSortAndFilters = function(v143) --[[ Line: 1343 ]] --[[ Name: addSortAndFilters ]]
    -- upvalues: v11 (copy), v1 (copy)
    local v144 = {
        AvatarExperience = {
            Catalog = {
                SortAndFilters = v11(nil, {})
            }
        }
    };
    v143.state = v1.joinDeep(v144, v143.state);
    return v143;
end;
v15.addSearchInCatalog = function(v145, v146) --[[ Line: 1355 ]] --[[ Name: addSearchInCatalog ]]
    -- upvalues: v15 (copy), v1 (copy)
    local v147 = {
        AvatarExperience = {
            Search = {
                SearchesInCatalog = {
                    [v15.DummySearchUid] = {
                        keyword = v15.DummyKeyword, 
                        items = v146
                    }
                }
            }
        }
    };
    v145.state = v1.joinDeep(v147, v145.state);
    return v145;
end;
v15.addItemDetailsPeekViewState = function(v148, v149) --[[ Line: 1373 ]] --[[ Name: addItemDetailsPeekViewState ]]
    -- upvalues: v1 (copy)
    local v150 = {
        AvatarExperience = {
            Common = {
                ItemDetailsPeekView = {
                    viewState = v149
                }
            }
        }
    };
    v148.state = v1.joinDeep(v150, v148.state);
    return v148;
end;
v15.addFetchingStatus = function(v151, v152, v153) --[[ Line: 1388 ]] --[[ Name: addFetchingStatus ]]
    -- upvalues: v1 (copy)
    local v154 = {
        FetchingStatus = {
            [v152] = v153
        }
    };
    v151.state = v1.joinDeep(v154, v151.state);
    return v151;
end;
return v15;