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
local l_game_EngineFeature_1 = game:GetEngineFeature("EnableDevSubscriptionPurchaseWithRobux");
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePromptPurchaseRequestedV2Take2);
local v20 = require(l_script_FirstAncestor_0.Flags.GetFFlagUseCatalogItemDetailsToResolveBundlePurchase);
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableCreatorStorePurchasingCutover);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_Parent_0.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local v25 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
v25 = string.gsub(v25, "http:", "https:");
local _ = string.gsub(v25, "https://www", "https://api");
local v27 = string.gsub(v25, "https://www", "https://apis");
local v28 = string.gsub(v25, "https://www", "https://games");
local v29 = string.gsub(v25, "https://www", "https://abtesting");
local v30 = string.gsub(v25, "https://www.", "https://catalog.");
local v31 = string.gsub(v25, "https://www.", "https://economy.");
local v32 = string.gsub(v25, "https://www.", "https://premiumfeatures.");
local v33 = string.gsub(v25, "https://www.", "https://economycreatorstats.");
local v34 = string.gsub(v25, "https://www", "https://users");
local function v43(v35, v36, v37) --[[ Line: 51 ]] --[[ Name: request ]]
    -- upvalues: v13 (copy), v14 (copy), l_HttpService_0 (copy)
    v13(function() --[[ Line: 52 ]]
        -- upvalues: v35 (copy), v14 (ref)
        return "Request " .. v35.Url .. "\n" .. v14(v35);
    end);
    return l_HttpService_0:RequestInternal(v35):Start(function(v38, v39) --[[ Line: 55 ]]
        -- upvalues: v13 (ref), v35 (copy), v14 (ref), l_HttpService_0 (ref), v36 (copy), v37 (copy)
        v13(function() --[[ Line: 56 ]]
            -- upvalues: v35 (ref), v14 (ref), v39 (copy)
            return "Response " .. v35.Url .. "\n" .. v14(v39);
        end);
        if v38 then
            local v40 = nil;
            local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v39.Body);
            v38 = l_status_0;
            v40 = l_result_0;
            if v38 then
                v36(v40);
                return;
            else
                v37("Could not parse JSON.");
                return;
            end;
        else
            v37((tostring(v39.StatusMessage)));
            return;
        end;
    end);
end;
local function v49(v44, v45) --[[ Line: 76 ]] --[[ Name: getABTestGroup ]]
    -- upvalues: v10 (copy), v43 (copy), v29 (copy), l_HttpService_0 (copy)
    local v46 = {
        {
            ExperimentName = v45, 
            SubjectType = 1, 
            SubjectTargetId = v44
        }
    };
    return v10.new(function(v47, v48) --[[ Line: 85 ]]
        -- upvalues: v43 (ref), v29 (ref), l_HttpService_0 (ref), v46 (copy)
        return v43({
            Url = v29 .. "v1/get-enrollments", 
            Method = "POST", 
            Body = l_HttpService_0:JSONEncode(v46), 
            Headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }, v47, v48);
    end);
