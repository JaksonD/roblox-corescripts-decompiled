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
local function v29(v25) --[[ Line: 161 ]] --[[ Name: getBatchItemDetails ]]
    -- upvalues: v1 (copy), v11 (copy), v2 (copy)
    local v26 = {};
    for _, v28 in ipairs(v25) do
        table.insert(v26, v1.Dictionary.join(v11, {
            Id = v28
        }));
    end;
    return v2.resolve(v26);
end;
local v30 = {
    data = {
        {
            assetId = 17, 
            creatingUniverseId = 13
        }
    }
};
local function v33(v31) --[[ Line: 183 ]] --[[ Name: getVersionInfo ]]
    -- upvalues: v1 (copy), v30 (copy), v2 (copy)
    local v32 = v1.Dictionary.join(v30, {
        AssetId = v31
    });
    return v2.resolve(v32);
end;
local function v36(v34) --[[ Line: 188 ]] --[[ Name: getExperiencePlayability ]]
    -- upvalues: v1 (copy), v13 (copy), v2 (copy)
    local v35 = v1.Dictionary.join(v13, {
        universeId = v34
    });
    return v2.resolve({
        v35
    });
end;
local function v39(v37) --[[ Line: 193 ]] --[[ Name: getExperienceInfo ]]
    -- upvalues: v1 (copy), v14 (copy), v2 (copy)
    local v38 = v1.Dictionary.join(v14, {
        id = v37
    });
    return v2.resolve({
        data = {
            v38
        }
    });
