local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum;
local v4 = {
    [1] = {
        id = 100425207, 
        name = "Reinforced Wizard", 
        assetType = {
            id = 8, 
            name = "Hat"
        }
    }, 
    [2] = {
        id = 2510238627, 
        name = "Rthro Run", 
        assetType = {
            id = 53, 
            name = "Run Animation"
        }
    }, 
    [3] = {
        id = 2807164805, 
        name = "Mech Golem - Head", 
        assetType = {
            id = 17, 
            name = "Head"
        }
    }
};
local v5 = {
    data = {
        [1] = {
            id = 451, 
            name = "test name", 
            description = "test description", 
            bundleType = "testBundleType", 
            items = {
                [1] = {
                    owned = false, 
                    id = 2510230574, 
                    name = "test asset name"
                }, 
                [2] = {
                    owned = false, 
                    id = 2510233257, 
                    name = "test asset name 2"
                }, 
                [3] = {
                    owned = false, 
                    type = "UserOutfit", 
                    id = 2510233258, 
                    name = "Outfit"
                }
            }, 
            creator = {
                id = 1, 
                name = "test creator name"
            }, 
            product = {
                id = 480872498, 
                isForSale = true, 
                priceInRobux = 250
            }
        }
    }
};
local l_HumanoidDescription_0 = Instance.new("HumanoidDescription");
l_HumanoidDescription_0.HatAccessory = 1;
l_HumanoidDescription_0.LeftArm = 2;
l_HumanoidDescription_0.ClimbAnimation = 3;
l_HumanoidDescription_0.BodyTypeScale = 0.3;
l_HumanoidDescription_0.LeftLegColor = Color3.new(0, 0, 0);
l_HumanoidDescription_0.GraphicTShirt = 4;
local l_HumanoidDescription_1 = Instance.new("HumanoidDescription");
l_HumanoidDescription_1:SetEmotes({
    Wave = {
        1
    }, 
    Laugh = {
        2
    }, 
    Cheer = {
        3
    }
});
local l_HumanoidDescription_2 = Instance.new("HumanoidDescription");
local v9 = {
    assetId = 123, 
    userId = 401784814, 
    created = ""
};
local v10 = {
    Name = "test name", 
    Description = "test description", 
    PriceInRobux = 100, 
    Creator = {
        Id = 1, 
        Name = "TEST CREATOR"
    }, 
    AssetId = 100425207, 
    AssetTypeId = 8, 
    ProductId = 18929548
};
local v11 = {
    Owned = true, 
    IsPurchasable = false, 
    Id = 100425207, 
    ItemType = "Asset"
};
local v12 = {
    purchasable = false, 
    reason = "InsufficientFunds", 
    price = 200, 
    assetId = 10
};
local v13 = {
    playabilityStatus = l_PlayabilityStatusEnum_0.Playable, 
    universeId = 13, 
    isPlayable = true
};
local v14 = {
    name = "fakename", 
    id = 13, 
    rootPlaceId = 17
};
local function v17(v15) --[[ Line: 145 ]] --[[ Name: getRobloxProductInfo ]]
    -- upvalues: v1 (copy), v10 (copy), v2 (copy)
    local v16 = v1.Dictionary.join(v10, {
        AssetId = v15
    });
    return v2.resolve(v16);