end;
local function v52(v50, v51) --[[ Line: 98 ]] --[[ Name: getProductInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
        return l_MarketplaceService_0:GetProductInfoAsync(v50, v51);
    else
        return l_MarketplaceService_0:GetProductInfo(v50, v51);
    end;
end;
local function v54(v53) --[[ Line: 106 ]] --[[ Name: getSubscriptionProductInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetSubscriptionProductInfoAsync(v53);
end;
local function v62() --[[ Line: 110 ]] --[[ Name: getPremiumProductInfo ]]
    -- upvalues: v10 (copy), v43 (copy), v32 (copy), v11 (copy), l_UserInputService_0 (copy)
    return v10.new(function(v55, v56) --[[ Line: 111 ]]
        -- upvalues: v43 (ref), v32 (ref), v11 (ref), l_UserInputService_0 (ref)
        v43({
            Url = v32 .. "v1/products?typeName=Subscription", 
            Method = "GET"
        }, function(v57) --[[ Line: 115 ]]
            -- upvalues: v11 (ref), l_UserInputService_0 (ref), v55 (copy)
            local v58 = nil;
            for _, v60 in ipairs(v57.products) do
                local v61 = v11(v60);
                if v61 ~= nil and (v58 == nil or v58.robuxAmount > v61.robuxAmount) then
                    v58 = v61;
                end;
            end;
            if l_UserInputService_0:GetPlatform() == Enum.Platform.Android and v58 ~= nil and v58.mobileProductId ~= nil then
                v58.mobileProductId = v58.mobileProductId:lower();
            end;
            v55(v58);
        end, v56);
    end);
end;
local function v66(v63, v64, v65) --[[ Line: 138 ]] --[[ Name: getPlayerOwns ]]
    -- upvalues: l_MarketplaceService_0 (copy), l_game_EngineFeature_0 (copy)
    if v65 == Enum.InfoType.Asset then
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return l_MarketplaceService_0:PlayerOwnsAssetAsync(v63, v64);
        else
            return l_MarketplaceService_0:PlayerOwnsAsset(v63, v64);
        end;
    elseif l_game_EngineFeature_0 and v65 == Enum.InfoType.Bundle then
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return l_MarketplaceService_0:PlayerOwnsBundleAsync(v63, v64);
        else
            return l_MarketplaceService_0:PlayerOwnsBundle(v63, v64);
        end;
    elseif v65 == Enum.InfoType.GamePass then
        return l_MarketplaceService_0:UserOwnsGamePassAsync(v63.UserId, v64);
    elseif v65 == Enum.InfoType.Subscription then
        return l_MarketplaceService_0:IsPlayerSubscribed(v63, v64);
    else
        return false;
    end;
end;
local function v79(v67, v68, v69, v70, v71, v72, v73, v74, v75, v76) --[[ Line: 160 ]] --[[ Name: performPurchase ]]
    -- upvalues: v18 (copy), v19 (copy), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_MarketplaceService_0 (copy), v15 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 172 ]]
        -- upvalues: v18 (ref), v19 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (ref), l_MarketplaceService_0 (ref), v67 (copy), v68 (copy), v69 (copy), v70 (copy), v71 (copy), v72 (copy), v73 (copy), v74 (copy), v75 (copy), v76 (copy)
        if v18() or v19() then
            if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then
                return l_MarketplaceService_0:PerformPurchase(v67, v68, v69, v70, v71, v72, v73, v74, v75, v76);
            else
                return l_MarketplaceService_0:PerformPurchase(v67, v68, v69, v70, v71, v72, v73, v74, v75);
            end;
        else
            return l_MarketplaceService_0:PerformPurchase(v67, v68, v69, v70, v71, v72, v73, v74);
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
local function v93(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89) --[[ Line: 227 ]] --[[ Name: performPurchaseV2 ]]
    -- upvalues: l_MarketplaceService_0 (copy), v15 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 239 ]]
        -- upvalues: v85 (copy), v86 (copy), v87 (copy), v88 (copy), v89 (copy), l_MarketplaceService_0 (ref), v80 (copy), v81 (copy), v82 (copy), v83 (copy), v84 (copy)
        local v90 = {
            CollectibleItemId = v85, 
            CollectibleProductId = v86, 
            IdempotencyKey = v87, 
            PurchaseAuthToken = v88, 
            CollectibleItemInstanceId = v89
        };
        return l_MarketplaceService_0:PerformPurchaseV2(v80, v81, v82, v83, v84, v90);
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
local function v98(v94, v95) --[[ Line: 272 ]] --[[ Name: performCreatorStorePurchase ]]
    -- upvalues: l_CreatorStoreService_0 (copy), v15 (copy)
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 273 ]]
        -- upvalues: l_CreatorStoreService_0 (ref), v94 (copy), v95 (copy)
        return l_CreatorStoreService_0:performCreatorStorePurchase(v94, v95);
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
local function v100(v99) --[[ Line: 292 ]] --[[ Name: getAssetInfo ]]
    -- upvalues: l_CreatorStoreService_0 (copy)
    return l_CreatorStoreService_0:getAssetInfoAsync(v99);
