local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_InsertService_0 = game:GetService("InsertService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_CreatorStoreService_0 = game:GetService("CreatorStoreService");
local l_UrlBuilder_0 = require(l_Parent_0.PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v10 = require(l_script_FirstAncestor_0.Promise);
local v11 = require(l_script_FirstAncestor_0.Models.PremiumProduct);
local _ = require(l_script_FirstAncestor_0.types);
local v13 = require(l_script_FirstAncestor_0.Utils.debugLog);
local v14 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v15 = require(l_script_FirstAncestor_0.Utils.isGenericChallengeResponse);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnablePlayerOwnsBundleApi");
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local v24 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
v24 = string.gsub(v24, "http:", "https:");
local _ = string.gsub(v24, "https://www", "https://api");
local v26 = string.gsub(v24, "https://www", "https://apis");
local v27 = string.gsub(v24, "https://www", "https://games");
local v28 = string.gsub(v24, "https://www", "https://abtesting");
local v29 = string.gsub(v24, "https://www.", "https://catalog.");
local v30 = string.gsub(v24, "https://www.", "https://economy.");
local v31 = string.gsub(v24, "https://www.", "https://premiumfeatures.");
local v32 = string.gsub(v24, "https://www.", "https://economycreatorstats.");
local v33 = string.gsub(v24, "https://www", "https://users");
local function v42(v34, v35, v36) --[[ Line: 50 ]] --[[ Name: request ]]
    -- upvalues: v13 (copy), v14 (copy), l_HttpService_0 (copy)
    v13(function() --[[ Line: 51 ]]
        -- upvalues: v34 (copy), v14 (ref)
        return "Request " .. v34.Url .. "\n" .. v14(v34);
    end);
    return l_HttpService_0:RequestInternal(v34):Start(function(v37, v38) --[[ Line: 54 ]]
        -- upvalues: v13 (ref), v34 (copy), v14 (ref), l_HttpService_0 (ref), v35 (copy), v36 (copy)
        v13(function() --[[ Line: 55 ]]
            -- upvalues: v34 (ref), v14 (ref), v38 (copy)
            return "Response " .. v34.Url .. "\n" .. v14(v38);
        end);
        if v37 then
            local v39 = nil;
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v38.Body);
            v37 = l_status_0;
            v39 = l_result_0;
            if v37 then
                v35(v39);
                return;
            else
                v36("Could not parse JSON.");
                return;
            end;
        else
            v36((tostring(v38.StatusMessage)));
            return;
        end;
    end);
end;
local function v48(v43, v44) --[[ Line: 75 ]] --[[ Name: getABTestGroup ]]
    -- upvalues: v10 (copy), v42 (copy), v28 (copy), l_HttpService_0 (copy)
    local v45 = {
        {
            ExperimentName = v44, 
            SubjectType = 1, 
            SubjectTargetId = v43
        }
    };
    return v10.new(function(v46, v47) --[[ Line: 84 ]]
        -- upvalues: v42 (ref), v28 (ref), l_HttpService_0 (ref), v45 (copy)
        return v42({
            Url = v28 .. "v1/get-enrollments", 
            Method = "POST", 
            Body = l_HttpService_0:JSONEncode(v45), 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }, v46, v47);
    end);
end;
local function v51(v49, v50) --[[ Line: 97 ]] --[[ Name: getProductInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        return l_MarketplaceService_0:GetProductInfoAsync(v49, v50);
    else
        return l_MarketplaceService_0:GetProductInfo(v49, v50);
    end;
end;
local function v53(v52) --[[ Line: 105 ]] --[[ Name: getSubscriptionProductInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetSubscriptionProductInfoAsync(v52);
end;
local function v61() --[[ Line: 109 ]] --[[ Name: getPremiumProductInfo ]]
    -- upvalues: v10 (copy), v42 (copy), v31 (copy), v11 (copy), l_UserInputService_0 (copy)
    return v10.new(function(v54, v55) --[[ Line: 110 ]]
        -- upvalues: v42 (ref), v31 (ref), v11 (ref), l_UserInputService_0 (ref)
        v42({
            Url = v31 .. "v1/products?typeName=Subscription", 
            Method = "GET"
        }, function(v56) --[[ Line: 114 ]]
            -- upvalues: v11 (ref), l_UserInputService_0 (ref), v54 (copy)
            local v57 = nil;
            for _, v59 in ipairs(v56.products) do
                local v60 = v11(v59);
                if v60 ~= nil and (v57 == nil or v57.robuxAmount > v60.robuxAmount) then
                    v57 = v60;
                end;
            end;
            if l_UserInputService_0:GetPlatform() == Enum.Platform.Android and v57 ~= nil and v57.mobileProductId ~= nil then
                v57.mobileProductId = v57.mobileProductId:lower();
            end;
            v54(v57);
        end, v55);
    end);
end;
local function v65(v62, v63, v64) --[[ Line: 137 ]] --[[ Name: getPlayerOwns ]]
    -- upvalues: l_MarketplaceService_0 (copy), l_game_EngineFeature_0 (copy)
    if v64 == Enum.InfoType.Asset then
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return l_MarketplaceService_0:PlayerOwnsAssetAsync(v62, v63);
        else
            return l_MarketplaceService_0:PlayerOwnsAsset(v62, v63);
        end;
    elseif l_game_EngineFeature_0 and v64 == Enum.InfoType.Bundle then
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return l_MarketplaceService_0:PlayerOwnsBundleAsync(v62, v63);
        else
            return l_MarketplaceService_0:PlayerOwnsBundle(v62, v63);
        end;
    elseif v64 == Enum.InfoType.GamePass then
        return l_MarketplaceService_0:UserOwnsGamePassAsync(v62.UserId, v63);
    elseif v64 == Enum.InfoType.Subscription then
        return l_MarketplaceService_0:IsPlayerSubscribed(v62, v63);
    else
        return false;
    end;
end;
local function v78(v66, v67, v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 159 ]] --[[ Name: performPurchase ]]
    -- upvalues: v17 (copy), v18 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_MarketplaceService_0 (copy), v15 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v17 (ref), v18 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_MarketplaceService_0 (ref), v66 (copy), v67 (copy), v68 (copy), v69 (copy), v70 (copy), v71 (copy), v72 (copy), v73 (copy), v74 (copy), v75 (copy)
        if v17() or v18() then
            if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then
                return l_MarketplaceService_0:PerformPurchase(v66, v67, v68, v69, v70, v71, v72, v73, v74, v75);
            else
                return l_MarketplaceService_0:PerformPurchase(v66, v67, v68, v69, v70, v71, v72, v73, v74);
            end;
        else
            return l_MarketplaceService_0:PerformPurchase(v66, v67, v68, v69, v70, v71, v72, v73);
        end;
    end);
    if l_status_1 then
        return l_result_1;
    elseif v15(l_result_1) then
        return l_result_1;
    else
        error((tostring(l_result_1)));
        return;
    end;
end;
local function v92(v79, v80, v81, v82, v83, v84, v85, v86, v87, v88) --[[ Line: 226 ]] --[[ Name: performPurchaseV2 ]]
    -- upvalues: l_MarketplaceService_0 (copy), v15 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 238 ]]
        -- upvalues: v84 (copy), v85 (copy), v86 (copy), v87 (copy), v88 (copy), l_MarketplaceService_0 (ref), v79 (copy), v80 (copy), v81 (copy), v82 (copy), v83 (copy)
        local v89 = {
            CollectibleItemId = v84, 
            CollectibleProductId = v85, 
            IdempotencyKey = v86, 
            PurchaseAuthToken = v87, 
            CollectibleItemInstanceId = v88
        };
        return l_MarketplaceService_0:PerformPurchaseV2(v79, v80, v81, v82, v83, v89);
    end);
    if l_status_2 then
        return l_result_2;
    elseif v15(l_result_2) then
        return l_result_2;
    else
        error((tostring(l_result_2)));
        return;
    end;
