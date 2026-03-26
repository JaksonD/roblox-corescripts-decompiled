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
local v10 = game:DefineFastFlag("AXEnableIaBRbxClientFeature", false);
local v11 = game:DefineFastString("InspectAndBuyFeature", "InspectAndBuy");
local function _(v12, v13, v14, v15) --[[ Line: 29 ]] --[[ Name: request ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:RequestInternal(v12):Start(function(v16, v17) --[[ Line: 30 ]]
        -- upvalues: v13 (copy), l_HttpService_0 (ref), v14 (copy), v15 (copy)
        if v16 and v17.StatusCode == 200 then
            local v18 = true;
            local v19 = nil;
            if v13 and v17.Body ~= "null" then
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v17.Body);
                v18 = l_status_0;
                v19 = l_result_0;
            else
                v19 = v17.Body;
            end;
            if v18 then
                v14(v19);
                return;
            else
                v15("Could not parse JSON.");
                return;
            end;
        else
            v15(v17);
            return;
        end;
    end);
end;
local function v38(v23, v24) --[[ Line: 52 ]] --[[ Name: createYieldingPromise ]]
    -- upvalues: v10 (copy), v11 (copy), v4 (copy), l_HttpService_0 (copy)
    if v10 then
        v23.Headers = v23.Headers or {};
        v23.Headers["rbx-client-feature"] = v11;
    end;
    return v4.new(function(v25, v26) --[[ Line: 57 ]]
        -- upvalues: v23 (copy), v24 (copy), l_HttpService_0 (ref)
        coroutine.wrap(function() --[[ Line: 58 ]]
            -- upvalues: v23 (ref), v24 (ref), v25 (copy), v26 (copy), l_HttpService_0 (ref)
            local l_v23_0 = v23;
            local l_v24_0 = v24;
            local l_v25_0 = v25;
            local l_v26_0 = v26;
            local _ = l_HttpService_0:RequestInternal(l_v23_0):Start(function(v31, v32) --[[ Line: 30 ]]
                -- upvalues: l_v24_0 (copy), l_HttpService_0 (ref), l_v25_0 (copy), l_v26_0 (copy)
                if v31 and v32.StatusCode == 200 then
                    local v33 = true;
                    local v34 = nil;
                    if l_v24_0 and v32.Body ~= "null" then
                        local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v32.Body);
                        v33 = l_status_1;
                        v34 = l_result_1;
                    else
                        v34 = v32.Body;
                    end;
                    if v33 then
                        l_v25_0(v34);
                        return;
                    else
                        l_v26_0("Could not parse JSON.");
                        return;
                    end;
                else
                    l_v26_0(v32);
                    return;
                end;
            end);
        end)();
    end);