end;
local function v103(v101, v102) --[[ Line: 296 ]] --[[ Name: getCreatorStoreProductInfo ]]
    -- upvalues: l_CreatorStoreService_0 (copy)
    return l_CreatorStoreService_0:getCreatorStoreProductInfoAsync(v101, v102);
end;
local function v105(v104) --[[ Line: 300 ]] --[[ Name: loadAssetForEquip ]]
    -- upvalues: l_InsertService_0 (copy)
    return l_InsertService_0:LoadAsset(v104);
end;
local function v108() --[[ Line: 304 ]] --[[ Name: getAccountInfo ]]
    -- upvalues: v10 (copy), v43 (copy), v34 (copy)
    return v10.new(function(v106, v107) --[[ Line: 305 ]]
        -- upvalues: v43 (ref), v34 (ref)
        v43({
            Url = v34 .. "v1/users/authenticated/app-launch-info", 
            Method = "GET"
        }, v106, v107);
    end);
end;
local function v111() --[[ Line: 313 ]] --[[ Name: getBalanceInfo ]]
    -- upvalues: v10 (copy), v43 (copy), v31 (copy)
    return v10.new(function(v109, v110) --[[ Line: 314 ]]
        -- upvalues: v43 (ref), v31 (ref)
        v43({
            Url = v31 .. "v1/user/currency", 
            Method = "GET"
        }, v109, v110);
    end);
end;
local function v116(v112) --[[ Line: 322 ]] --[[ Name: getBundleDetails ]]
    -- upvalues: v30 (copy), v10 (copy), v43 (copy)
    local v113 = {
        Url = v30 .. "v1/bundles/" .. tostring(v112) .. "/details", 
        Method = "GET"
    };
    return v10.new(function(v114, v115) --[[ Line: 329 ]]
        -- upvalues: v43 (ref), v113 (copy)
        spawn(function() --[[ Line: 330 ]]
            -- upvalues: v43 (ref), v113 (ref), v114 (copy), v115 (copy)
            v43(v113, v114, v115);
        end);
    end);
end;
local function v121(v117) --[[ Line: 336 ]] --[[ Name: getProductPurchasableDetails ]]
    -- upvalues: v31 (copy), v10 (copy), v43 (copy)
    local v118 = {
        Url = v31 .. "v1/products/" .. tostring(v117) .. "?showPurchasable=true", 
        Method = "GET"
    };
    return v10.new(function(v119, v120) --[[ Line: 343 ]]
        -- upvalues: v43 (ref), v118 (copy)
        spawn(function() --[[ Line: 344 ]]
            -- upvalues: v43 (ref), v118 (ref), v119 (copy), v120 (copy)
            v43(v118, v119, v120);
        end);
    end);
end;
local function v127(v122, v123) --[[ Line: 350 ]] --[[ Name: getCatalogItemDetails ]]
    -- upvalues: v30 (copy), v10 (copy), v43 (copy)
    local v124 = {
        Url = string.format("%sv1/catalog/items/%d/details?itemType=%s", v30, v122, v123), 
        Method = "GET"
    };
    return v10.new(function(v125, v126) --[[ Line: 356 ]]
        -- upvalues: v43 (ref), v124 (copy)
        spawn(function() --[[ Line: 357 ]]
            -- upvalues: v43 (ref), v124 (ref), v125 (copy), v126 (copy)
            v43(v124, v125, v126);
        end);
    end);
