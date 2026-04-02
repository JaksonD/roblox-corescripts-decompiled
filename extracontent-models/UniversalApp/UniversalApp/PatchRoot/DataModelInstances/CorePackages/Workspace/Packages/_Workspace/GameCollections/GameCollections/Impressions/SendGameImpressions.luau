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
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v12 = require(script.Parent.gameImpressionsEvent);
local v13 = require(script.Parent.reportGameImpressionCounts);
local v14 = require(script.Parent.FeedItemRowDataHitCounter);
local v15 = require(script.Parent.FeedItemRowDataMissingCounter);
local l_FFlagLuaAppGameImpressionsMobileAdsId_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagEnableInGameExitModalNextUpUi_0 = require(l_Parent_0.SharedFlags).FFlagEnableInGameExitModalNextUpUi;
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
local function v77(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 60 ]] --[[ Name: addGameFields ]]
    -- upvalues: l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), l_GameCollectionItemTypes_0 (copy), l_calculateRowPositionFields_0 (copy), v4 (copy), l_getGameTileLayoutData_0 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), l_ItemLayoutDataParsingUtils_0 (copy), l_getValidTileBadges_0 (copy), v6 (copy)
    local v33 = {};
    local v34 = {};
    local v35 = {};
    local v36 = {};
    local v37 = {};
    local v38 = {};
    local v39 = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then {} else nil;
    local v40 = {};
    local v41 = {};
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = {};
    local v47 = {};
    local v48 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
    local v49 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v50 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v51 = false;
    for _, v53 in ipairs(v26) do
        local v54 = v27[v53];
        if v54 ~= nil then
            local v55 = v54.uiIndex or v53;
            local v56 = v54.topicContentsIndex or v53;
            table.insert(v33, v54.placeId or 0);
            table.insert(v34, v53);
            table.insert(v36, v54.universeId or 0);
            table.insert(v35, v56);
            if v54.isSponsored then
                v51 = true;
                table.insert(v40, 1);
                table.insert(v41, v54.adId or 0);
            else
                table.insert(v40, 0);
                table.insert(v41, 0);
            end;
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v48 then
                table.insert(v48, v54.gameCollectionItemTypeOverride or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile);
            end;
            local v57 = l_calculateRowPositionFields_0(v55, v28, v30);
            if v28 and v28 > 0 then
                table.insert(v42, v57.rowInSort);
                if v30 then
                    table.insert(v43, v57.rowOnPage);
                    table.insert(v44, v57.positionInRow);
                end;
            else
                v4.assert(v28 ~= 0);
                if v30 then
                    table.insert(v43, v30);
                    table.insert(v44, v55);
                end;
            end;
            if v29 then
                local v58 = l_getGameTileLayoutData_0(v54, v31);
                if v54 and v54.thumbnailAssetId then
                    table.insert(v37, v54.thumbnailAssetId);
                else
                    table.insert(v37, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v54 and v54.primaryWideImageAssetId then v54.primaryWideImageAssetId else if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then l_ItemLayoutDataParsingUtils_0.getWideImageAssetId(v58) else v58 and v58.primaryMediaAsset and v58.primaryMediaAsset.wideImageAssetId) or v54 and v54.primaryWideAssetId or nil or "0");
                end;
                if v54 and v54.thumbnailListId then
                    table.insert(v38, v54.thumbnailListId);
                else
                    table.insert(v38, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v54 and v54.primaryWideImageListId then v54.primaryWideImageListId else v58 and v58.primaryMediaAsset and v58.primaryMediaAsset.wideImageListId) or v54 and v54.primaryWideListId or "0");
                end;
                if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                    if v54 and v54.videoThumbnailAssetId then
                        table.insert(v39, v54.videoThumbnailAssetId);
                    else
                        table.insert(v39, (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v54 and v54.primaryWideVideoAssetId then v54.primaryWideVideoAssetId else v58 and v58.primaryMediaAsset and v58.primaryMediaAsset.wideVideoAssetId) or "0");
                    end;
                end;
                local v59 = nil;
                if v54 and v54.tileBadgeIds then
                    v59 = v54.tileBadgeIds;
                elseif v58 and v58.tileBadgesByPosition then
                    local v60 = l_getValidTileBadges_0(v58.tileBadgesByPosition);
                    local v61 = {};
                    for v62, v63 in v60 do
                        local v65 = v6.List.map(v63, function(v64) --[[ Line: 206 ]]
                            return v64.analyticsId;
                        end);
                        if #v65 > 0 then
                            table.insert(v61, v62 .. "=" .. table.concat(v65, "+"));
                        end;
                    end;
                    if #v61 > 0 then
                        v59 = table.concat(v61, "&");
                    end;
                end;
                table.insert(v45, v59 or "0");
                local v66 = nil;
                if v54 and v54.footer and v54.footer.analytics then
                    v66 = v54.footer.analytics;
                elseif v58 and v58.footer and v58.footer.analytics then
                    v66 = v58.footer.analytics;
                end;
                if v66 and v66.textLiteral then
                    table.insert(v46, v66.textLiteral);
                else
                    table.insert(v46, "0");
                end;
                if v66 and v66.locKey then
                    table.insert(v47, v66.locKey);
                else
                    table.insert(v47, "0");
                end;
            end;
            if l_FFlagLuaAppLogOmniAnalyticsData_0 then
                local l_analyticsData_0 = v54.analyticsData;
                if l_analyticsData_0 then
                    for v68 in l_analyticsData_0 do
                        v50[v68] = true;
                    end;
                end;
                table.insert(v49, l_analyticsData_0 or {});
            end;
        end;
    end;
    local v69 = #v33;
    v4.assert(v69 == #v34);
    v4.assert(v69 == #v35);
    v4.assert(v69 == #v36);
    v4.assert(v69 == #v40);
    v4.assert(v69 == #v41);
    if #v42 > 0 then
        v4.assert(v69 == #v42);
    end;
    if #v43 > 0 then
        v4.assert(v69 == #v43);
    end;
    if #v44 > 0 then
        v4.assert(v69 == #v44);
    end;
    local v70 = {
        rootPlaceIds = table.concat(v33, ","), 
        absPositions = table.concat(v34, ","), 
        topicDataPositions = table.concat(v35, ","), 
        universeIds = table.concat(v36, ",")
    };
    if v51 then
        v70.adFlags = table.concat(v40, ",");
        v70.adIds = table.concat(v41, ",");
    end;
    if #v42 > 0 then
        v70.rows = table.concat(v42, ",");
    end;
    if #v43 > 0 then
        v70.rowsOnPage = table.concat(v43, ",");
    end;
    if #v44 > 0 then
        v70.positionsInRows = table.concat(v44, ",");
    end;
    if v29 and #v37 > 0 then
        v70.thumbnailAssetIds = table.concat(v37, ",");
    end;
    if v29 and #v38 > 0 then
        v70.thumbnailListIds = table.concat(v38, ",");
    end;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v29 and #v39 > 0 then
        v70.videoThumbnailAssetIds = table.concat(v39, ",");
    end;
    if v29 and #v45 > 0 then
        v70.tileBadgeContexts = table.concat(v45, ",");
    end;
    if v46 and #v46 > 0 then
        v70.footerTextLiterals = table.concat(v46, ",");
    end;
    if v47 and #v47 > 0 then
        v70.footerLocalizationKeys = table.concat(v47, ",");
    end;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v48 and #v48 > 0 then
        v70.tileTypes = table.concat(v48, ",");
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 then
        local v71 = {};
        if next(v50) then
            for v72 in v50 do
                local v73 = {};
                for _, v75 in v49 do
                    table.insert(v73, v75[v72] or "0");
                end;
                v71[("%*_arr"):format(v72)] = table.concat(v73, ",");
            end;
        end;
        local v76 = v6.Dictionary.join(v71, v32 or {});
        if next(v76) then
            v70.analyticsData = v76;
        end;
    end;
    return v70, v69;
end;
local function _(v78) --[[ Line: 344 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v78.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
local function v103(v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98) --[[ Line: 351 ]]
    -- upvalues: v5 (copy), v14 (copy), v15 (copy), v77 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v81 or not v82 then
        if v96 then
            v96((("Missing analytics service eventIngest: %* appAnalytics: %*"):format(v81, v82)));
        end;
        return;
    elseif not v83 or #v83 == 0 then
        if v96 then
            v96((("Missing impressionsToSend or impressionsToSend == 0 %*"):format(v83)));
        end;
        return;
    elseif not v84 or #v84 == 0 then
        if v96 then
            v96((("Missing topicContentsEntries or topicContentsEntries == 0 %*"):format(v84)));
        end;
        return;
    else
        if v88 then
            v5.default:logRobloxTelemetryCounter(v14);
        else
            v5.default:logRobloxTelemetryCounter(v15);
        end;
        local v99 = nil;
        local v100 = nil;
        local v101, v102 = v77(v83, v84, v91, v92, v88, v86, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v98 else nil);
        v99 = v101;
        v100 = v102;
        v99 = v6.Dictionary.join(v99, {
            sortPos = v87, 
            gameSetTypeId = v86, 
            gameSetTargetId = v89, 
            pageId = v90, 
            componentType = v93, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            appliedFilters = v94, 
            loadSource = v95, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v97 else nil
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            v101 = v99;
            v102 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if v102 and v102 ~= "" then
                v101.mobileAdvertisingId = v102;
            end;
        end;
        v12(v81, v85, v99);
        v13(v82, v85, v100);
        return;
    end;
end;
local function v118(v104, v105, v106, v107, v108, v109, v110, v111, v112, v113) --[[ Line: 429 ]]
    -- upvalues: v77 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v104 or not v105 then
        return;
    elseif not v106 or #v106 == 0 then
        return;
    elseif not v107 or #v107 == 0 then
        return;
    else
        local v114, v115 = v77(v106, v107, v110, v112, v111);
        if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then
            v114 = v6.Dictionary.join(v114, v109, {
                locale = l_LocalizationService_0.RobloxLocaleId, 
                componentType = v113
            });
        else
            v114.locale = l_LocalizationService_0.RobloxLocaleId;
            v114 = v6.Dictionary.join(v114, v109);
        end;
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v114_0 = v114;
            local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
                l_v114_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
            end;
        end;
        v12(v104, v108, v114);
        v13(v105, v108, v115);
        return;
    end;
end;
local function v127(v119, v120, v121, v122, v123) --[[ Line: 473 ]]
    -- upvalues: v77 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    local v124, v125 = v77(v121, v122);
    v124.locale = l_LocalizationService_0.RobloxLocaleId;
    v124.refId = v123;
    if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then
            v124.mobileAdvertisingId = l_l_AppStorageService_0_Item_2;
        end;
    end;
    v12(v119, "recommended", v124);
    v13(v120, "recommended", v125);
end;
local function v142(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137) --[[ Line: 493 ]]
    -- upvalues: v77 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v128 or not v129 then
        return;
    elseif not v130 or #v130 == 0 then
        return;
    elseif not v131 or #v131 == 0 then
        return;
    else
        local v138, v139 = v77(v130, v131, nil, v137);
        v138 = v6.Dictionary.join(v138, {
            gameSetTypeId = v133, 
            gameSetTargetId = v134, 
            pageId = v135, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            seeAllFlag = 1, 
            appliedFilters = v136
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v138_0 = v138;
            local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then
                l_v138_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_3;
            end;
        end;
        v12(v128, v132, v138);
        v13(v129, v132, v139, 1);
        return;
    end;
end;
local v152 = l_FFlagEnableInGameExitModalNextUpUi_0 and function(v143, v144, v145, v146, v147) --[[ Line: 541 ]]
    -- upvalues: v77 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v143 or not v144 then
        return;
    elseif not v146 or #v146 == 0 then
        return;
    elseif not v147 or #v147 == 0 then
        return;
    else
        local v148, v149 = v77(v146, v147);
        v148 = v6.Dictionary.join(v148, {
            gameSetTypeId = v145, 
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v148_0 = v148;
            local l_l_AppStorageService_0_Item_4 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_4 and l_l_AppStorageService_0_Item_4 ~= "" then
                l_v148_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_4;
            end;
        end;
        v12(v143, "InGameExitPage", v148);
        v13(v144, "InGameExitPage", v149);
        return;
    end;
end or nil;
local v161 = l_FFlagTraversalHistoryDiscoveryTelemetry_0 and function(v153, v154, v155, v156, v157, v158) --[[ Line: 577 ]]
    -- upvalues: v77 (copy), v6 (copy), l_LocalizationService_0 (copy), v12 (copy), v13 (copy)
    if not v153 or not v154 then
        return;
    else
        local v159, v160 = v77(v155, v156, v157, false, v158);
        v159 = v6.Dictionary.join(v159, {
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        v12(v153, "InExpHistoryPage", v159);
        v13(v154, "InExpHistoryPage", v160);
        return;
    end;
end or nil;
return {
    sendFromTopicContents = v103, 
    sendFromSearch = v118, 
    sendFromGameDetails = v127, 
    sendFromSeeAll = v142, 
    sendFromInGameExitModal = if l_FFlagEnableInGameExitModalNextUpUi_0 then v152 else nil, 
    sendFromTraversalHistoryPage = v161
};