end;
local function v97(v93, v94) --[[ Line: 271 ]] --[[ Name: performCreatorStorePurchase ]]
    -- upvalues: l_CreatorStoreService_0 (copy), v15 (copy)
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 272 ]]
        -- upvalues: l_CreatorStoreService_0 (ref), v93 (copy), v94 (copy)
        return l_CreatorStoreService_0:performCreatorStorePurchase(v93, v94);
    end);
    if l_status_3 then
        return l_result_3;
    elseif v15(l_result_3) then
        return l_result_3;
    else
        error((tostring(l_result_3)));
        return;
    end;
end;
local function v99(v98) --[[ Line: 291 ]] --[[ Name: getAssetInfo ]]
    -- upvalues: l_CreatorStoreService_0 (copy)
    return l_CreatorStoreService_0:getAssetInfoAsync(v98);
end;
local function v102(v100, v101) --[[ Line: 295 ]] --[[ Name: getCreatorStoreProductInfo ]]
    -- upvalues: l_CreatorStoreService_0 (copy)
    return l_CreatorStoreService_0:getCreatorStoreProductInfoAsync(v100, v101);
end;
local function v104(v103) --[[ Line: 299 ]] --[[ Name: loadAssetForEquip ]]
    -- upvalues: l_InsertService_0 (copy)
    return l_InsertService_0:LoadAsset(v103);