end;
local function v133() --[[ Line: 363 ]] --[[ Name: postPremiumImpression ]]
    -- upvalues: v33 (copy), l_HttpService_0 (copy), v10 (copy)
    local v128 = {
        Url = v33 .. "v1/universes/" .. tostring(game.GameId) .. "/premium-impressions/increment", 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(_, _) --[[ Line: 378 ]]
        -- upvalues: l_HttpService_0 (ref), v128 (copy)
        spawn(function() --[[ Line: 379 ]]
            -- upvalues: l_HttpService_0 (ref), v128 (ref)
            return l_HttpService_0:RequestInternal(v128):Start(function(_, _) --[[ Line: 380 ]]

            end);
        end);
    end);
end;
local function v139() --[[ Line: 387 ]] --[[ Name: getPremiumUpsellPrecheck ]]
    -- upvalues: v32 (copy), l_Players_0 (copy), v10 (copy), l_HttpService_0 (copy)
    local v134 = {
        Url = string.format("%sv1/users/%d/premium-upsell-precheck?universeId=%d&placeId=%d", v32, l_Players_0.LocalPlayer.UserId, game.GameId, game.PlaceId), 
        Method = "GET"
    };
    return v10.new(function(v135, v136) --[[ Line: 399 ]]
        -- upvalues: l_HttpService_0 (ref), v134 (copy)
        spawn(function() --[[ Line: 400 ]]
            -- upvalues: l_HttpService_0 (ref), v134 (ref), v135 (copy), v136 (copy)
            return l_HttpService_0:RequestInternal(v134):Start(function(v137, v138) --[[ Line: 401 ]]
                -- upvalues: v135 (ref), v136 (ref)
                if v137 and v138.StatusCode == 200 then
                    v135();
                    return;
                else
                    v136();
                    return;
                end;
            end);
        end);
    end);
