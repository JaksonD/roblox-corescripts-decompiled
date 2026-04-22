local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.ArgCheck);
local v5 = require(l_Parent_0.LoggingProtocol);
local v6 = require(l_Parent_0.Cryo);
local l_getGameTileLayoutData_0 = require(l_Parent_0.GameTile).getGameTileLayoutData;
local l_getValidTileBadges_0 = require(l_Parent_0.GameTile).getValidTileBadges;
local l_ItemLayoutDataParsingUtils_0 = require(l_Parent_0.GameTile).ItemLayoutDataParsingUtils;
local l_calculateRowPositionFields_0 = require(l_Parent_0.UnifiedLogging).calculateRowPositionFields;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v13 = require(script.Parent.gameImpressionsEvent);
local v14 = require(script.Parent.reportGameImpressionCounts);
local v15 = require(script.Parent.FeedItemRowDataHitCounter);
local v16 = require(script.Parent.FeedItemRowDataMissingCounter);
local l_FFlagLuaAppGameImpressionsMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
local l_FFlagLuaAppFixSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixSearchImpressions;
local function v80(v27, v28, v29, v30, v31, v32, v33, v34, v35) --[[ Line: 61 ]] --[[ Name: addGameFields ]]
    -- upvalues: l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), l_FFlagLuaAppFixSearchImpressions_0 (copy), l_GameCollectionItemTypes_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_calculateRowPositionFields_0 (copy), v4 (copy), l_getGameTileLayoutData_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_ItemLayoutDataParsingUtils_0 (copy), l_getValidTileBadges_0 (copy), v6 (copy)
    local v36 = {};
    local v37 = {};
    local v38 = {};
    local v39 = {};
    local v40 = {};
    local v41 = {};
    local v42 = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then {} else nil;
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = {};
    local v47 = {};
    local v48 = {};
    local v49 = {};
    local v50 = {};
    local v51 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
    local v52 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v53 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v54 = false;
    for _, v56 in ipairs(v27) do
        local v57 = v28[v56];
        if v57 ~= nil then
            if l_FFlagLuaAppFixSearchImpressions_0 and v57.gameCollectionItemTypeOverride == l_GameCollectionItemTypes_0.GameCollectionItemType.Blank then
                l_DiscoveryEventErrorLogger_0.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
                    entryIndex = v56, 
                    pageContext = v35, 
                    emphasisFlag = if v34 then v34.emphasisFlag else nil, 
                    sortPos = if v34 then v34.sortPos else nil, 
                    gameSortId = v32
                });
            else
                local v58 = v57.uiIndex or v56;
                local v59 = v57.topicContentsIndex or v56;
                table.insert(v36, v57.placeId or 0);
                table.insert(v37, v56);
                table.insert(v39, v57.universeId or 0);
                table.insert(v38, v59);
                if v57.isSponsored then
                    v54 = true;
                    table.insert(v43, 1);
                    table.insert(v44, v57.adId or 0);
                else
                    table.insert(v43, 0);
                    table.insert(v44, 0);
                end;
                if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v51 then
                    table.insert(v51, v57.gameCollectionItemTypeOverride or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile);
                end;
                local v60 = l_calculateRowPositionFields_0(v58, v29, v31);
                if v29 and v29 > 0 then
                    table.insert(v45, v60.rowInSort);
                    if v31 then
                        table.insert(v46, v60.rowOnPage);
                        table.insert(v47, v60.positionInRow);
                    end;
                else
                    v4.assert(v29 ~= 0);
                    if v31 then
                        table.insert(v46, v31);
                        table.insert(v47, v58);
                    end;
                end;
                if v30 then
                    local v61 = l_getGameTileLayoutData_0(v57, v32);
                    if v57 and v57.thumbnailAssetId then
                        table.insert(v40, v57.thumbnailAssetId);
                    else
                        table.insert(v40, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v57 and v57.primaryWideImageAssetId then v57.primaryWideImageAssetId else l_ItemLayoutDataParsingUtils_0.getWideImageAssetId(v61)) or v57 and v57.primaryWideAssetId or nil or "0");
                    end;
                    if v57 and v57.thumbnailListId then
                        table.insert(v41, v57.thumbnailListId);
                    else
                        table.insert(v41, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v57 and v57.primaryWideImageListId then v57.primaryWideImageListId else v61 and v61.primaryMediaAsset and v61.primaryMediaAsset.wideImageListId) or v57 and v57.primaryWideListId or "0");
                    end;
                    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                        if v57 and v57.videoThumbnailAssetId then
                            table.insert(v42, v57.videoThumbnailAssetId);
                        else
                            table.insert(v42, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v57 and v57.primaryWideVideoAssetId then v57.primaryWideVideoAssetId else v61 and v61.primaryMediaAsset and v61.primaryMediaAsset.wideVideoAssetId) or "0");
                        end;
                    end;
                    local v62 = nil;
                    if v57 and v57.tileBadgeIds then
                        v62 = v57.tileBadgeIds;
                    elseif v61 and v61.tileBadgesByPosition then
                        local v63 = l_getValidTileBadges_0(v61.tileBadgesByPosition);
                        local v64 = {};
                        for v65, v66 in v63 do
                            local v68 = v6.List.map(v66, function(v67) --[[ Line: 222 ]]
                                return v67.analyticsId;
                            end);
                            if #v68 > 0 then
                                table.insert(v64, v65 .. "=" .. table.concat(v68, "+"));
                            end;
                        end;
                        if #v64 > 0 then
                            v62 = table.concat(v64, "&");
                        end;
                    end;
                    table.insert(v48, v62 or "0");
                    local v69 = nil;
                    if v57 and v57.footer and v57.footer.analytics then
                        v69 = v57.footer.analytics;
                    elseif v61 and v61.footer and v61.footer.analytics then
                        v69 = v61.footer.analytics;
                    end;
                    if v69 and v69.textLiteral then
                        table.insert(v49, v69.textLiteral);
                    else
                        table.insert(v49, "0");
                    end;
                    if v69 and v69.locKey then
                        table.insert(v50, v69.locKey);
                    else
                        table.insert(v50, "0");
                    end;
                end;
                if l_FFlagLuaAppLogOmniAnalyticsData_0 then
                    local l_analyticsData_0 = v57.analyticsData;
                    if l_analyticsData_0 then
                        for v71 in l_analyticsData_0 do
                            v53[v71] = true;
                        end;
                    end;
                    table.insert(v52, l_analyticsData_0 or {});
                end;
            end;
        end;
    end;
    local v72 = #v36;
    v4.assert(v72 == #v37);
    v4.assert(v72 == #v38);
    v4.assert(v72 == #v39);
    v4.assert(v72 == #v43);
    v4.assert(v72 == #v44);
    if #v45 > 0 then
        v4.assert(v72 == #v45);
    end;
    if #v46 > 0 then
        v4.assert(v72 == #v46);
    end;
    if #v47 > 0 then
        v4.assert(v72 == #v47);
    end;
    local v73 = {
        rootPlaceIds = table.concat(v36, ","), 
        absPositions = table.concat(v37, ","), 
        topicDataPositions = table.concat(v38, ","), 
        universeIds = table.concat(v39, ",")
    };
    if v54 then
        v73.adFlags = table.concat(v43, ",");
        v73.adIds = table.concat(v44, ",");
    end;
    if #v45 > 0 then
        v73.rows = table.concat(v45, ",");
    end;
    if #v46 > 0 then
        v73.rowsOnPage = table.concat(v46, ",");
    end;
    if #v47 > 0 then
        v73.positionsInRows = table.concat(v47, ",");
    end;
    if v30 and #v40 > 0 then
        v73.thumbnailAssetIds = table.concat(v40, ",");
    end;
    if v30 and #v41 > 0 then
        v73.thumbnailListIds = table.concat(v41, ",");
    end;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v30 and #v42 > 0 then
        v73.videoThumbnailAssetIds = table.concat(v42, ",");
    end;
    if v30 and #v48 > 0 then
        v73.tileBadgeContexts = table.concat(v48, ",");
    end;
    if v49 and #v49 > 0 then
        v73.footerTextLiterals = table.concat(v49, ",");
    end;
    if v50 and #v50 > 0 then
        v73.footerLocalizationKeys = table.concat(v50, ",");
    end;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v51 and #v51 > 0 then
        v73.tileTypes = table.concat(v51, ",");
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 then
        local v74 = {};
        if next(v53) then
            for v75 in v53 do
                local v76 = {};
                for _, v78 in v52 do
                    table.insert(v76, v78[v75] or "0");
                end;
                v74[("%*_arr"):format(v75)] = table.concat(v76, ",");
            end;
        end;
        local v79 = v6.Dictionary.join(v74, v33 or {});
        if next(v79) then
            v73.analyticsData = v79;
        end;
    end;
    return v73, v72;
end;
local function _(v81) --[[ Line: 360 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v81.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
local function v106(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101) --[[ Line: 367 ]]
    -- upvalues: v5 (copy), v15 (copy), v16 (copy), v80 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v13 (copy), v14 (copy)
    if not v84 or not v85 then
        if v99 then
            v99((("Missing analytics service eventIngest: %* appAnalytics: %*"):format(v84, v85)));
        end;
        return;
    elseif not v86 or #v86 == 0 then
        if v99 then
            v99((("Missing impressionsToSend or impressionsToSend == 0 %*"):format(v86)));
        end;
        return;
    elseif not v87 or #v87 == 0 then
        if v99 then
            v99((("Missing topicContentsEntries or topicContentsEntries == 0 %*"):format(v87)));
        end;
        return;
    else
        if v91 then
            v5.default:logRobloxTelemetryCounter(v15);
        else
            v5.default:logRobloxTelemetryCounter(v16);
        end;
        local v102 = nil;
        local v103 = nil;
        local v104, v105 = v80(v86, v87, v94, v95, v91, v89, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v101 else nil);
        v102 = v104;
        v103 = v105;
        v102 = v6.Dictionary.join(v102, {
            sortPos = v90, 
            gameSetTypeId = v89, 
            gameSetTargetId = v92, 
            pageId = v93, 
            componentType = v96, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            appliedFilters = v97, 
            loadSource = v98, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v100 else nil
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            v104 = v102;
            v105 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if v105 and v105 ~= "" then
                v104.mobileAdvertisingId = v105;
            end;
        end;
        v13(v84, v88, v102);
        v14(v85, v88, v103);
        return;
    end;
end;
local function v121(v107, v108, v109, v110, v111, v112, v113, v114, v115, v116) --[[ Line: 445 ]]
    -- upvalues: v80 (copy), l_FFlagLuaAppFixSearchImpressions_0 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v13 (copy), v14 (copy)
    if not v107 or not v108 then
        return;
    elseif not v109 or #v109 == 0 then
        return;
    elseif not v110 or #v110 == 0 then
        return;
    else
        local v117, v118 = v80(v109, v110, v113, v115, v114, nil, nil, if l_FFlagLuaAppFixSearchImpressions_0 then v112 else nil, if l_FFlagLuaAppFixSearchImpressions_0 then v111 else nil);
        if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then
            v117 = v6.Dictionary.join(v117, v112, {
                locale = l_LocalizationService_0.RobloxLocaleId, 
                componentType = v116
            });
        else
            v117.locale = l_LocalizationService_0.RobloxLocaleId;
            v117 = v6.Dictionary.join(v117, v112);
        end;
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v117_0 = v117;
            local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
                l_v117_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
            end;
        end;
        v13(v107, v111, v117);
        v14(v108, v111, v118);
        return;
    end;
end;
local function v130(v122, v123, v124, v125, v126) --[[ Line: 498 ]]
    -- upvalues: v80 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v13 (copy), v14 (copy)
    local v127, v128 = v80(v124, v125);
    v127.locale = l_LocalizationService_0.RobloxLocaleId;
    v127.refId = v126;
    if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then
            v127.mobileAdvertisingId = l_l_AppStorageService_0_Item_2;
        end;
    end;
    v13(v122, "recommended", v127);
    v14(v123, "recommended", v128);
end;
local function v145(v131, v132, v133, v134, v135, v136, v137, v138, v139, v140) --[[ Line: 518 ]]
    -- upvalues: v80 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v13 (copy), v14 (copy)
    if not v131 or not v132 then
        return;
    elseif not v133 or #v133 == 0 then
        return;
    elseif not v134 or #v134 == 0 then
        return;
    else
        local v141, v142 = v80(v133, v134, nil, v140);
        v141 = v6.Dictionary.join(v141, {
            gameSetTypeId = v136, 
            gameSetTargetId = v137, 
            pageId = v138, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            seeAllFlag = 1, 
            appliedFilters = v139
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v141_0 = v141;
            local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then
                l_v141_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_3;
            end;
        end;
        v13(v131, v135, v141);
        v14(v132, v135, v142, 1);
        return;
    end;
end;
local v155 = l_FFlagEnableInGameExitModalNextUpUi_0 and function(v146, v147, v148, v149, v150) --[[ Line: 566 ]]
    -- upvalues: v80 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v13 (copy), v14 (copy)
    if not v146 or not v147 then
        return;
    elseif not v149 or #v149 == 0 then
        return;
    elseif not v150 or #v150 == 0 then
        return;
    else
        local v151, v152 = v80(v149, v150);
        v151 = v6.Dictionary.join(v151, {
            gameSetTypeId = v148, 
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v151_0 = v151;
            local l_l_AppStorageService_0_Item_4 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_4 and l_l_AppStorageService_0_Item_4 ~= "" then
                l_v151_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_4;
            end;
        end;
        v13(v146, "InGameExitPage", v151);
        v14(v147, "InGameExitPage", v152);
        return;
    end;
end or nil;
local v164 = l_FFlagTraversalHistoryDiscoveryTelemetry_0 and function(v156, v157, v158, v159, v160, v161) --[[ Line: 602 ]]
    -- upvalues: v80 (copy), v6 (copy), l_LocalizationService_0 (copy), v13 (copy), v14 (copy)
    if not v156 or not v157 then
        return;
    else
        local v162, v163 = v80(v158, v159, v160, false, v161);
        v162 = v6.Dictionary.join(v162, {
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        v13(v156, "InExpHistoryPage", v162);
        v14(v157, "InExpHistoryPage", v163);
        return;
    end;
end or nil;
return {
    sendFromTopicContents = v106, 
    sendFromSearch = v121, 
    sendFromGameDetails = v130, 
    sendFromSeeAll = v145, 
    sendFromInGameExitModal = if l_FFlagEnableInGameExitModalNextUpUi_0 then v155 else nil, 
    sendFromTraversalHistoryPage = v164
};