end;
local function v20(v18) --[[ Line: 150 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v1 (copy), v10 (copy), v2 (copy)
    local v19 = v1.Dictionary.join(v10, {
        AssetId = v18
    });
    v19.Creator.Id = 2;
    return v2.resolve(v19);
end;
local function v24(v21, v22) --[[ Line: 156 ]] --[[ Name: getItemDetails ]]
    -- upvalues: v1 (copy), v11 (copy), v2 (copy)
    local v23 = v1.Dictionary.join(v11, {
        Id = v21, 
        ItemType = v22
    });
    return v2.resolve(v23);
end;
local v25 = {
    data = {
        {
            assetId = 17, 
            creatingUniverseId = 13
        }
    }
};
local function v28(v26) --[[ Line: 175 ]] --[[ Name: getVersionInfo ]]
    -- upvalues: v1 (copy), v25 (copy), v2 (copy)
    local v27 = v1.Dictionary.join(v25, {
        AssetId = v26
    });
    return v2.resolve(v27);
end;
local function v31(v29) --[[ Line: 180 ]] --[[ Name: getExperiencePlayability ]]
    -- upvalues: v1 (copy), v13 (copy), v2 (copy)
    local v30 = v1.Dictionary.join(v13, {
        universeId = v29
    });
    return v2.resolve({
        v30
    });
end;
local function v34(v32) --[[ Line: 185 ]] --[[ Name: getExperienceInfo ]]
    -- upvalues: v1 (copy), v14 (copy), v2 (copy)
    local v33 = v1.Dictionary.join(v14, {
        id = v32
    });
    return v2.resolve({
        data = {
            v33
        }
    });
end;
local function v36(_) --[[ Line: 190 ]] --[[ Name: getAssetBundles ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.resolve(v5);
end;
local function v38(_) --[[ Line: 194 ]] --[[ Name: getPlayerName ]]
    -- upvalues: v2 (copy)
    return v2.resolve("TEST");
end;
local function v40(_) --[[ Line: 198 ]] --[[ Name: createFavoriteForAsset ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v42(_) --[[ Line: 202 ]] --[[ Name: createFavoriteForBundle ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v44(_) --[[ Line: 206 ]] --[[ Name: deleteFavoriteForAsset ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v46(_) --[[ Line: 210 ]] --[[ Name: deleteFavoriteForBundle ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v48(_) --[[ Line: 214 ]] --[[ Name: getAssetFavoriteCount ]]
    -- upvalues: v2 (copy)
    return v2.resolve(120);
end;
local function v50(_) --[[ Line: 218 ]] --[[ Name: getBundleFavoriteCount ]]
    -- upvalues: v2 (copy)
    return v2.resolve(120);
end;
local function v52(v51) --[[ Line: 222 ]] --[[ Name: getFavoriteForAsset ]]
    -- upvalues: v2 (copy), v9 (copy)
    if v51 == "GetFavoriteModel" then
        return v2.resolve(v9);
    else
        return v2.resolve("null");
    end;
end;
local function v54(v53) --[[ Line: 230 ]] --[[ Name: getFavoriteForBundle ]]
    -- upvalues: v2 (copy), v9 (copy)
    if v53 == "GetFavoriteModel" then
        return v2.resolve(v9);
    else
        return v2.resolve("null");
    end;
end;
local function v56(_) --[[ Line: 238 ]] --[[ Name: getEconomyProductInfo ]]
    -- upvalues: v2 (copy), v12 (copy)
    return v2.resolve(v12);
end;
local function v58(_) --[[ Line: 242 ]] --[[ Name: getModelFromUserId ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v61(_, _) --[[ Line: 246 ]] --[[ Name: networkFailure ]]
    -- upvalues: v2 (copy)
    return v2.reject("Failed to access network service");
end;
local v62 = {};
v62.__index = v62;
v62.new = function(v63, v64) --[[ Line: 253 ]] --[[ Name: new ]]
    -- upvalues: v61 (copy), v20 (copy), v17 (copy), v38 (copy), v36 (copy), v40 (copy), v42 (copy), v44 (copy), v46 (copy), v48 (copy), v50 (copy), v52 (copy), v54 (copy), v56 (copy), v58 (copy), v28 (copy), v31 (copy), v34 (copy), v24 (copy)
    local v65 = nil;
    v65 = if v63 then {
        getProductInfo = v61, 
        getPlayerName = v61, 
        getAssetBundles = v61, 
        createFavoriteForAsset = v61, 
        createFavoriteForBundle = v61, 
        deleteFavoriteForAsset = v61, 
        deleteFavoriteForBundle = v61, 
        getAssetFavoriteCount = v61, 
        getBundleFavoriteCount = v61, 
        getFavoriteForAsset = v61, 
        getFavoriteForBundle = v61, 
        getEconomyProductInfo = v61, 
        getModelFromUserId = v61, 
        getVersionInfo = v61, 
        getExperiencePlayability = v61, 
        getExperienceInfo = v61, 
        getItemDetails = v61
    } else {
        getProductInfo = v64 and v20 or v17, 
        getPlayerName = v38, 
        getAssetBundles = v36, 
        createFavoriteForAsset = v40, 
        createFavoriteForBundle = v42, 
        deleteFavoriteForAsset = v44, 
        deleteFavoriteForBundle = v46, 
        getAssetFavoriteCount = v48, 
        getBundleFavoriteCount = v50, 
        getFavoriteForAsset = v52, 
        getFavoriteForBundle = v54, 
        getEconomyProductInfo = v56, 
        getModelFromUserId = v58, 
        getVersionInfo = v28, 
        getExperiencePlayability = v31, 
        getExperienceInfo = v34, 
        getItemDetails = v24
    };
    setmetatable(v65, {
        __tostring = function() --[[ Line: 299 ]] --[[ Name: __tostring ]]
            return "MockService(Network)";
        end
    });
    return v65;
end;
v62.GetMockAssetData = function() --[[ Line: 307 ]] --[[ Name: GetMockAssetData ]]
    -- upvalues: v4 (copy)
    return v4;
end;
v62.GetMockHumanoidDescription = function() --[[ Line: 311 ]] --[[ Name: GetMockHumanoidDescription ]]
    -- upvalues: l_HumanoidDescription_0 (copy)
    return l_HumanoidDescription_0;
end;
v62.GetMockHumanoidDescriptionEmpty = function() --[[ Line: 315 ]] --[[ Name: GetMockHumanoidDescriptionEmpty ]]
    -- upvalues: l_HumanoidDescription_2 (copy)
    return l_HumanoidDescription_2;
end;
v62.GetMockPlayerName = function() --[[ Line: 319 ]] --[[ Name: GetMockPlayerName ]]
    return "TEST";
end;
v62.GetMockAssetBundlesData = function() --[[ Line: 323 ]] --[[ Name: GetMockAssetBundlesData ]]
    -- upvalues: v5 (copy)
    return v5;
end;
v62.GetMockFavoriteCount = function() --[[ Line: 327 ]] --[[ Name: GetMockFavoriteCount ]]
    return 120;
end;
v62.GetFavoriteModelId = function() --[[ Line: 331 ]] --[[ Name: GetFavoriteModelId ]]
    return "GetFavoriteModel";
end;
v62.GetProductInfo = function() --[[ Line: 335 ]] --[[ Name: GetProductInfo ]]
    -- upvalues: v10 (copy)
    return v10;
end;
v62.GetEconomyProductInfo = function() --[[ Line: 339 ]] --[[ Name: GetEconomyProductInfo ]]
    -- upvalues: v12 (copy)
    return v12;
end;
v62.GetMockHumanoidDescriptionEmotes = function() --[[ Line: 343 ]] --[[ Name: GetMockHumanoidDescriptionEmotes ]]
    -- upvalues: l_HumanoidDescription_1 (copy)
    return l_HumanoidDescription_1;
end;
v62.GetVersionInfo = function() --[[ Line: 347 ]] --[[ Name: GetVersionInfo ]]
    -- upvalues: v25 (copy)
    return v25;
end;
v62.GetExperiencePlayability = function() --[[ Line: 351 ]] --[[ Name: GetExperiencePlayability ]]
    -- upvalues: v13 (copy)
    return {
        v13
    };
end;
v62.GetExperienceInfo = function() --[[ Line: 355 ]] --[[ Name: GetExperienceInfo ]]
    -- upvalues: v14 (copy)
    return {
        data = {
            v14
        }
    };
end;
return v62;