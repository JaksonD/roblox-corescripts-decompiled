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
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v15 = string.format("https://develop.%s", v5.DOMAIN);
local v59 = {
    FetchSponsoredItems = function(v16, v17, v18) --[[ Line: 60 ]] --[[ Name: FetchSponsoredItems ]]
        -- upvalues: v5 (copy)
        local v19 = string.format("%sv1/catalog/sponsored-items?model.placementLocation=AvatarShop", v5.CATALOG_URL);
        if v17 then
            v19 = v19 .. "&model.catalogCategoryType=" .. v17;
        end;
        if v18 then
            v19 = v19 .. "&model.count=" .. tostring(v18);
        end;
        return v16(v19, "GET");
    end, 
    FetchWidgets = function(v20, v21, v22) --[[ Line: 74 ]] --[[ Name: FetchWidgets ]]
        -- upvalues: v5 (copy)
        local v23 = v5:makeQueryString({
            requestId = v21, 
            context = v22
        });
        return v20(string.format("%smarketplace-widgets/v1/widgets?%s", v5.APIS_URL, v23), "GET");
    end, 
    FetchWidgetsSearch = function(v24, v25, v26) --[[ Line: 84 ]] --[[ Name: FetchWidgetsSearch ]]
        -- upvalues: v5 (copy)
        local v27 = v5:makeQueryString({
            query = v26, 
            requestId = v25
        });
        return v24(string.format("%smarketplace-widgets/v1/widgets/search?%s", v5.APIS_URL, v27), "GET");
    end, 
    HydrateWidgetContent = function(v28, v29) --[[ Line: 94 ]] --[[ Name: HydrateWidgetContent ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v28(string.format("%smarketplace-widgets/v1/widgets/hydrate", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                Content = v29
            })
        });
    end, 
    TrackSponsoredItemClick = function(v30, v31) --[[ Line: 104 ]] --[[ Name: TrackSponsoredItemClick ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v30(string.format("%sv2/tracking/click", v5.AD_CONFIGURATION_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                encryptedAdTrackingData = v31, 
                campaignTargetType = "Asset", 
                placementLocation = "AvatarShop"
            })
        });
    end, 
    FetchItemDetails = function(v32, v33) --[[ Line: 116 ]] --[[ Name: FetchItemDetails ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v32(string.format("%sv1/catalog/items/details", v5.CATALOG_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                items = v33
            })
        });
    end, 
    FetchCollectibleItemDetails = function(v34, v35) --[[ Line: 124 ]] --[[ Name: FetchCollectibleItemDetails ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v34(string.format("%smarketplace-items/v1/items/details", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                itemIds = v35
            })
        });
    end, 
    PurchaseProduct = function(v36, v37, v38, v39, v40) --[[ Line: 132 ]] --[[ Name: PurchaseProduct ]]
        -- upvalues: v6 (copy), v5 (copy), l_HttpService_0 (copy), v7 (copy)
        v6.isType(v37, "string", "CatalogWebApi.PurchaseProduct: productId");
        v6.isNonNegativeNumber(v38, "CatalogWebApi.PurchaseProduct: expectedPrice");
        v6.isType(v39, "string", "CatalogWebApi.PurchaseProduct: expectedSellerId");
        return v36(string.format("%sv1/purchases/products/%s", v5.ECONOMY_URL, v37), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v38), 
                expectedSellerId = tostring(v39), 
                userAssetId = v40
            })
        });
    end, 
    PurchaseCollectibleItem = function(v41, v42, v43, v44, v45, v46, v47, v48, v49) --[[ Line: 154 ]] --[[ Name: PurchaseCollectibleItem ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy), l_FFlagAXDurablesSupport_0 (copy)
        return v41(string.format("%smarketplace-sales/v1/item/%s/purchase-item", v5.APIS_URL, v42), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v44), 
                expectedSellerId = tostring(v45), 
                expectedPurchaserId = v47, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v46, 
                collectibleProductId = v43, 
                idempotencyKey = v48, 
                rentalOptionDays = if l_FFlagAXDurablesSupport_0 then v49 else nil
            })
        });
    end, 
    PurchaseCollectibleItemResale = function(v50, v51, v52, v53, v54, v55, v56, v57, v58) --[[ Line: 180 ]] --[[ Name: PurchaseCollectibleItemResale ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
        return v50(string.format("%smarketplace-sales/v1/item/%s/purchase-resale", v5.APIS_URL, v51), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v54), 
                expectedSellerId = tostring(v55), 
                expectedPurchaserId = v57, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v56, 
                collectibleProductId = v53, 
                collectibleItemInstanceId = v52, 
                idempotencyKey = v58
            })
        });
    end
};
if v13 then
    v59.RedeemQRCodeItem = function(v60, v61) --[[ Line: 207 ]] --[[ Name: RedeemQRCodeItem ]]
        -- upvalues: v6 (copy), v5 (copy)
        v6.isType(v61, "string", "CatalogWebApi.RedeemQRCodeItem: assetId");
        return v60(string.format("%sv2/qr-code-auto-redeem/%s", v5.ECONOMY_URL, v61), "POST", {
            postBody = ""
        });
    end;