end;
local function v41(v39) --[[ Line: 67 ]] --[[ Name: getPreviewAvatar ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v38 (copy)
    local v40 = {
        Url = l_Url_0.APIS_URL .. "look-api/v1/looks/purchase-details", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            assets = v39
        }), 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v38(v40, true);
end;
local function v47(v42) --[[ Line: 85 ]] --[[ Name: getProductInfo ]]
    -- upvalues: v4 (copy), l_MarketplaceService_0 (copy)
    return v4.new(function(v43, v44) --[[ Line: 86 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v42 (copy)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 87 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v42 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_MarketplaceService_0:GetProductInfoAsync(v42);
            else
                return l_MarketplaceService_0:GetProductInfo(v42);
            end;
        end);
        if l_status_2 then
            v43(l_result_2);
            return;
        else
            v44("Failure in getProductInfo: ", (tostring(l_result_2)));
            return;
        end;
    end);
end;
local function v54(v48, v49) --[[ Line: 106 ]] --[[ Name: getBatchItemDetails ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy)
    return v4.new(function(v50, v51) --[[ Line: 107 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v48 (copy), v49 (copy)
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 108 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v48 (ref), v49 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetBatchItemDetailsAsync(v48, v49);
            else
                return l_AvatarEditorService_0:GetBatchItemDetails(v48, v49);
            end;
        end);
        if l_status_3 then
            v50(l_result_3);
            return;
        else
            v51("Failure in batchGetItemDetails: ", (tostring(l_result_3)));
            return;
        end;
    end);
end;
local function v57(v55) --[[ Line: 129 ]] --[[ Name: getBatchItemDetailsV2 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v38 (copy)
    local v56 = {
        Url = l_Url_0.CATALOG_URL .. "v1/catalog/items/details", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            items = v55
        }), 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v38(v56, true);
end;
local function v64(v58, v59) --[[ Line: 147 ]] --[[ Name: getItemDetails ]]
    -- upvalues: v4 (copy), l_AvatarEditorService_0 (copy)
    return v4.new(function(v60, v61) --[[ Line: 148 ]]
        -- upvalues: l_AvatarEditorService_0 (ref), v58 (copy), v59 (copy)
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 149 ]]
            -- upvalues: l_AvatarEditorService_0 (ref), v58 (ref), v59 (ref)
            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                return l_AvatarEditorService_0:GetItemDetailsAsync(v58, v59);
            else
                return l_AvatarEditorService_0:GetItemDetails(v58, v59);
            end;
        end);
        if l_status_4 then
            v60(l_result_4);
            return;
        else
            v61("Failure in getItemDetails: ", (tostring(l_result_4)));
            return;
        end;
    end);
end;
local function v70(v65) --[[ Line: 168 ]] --[[ Name: getPlayerName ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v66, v67) --[[ Line: 169 ]]
        -- upvalues: l_Players_0 (ref), v65 (copy)
        local l_status_5, l_result_5 = pcall(function() --[[ Line: 170 ]]
            -- upvalues: l_Players_0 (ref), v65 (ref)
            return l_Players_0:GetNameFromUserIdAsync(v65);
        end);
        if l_status_5 then
            v66(l_result_5);
            return;
        else
            v67("Failure in getPlayerName: ", (tostring(l_result_5)));
            return;
        end;
    end);
end;
local function v73(v71) --[[ Line: 185 ]] --[[ Name: getAssetBundles ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v72 = {
        Url = l_Url_0.CATALOG_URL .. "v1/assets/" .. tostring(v71) .. "/bundles", 
        Method = "GET"
    };
    return v38(v72, true);
end;
local function v78(v74) --[[ Line: 198 ]] --[[ Name: getHumanoidDescriptionFromCostumeId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v75, _) --[[ Line: 199 ]]
        -- upvalues: l_Players_0 (ref), v74 (copy)
        spawn(function() --[[ Line: 200 ]]
            -- upvalues: l_Players_0 (ref), v74 (ref), v75 (copy)
            local v77 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:GetHumanoidDescriptionFromOutfitIdAsync(v74) else l_Players_0:GetHumanoidDescriptionFromOutfitId(v74);
            if v77 then
                v75(v77);
            end;
        end);
    end);
end;
local function v81(v79) --[[ Line: 215 ]] --[[ Name: getAssetFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v80 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/assets/" .. tostring(v79) .. "/count", 
        Method = "GET"
    };
    return v38(v80, false);
end;
local function v84(v82) --[[ Line: 228 ]] --[[ Name: getBundleFavoriteCount ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v83 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(v82) .. "/count", 
        Method = "GET"
    };
    return v38(v83, false);
end;
local function v88(v85) --[[ Line: 241 ]] --[[ Name: getFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v38 (copy)
    local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
    local v87 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_0) .. "/assets/" .. tostring(v85) .. "/favorite", 
        Method = "GET"
    };
    return v38(v87, true);
end;
local function v92(v89) --[[ Line: 260 ]] --[[ Name: getFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v38 (copy)
    local l_UserId_1 = l_Players_0.LocalPlayer.UserId;
    local v91 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_1) .. "/bundles/" .. tostring(v89) .. "/favorite", 
        Method = "GET"
    };
    return v38(v91, true);
end;
local function v96(v93) --[[ Line: 279 ]] --[[ Name: createFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v38 (copy)
    local l_UserId_2 = l_Players_0.LocalPlayer.UserId;
    local v95 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_2) .. "/assets/" .. tostring(v93) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v38(v95, true);
end;
local function v100(v97) --[[ Line: 299 ]] --[[ Name: deleteFavoriteForAsset ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v38 (copy)
    local l_UserId_3 = l_Players_0.LocalPlayer.UserId;
    local v99 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_3) .. "/assets/" .. tostring(v97) .. "/favorite", 
        Method = "DELETE"
    };
    return v38(v99, true);
end;
local function v104(v101) --[[ Line: 318 ]] --[[ Name: createFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v38 (copy)
    local l_UserId_4 = l_Players_0.LocalPlayer.UserId;
    local v103 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_4) .. "/bundles/" .. tostring(v101) .. "/favorite", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({})
    };
    return v38(v103, true);
end;
local function v108(v105) --[[ Line: 338 ]] --[[ Name: deleteFavoriteForBundle ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), v38 (copy)
    local l_UserId_5 = l_Players_0.LocalPlayer.UserId;
    local v107 = {
        Url = l_Url_0.CATALOG_URL .. "v1/favorites/users/" .. tostring(l_UserId_5) .. "/bundles/" .. tostring(v105) .. "/favorite", 
        Method = "DELETE"
    };
    return v38(v107, true);
end;
local function v111(v109) --[[ Line: 357 ]] --[[ Name: getEconomyProductInfo ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v110 = {
        Url = l_Url_0.ECONOMY_URL .. "v1/products/" .. tostring(v109) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v38(v110, true);
end;
local function v116(v112) --[[ Line: 370 ]] --[[ Name: getModelFromUserId ]]
    -- upvalues: v4 (copy), l_Players_0 (copy)
    return v4.new(function(v113, v114) --[[ Line: 371 ]]
        -- upvalues: l_Players_0 (ref), v112 (copy)
        spawn(function() --[[ Line: 372 ]]
            -- upvalues: l_Players_0 (ref), v112 (ref), v113 (copy), v114 (copy)
            local v115 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromUserIdAsync(v112) else l_Players_0:CreateHumanoidModelFromUserId(v112);
            if v115 then
                v113(v115);
                return;
            else
                v114("Failure in getModelFromUserId");
                return;
            end;
        end);
    end);
end;
local function v121(v117, v118) --[[ Line: 389 ]] --[[ Name: getCollectibleResellableInstances ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v119 = l_Url_0:makeQueryString({
        ownerId = tostring(v118), 
        ownerType = "User", 
        cursor = "", 
        limit = 500
    });
    local v120 = {
        Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", l_Url_0.APIS_URL, v117, v119), 
        Method = "GET"
    };
    return v38(v120, true);
end;
local function v124(v122) --[[ Line: 406 ]] --[[ Name: getVersionInfo ]]
    -- upvalues: v9 (copy), v38 (copy)
    local v123 = {
        Url = string.format("%sv1/assets/%s/saved-versions", v9, v122), 
        Method = "GET"
    };
    return v38(v123, true);
end;
local function v127(v125) --[[ Line: 415 ]] --[[ Name: getExperiencePlayability ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v126 = {
        Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", l_Url_0.GAME_URL, v125), 
        Method = "GET"
    };
    return v38(v126, true);
end;
local function v130(v128) --[[ Line: 424 ]] --[[ Name: getExperienceInfo ]]
    -- upvalues: l_Url_0 (copy), v38 (copy)
    local v129 = {
        Url = string.format("%sv1/games?universeIds=%s", l_Url_0.GAME_URL, v128), 
        Method = "GET"
    };
    return v38(v129, true);
end;
return {
    new = function() --[[ Line: 435 ]] --[[ Name: new ]]
        -- upvalues: v47 (copy), v111 (copy), v70 (copy), v73 (copy), v78 (copy), v81 (copy), v84 (copy), v88 (copy), v92 (copy), v96 (copy), v100 (copy), v104 (copy), v108 (copy), v116 (copy), v121 (copy), v124 (copy), v127 (copy), v130 (copy), v64 (copy), v41 (copy), v54 (copy), v57 (copy)
        local v131 = {
            getProductInfo = v47, 
            getEconomyProductInfo = v111, 
            getPlayerName = v70, 
            getAssetBundles = v73, 
            getHumanoidDescriptionFromCostumeId = v78, 
            getAssetFavoriteCount = v81, 
            getBundleFavoriteCount = v84, 
            getFavoriteForAsset = v88, 
            getFavoriteForBundle = v92, 
            createFavoriteForAsset = v96, 
            deleteFavoriteForAsset = v100, 
            createFavoriteForBundle = v104, 
            deleteFavoriteForBundle = v108, 
            getModelFromUserId = v116, 
            getCollectibleResellableInstances = v121, 
            getVersionInfo = v124, 
            getExperiencePlayability = v127, 
            getExperienceInfo = v130, 
            getItemDetails = v64, 
            getPreviewAvatar = v41, 
            getBatchItemDetails = v54, 
            getBatchItemDetailsV2 = v57
        };
        setmetatable(v131, {
            __tostring = function() --[[ Line: 468 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v131;
    end
};