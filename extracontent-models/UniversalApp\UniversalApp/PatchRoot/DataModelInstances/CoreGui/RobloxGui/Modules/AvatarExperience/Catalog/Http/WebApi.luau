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
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local v16 = string.format("https://develop.%s", v5.DOMAIN);
local v60 = {
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
    end, 
    FetchItemDetails = function(v33, v34) --[[ Line: 118 ]] --[[ Name: FetchItemDetails ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v33(string.format("%sv1/catalog/items/details", v5.CATALOG_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                items = v34
            })
        });
    end, 
    FetchCollectibleItemDetails = function(v35, v36) --[[ Line: 126 ]] --[[ Name: FetchCollectibleItemDetails ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v35(string.format("%smarketplace-items/v1/items/details", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                itemIds = v36
            })
        });
    end, 
    PurchaseProduct = function(v37, v38, v39, v40, v41) --[[ Line: 134 ]] --[[ Name: PurchaseProduct ]]
        -- upvalues: v6 (copy), v5 (copy), l_HttpService_0 (copy), v7 (copy)
        v6.isType(v38, "string", "CatalogWebApi.PurchaseProduct: productId");
        v6.isNonNegativeNumber(v39, "CatalogWebApi.PurchaseProduct: expectedPrice");
        v6.isType(v40, "string", "CatalogWebApi.PurchaseProduct: expectedSellerId");
        return v37(string.format("%sv1/purchases/products/%s", v5.ECONOMY_URL, v38), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v39), 
                expectedSellerId = tostring(v40), 
                userAssetId = v41
            })
        });
    end, 
    PurchaseCollectibleItem = function(v42, v43, v44, v45, v46, v47, v48, v49, v50) --[[ Line: 156 ]] --[[ Name: PurchaseCollectibleItem ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy), l_FFlagAXDurablesSupport_0 (copy)
        return v42(string.format("%smarketplace-sales/v1/item/%s/purchase-item", v5.APIS_URL, v43), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v45), 
                expectedSellerId = tostring(v46), 
                expectedPurchaserId = v48, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v47, 
                collectibleProductId = v44, 
                idempotencyKey = v49, 
                rentalOptionDays = if l_FFlagAXDurablesSupport_0 then v50 else nil
            })
        });
    end, 
    PurchaseCollectibleItemResale = function(v51, v52, v53, v54, v55, v56, v57, v58, v59) --[[ Line: 182 ]] --[[ Name: PurchaseCollectibleItemResale ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
        return v51(string.format("%smarketplace-sales/v1/item/%s/purchase-resale", v5.APIS_URL, v52), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                expectedCurrency = v7.ExpectedCurrencyRobux, 
                expectedPrice = tostring(v55), 
                expectedSellerId = tostring(v56), 
                expectedPurchaserId = v58, 
                expectedPurchaserType = v7.CreatorType.User, 
                expectedSellerType = v57, 
                collectibleProductId = v54, 
                collectibleItemInstanceId = v53, 
                idempotencyKey = v59
            })
        });
    end
};
if v13 then
    v60.RedeemQRCodeItem = function(v61, v62) --[[ Line: 209 ]] --[[ Name: RedeemQRCodeItem ]]
        -- upvalues: v6 (copy), v5 (copy)
        v6.isType(v62, "string", "CatalogWebApi.RedeemQRCodeItem: assetId");
        return v61(string.format("%sv2/qr-code-auto-redeem/%s", v5.ECONOMY_URL, v62), "POST", {
            postBody = ""
        });
    end;
end;
v60.FetchSellPageData = function(v63, v64, v65) --[[ Line: 216 ]] --[[ Name: FetchSellPageData ]]
    -- upvalues: v5 (copy)
    return v63(string.format("%s/v1/assets/%s/users/%s/resellable-copies", v5.ECONOMY_URL, v64, v65), "GET");
