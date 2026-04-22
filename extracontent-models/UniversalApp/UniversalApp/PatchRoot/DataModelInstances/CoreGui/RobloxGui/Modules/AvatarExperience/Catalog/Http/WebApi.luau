local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Http.Url);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_CorePackages_0.Packages.Dash);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v11 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps);
local v12 = require(l_CorePackages_0.Workspace.Packages.ShareLinksNetworking);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled);
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXBlackbirdRoot_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlackbirdRoot;
local v16 = string.format("https://develop.%s", v5.DOMAIN);
local v33 = {
    FetchSponsoredItems = function(v17, v18, v19) --[[ Line: 62 ]] --[[ Name: FetchSponsoredItems ]]
        -- upvalues: v5 (copy)
        local v20 = string.format("%sv1/catalog/sponsored-items?model.placementLocation=AvatarShop", v5.CATALOG_URL);
        if v18 then
            v20 = v20 .. "&model.catalogCategoryType=" .. v18;
        end;
        if v19 then
            v20 = v20 .. "&model.count=" .. tostring(v19);
        end;
        return v17(v20, "GET");
    end, 
    FetchWidgets = function(v21, v22, v23) --[[ Line: 76 ]] --[[ Name: FetchWidgets ]]
        -- upvalues: v5 (copy)
        local v24 = v5:makeQueryString({
            requestId = v22, 
            context = v23
        });
        return v21(string.format("%smarketplace-widgets/v1/widgets?%s", v5.APIS_URL, v24), "GET");
    end, 
    FetchWidgetsSearch = function(v25, v26, v27) --[[ Line: 86 ]] --[[ Name: FetchWidgetsSearch ]]
        -- upvalues: v5 (copy)
        local v28 = v5:makeQueryString({
            query = v27, 
            requestId = v26
        });
        return v25(string.format("%smarketplace-widgets/v1/widgets/search?%s", v5.APIS_URL, v28), "GET");
    end, 
    HydrateWidgetContent = function(v29, v30) --[[ Line: 96 ]] --[[ Name: HydrateWidgetContent ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v29(string.format("%smarketplace-widgets/v1/widgets/hydrate", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                Content = v30
            })
        });
    end, 
    TrackSponsoredItemClick = function(v31, v32) --[[ Line: 106 ]] --[[ Name: TrackSponsoredItemClick ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v31(string.format("%sv2/tracking/click", v5.AD_CONFIGURATION_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                encryptedAdTrackingData = v32, 
                campaignTargetType = "Asset", 
                placementLocation = "AvatarShop"
            })
        });
    end
};
if l_FFlagAXBlackbirdRoot_0 then
    v33.FetchItemDetail = function(v34, v35, v36) --[[ Line: 119 ]] --[[ Name: FetchItemDetail ]]
        -- upvalues: v5 (copy)
        local v37 = v5:makeQueryString({
            itemType = v36
        });
        return v34(string.format("%sv1/catalog/items/%s/details?%s", v5.CATALOG_URL, tostring(v35), v37), "GET");
    end;
end;
v33.FetchItemDetails = function(v38, v39) --[[ Line: 128 ]] --[[ Name: FetchItemDetails ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v38(string.format("%sv1/catalog/items/details", v5.CATALOG_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            items = v39
        })
    });
end;
v33.FetchCollectibleItemDetails = function(v40, v41) --[[ Line: 136 ]] --[[ Name: FetchCollectibleItemDetails ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v40(string.format("%smarketplace-items/v1/items/details", v5.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            itemIds = v41
        })
    });
end;
v33.PurchaseProduct = function(v42, v43, v44, v45, v46) --[[ Line: 144 ]] --[[ Name: PurchaseProduct ]]
    -- upvalues: v6 (copy), v5 (copy), l_HttpService_0 (copy), v7 (copy)
    v6.isType(v43, "string", "CatalogWebApi.PurchaseProduct: productId");
    v6.isNonNegativeNumber(v44, "CatalogWebApi.PurchaseProduct: expectedPrice");
    v6.isType(v45, "string", "CatalogWebApi.PurchaseProduct: expectedSellerId");
    return v42(string.format("%sv1/purchases/products/%s", v5.ECONOMY_URL, v43), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            expectedCurrency = v7.ExpectedCurrencyRobux, 
            expectedPrice = tostring(v44), 
            expectedSellerId = tostring(v45), 
            userAssetId = v46
        })
    });
