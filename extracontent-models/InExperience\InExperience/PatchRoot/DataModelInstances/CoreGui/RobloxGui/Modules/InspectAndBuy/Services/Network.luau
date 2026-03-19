local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_CorePackages_0.Packages.Promise);
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local v9 = string.format("https://develop.%s", l_Url_0.DOMAIN);
local function _(v10, v11, v12, v13) --[[ Line: 26 ]] --[[ Name: request ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:RequestInternal(v10):Start(function(v14, v15) --[[ Line: 27 ]]
        -- upvalues: v11 (copy), l_HttpService_0 (ref), v12 (copy), v13 (copy)
        if v14 and v15.StatusCode == 200 then
            local v16 = true;
            local v17 = nil;
            if v11 and v15.Body ~= "null" then
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v15.Body);
                v16 = l_status_0;
                v17 = l_result_0;
            else
                v17 = v15.Body;
            end;
            if v16 then
                v12(v17);
                return;
            else
                v13("Could not parse JSON.");
                return;
            end;
        else
            v13(v15);
            return;
        end;
    end);
end;
local function v36(v21, v22) --[[ Line: 49 ]] --[[ Name: createYieldingPromise ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy)
    return v4.new(function(v23, v24) --[[ Line: 50 ]]
        -- upvalues: v21 (copy), v22 (copy), l_HttpService_0 (ref)
        coroutine.wrap(function() --[[ Line: 51 ]]
            -- upvalues: v21 (ref), v22 (ref), v23 (copy), v24 (copy), l_HttpService_0 (ref)
            local l_v21_0 = v21;
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            local l_v24_0 = v24;
            local _ = l_HttpService_0:RequestInternal(l_v21_0):Start(function(v29, v30) --[[ Line: 27 ]]
                -- upvalues: l_v22_0 (copy), l_HttpService_0 (ref), l_v23_0 (copy), l_v24_0 (copy)
                if v29 and v30.StatusCode == 200 then
                    local v31 = true;
                    local v32 = nil;
                    if l_v22_0 and v30.Body ~= "null" then
                        local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v30.Body);
                        v31 = l_status_1;
                        v32 = l_result_1;
                    else
                        v32 = v30.Body;
                    end;
                    if v31 then
                        l_v23_0(v32);
                        return;
                    else
                        l_v24_0("Could not parse JSON.");
                        return;
                    end;
                else
                    l_v24_0(v30);
                    return;
                end;
            end);
        end)();
    end);
end;
local function v39(v37) --[[ Line: 60 ]] --[[ Name: getPreviewAvatar ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v36 (copy)
    local v38 = {
        Url = l_Url_0.APIS_URL .. "look-api/v1/looks/purchase-details", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            assets = v37
        }), 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v36(v38, true);
end;
local function v45(v40) --[[ Line: 78 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v4 (copy), l_MarketplaceService_0 (copy)
    return v4.new(function(v41, v42) --[[ Line: 79 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v40 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 80 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v40 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_MarketplaceService_0:GetProductInfoAsync(v40);
            else
                return l_MarketplaceService_0:GetProductInfo(v40);
            end;
        end);
        if l_status_2 then
            v41(l_result_2);
            return;
        else
            v42("Failure in getProductInfo: ", (tostring(l_result_2)));
            return;
        end;
    end);
end;
local function v52(v46, v47) --[[ Line: 99 ]] --[[ Name: getBatchItemDetails ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy)
    return v4.new(function(v48, v49) --[[ Line: 100 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v46 (copy), v47 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 101 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v46 (ref), v47 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetBatchItemDetailsAsync(v46, v47);
            else
                return l_AvatarEditorService_0:GetBatchItemDetails(v46, v47);
            end;
        end);
        if l_status_3 then
            v48(l_result_3);
            return;
        else
            v49("Failure in batchGetItemDetails: ", (tostring(l_result_3)));
            return;
        end;
    end);
end;
local function v55(v53) --[[ Line: 122 ]] --[[ Name: getBatchItemDetailsV2 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v36 (copy)
    local v54 = {
        Url = l_Url_0.CATALOG_URL .. "v1/catalog/items/details", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            items = v53
        }), 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v36(v54, true);
end;
local function v62(v56, v57) --[[ Line: 140 ]] --[[ Name: getItemDetails ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy)
    return v4.new(function(v58, v59) --[[ Line: 141 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v56 (copy), v57 (copy)
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 142 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v56 (ref), v57 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetItemDetailsAsync(v56, v57);
            else
                return l_AvatarEditorService_0:GetItemDetails(v56, v57);
            end;
        end);
        if l_status_4 then
            v58(l_result_4);
            return;
        else
            v59("Failure in getItemDetails: ", (tostring(l_result_4)));
            return;
        end;
    end);
end;
local function v68(v63) --[[ Line: 161 ]] --[[ Name: getPlayerName ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v64, v65) --[[ Line: 162 ]]
        -- upvalues: l_Players_0 (ref), v63 (copy)
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 163 ]]
            -- upvalues: l_Players_0 (ref), v63 (ref)
            return l_Players_0:GetNameFromUserIdAsync(v63);
        end);
        if l_status_5 then
            v64(l_result_5);
            return;
        else
            v65("Failure in getPlayerName: ", (tostring(l_result_5)));
            return;
        end;
    end);
end;
local function v71(v69) --[[ Line: 178 ]] --[[ Name: getAssetBundles ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v70 = {
        Url = l_Url_0.CATALOG_URL .. "v1/assets/" .. tostring(v69) .. "/bundles", 
        Method = "GET"
    };
    return v36(v70, true);
end;
local function v76(v72) --[[ Line: 191 ]] --[[ Name: getHumanoidDescriptionFromCostumeId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v73, _) --[[ Line: 192 ]]
        -- upvalues: l_Players_0 (ref), v72 (copy)
        spawn(function() --[[ Line: 193 ]]
            -- upvalues: l_Players_0 (ref), v72 (ref), v73 (copy)
            local v75 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v72) else l_Players_0:GetHumanoidDescriptionFromOutfitId(v72);
            if v75 then
                v73(v75);
            end;
        end);
    end);
end;
local function v79(v77) --[[ Line: 210 ]] --[[ Name: getAssetFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v78 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/assets/" .. tostring(v77) .. "/count", 
        Method = "GET"
    };
    return v36(v78, false);
end;
local function v82(v80) --[[ Line: 223 ]] --[[ Name: getBundleFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v81 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(v80) .. "/count", 
        Method = "GET"
    };
    return v36(v81, false);
end;
local function v86(v83) --[[ Line: 236 ]] --[[ Name: getFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v36 (copy)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v85 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_0) .. "/assets/" .. tostring(v83) .. "/favorite", 
        Method = "GET"
    };
    return v36(v85, true);
end;
local function v90(v87) --[[ Line: 255 ]] --[[ Name: getFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v36 (copy)
    local l_UserId_1 = l_Players_0.LocalPlayer.UserId;
    local v89 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_1) .. "/bundles/" .. tostring(v87) .. "/favorite", 
        Method = "GET"
    };
    return v36(v89, true);
end;
local function v94(v91) --[[ Line: 274 ]] --[[ Name: createFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v36 (copy)
    local l_UserId_2 = l_Players_0.LocalPlayer.UserId;
    local v93 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_2) .. "/assets/" .. tostring(v91) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v36(v93, true);
end;
local function v98(v95) --[[ Line: 294 ]] --[[ Name: deleteFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v36 (copy)
    local l_UserId_3 = l_Players_0.LocalPlayer.UserId;
    local v97 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_3) .. "/assets/" .. tostring(v95) .. "/favorite", 
        Method = "DELETE"
    };
    return v36(v97, true);
end;
local function v102(v99) --[[ Line: 313 ]] --[[ Name: createFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v36 (copy)
    local l_UserId_4 = l_Players_0.LocalPlayer.UserId;
    local v101 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_4) .. "/bundles/" .. tostring(v99) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v36(v101, true);
end;
local function v106(v103) --[[ Line: 333 ]] --[[ Name: deleteFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v36 (copy)
    local l_UserId_5 = l_Players_0.LocalPlayer.UserId;
    local v105 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_5) .. "/bundles/" .. tostring(v103) .. "/favorite", 
        Method = "DELETE"
    };
    return v36(v105, true);
end;
local function v109(v107) --[[ Line: 352 ]] --[[ Name: getEconomyProductInfo ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v108 = {
        Url = l_Url_0.ECONOMY_URL .. "v1/products/" .. tostring(v107) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v36(v108, true);
end;
local function v114(v110) --[[ Line: 365 ]] --[[ Name: getModelFromUserId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v111, v112) --[[ Line: 366 ]]
        -- upvalues: l_Players_0 (ref), v110 (copy)
        spawn(function() --[[ Line: 367 ]]
            -- upvalues: l_Players_0 (ref), v110 (ref), v111 (copy), v112 (copy)
            local v113 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromUserIdAsync(v110) else l_Players_0:CreateHumanoidModelFromUserId(v110);
            if v113 then
                v111(v113);
                return;
            else
                v112("Failure in getModelFromUserId");
                return;
            end;
        end);
    end);
end;
local function v119(v115, v116) --[[ Line: 385 ]] --[[ Name: getCollectibleResellableInstances ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v117 = l_Url_0:makeQueryString({
        ownerId = tostring(v116), 
        ownerType = "User", 
        cursor = "", 
        limit = 500
    });
    local v118 = {
        Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", l_Url_0.APIS_URL, v115, v117), 
        Method = "GET"
    };
    return v36(v118, true);
end;
local function v122(v120) --[[ Line: 402 ]] --[[ Name: getVersionInfo ]]
    -- upvalues: v9 (copy), v36 (copy)
    local v121 = {
        Url = string.format("%sv1/assets/%s/saved-versions", v9, v120), 
        Method = "GET"
    };
    return v36(v121, true);
end;
local function v125(v123) --[[ Line: 411 ]] --[[ Name: getExperiencePlayability ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v124 = {
        Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, v123), 
        Method = "GET"
    };
    return v36(v124, true);
end;
local function v128(v126) --[[ Line: 420 ]] --[[ Name: getExperienceInfo ]]
    -- upvalues: l_Url_0 (copy), v36 (copy)
    local v127 = {
        Url = string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, v126), 
        Method = "GET"
    };
    return v36(v127, true);
end;
return {
    new = function() --[[ Line: 431 ]] --[[ Name: new ]]
        -- upvalues: v45 (copy), v109 (copy), v68 (copy), v71 (copy), v76 (copy), v79 (copy), v82 (copy), v86 (copy), v90 (copy), v94 (copy), v98 (copy), v102 (copy), v106 (copy), v114 (copy), v119 (copy), v122 (copy), v125 (copy), v128 (copy), v62 (copy), v39 (copy), v52 (copy), v55 (copy)
        local v129 = {
            getProductInfo = v45, 
            getEconomyProductInfo = v109, 
            getPlayerName = v68, 
            getAssetBundles = v71, 
            getHumanoidDescriptionFromCostumeId = v76, 
            getAssetFavoriteCount = v79, 
            getBundleFavoriteCount = v82, 
            getFavoriteForAsset = v86, 
            getFavoriteForBundle = v90, 
            createFavoriteForAsset = v94, 
            deleteFavoriteForAsset = v98, 
            createFavoriteForBundle = v102, 
            deleteFavoriteForBundle = v106, 
            getModelFromUserId = v114, 
            getCollectibleResellableInstances = v119, 
            getVersionInfo = v122, 
            getExperiencePlayability = v125, 
            getExperienceInfo = v128, 
            getItemDetails = v62, 
            getPreviewAvatar = v39, 
            getBatchItemDetails = v52, 
            getBatchItemDetailsV2 = v55
        };
        setmetatable(v129, {
            __tostring = function() --[[ Line: 464 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v129;
    end
};