end;
local function v41(_) --[[ Line: 198 ]] --[[ Name: getAssetBundles ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.resolve(v5);
end;
local function v43(_) --[[ Line: 202 ]] --[[ Name: getPlayerName ]]
    -- upvalues: v2 (copy)
    return v2.resolve("TEST");
end;
local function v45(_) --[[ Line: 206 ]] --[[ Name: createFavoriteForAsset ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v47(_) --[[ Line: 210 ]] --[[ Name: createFavoriteForBundle ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v49(_) --[[ Line: 214 ]] --[[ Name: deleteFavoriteForAsset ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v51(_) --[[ Line: 218 ]] --[[ Name: deleteFavoriteForBundle ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v53(_) --[[ Line: 222 ]] --[[ Name: getAssetFavoriteCount ]]
    -- upvalues: v2 (copy)
    return v2.resolve(120);
end;
local function v55(_) --[[ Line: 226 ]] --[[ Name: getBundleFavoriteCount ]]
    -- upvalues: v2 (copy)
    return v2.resolve(120);
end;
local function v57(v56) --[[ Line: 230 ]] --[[ Name: getFavoriteForAsset ]]
    -- upvalues: v2 (copy), v9 (copy)
    if v56 == "GetFavoriteModel" then
        return v2.resolve(v9);
    else
        return v2.resolve("null");
    end;
end;
local function v59(v58) --[[ Line: 238 ]] --[[ Name: getFavoriteForBundle ]]
    -- upvalues: v2 (copy), v9 (copy)
    if v58 == "GetFavoriteModel" then
        return v2.resolve(v9);
    else
        return v2.resolve("null");
    end;
end;
local function v61(_) --[[ Line: 246 ]] --[[ Name: getEconomyProductInfo ]]
    -- upvalues: v2 (copy), v12 (copy)
    return v2.resolve(v12);
end;
local function v63(_) --[[ Line: 250 ]] --[[ Name: getModelFromUserId ]]
    -- upvalues: v2 (copy)
    return v2.resolve();
end;
local function v66(_, _) --[[ Line: 254 ]] --[[ Name: networkFailure ]]
    -- upvalues: v2 (copy)
    return v2.reject("Failed to access network service");
end;
local v67 = {};
v67.__index = v67;
v67.new = function(v68, v69) --[[ Line: 261 ]] --[[ Name: new ]]
    -- upvalues: v66 (copy), v20 (copy), v17 (copy), v43 (copy), v41 (copy), v45 (copy), v47 (copy), v49 (copy), v51 (copy), v53 (copy), v55 (copy), v57 (copy), v59 (copy), v61 (copy), v63 (copy), v33 (copy), v36 (copy), v39 (copy), v24 (copy), v29 (copy)
    local v70 = nil;
    v70 = if v68 then {
        getProductInfo = v66, 
        getPlayerName = v66, 
        getAssetBundles = v66, 
        createFavoriteForAsset = v66, 
        createFavoriteForBundle = v66, 
        deleteFavoriteForAsset = v66, 
        deleteFavoriteForBundle = v66, 
        getAssetFavoriteCount = v66, 
        getBundleFavoriteCount = v66, 
        getFavoriteForAsset = v66, 
        getFavoriteForBundle = v66, 
        getEconomyProductInfo = v66, 
        getModelFromUserId = v66, 
        getVersionInfo = v66, 
        getExperiencePlayability = v66, 
        getExperienceInfo = v66, 
        getItemDetails = v66, 
        getBatchItemDetails = v66
    } else {
        getProductInfo = v69 and v20 or v17, 
        getPlayerName = v43, 
        getAssetBundles = v41, 
        createFavoriteForAsset = v45, 
        createFavoriteForBundle = v47, 
        deleteFavoriteForAsset = v49, 
        deleteFavoriteForBundle = v51, 
        getAssetFavoriteCount = v53, 
        getBundleFavoriteCount = v55, 
        getFavoriteForAsset = v57, 
        getFavoriteForBundle = v59, 
        getEconomyProductInfo = v61, 
        getModelFromUserId = v63, 
        getVersionInfo = v33, 
        getExperiencePlayability = v36, 
        getExperienceInfo = v39, 
        getItemDetails = v24, 
        getBatchItemDetails = v29
    };
    setmetatable(v70, {
        __tostring = function() --[[ Line: 309 ]] --[[ Name: __tostring ]]
            return "MockService(Network)";
        end
    });
    return v70;
end;
v67.GetMockAssetData = function() --[[ Line: 317 ]] --[[ Name: GetMockAssetData ]]
    -- upvalues: v4 (copy)
    return v4;
end;
v67.GetMockHumanoidDescription = function() --[[ Line: 321 ]] --[[ Name: GetMockHumanoidDescription ]]
    -- upvalues: l_HumanoidDescription_0 (copy)
    return l_HumanoidDescription_0;
end;
v67.GetMockHumanoidDescriptionEmpty = function() --[[ Line: 325 ]] --[[ Name: GetMockHumanoidDescriptionEmpty ]]
    -- upvalues: l_HumanoidDescription_2 (copy)
    return l_HumanoidDescription_2;
end;
v67.GetMockPlayerName = function() --[[ Line: 329 ]] --[[ Name: GetMockPlayerName ]]
    return "TEST";
end;
v67.GetMockAssetBundlesData = function() --[[ Line: 333 ]] --[[ Name: GetMockAssetBundlesData ]]
    -- upvalues: v5 (copy)
    return v5;
end;
v67.GetMockFavoriteCount = function() --[[ Line: 337 ]] --[[ Name: GetMockFavoriteCount ]]
    return 120;
end;
v67.GetFavoriteModelId = function() --[[ Line: 341 ]] --[[ Name: GetFavoriteModelId ]]
    return "GetFavoriteModel";
end;
v67.GetProductInfo = function() --[[ Line: 345 ]] --[[ Name: GetProductInfo ]]
    -- upvalues: v10 (copy)
    return v10;
end;
v67.GetEconomyProductInfo = function() --[[ Line: 349 ]] --[[ Name: GetEconomyProductInfo ]]
    -- upvalues: v12 (copy)
    return v12;
end;
v67.GetMockHumanoidDescriptionEmotes = function() --[[ Line: 353 ]] --[[ Name: GetMockHumanoidDescriptionEmotes ]]
    -- upvalues: l_HumanoidDescription_1 (copy)
    return l_HumanoidDescription_1;
end;
v67.GetVersionInfo = function() --[[ Line: 357 ]] --[[ Name: GetVersionInfo ]]
    -- upvalues: v30 (copy)
    return v30;
end;
v67.GetExperiencePlayability = function() --[[ Line: 361 ]] --[[ Name: GetExperiencePlayability ]]
    -- upvalues: v13 (copy)
    return {
        v13
    };
end;
v67.GetExperienceInfo = function() --[[ Line: 365 ]] --[[ Name: GetExperienceInfo ]]
    -- upvalues: v14 (copy)
    return {
        data = {
            v14
        }
    };
end;
return v67;