end;
v33.PurchaseCollectibleItem = function(v47, v48, v49, v50, v51, v52, v53, v54, v55) --[[ Line: 166 ]] --[[ Name: PurchaseCollectibleItem ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v47(string.format("%smarketplace-sales/v1/item/%s/purchase-item", v5.APIS_URL, v48), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            expectedCurrency = v7.ExpectedCurrencyRobux, 
            expectedPrice = tostring(v50), 
            expectedSellerId = tostring(v51), 
            expectedPurchaserId = v53, 
            expectedPurchaserType = v7.CreatorType.User, 
            expectedSellerType = v52, 
            collectibleProductId = v49, 
            idempotencyKey = v54, 
            rentalOptionDays = v55
        })
    });
end;
v33.PurchaseCollectibleItemResale = function(v56, v57, v58, v59, v60, v61, v62, v63, v64) --[[ Line: 192 ]] --[[ Name: PurchaseCollectibleItemResale ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v56(string.format("%smarketplace-sales/v1/item/%s/purchase-resale", v5.APIS_URL, v57), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            expectedCurrency = v7.ExpectedCurrencyRobux, 
            expectedPrice = tostring(v60), 
            expectedSellerId = tostring(v61), 
            expectedPurchaserId = v63, 
            expectedPurchaserType = v7.CreatorType.User, 
            expectedSellerType = v62, 
            collectibleProductId = v59, 
            collectibleItemInstanceId = v58, 
            idempotencyKey = v64
        })
    });
end;
if v13 then
    v33.RedeemQRCodeItem = function(v65, v66) --[[ Line: 219 ]] --[[ Name: RedeemQRCodeItem ]]
        -- upvalues: v6 (copy), v5 (copy)
        v6.isType(v66, "string", "CatalogWebApi.RedeemQRCodeItem: assetId");
        return v65(string.format("%sv2/qr-code-auto-redeem/%s", v5.ECONOMY_URL, v66), "POST", {
            postBody = ""
        });
    end;
end;
v33.FetchSellPageData = function(v67, v68, v69) --[[ Line: 226 ]] --[[ Name: FetchSellPageData ]]
    -- upvalues: v5 (copy)
    return v67(string.format("%s/v1/assets/%s/users/%s/resellable-copies", v5.ECONOMY_URL, v68, v69), "GET");