end;
local function v141(v140) --[[ Line: 412 ]] --[[ Name: getSubscriptionPurchaseInfo ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:GetSubscriptionPurchaseInfoAsync(v140);
end;
local function v144(v142, v143) --[[ Line: 416 ]] --[[ Name: performSubscriptionPurchase ]]
    -- upvalues: l_MarketplaceService_0 (copy)
    return l_MarketplaceService_0:PerformSubscriptionPurchaseV2(v142, v143);
end;
local function v151(v145, v146, v147) --[[ Line: 420 ]] --[[ Name: getPurchaseWarning ]]
    -- upvalues: l_UrlBuilder_0 (copy), v10 (copy), v43 (copy)
    local v148 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.getPurchaseWarning(v145, v146, not v147), 
        Method = "GET"
    };
    return v10.new(function(v149, v150) --[[ Line: 426 ]]
        -- upvalues: v43 (ref), v148 (copy)
        spawn(function() --[[ Line: 427 ]]
            -- upvalues: v43 (ref), v148 (ref), v149 (copy), v150 (copy)
            v43(v148, v149, v150);
        end);
    end);
end;
local function v158(v152) --[[ Line: 433 ]] --[[ Name: postPurchaseWarningAcknowledge ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v10 (copy)
    local v153 = {
        Url = l_UrlBuilder_0.economy.purchaseWarning.ackPurchaseWarning(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            acknowledgement = v152
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(_, _) --[[ Line: 447 ]]
        -- upvalues: l_HttpService_0 (ref), v153 (copy)
        spawn(function() --[[ Line: 448 ]]
            -- upvalues: l_HttpService_0 (ref), v153 (ref)
            return l_HttpService_0:RequestInternal(v153):Start(function(_, _) --[[ Line: 449 ]]

            end);
        end);
    end);
end;
local function v162() --[[ Line: 456 ]] --[[ Name: checkUserPurchaseSettings ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v10 (copy), v43 (copy)
    local v159 = {
        Url = l_UrlBuilder_0.economy.paymentsGateway.checkUserPurchaseSettings(), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode("{}"), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v160, v161) --[[ Line: 469 ]]
        -- upvalues: v43 (ref), v159 (copy)
        spawn(function() --[[ Line: 470 ]]
            -- upvalues: v43 (ref), v159 (ref), v160 (copy), v161 (copy)
            v43(v159, v160, v161);
        end);
    end);
end;
local function v166() --[[ Line: 476 ]] --[[ Name: getVngShopUrl ]]
    -- upvalues: l_UrlBuilder_0 (copy), v10 (copy), v43 (copy)
    local v163 = {
        Url = l_UrlBuilder_0.economy.vngPayments.getVngShopUrl(), 
        Method = "GET"
    };
    return v10.new(function(v164, v165) --[[ Line: 484 ]]
        -- upvalues: v43 (ref), v163 (copy)
        spawn(function() --[[ Line: 485 ]]
            -- upvalues: v43 (ref), v163 (ref), v164 (copy), v165 (copy)
            v43(v163, v164, v165);
        end);
    end);
end;
local function v172(v167, v168) --[[ Line: 491 ]] --[[ Name: performDevProductEdpPurchase ]]
    -- upvalues: v27 (copy), l_HttpService_0 (copy), v10 (copy), v43 (copy)
    local v169 = {
        Url = ("%sdeveloper-products/v1/developer-products/%i/purchase?requestLocationType=ExperienceDetailPage"):format(v27, v167), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v168), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v170, v171) --[[ Line: 507 ]]
        -- upvalues: v43 (ref), v169 (copy)
        spawn(function() --[[ Line: 508 ]]
            -- upvalues: v43 (ref), v169 (ref), v170 (copy), v171 (copy)
            v43(v169, v170, v171);
        end);
    end);
end;
local function v177(v173) --[[ Line: 514 ]] --[[ Name: getExperienceProductInfo ]]
    -- upvalues: v28 (copy), v10 (copy), v43 (copy)
    local v174 = {
        Url = ("%sv1/games/games-product-info?universeIds=%s"):format(v28, v173), 
        Method = "GET"
    };
    return v10.new(function(v175, v176) --[[ Line: 522 ]]
        -- upvalues: v43 (ref), v174 (copy)
        spawn(function() --[[ Line: 523 ]]
            -- upvalues: v43 (ref), v174 (ref), v175 (copy), v176 (copy)
            v43(v174, v175, v176);
        end);
    end);
end;
local function v183(v178, v179) --[[ Line: 529 ]] --[[ Name: performExperiencePurchase ]]
    -- upvalues: v31 (copy), l_HttpService_0 (copy), v10 (copy), v43 (copy)
    local v180 = {
        Url = ("%sv1/purchases/products/%s"):format(v31, v178), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v179), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v181, v182) --[[ Line: 542 ]]
        -- upvalues: v43 (ref), v180 (copy)
        spawn(function() --[[ Line: 543 ]]
            -- upvalues: v43 (ref), v180 (ref), v181 (copy), v182 (copy)
            v43(v180, v181, v182);
        end);
    end);
end;
local function v189(v184, v185) --[[ Line: 549 ]] --[[ Name: performLookPurchase ]]
    -- upvalues: v27 (copy), l_HttpService_0 (copy), v10 (copy), v43 (copy)
    local v186 = {
        Url = ("%slook-api/v2/looks/%s/purchase"):format(v27, v184), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode(v185), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }
    };
    return v10.new(function(v187, v188) --[[ Line: 562 ]]
        -- upvalues: v43 (ref), v186 (copy)
        spawn(function() --[[ Line: 563 ]]
            -- upvalues: v43 (ref), v186 (ref), v187 (copy), v188 (copy)
            v43(v186, v187, v188);
        end);
    end);