end;
v60.FetchCollectibleResellableInstances = function(v66, v67, v68) --[[ Line: 221 ]] --[[ Name: FetchCollectibleResellableInstances ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v69 = v5:makeQueryString({
        ownerId = v68, 
        ownerType = v7.CreatorType.User, 
        cursor = "", 
        limit = v7.MaxOwnedCopiesPerPage
    });
    return v66(string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", v5.APIS_URL, v67, v69), "GET");
end;
v60.FetchAssetResellers = function(v70, v71, v72, _) --[[ Line: 239 ]] --[[ Name: FetchAssetResellers ]]
    -- upvalues: v5 (copy), v7 (copy)
    local v74 = v5:makeQueryString({
        cursor = v72, 
        limit = v7.MaxResellersPerPage
    });
    return v70(string.format("%s/v1/assets/%s/resellers?%s", v5.ECONOMY_URL, v71, v74), "GET");
end;
v60.FetchAssetResaleData = function(v75, v76) --[[ Line: 248 ]] --[[ Name: FetchAssetResaleData ]]
    -- upvalues: v5 (copy)
    return v75(string.format("%s/v1/assets/%s/resale-data", v5.ECONOMY_URL, v76), "GET");
end;
v60.FetchCollectibleResaleData = function(v77, v78) --[[ Line: 253 ]] --[[ Name: FetchCollectibleResaleData ]]
    -- upvalues: v5 (copy)
    return v77(string.format("%smarketplace-sales/v1/item/%s/resale-data", v5.APIS_URL, v78), "GET");
end;
v60.GetCollectibleResellers = function(v79, v80, v81, v82) --[[ Line: 258 ]] --[[ Name: GetCollectibleResellers ]]
    -- upvalues: v5 (copy)
    local v83 = v5:makeQueryString({
        cursor = v81, 
        limit = v82
    });
    return v79(string.format("%smarketplace-sales/v1/item/%s/resellers?%s", v5.APIS_URL, v80, v83), "GET");
end;
v60.RemoveCurrentlySellingAsset = function(v84, v85, v86) --[[ Line: 267 ]] --[[ Name: RemoveCurrentlySellingAsset ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v87 = l_HttpService_0:JSONEncode({
        price = ""
    });
    return v84(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v85, v86), "PATCH", {
        postBody = v87
    });
end;
v60.RemoveAvailableToSell = function(v88, v89, v90, v91) --[[ Line: 275 ]] --[[ Name: RemoveAvailableToSell ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v92 = l_HttpService_0:JSONEncode({
        price = v91
    });
    return v88(string.format("%s/v1/assets/%s/resellable-copies/%s", v5.ECONOMY_URL, v89, v90), "PATCH", {
        postBody = v92
    });
end;
v60.UpdateCollectibleInstanceResaleState = function(v93, v94, v95, v96, v97, v98, v99) --[[ Line: 283 ]] --[[ Name: UpdateCollectibleInstanceResaleState ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v93(string.format("%smarketplace-sales/v1/item/%s/instance/%s/resale", v5.APIS_URL, v94, v95), "PATCH", {
        postBody = l_HttpService_0:JSONEncode({
            price = v97, 
            isOnSale = v98, 
            sellerId = v99, 
            sellerType = v7.CreatorType.User, 
            collectibleProductId = v96
        })
    });
end;
v60.GetMarketplaceFee = function(v100) --[[ Line: 310 ]] --[[ Name: GetMarketplaceFee ]]
    -- upvalues: v5 (copy)
    return v100(string.format("%s/v1/resale-tax-rate", v5.ECONOMY_URL), "GET");
end;
v60.GetCollectibleMarketplaceResaleParameters = function(v101, v102) --[[ Line: 315 ]] --[[ Name: GetCollectibleMarketplaceResaleParameters ]]
    -- upvalues: v5 (copy)
    return v101(string.format("%smarketplace-sales/v1/item/%s/get-resale-parameters", v5.APIS_URL, v102), "GET");
end;
v60.ReportItem = function(v103, v104, v105, v106) --[[ Line: 323 ]] --[[ Name: ReportItem ]]
    -- upvalues: l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    local v107 = {
        reportingItemTypeName = v103, 
        reportingItemId = v104, 
        reportCategoryId = v105, 
        comment = v106
    };
    local v108 = l_HttpService_0:JSONEncode(v107);
    if v108 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 333 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v108 (copy)
            return l_HttpRbxApiService_0:PostAsync("moderation/reportabuse", v108, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_0 then
            return l_result_0;
        end;
    end;
    return nil;
end;
v60.ReportItemV2 = function(v111, v112, v113, v114, v115, v116, v117, v118, v119) --[[ Line: 353 ]] --[[ Name: ReportItemV2 ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy), l_HttpRbxApiService_0 (copy)
    local v120 = {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = v116
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = v111
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v113
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v118
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = v117
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v119
                    }
                }
            }, 
            REPORT_TARGET_ASSET_ID = {
                valueList = {
                    {
                        data = v112
                    }
                }
            }, 
            REPORT_TARGET_ASSET_NAME = {
                valueList = {
                    {
                        data = v114
                    }
                }
            }, 
            REPORT_TARGET_ASSET_DESCRIPTION = {
                valueList = {
                    {
                        data = v115
                    }
                }
            }
        }
    };
    local v121 = l_HttpService_0:JSONEncode(v120);
    local v122 = v5.APIS_URL .. "abuse-reporting/v2/abuse-report";
    if v121 then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 417 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v122 (copy), v121 (copy)
            return l_HttpRbxApiService_0:PostAsyncFullUrl(v122, v121, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v60.AbuseReport = function(v125, v126) --[[ Line: 438 ]] --[[ Name: AbuseReport ]]
    -- upvalues: l_HttpService_0 (copy), v5 (copy)
    local v127 = {
        tags = {}
    };
    for v128, v129 in v126 do
        if typeof(v129) ~= "table" then
            v129 = {
                v129
            };
        end;
        local v130 = {};
        for _, v132 in v129 do
            table.insert(v130, {
                data = v132
            });
        end;
        v127.tags[v128] = {
            valueList = v130
        };
    end;
    local v133 = l_HttpService_0:JSONEncode(v127);
    return v125(v5.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", {
        postBody = v133
    });
end;
v60.AbuseReportBundle = function(v134, v135, v136, v137, v138) --[[ Line: 491 ]] --[[ Name: AbuseReportBundle ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v134(v5.APIS_URL .. "abuse-reporting/v1/safety-event", "POST", {
        postBody = l_HttpService_0:JSONEncode({
            safetyEvent = {
                eventTime = v138, 
                idempotencyKey = "ugc_bundle/" .. tostring(v136) .. "/" .. tostring(v135), 
                tags = {
                    SUBMITTER_USER_ID = {
                        valueList = {
                            {
                                data = tostring(v135)
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
                                data = tostring(v136)
                            }
                        }
                    }, 
                    ENTRY_POINT = {
                        valueList = {
                            {
                                data = v137
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
v60.GetTopics = function(v139, v140, v141) --[[ Line: 543 ]] --[[ Name: GetTopics ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), v7 (copy)
    return v139(string.format("%sv1/topic/get-topics", v5.CATALOG_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            selectTopics = v140, 
            inputQuery = v141, 
            maxResult = v7.MaxTopics
        })
    });
end;
v60.GetInitialTopics = function(v142, v143) --[[ Line: 556 ]] --[[ Name: GetInitialTopics ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), l_HttpService_0 (copy)
    local v144 = string.format("%sv1/topic/get-topics", v5.CATALOG_URL);
    if #v143 > v7.MaxItemsInTopicsRequest then
        v143 = v8.slice(v143, 1, v7.MaxItemsInTopicsRequest);
    end;
    return v142(v144, "POST", {
        postBody = l_HttpService_0:JSONEncode({
            items = v143, 
            maxResult = v7.MaxTopics
        })
    });
end;
v60.GetCatalogMetadata = function(v145) --[[ Line: 574 ]] --[[ Name: GetCatalogMetadata ]]
    -- upvalues: v5 (copy)
    return v145(string.format("%s/v1/catalog/metadata", v5.CATALOG_URL), "GET");
end;
v60.FetchAssetVersionData = function(v146, v147) --[[ Line: 585 ]] --[[ Name: FetchAssetVersionData ]]
    -- upvalues: v16 (copy)
    return v146(string.format("%sv1/assets/%s/saved-versions", v16, v147), "GET");
end;
v60.GetLookDetails = function(v148, v149) --[[ Line: 590 ]] --[[ Name: GetLookDetails ]]
    -- upvalues: v5 (copy)
    return v148(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v149), "GET");
end;
v60.HasFavoritedLook = function(v150, v151) --[[ Line: 595 ]] --[[ Name: HasFavoritedLook ]]
    -- upvalues: v5 (copy)
    return v150(string.format("%slook-api/v1/looks/%s/favorite", v5.APIS_URL, v151), "GET");
end;
if l_FFlagAXCatalogMakeupSupport_0 then
    v60.FavoriteLookV2 = function(v152, v153, v154) --[[ Line: 601 ]] --[[ Name: FavoriteLookV2 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v152(string.format("%slook-api/v1/looks/favorite/create", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v153, 
                lookType = v154 or ""
            })
        });
    end;
else
    v60.FavoriteLook = function(v155, v156) --[[ Line: 611 ]] --[[ Name: FavoriteLook ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v155(string.format("%slook-api/v1/looks/favorite/create", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v156, 
                lookType = "Avatar"
            })
        });
    end;
end;
if l_FFlagAXCatalogMakeupSupport_0 then
    v60.UnfavoriteLookV2 = function(v157, v158, v159) --[[ Line: 623 ]] --[[ Name: UnfavoriteLookV2 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v157(string.format("%slook-api/v1/looks/favorite/delete", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v158, 
                lookType = v159 or ""
            })
        });
    end;
else
    v60.UnfavoriteLook = function(v160, v161) --[[ Line: 633 ]] --[[ Name: UnfavoriteLook ]]
        -- upvalues: v5 (copy), l_HttpService_0 (copy)
        return v160(string.format("%slook-api/v1/looks/favorite/delete", v5.APIS_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                id = v161, 
                lookType = "Avatar"
            })
        });
    end;
end;
v60.GetLookDetailsV2 = function(v162, v163) --[[ Line: 644 ]] --[[ Name: GetLookDetailsV2 ]]
    -- upvalues: v5 (copy)
    return v162(string.format("%slook-api/v2/looks/%s", v5.APIS_URL, v163), "GET");
end;
v60.DeleteLook = function(v164, v165) --[[ Line: 649 ]] --[[ Name: DeleteLook ]]
    -- upvalues: v5 (copy)
    return v164(string.format("%slook-api/v1/looks/%s", v5.APIS_URL, v165), "DELETE");
end;
v60.PurchaseLook = function(v166, v167, v168, v169, v170, v171) --[[ Line: 654 ]] --[[ Name: PurchaseLook ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy)
    return v166(string.format("%slook-api/v1/looks/%s/purchase", v5.APIS_URL, v167), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v167, 
            idempotencyKey = v168, 
            expectedPrice = v169, 
            salesLocationId = v170, 
            excludedItems = v171
        })
    });
end;
v60.PurchaseLookV2 = function(v172, v173, v174, v175, v176, v177, v178, v179) --[[ Line: 674 ]] --[[ Name: PurchaseLookV2 ]]
    -- upvalues: v5 (copy), l_HttpService_0 (copy), l_FFlagAXDurablesSupport_0 (copy)
    return v172(string.format("%slook-api/v2/looks/%s/purchase", v5.APIS_URL, v173), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            lookId = v173, 
            idempotencyKey = v174, 
            expectedPrice = v175, 
            salesLocationId = v176, 
            excludedAssets = v177, 
            excludedBundles = v178, 
            timedOptions = if l_FFlagAXDurablesSupport_0 then v179 else nil
        })
    });
end;
v60.GetOrGenerateShortShareLink = function(v180, v181) --[[ Line: 698 ]] --[[ Name: GetOrGenerateShortShareLink ]]
    -- upvalues: v11 (copy), v12 (copy)
    local v182 = v11.httpRequest.config({
        requestFunction = v11.httpRequest.requestFunctions.HttpRbxApi, 
        maxWaitTime = 3, 
        maxRetryCount = game:DefineFastInt("CatalogWebApiHttpRetryCount", 2)
    });
    local v183 = v11.RoduxNetworking.config({
        keyPath = "AvatarExperience", 
        networkImpl = v182
    });
    return v12.config({
        roduxNetworking = v183, 
        useMockedResponse = false
    }).GetOrGenerateLink.API({
        linkType = "AvatarItemDetails", 
        itemId = v180, 
        itemType = v181
    });
end;
return v60;