end;
v59.FetchSellPageData = function(v62, v63, v64) --[[ Line: 214 ]] --[[ Name: FetchSellPageData ]]
    -- upvalues: v5 (copy)
    return v62(string.format("%s/v1/assets/%s/users/%s/resellable-copies", v5.ECONOMY_URL, v63, v64), "GET");
end;
v59.FetchCollectibleResellableInstances = function(v65, v66, v67) --[[ Line: 219 ]] --[[ Name: FetchCollectibleResellableInstances ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v68 = v5:makeQueryString({
        ownerId = v67, 
        ownerType = v7.CreatorType.User, 
        cursor = "", 
        limit = v7.MaxOwnedCopiesPerPage
    });
    return v65(string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", v5.APIS_URL, v66, v68), "GET");
end;
v59.FetchAssetResellers = function(v69, v70, v71, _) --[[ Line: 237 ]] --[[ Name: FetchAssetResellers ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v73 = v5:makeQueryString({
        cursor = v71, 
        limit = v7.MaxResellersPerPage
    });
    return v69(string.format("%s/v1/assets/%s/resellers?%s", v5.ECONOMY_URL, v70, v73), "GET");
end;
v59.FetchAssetResaleData = function(v74, v75) --[[ Line: 246 ]] --[[ Name: FetchAssetResaleData ]]
    -- upvalues: v5 (copy)
    return v74(string.format("%s/v1/assets/%s/resale-data", v5.ECONOMY_URL, v75), "GET");
end;
v59.FetchCollectibleResaleData = function(v76, v77) --[[ Line: 251 ]] --[[ Name: FetchCollectibleResaleData ]]
    -- upvalues: v5 (copy)
    return v76(string.format("%smarketplace-sales/v1/item/%s/resale-data", v5.APIS_URL, v77), "GET");
end;
v59.GetCollectibleResellers = function(v78, v79, v80, v81) --[[ Line: 256 ]] --[[ Name: GetCollectibleResellers ]]
    -- upvalues: v5 (copy)
    local v82 = v5:makeQueryString({
        cursor = v80, 
        limit = v81
    });
    return v78(string.format("%smarketplace-sales/v1/item/%s/resellers?%s", v5.APIS_URL, v79, v82), "GET");
end;
v59.RemoveCurrentlySellingAsset = function(v83, v84, v85) --[[ Line: 265 ]] --[[ Name: RemoveCurrentlySellingAsset ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v86 = l_HttpService_0:JSONEncode({
        price = ""
    });
    return v83(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v84, v85), "PATCH", {
        postBody = v86
    });
end;
v59.RemoveAvailableToSell = function(v87, v88, v89, v90) --[[ Line: 273 ]] --[[ Name: RemoveAvailableToSell ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v91 = l_HttpService_0:JSONEncode({
        price = v90
    });
    return v87(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v88, v89), "PATCH", {
        postBody = v91
    });
end;
v59.UpdateCollectibleInstanceResaleState = function(v92, v93, v94, v95, v96, v97, v98) --[[ Line: 281 ]] --[[ Name: UpdateCollectibleInstanceResaleState ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v92(string.format("%smarketplace-sales/v1/item/%s/instance/%s/resale", v5.APIS_URL, v93, v94), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = v96, 
            isOnSale = v97, 
            sellerId = v98, 
            sellerType = v7.CreatorType.User, 
            collectibleProductId = v95
        })
    });
end;
v59.GetMarketplaceFee = function(v99) --[[ Line: 308 ]] --[[ Name: GetMarketplaceFee ]]
    -- upvalues: v5 (copy)
    return v99(string.format("%s/v1/resale-tax-rate", v5.ECONOMY_URL), "GET");
end;
v59.GetCollectibleMarketplaceResaleParameters = function(v100, v101) --[[ Line: 313 ]] --[[ Name: GetCollectibleMarketplaceResaleParameters ]]
    -- upvalues: v5 (copy)
    return v100(string.format("%smarketplace-sales/v1/item/%s/get-resale-parameters", v5.APIS_URL, v101), "GET");
end;
v59.ReportItem = function(v102, v103, v104, v105) --[[ Line: 321 ]] --[[ Name: ReportItem ]]
    -- upvalues: l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    local v106 = {
        reportingItemTypeName = v102, 
        reportingItemId = v103, 
        reportCategoryId = v104, 
        comment = v105
    };
    local v107 = l_HttpService_0:JSONEncode(v106);
    if v107 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 331 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v107 (copy)
            return l_HttpRbxApiService_0:PostAsync("moderation/reportabuse", v107, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_0 then
            return l_result_0;
        end;
    end;
    return nil;
end;
v59.ReportItemV2 = function(v110, v111, v112, v113, v114, v115, v116, v117, v118) --[[ Line: 351 ]] --[[ Name: ReportItemV2 ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy), l_HttpRbxApiService_0 (copy)
    local v119 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v115
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v110
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v112
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v117
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v116
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v118
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v111
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v113
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v114
                    }
                }
            }
        }
    };
    local v120 = l_HttpService_0:JSONEncode(v119);
    local v121 = v5.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if v120 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 415 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v121 (copy), v120 (copy)
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v121, v120, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v59.AbuseReport = function(v124, v125) --[[ Line: 436 ]] --[[ Name: AbuseReport ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v126 = {
        tags = {}
    };
    for v127, v128 in v125 do
        if typeof(v128) ~= "table" then
            v128 = {
                v128
            };
        end;
        local v129 = {};
        for _, v131 in v128 do
            table.insert(v129, {
                data = v131
            });
        end;
        v126.tags[v127] = {
            valueList = v129
        };
    end;
    local v132 = l_HttpService_0:JSONEncode(v126);
    return v124(v5.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", {
        postBody = v132
    });
end;
v59.AbuseReportBundle = function(v133, v134, v135, v136, v137) --[[ Line: 489 ]] --[[ Name: AbuseReportBundle ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v133(v5.APIS_URL .. "abuse-reporting/v1/safety-event", "POST", {
        postBody = l_HttpService_0:JSONEncode({
            safetyEvent = {
                eventTime = v137, 
                idempotencyKey = "ugc_bundle/" .. tostring(v135) .. "/" .. tostring(v134), 
                tags = {
                    SUBMITTER_USER_ID = {
                        valueList = {
                            {
                                data = tostring(v134)
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
                                data = tostring(v135)
                            }
                        }
                    }, 
                    ENTRY_POINT = {
                        valueList = {
                            {
                                data = v136
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
v59.GetTopics = function(v138, v139, v140) --[[ Line: 541 ]] --[[ Name: GetTopics ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v138(string.format("%sv1/topic/get-topics", v5.CATALOG_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            selectTopics = v139, 
            inputQuery = v140, 
            maxResult = v7.MaxTopics
        })
    });
end;
v59.GetInitialTopics = function(v141, v142) --[[ Line: 554 ]] --[[ Name: GetInitialTopics ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), l_HttpService_0 (copy)
    local v143 = string.format("%sv1/topic/get-topics", v5.CATALOG_URL);
    if #v142 > v7.MaxItemsInTopicsRequest then
        v142 = v8.slice(v142, 1, v7.MaxItemsInTopicsRequest);
    end;
    return v141(v143, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            items = v142, 
            maxResult = v7.MaxTopics
        })
    });
end;
v59.GetCatalogMetadata = function(v144) --[[ Line: 572 ]] --[[ Name: GetCatalogMetadata ]]
    -- upvalues: v5 (copy)
    return v144(string.format("%s/v1/catalog/metadata", v5.CATALOG_URL), "GET");
end;
v59.FetchAssetVersionData = function(v145, v146) --[[ Line: 583 ]] --[[ Name: FetchAssetVersionData ]]
    -- upvalues: v15 (copy)
    return v145(string.format("%sv1/assets/%s/saved-versions", v15, v146), "GET");
end;
v59.GetLookDetails = function(v147, v148) --[[ Line: 588 ]] --[[ Name: GetLookDetails ]]
    -- upvalues: v5 (copy)
    return v147(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v148), "GET");
end;
v59.HasFavoritedLook = function(v149, v150) --[[ Line: 593 ]] --[[ Name: HasFavoritedLook ]]
    -- upvalues: v5 (copy)
    return v149(string.format("%slook-api/v1/looks/%s/favorite", v5.APIS_URL, v150), "GET");
end;
v59.FavoriteLook = function(v151, v152) --[[ Line: 598 ]] --[[ Name: FavoriteLook ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v151(string.format("%slook-api/v1/looks/favorite/create", v5.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            id = v152, 
            lookType = "Avatar"
        })
    });
end;
v59.UnfavoriteLook = function(v153, v154) --[[ Line: 608 ]] --[[ Name: UnfavoriteLook ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v153(string.format("%slook-api/v1/looks/favorite/delete", v5.APIS_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            id = v154, 
            lookType = "Avatar"
        })
    });
end;
v59.GetLookDetailsV2 = function(v155, v156) --[[ Line: 618 ]] --[[ Name: GetLookDetailsV2 ]]
    -- upvalues: v5 (copy)
    return v155(string.format("%slook-api/v2/looks/%s", v5.APIS_URL, v156), "GET");
end;
v59.DeleteLook = function(v157, v158) --[[ Line: 623 ]] --[[ Name: DeleteLook ]]
    -- upvalues: v5 (copy)
    return v157(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v158), "DELETE");
end;
v59.PurchaseLook = function(v159, v160, v161, v162, v163, v164) --[[ Line: 628 ]] --[[ Name: PurchaseLook ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v159(string.format("%slook-api/v1/looks/%s/purchase", v5.APIS_URL, v160), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v160, 
            idempotencyKey = v161, 
            expectedPrice = v162, 
            salesLocationId = v163, 
            excludedItems = v164
        })
    });
end;
v59.PurchaseLookV2 = function(v165, v166, v167, v168, v169, v170, v171, v172) --[[ Line: 648 ]] --[[ Name: PurchaseLookV2 ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    return v165(string.format("%slook-api/v2/looks/%s/purchase", v5.APIS_URL, v166), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v166, 
            idempotencyKey = v167, 
            expectedPrice = v168, 
            salesLocationId = v169, 
            excludedAssets = v170, 
            excludedBundles = v171, 
            timedOptions = if l_FFlagAXDurablesSupport_0 then v172 else nil
        })
    });
end;
v59.GetOrGenerateShortShareLink = function(v173, v174) --[[ Line: 672 ]] --[[ Name: GetOrGenerateShortShareLink ]]
    -- upvalues: v11 (copy), v12 (copy)
    local v175 = v11.httpRequest.config({
        requestFunction = v11.httpRequest.requestFunctions.HttpRbxApi, 
        maxWaitTime = 3, 
        maxRetryCount = game:DefineFastInt("CatalogWebApiHttpRetryCount", 2)
    });
    local v176 = v11.RoduxNetworking.config({
        keyPath = "AvatarExperience", 
        networkImpl = v175
    });
    return v12.config({
        roduxNetworking = v176, 
        useMockedResponse = false
    }).GetOrGenerateLink.API({
        linkType = "AvatarItemDetails", 
        itemId = v173, 
        itemType = v174
    });
end;
return v59;