end;
local function v194(v190, v191) --[[ Line: 569 ]] --[[ Name: performDeveloperSubscriptionRobuxPurchase ]]
    -- upvalues: l_game_EngineFeature_1 (copy), l_MarketplaceService_0 (copy)
    if l_game_EngineFeature_1 then
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 571 ]]
            -- upvalues: l_MarketplaceService_0 (ref), v190 (copy), v191 (copy)
            l_MarketplaceService_0:PerformSubscriptionPurchaseWithRobuxAsync(v190, v191);
        end);
        if not l_status_4 then
            error(l_result_4);
        end;
        return;
    else
        error("Developer subscription Robux purchase requires engine feature to be enabled");
        return;
    end;
end;
local function v198() --[[ Line: 583 ]] --[[ Name: getUnifiedPurchaseFlowUserEligibility ]]
    -- upvalues: v27 (copy), v10 (copy), v43 (copy)
    local v195 = {
        Url = ("%sroblox-subscriptions/v1/metadata"):format(v27), 
        Method = "GET"
    };
    return v10.new(function(v196, v197) --[[ Line: 591 ]]
        -- upvalues: v43 (ref), v195 (copy)
        spawn(function() --[[ Line: 592 ]]
            -- upvalues: v43 (ref), v195 (ref), v196 (copy), v197 (copy)
            v43(v195, v196, v197);
        end);
    end);
end;
return {
    new = function() --[[ Line: 602 ]] --[[ Name: new ]]
        -- upvalues: v10 (copy), v49 (copy), v52 (copy), v66 (copy), v79 (copy), v93 (copy), v21 (copy), v98 (copy), v105 (copy), v108 (copy), v100 (copy), v111 (copy), v116 (copy), v121 (copy), v20 (copy), v127 (copy), v103 (copy), v62 (copy), v133 (copy), v139 (copy), v141 (copy), v144 (copy), v151 (copy), v158 (copy), v162 (copy), v166 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), v172 (copy), v177 (copy), v183 (copy), v189 (copy), v198 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), v194 (copy), v54 (copy)
        local v199 = {
            getABTestGroup = v10.promisify(v49), 
            getProductInfo = v10.promisify(v52), 
            getPlayerOwns = v10.promisify(v66), 
            performPurchase = v10.promisify(v79), 
            performPurchaseV2 = v10.promisify(v93), 
            performCreatorStorePurchase = if v21() then v10.promisify(v98) else nil, 
            loadAssetForEquip = v10.promisify(v105), 
            getAccountInfo = v10.promisify(v108), 
            getAssetInfo = if v21() then v10.promisify(v100) else nil, 
            getBalanceInfo = v10.promisify(v111), 
            getBundleDetails = v116, 
            getProductPurchasableDetails = v121, 
            getCatalogItemDetails = if v20() then v127 else nil, 
            getCreatorStoreProductInfo = if v21() then v10.promisify(v103) else nil, 
            getPremiumProductInfo = v10.promisify(v62), 
            postPremiumImpression = v10.promisify(v133), 
            getPremiumUpsellPrecheck = v10.promisify(v139), 
            getSubscriptionPurchaseInfo = v10.promisify(v141), 
            performSubscriptionPurchase = v10.promisify(v144), 
            getPurchaseWarning = v10.promisify(v151), 
            postPurchaseWarningAcknowledge = v10.promisify(v158), 
            checkUserPurchaseSettings = v10.promisify(v162), 
            getVngShopUrl = v10.promisify(v166), 
            performDevProductEdpPurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v172) else nil, 
            getExperienceProductInfo = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v177) else nil, 
            performExperiencePurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v183) else nil, 
            performLookPurchase = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v189) else nil, 
            getUnifiedPurchaseFlowUserEligibility = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v10.promisify(v198) else nil, 
            performDeveloperSubscriptionRobuxPurchase = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v10.promisify(v194) else nil, 
            getSubscriptionProductInfo = if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 then v10.promisify(v54) else nil
        };
        setmetatable(v199, {
            __tostring = function() --[[ Line: 657 ]] --[[ Name: __tostring ]]
                return "Service(Network)";
            end
        });
        return v199;
    end
};