end;
v33.FetchCollectibleResellableInstances = function(v70, v71, v72) --[[ Line: 231 ]] --[[ Name: FetchCollectibleResellableInstances ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v73 = v5:makeQueryString({
        ownerId = v72, 
        ownerType = v7.CreatorType.User, 
        cursor = "", 
        limit = v7.MaxOwnedCopiesPerPage
    });
    return v70(string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", v5.APIS_URL, v71, v73), "GET");
end;
v33.FetchAssetResellers = function(v74, v75, v76, _) --[[ Line: 249 ]] --[[ Name: FetchAssetResellers ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v78 = v5:makeQueryString({
        cursor = v76, 
        limit = v7.MaxResellersPerPage
    });
    return v74(string.format("%s/v1/assets/%s/resellers?%s", v5.ECONOMY_URL, v75, v78), "GET");
end;
v33.FetchAssetResaleData = function(v79, v80) --[[ Line: 258 ]] --[[ Name: FetchAssetResaleData ]]
    -- upvalues: v5 (copy)
    return v79(string.format("%s/v1/assets/%s/resale-data", v5.ECONOMY_URL, v80), "GET");
end;
v33.FetchCollectibleResaleData = function(v81, v82) --[[ Line: 263 ]] --[[ Name: FetchCollectibleResaleData ]]
    -- upvalues: v5 (copy)
    return v81(string.format("%smarketplace-sales/v1/item/%s/resale-data", v5.APIS_URL, v82), "GET");
end;
v33.GetCollectibleResellers = function(v83, v84, v85, v86) --[[ Line: 268 ]] --[[ Name: GetCollectibleResellers ]]
    -- upvalues: v5 (copy)
    local v87 = v5:makeQueryString({
        cursor = v85, 
        limit = v86
    });
    return v83(string.format("%smarketplace-sales/v1/item/%s/resellers?%s", v5.APIS_URL, v84, v87), "GET");
end;
v33.RemoveCurrentlySellingAsset = function(v88, v89, v90) --[[ Line: 277 ]] --[[ Name: RemoveCurrentlySellingAsset ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v91 = l_HttpService_0:JSONEncode({
        price = ""
    });
    return v88(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v89, v90), "PATCH", {
        postBody = v91
    });
end;
v33.RemoveAvailableToSell = function(v92, v93, v94, v95) --[[ Line: 285 ]] --[[ Name: RemoveAvailableToSell ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v96 = l_HttpService_0:JSONEncode({
        price = v95
    });
    return v92(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v93, v94), "PATCH", {
        postBody = v96
    });
end;
v33.UpdateCollectibleInstanceResaleState = function(v97, v98, v99, v100, v101, v102, v103) --[[ Line: 293 ]] --[[ Name: UpdateCollectibleInstanceResaleState ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v97(string.format("%smarketplace-sales/v1/item/%s/instance/%s/resale", v5.APIS_URL, v98, v99), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = v101, 
            isOnSale = v102, 
            sellerId = v103, 
            sellerType = v7.CreatorType.User, 
            collectibleProductId = v100
        })
    });
end;
v33.GetMarketplaceFee = function(v104) --[[ Line: 320 ]] --[[ Name: GetMarketplaceFee ]]
    -- upvalues: v5 (copy)
    return v104(string.format("%s/v1/resale-tax-rate", v5.ECONOMY_URL), "GET");
end;
v33.GetCollectibleMarketplaceResaleParameters = function(v105, v106) --[[ Line: 325 ]] --[[ Name: GetCollectibleMarketplaceResaleParameters ]]
    -- upvalues: v5 (copy)
    return v105(string.format("%smarketplace-sales/v1/item/%s/get-resale-parameters", v5.APIS_URL, v106), "GET");
end;
v33.ReportItem = function(v107, v108, v109, v110) --[[ Line: 333 ]] --[[ Name: ReportItem ]]
    -- upvalues: l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    local v111 = {
        reportingItemTypeName = v107, 
        reportingItemId = v108, 
        reportCategoryId = v109, 
        comment = v110
    };
    local v112 = l_HttpService_0:JSONEncode(v111);
    if v112 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 343 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v112 (copy)
            return l_HttpRbxApiService_0:PostAsync("moderation/reportabuse", v112, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_0 then
            return l_result_0;
        end;
    end;
    return nil;
end;
v33.ReportItemV2 = function(v115, v116, v117, v118, v119, v120, v121, v122, v123) --[[ Line: 363 ]] --[[ Name: ReportItemV2 ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy), l_HttpRbxApiService_0 (copy)
    local v124 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v120
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v115
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v117
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v122
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v121
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v123
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v116
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v118
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v119
                    }
                }
            }
        }
    };
    local v125 = l_HttpService_0:JSONEncode(v124);
    local v126 = v5.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if v125 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 427 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v126 (copy), v125 (copy)
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v126, v125, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v33.AbuseReport = function(v129, v130) --[[ Line: 448 ]] --[[ Name: AbuseReport ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v131 = {
        tags = {}
    };
    for v132, v133 in v130 do
        if typeof(v133) ~= "table" then
            v133 = {
                v133
            };
        end;
        local v134 = {};
        for _, v136 in v133 do
            table.insert(v134, {
                data = v136
            });
        end;
        v131.tags[v132] = {
            valueList = v134
        };
    end;
    local v137 = l_HttpService_0:JSONEncode(v131);
    return v129(v5.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", {
        postBody = v137
    });
end;
v33.AbuseReportBundle = function(v138, v139, v140, v141, v142) --[[ Line: 501 ]] --[[ Name: AbuseReportBundle ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v138(v5.APIS_URL .. "abuse-reporting/v1/safety-event", "POST", {
        postBody = l_HttpService_0:JSONEncode({
            safetyEvent = {
                eventTime = v142, 
                idempotencyKey = "ugc_bundle/" .. tostring(v140) .. "/" .. tostring(v139), 
                tags = {
                    SUBMITTER_USER_ID = {
                        valueList = {
                            {
                                data = tostring(v139)
                            }
                        }
                    }, 
                    REPORTED_ABUSE_VECTOR = {
                        valueList = {
                            {
                                data = "ugc_bundle"
                            }
                        }
                    }, 
                    UGC_BUNDLE_ID = {
                        valueList = {
                            {
                                data = tostring(v140)
                            }
                        }
                    }, 
                    ENTRY_POINT = {
                        valueList = {
                            {
                                data = v141
                            }
                        }
                    }, 
                    REPORTED_ABUSE_CATEGORY = {
                        valueList = {
                            {
                                data = "ABUSE_CATEGORY_OTHER"
                            }
                        }
                    }, 
                    REPORTER_COMMENT = {
                        valueList = {
                            {
                                data = ""
                            }
                        }
                    }
                }
            }
        })
    });
end;
v33.GetTopics = function(v143, v144, v145) --[[ Line: 553 ]] --[[ Name: GetTopics ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v143(string.format("%sv1/topic/get-topics", v5.CATALOG_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            selectTopics = v144, 
            inputQuery = v145, 
            maxResult = v7.MaxTopics
        })
    });
end;
v33.GetInitialTopics = function(v146, v147) --[[ Line: 566 ]] --[[ Name: GetInitialTopics ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), l_HttpService_0 (copy)
    local v148 = string.format("%sv1/topic/get-topics", v5.CATALOG_URL);
    if #v147 > v7.MaxItemsInTopicsRequest then
        v147 = v8.slice(v147, 1, v7.MaxItemsInTopicsRequest);
    end;
    return v146(v148, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            items = v147, 
            maxResult = v7.MaxTopics
        })
    });
end;
v33.GetCatalogMetadata = function(v149) --[[ Line: 584 ]] --[[ Name: GetCatalogMetadata ]]
    -- upvalues: v5 (copy)
    return v149(string.format("%s/v1/catalog/metadata", v5.CATALOG_URL), "GET");
end;
v33.FetchAssetVersionData = function(v150, v151) --[[ Line: 595 ]] --[[ Name: FetchAssetVersionData ]]
    -- upvalues: v16 (copy)
    return v150(string.format("%sv1/assets/%s/saved-versions", v16, v151), "GET");
end;
v33.GetLookDetails = function(v152, v153) --[[ Line: 600 ]] --[[ Name: GetLookDetails ]]
    -- upvalues: v5 (copy)
    return v152(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v153), "GET");
end;
v33.HasFavoritedLook = function(v154, v155) --[[ Line: 605 ]] --[[ Name: HasFavoritedLook ]]
    -- upvalues: v5 (copy)
    return v154(string.format("%slook-api/v1/looks/%s/favorite", v5.APIS_URL, v155), "GET");
end;
if l_FFlagAXCatalogMakeupSupport_0 then
    v33.FavoriteLookV2 = function(v156, v157, v158) --[[ Line: 611 ]] --[[ Name: FavoriteLookV2 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v156(string.format("%slook-api/v1/looks/favorite/create", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v157, 
                lookType = v158 or ""
            })
        });
    end;
else
    v33.FavoriteLook = function(v159, v160) --[[ Line: 621 ]] --[[ Name: FavoriteLook ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v159(string.format("%slook-api/v1/looks/favorite/create", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v160, 
                lookType = "Avatar"
            })
        });
    end;
end;
if l_FFlagAXCatalogMakeupSupport_0 then
    v33.UnfavoriteLookV2 = function(v161, v162, v163) --[[ Line: 633 ]] --[[ Name: UnfavoriteLookV2 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v161(string.format("%slook-api/v1/looks/favorite/delete", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v162, 
                lookType = v163 or ""
            })
        });
    end;
else
    v33.UnfavoriteLook = function(v164, v165) --[[ Line: 643 ]] --[[ Name: UnfavoriteLook ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v164(string.format("%slook-api/v1/looks/favorite/delete", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v165, 
                lookType = "Avatar"
            })
        });
    end;
end;
v33.GetLookDetailsV2 = function(v166, v167) --[[ Line: 654 ]] --[[ Name: GetLookDetailsV2 ]]
    -- upvalues: v5 (copy)
    return v166(string.format("%slook-api/v2/looks/%s", v5.APIS_URL, v167), "GET");
end;
v33.DeleteLook = function(v168, v169) --[[ Line: 659 ]] --[[ Name: DeleteLook ]]
    -- upvalues: v5 (copy)
    return v168(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v169), "DELETE");
end;
v33.PurchaseLook = function(v170, v171, v172, v173, v174, v175) --[[ Line: 664 ]] --[[ Name: PurchaseLook ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v170(string.format("%slook-api/v1/looks/%s/purchase", v5.APIS_URL, v171), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v171, 
            idempotencyKey = v172, 
            expectedPrice = v173, 
            salesLocationId = v174, 
            excludedItems = v175
        })
    });
end;
v33.PurchaseLookV2 = function(v176, v177, v178, v179, v180, v181, v182, v183) --[[ Line: 684 ]] --[[ Name: PurchaseLookV2 ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v176(string.format("%slook-api/v2/looks/%s/purchase", v5.APIS_URL, v177), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v177, 
            idempotencyKey = v178, 
            expectedPrice = v179, 
            salesLocationId = v180, 
            excludedAssets = v181, 
            excludedBundles = v182, 
            timedOptions = v183
        })
    });
end;
v33.GetOrGenerateShortShareLink = function(v184, v185) --[[ Line: 708 ]] --[[ Name: GetOrGenerateShortShareLink ]]
    -- upvalues: v11 (copy), v12 (copy)
    local v186 = v11.httpRequest.config({
        requestFunction = v11.httpRequest.requestFunctions.HttpRbxApi, 
        maxWaitTime = 3, 
        maxRetryCount = game:DefineFastInt("CatalogWebApiHttpRetryCount", 2)
    });
    local v187 = v11.RoduxNetworking.config({
        keyPath = "AvatarExperience", 
        networkImpl = v186
    });
    return v12.config({
        roduxNetworking = v187, 
        useMockedResponse = false
    }).GetOrGenerateLink.API({
        linkType = "AvatarItemDetails", 
        itemId = v184, 
        itemType = v185
    });
end;
return v33;