end;
local function v107() --[[ Line: 303 ]] --[[ Name: getAccountInfo ]]
    -- upvalues: v10 (copy), v42 (copy), v33 (copy)
    return v10.new(function(v105, v106) --[[ Line: 304 ]]
        -- upvalues: v42 (ref), v33 (ref)
        v42({
            Url = v33 .. "v1/users/authenticated/app-launch-info", 
            Method = "GET"
        }, v105, v106);
    end);
end;
local function v110() --[[ Line: 312 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v10 (copy), v42 (copy), v30 (copy)
    return v10.new(function(v108, v109) --[[ Line: 313 ]]
        -- upvalues: v42 (ref), v30 (ref)
        v42({
            Url = v30 .. "v1/user/currency", 
            Method = "GET"
        }, v108, v109);
    end);
end;
local function v115(v111) --[[ Line: 321 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v29 (copy), v10 (copy), v42 (copy)
    local v112 = {
        Url = v29 .. "v1/bundles/" .. tostring(v111) .. "/details", 
        Method = "GET"
    };
    return v10.new(function(v113, v114) --[[ Line: 328 ]]
        -- upvalues: v42 (ref), v112 (copy)
        spawn(function() --[[ Line: 329 ]]
            -- upvalues: v42 (ref), v112 (ref), v113 (copy), v114 (copy)
            v42(v112, v113, v114);
        end);
    end);
end;
local function v120(v116) --[[ Line: 335 ]] --[[ Name: getProductPurchasableDetails ]]
    -- upvalues: v30 (copy), v10 (copy), v42 (copy)
    local v117 = {
        Url = v30 .. "v1/products/" .. tostring(v116) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v10.new(function(v118, v119) --[[ Line: 342 ]]
        -- upvalues: v42 (ref), v117 (copy)
        spawn(function() --[[ Line: 343 ]]
            -- upvalues: v42 (ref), v117 (ref), v118 (copy), v119 (copy)
            v42(v117, v118, v119);
        end);
    end);
end;
local function v126(v121, v122) --[[ Line: 349 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v29 (copy), v10 (copy), v42 (copy)
    local v123 = {
        Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", v29, v121, v122), 
        Method = "GET"
    };
    return v10.new(function(v124, v125) --[[ Line: 355 ]]
        -- upvalues: v42 (ref), v123 (copy)
        spawn(function() --[[ Line: 356 ]]
            -- upvalues: v42 (ref), v123 (ref), v124 (copy), v125 (copy)
            v42(v123, v124, v125);
        end);
    end);
end;
local function v132() --[[ Line: 362 ]] --[[ Name: postPremiumImpression ]]
    -- upvalues: v32 (copy), l_HttpService_0 (copy), v10 (copy)
    local v127 = {
        Url = v32 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(_, _) --[[ Line: 377 ]]
        -- upvalues: l_HttpService_0 (ref), v127 (copy)
        spawn(function() --[[ Line: 378 ]]
            -- upvalues: l_HttpService_0 (ref), v127 (ref)
            return l_HttpService_0:RequestInternal(v127):Start(function(_, _) --[[ Line: 379 ]]

            end);
        end);
    end);
end;
local function v138() --[[ Line: 386 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v31 (copy), l_Players_0 (copy), v10 (copy), l_HttpService_0 (copy)
    local v133 = {
        Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", v31, l_Players_0.LocalPlayer.UserId, game.GameId, game.PlaceId), 
        Method = "GET"
    };
    return v10.new(function(v134, v135) --[[ Line: 398 ]]
        -- upvalues: l_HttpService_0 (ref), v133 (copy)
        spawn(function() --[[ Line: 399 ]]
            -- upvalues: l_HttpService_0 (ref), v133 (ref), v134 (copy), v135 (copy)
            return l_HttpService_0:RequestInternal(v133):Start(function(v136, v137) --[[ Line: 400 ]]
                -- upvalues: v134 (ref), v135 (ref)
                if v136 and v137.StatusCode == 200 then
                    v134();
                    return;
                else
                    v135();
                    return;
                end;
            end);
        end);
    end);
end;
local function v140(v139) --[[ Line: 411 ]] --[[ Name: getSubscriptionPurchaseInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetSubscriptionPurchaseInfoAsync(v139);
end;
local function v143(v141, v142) --[[ Line: 415 ]] --[[ Name: performSubscriptionPurchase ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:PerformSubscriptionPurchaseV2(v141, v142);
end;
local function v150(v144, v145, v146) --[[ Line: 419 ]] --[[ Name: getPurchaseWarning ]]
    -- upvalues: l_UrlBuilder_0 (copy), v10 (copy), v42 (copy)
    local v147 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.getPurchaseWarning(v144, v145, not v146), 
        Method = "GET"
    };
    return v10.new(function(v148, v149) --[[ Line: 425 ]]
        -- upvalues: v42 (ref), v147 (copy)
        spawn(function() --[[ Line: 426 ]]
            -- upvalues: v42 (ref), v147 (ref), v148 (copy), v149 (copy)
            v42(v147, v148, v149);
        end);
    end);
end;
local function v157(v151) --[[ Line: 432 ]] --[[ Name: postPurchaseWarningAcknowledge ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v10 (copy)
    local v152 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.ackPurchaseWarning(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            acknowledgement = v151
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(_, _) --[[ Line: 446 ]]
        -- upvalues: l_HttpService_0 (ref), v152 (copy)
        spawn(function() --[[ Line: 447 ]]
            -- upvalues: l_HttpService_0 (ref), v152 (ref)
            return l_HttpService_0:RequestInternal(v152):Start(function(_, _) --[[ Line: 448 ]]

            end);
        end);
    end);
end;
local function v161() --[[ Line: 455 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v10 (copy), v42 (copy)
    local v158 = {
        Url = l_UrlBuilder_0.economy.paymentsGateway.checkUserPurchaseSettings(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v159, v160) --[[ Line: 468 ]]
        -- upvalues: v42 (ref), v158 (copy)
        spawn(function() --[[ Line: 469 ]]
            -- upvalues: v42 (ref), v158 (ref), v159 (copy), v160 (copy)
            v42(v158, v159, v160);
        end);
    end);
end;
local function v165() --[[ Line: 475 ]] --[[ Name: getVngShopUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v10 (copy), v42 (copy)
    local v162 = {
        Url = l_UrlBuilder_0.economy.vngPayments.getVngShopUrl(), 
        Method = "GET"
    };
    return v10.new(function(v163, v164) --[[ Line: 483 ]]
        -- upvalues: v42 (ref), v162 (copy)
        spawn(function() --[[ Line: 484 ]]
            -- upvalues: v42 (ref), v162 (ref), v163 (copy), v164 (copy)
            v42(v162, v163, v164);
        end);
    end);
end;
local function v171(v166, v167) --[[ Line: 490 ]] --[[ Name: performDevProductEdpPurchase ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), v10 (copy), v42 (copy)
    local v168 = {
        Url = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(v26, v166), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v167), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v169, v170) --[[ Line: 506 ]]
        -- upvalues: v42 (ref), v168 (copy)
        spawn(function() --[[ Line: 507 ]]
            -- upvalues: v42 (ref), v168 (ref), v169 (copy), v170 (copy)
            v42(v168, v169, v170);
        end);
    end);
end;
local function v176(v172) --[[ Line: 513 ]] --[[ Name: getExperienceProductInfo ]]
    -- upvalues: v27 (copy), v10 (copy), v42 (copy)
    local v173 = {
        Url = ("%sv1/games/games-product-info?universeIds=%s"):format(v27, v172), 
        Method = "GET"
    };
    return v10.new(function(v174, v175) --[[ Line: 521 ]]
        -- upvalues: v42 (ref), v173 (copy)
        spawn(function() --[[ Line: 522 ]]
            -- upvalues: v42 (ref), v173 (ref), v174 (copy), v175 (copy)
            v42(v173, v174, v175);
        end);
    end);
end;
local function v182(v177, v178) --[[ Line: 528 ]] --[[ Name: performExperiencePurchase ]]
    -- upvalues: v30 (copy), l_HttpService_0 (copy), v10 (copy), v42 (copy)
    local v179 = {
        Url = ("%sv1/purchases/products/%s"):format(v30, v177), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v178), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v180, v181) --[[ Line: 541 ]]
        -- upvalues: v42 (ref), v179 (copy)
        spawn(function() --[[ Line: 542 ]]
            -- upvalues: v42 (ref), v179 (ref), v180 (copy), v181 (copy)
            v42(v179, v180, v181);
        end);
    end);
end;
local function v188(v183, v184) --[[ Line: 548 ]] --[[ Name: performLookPurchase ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), v10 (copy), v42 (copy)
    local v185 = {
        Url = ("%slook-api/v2/looks/%s/purchase"):format(v26, v183), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v184), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v186, v187) --[[ Line: 561 ]]
        -- upvalues: v42 (ref), v185 (copy)
        spawn(function() --[[ Line: 562 ]]
            -- upvalues: v42 (ref), v185 (ref), v186 (copy), v187 (copy)
            v42(v185, v186, v187);
        end);
    end);
end;
local function v194(v189, v190) --[[ Line: 568 ]] --[[ Name: performDeveloperSubscriptionRobuxPurchase ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), v10 (copy), v42 (copy)
    local v191 = {
        Url = ("%sv1/subscriptions/purchase-with-robux/%s"):format(v26, v189), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            priceInRobux = v190
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v192, v193) --[[ Line: 581 ]]
        -- upvalues: v42 (ref), v191 (copy)
        spawn(function() --[[ Line: 582 ]]
            -- upvalues: v42 (ref), v191 (ref), v192 (copy), v193 (copy)
            v42(v191, v192, v193);
        end);
    end);
end;
local function v198() --[[ Line: 588 ]] --[[ Name: getUnifiedPurchaseFlowUserEligibility ]]
    -- upvalues: v26 (copy), v10 (copy), v42 (copy)
    local v195 = {
        Url = ("%sroblox-subscriptions/v1/metadata"):format(v26), 
        Method = "GET"
    };
    return v10.new(function(v196, v197) --[[ Line: 596 ]]
        -- upvalues: v42 (ref), v195 (copy)
        spawn(function() --[[ Line: 597 ]]
            -- upvalues: v42 (ref), v195 (ref), v196 (copy), v197 (copy)
            v42(v195, v196, v197);
        end);
    end);
end;
return {
    new = function() --[[ Line: 607 ]] --[[ Name: new ]]
        -- upvalues: v10 (copy), v48 (copy), v51 (copy), v65 (copy), v78 (copy), v92 (copy), v20 (copy), v97 (copy), v104 (copy), v107 (copy), v99 (copy), v110 (copy), v115 (copy), v120 (copy), v19 (copy), v126 (copy), v102 (copy), v61 (copy), v132 (copy), v138 (copy), v140 (copy), v143 (copy), v150 (copy), v157 (copy), v161 (copy), v165 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v171 (copy), v176 (copy), v182 (copy), v188 (copy), v198 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v194 (copy), v53 (copy)
        local v199 = {
            getABTestGroup = v10.promisify(v48), 
            getProductInfo = v10.promisify(v51), 
            getPlayerOwns = v10.promisify(v65), 
            performPurchase = v10.promisify(v78), 
            performPurchaseV2 = v10.promisify(v92), 
            performCreatorStorePurchase = if v20() then v10.promisify(v97) else nil, 
            loadAssetForEquip = v10.promisify(v104), 
            getAccountInfo = v10.promisify(v107), 
            getAssetInfo = if v20() then v10.promisify(v99) else nil, 
            getBalanceInfo = v10.promisify(v110), 
            getBundleDetails = v115, 
            getProductPurchasableDetails = v120, 
            getCatalogItemDetails = if v19() then v126 else nil, 
            getCreatorStoreProductInfo = if v20() then v10.promisify(v102) else nil, 
            getPremiumProductInfo = v10.promisify(v61), 
            postPremiumImpression = v10.promisify(v132), 
            getPremiumUpsellPrecheck = v10.promisify(v138), 
            getSubscriptionPurchaseInfo = v10.promisify(v140), 
            performSubscriptionPurchase = v10.promisify(v143), 
            getPurchaseWarning = v10.promisify(v150), 
            postPurchaseWarningAcknowledge = v10.promisify(v157), 
            checkUserPurchaseSettings = v10.promisify(v161), 
            getVngShopUrl = v10.promisify(v165), 
            performDevProductEdpPurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v171) else nil, 
            getExperienceProductInfo = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v176) else nil, 
            performExperiencePurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v182) else nil, 
            performLookPurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v188) else nil, 
            getUnifiedPurchaseFlowUserEligibility = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v198) else nil, 
            performDeveloperSubscriptionRobuxPurchase = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v10.promisify(v194) else nil, 
            getSubscriptionProductInfo = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v10.promisify(v53) else nil
        };
        setmetatable(v199, {
            __tostring = function() --[[ Line: 662 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v199;
    end
};