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
local function v76(v25, v26, v27, v28, v29, v30, v31) --[[ Line: 54 ]] --[[ Name: addGameFields ]]
    -- upvalues: l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), l_GameCollectionItemTypes_0 (copy), l_calculateRowPositionFields_0 (copy), v4 (copy), l_getGameTileLayoutData_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), l_ItemLayoutDataParsingUtils_0 (copy), l_getValidTileBadges_0 (copy), v6 (copy)
    local v32 = {};
    local v33 = {};
    local v34 = {};
    local v35 = {};
    local v36 = {};
    local v37 = {};
    local v38 = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then {} else nil;
    local v39 = {};
    local v40 = {};
    local v41 = {};
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = {};
    local v47 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
    local v48 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v49 = if l_FFlagLuaAppLogOmniAnalyticsData_0 then {} else nil;
    local v50 = false;
    for _, v52 in ipairs(v25) do
        local v53 = v26[v52];
        if v53 ~= nil then
            local v54 = v53.uiIndex or v52;
            local v55 = v53.topicContentsIndex or v52;
            table.insert(v32, v53.placeId or 0);
            table.insert(v33, v52);
            table.insert(v35, v53.universeId or 0);
            table.insert(v34, v55);
            if v53.isSponsored then
                v50 = true;
                table.insert(v39, 1);
                table.insert(v40, v53.adId or 0);
            else
                table.insert(v39, 0);
                table.insert(v40, 0);
            end;
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v47 then
                table.insert(v47, v53.gameCollectionItemTypeOverride or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile);
            end;
            local v56 = l_calculateRowPositionFields_0(v54, v27, v29);
            if v27 and v27 > 0 then
                table.insert(v41, v56.rowInSort);
                if v29 then
                    table.insert(v42, v56.rowOnPage);
                    table.insert(v43, v56.positionInRow);
                end;
            else
                v4.assert(v27 ~= 0);
                if v29 then
                    table.insert(v42, v29);
                    table.insert(v43, v54);
                end;
            end;
            if v28 then
                local v57 = l_getGameTileLayoutData_0(v53, v30);
                if v53 and v53.thumbnailAssetId then
                    table.insert(v36, v53.thumbnailAssetId);
                else
                    table.insert(v36, (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then l_ItemLayoutDataParsingUtils_0.getWideImageAssetId(v57) else v57 and v57.primaryMediaAsset and v57.primaryMediaAsset.wideImageAssetId) or v53 and v53.primaryWideAssetId or nil or "0");
                end;
                if v53 and v53.thumbnailListId then
                    table.insert(v37, v53.thumbnailListId);
                else
                    table.insert(v37, v57 and v57.primaryMediaAsset and v57.primaryMediaAsset.wideImageListId or v53 and v53.primaryWideListId or "0");
                end;
                if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                    if v53 and v53.videoThumbnailAssetId then
                        table.insert(v38, v53.videoThumbnailAssetId);
                    else
                        table.insert(v38, v57 and v57.primaryMediaAsset and v57.primaryMediaAsset.wideVideoAssetId or "0");
                    end;
                end;
                local v58 = nil;
                if v53 and v53.tileBadgeIds then
                    v58 = v53.tileBadgeIds;
                elseif v57 and v57.tileBadgesByPosition then
                    local v59 = l_getValidTileBadges_0(v57.tileBadgesByPosition);
                    local v60 = {};
                    for v61, v62 in v59 do
                        local v64 = v6.List.map(v62, function(v63) --[[ Line: 185 ]]
                            return v63.analyticsId;
                        end);
                        if #v64 > 0 then
                            table.insert(v60, v61 .. "=" .. table.concat(v64, "+"));
                        end;
                    end;
                    if #v60 > 0 then
                        v58 = table.concat(v60, "&");
                    end;
                end;
                table.insert(v44, v58 or "0");
                local v65 = nil;
                if v53 and v53.footer and v53.footer.analytics then
                    v65 = v53.footer.analytics;
                elseif v57 and v57.footer and v57.footer.analytics then
                    v65 = v57.footer.analytics;
                end;
                if v65 and v65.textLiteral then
                    table.insert(v45, v65.textLiteral);
                else
                    table.insert(v45, "0");
                end;
                if v65 and v65.locKey then
                    table.insert(v46, v65.locKey);
                else
                    table.insert(v46, "0");
                end;
            end;
            if l_FFlagLuaAppLogOmniAnalyticsData_0 then
                local l_analyticsData_0 = v53.analyticsData;
                if l_analyticsData_0 then
                    for v67 in l_analyticsData_0 do
                        v49[v67] = true;
                    end;
                end;
                table.insert(v48, l_analyticsData_0 or {});
            end;
        end;
    end;
    local v68 = #v32;
    v4.assert(v68 == #v33);
    v4.assert(v68 == #v34);
    v4.assert(v68 == #v35);
    v4.assert(v68 == #v39);
    v4.assert(v68 == #v40);
    if #v41 > 0 then
        v4.assert(v68 == #v41);
    end;
    if #v42 > 0 then
        v4.assert(v68 == #v42);
    end;
    if #v43 > 0 then
        v4.assert(v68 == #v43);
    end;
    local v69 = {
        rootPlaceIds = table.concat(v32, ","), 
        absPositions = table.concat(v33, ","), 
        topicDataPositions = table.concat(v34, ","), 
        universeIds = table.concat(v35, ",")
    };
    if v50 then
        v69.adFlags = table.concat(v39, ",");
        v69.adIds = table.concat(v40, ",");
    end;
    if #v41 > 0 then
        v69.rows = table.concat(v41, ",");
    end;
    if #v42 > 0 then
        v69.rowsOnPage = table.concat(v42, ",");
    end;
    if #v43 > 0 then
        v69.positionsInRows = table.concat(v43, ",");
    end;
    if v28 and #v36 > 0 then
        v69.thumbnailAssetIds = table.concat(v36, ",");
    end;
    if v28 and #v37 > 0 then
        v69.thumbnailListIds = table.concat(v37, ",");
    end;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v28 and #v38 > 0 then
        v69.videoThumbnailAssetIds = table.concat(v38, ",");
    end;
    if v28 and #v44 > 0 then
        v69.tileBadgeContexts = table.concat(v44, ",");
    end;
    if v45 and #v45 > 0 then
        v69.footerTextLiterals = table.concat(v45, ",");
    end;
    if v46 and #v46 > 0 then
        v69.footerLocalizationKeys = table.concat(v46, ",");
    end;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v47 and #v47 > 0 then
        v69.tileTypes = table.concat(v47, ",");
    end;
    if l_FFlagLuaAppLogOmniAnalyticsData_0 then
        local v70 = {};
        if next(v49) then
            for v71 in v49 do
                local v72 = {};
                for _, v74 in v48 do
                    table.insert(v72, v74[v71] or "0");
                end;
                v70[("%*_arr"):format(v71)] = table.concat(v72, ",");
            end;
        end;
        local v75 = v6.Dictionary.join(v70, v31 or {});
        if next(v75) then
            v69.analyticsData = v75;
        end;
    end;
    return v69, v68;
end;
local function _(v77) --[[ Line: 323 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v77.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
local function v102(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) --[[ Line: 330 ]]
    -- upvalues: v5 (copy), v14 (copy), v15 (copy), v76 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v80 or not v81 then
        if v95 then
            v95((("Missing analytics service eventIngest: %* appAnalytics: %*"):format(v80, v81)));
        end;
        return;
    elseif not v82 or #v82 == 0 then
        if v95 then
            v95((("Missing impressionsToSend or impressionsToSend == 0 %*"):format(v82)));
        end;
        return;
    elseif not v83 or #v83 == 0 then
        if v95 then
            v95((("Missing topicContentsEntries or topicContentsEntries == 0 %*"):format(v83)));
        end;
        return;
    else
        if v87 then
            v5.default:logRobloxTelemetryCounter(v14);
        else
            v5.default:logRobloxTelemetryCounter(v15);
        end;
        local v98 = nil;
        local v99 = nil;
        local v100, v101 = v76(v82, v83, v90, v91, v87, v85, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v97 else nil);
        v98 = v100;
        v99 = v101;
        v98 = v6.Dictionary.join(v98, {
            sortPos = v86, 
            gameSetTypeId = v85, 
            gameSetTargetId = v88, 
            pageId = v89, 
            componentType = v92, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            appliedFilters = v93, 
            loadSource = v94, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v96 else nil
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            v100 = v98;
            v101 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if v101 and v101 ~= "" then
                v100.mobileAdvertisingId = v101;
            end;
        end;
        v12(v80, v84, v98);
        v13(v81, v84, v99);
        return;
    end;
end;
local function v117(v103, v104, v105, v106, v107, v108, v109, v110, v111, v112) --[[ Line: 408 ]]
    -- upvalues: v76 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v103 or not v104 then
        return;
    elseif not v105 or #v105 == 0 then
        return;
    elseif not v106 or #v106 == 0 then
        return;
    else
        local v113, v114 = v76(v105, v106, v109, v111, v110);
        if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then
            v113 = v6.Dictionary.join(v113, v108, {
                locale = l_LocalizationService_0.RobloxLocaleId, 
                componentType = v112
            });
        else
            v113.locale = l_LocalizationService_0.RobloxLocaleId;
            v113 = v6.Dictionary.join(v113, v108);
        end;
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v113_0 = v113;
            local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
                l_v113_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
            end;
        end;
        v12(v103, v107, v113);
        v13(v104, v107, v114);
        return;
    end;
end;
local function v126(v118, v119, v120, v121, v122) --[[ Line: 452 ]]
    -- upvalues: v76 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    local v123, v124 = v76(v120, v121);
    v123.locale = l_LocalizationService_0.RobloxLocaleId;
    v123.refId = v122;
    if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then
            v123.mobileAdvertisingId = l_l_AppStorageService_0_Item_2;
        end;
    end;
    v12(v118, "recommended", v123);
    v13(v119, "recommended", v124);
end;
local function v141(v127, v128, v129, v130, v131, v132, v133, v134, v135, v136) --[[ Line: 472 ]]
    -- upvalues: v76 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v127 or not v128 then
        return;
    elseif not v129 or #v129 == 0 then
        return;
    elseif not v130 or #v130 == 0 then
        return;
    else
        local v137, v138 = v76(v129, v130, nil, v136);
        v137 = v6.Dictionary.join(v137, {
            gameSetTypeId = v132, 
            gameSetTargetId = v133, 
            pageId = v134, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            seeAllFlag = 1, 
            appliedFilters = v135
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v137_0 = v137;
            local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then
                l_v137_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_3;
            end;
        end;
        v12(v127, v131, v137);
        v13(v128, v131, v138, 1);
        return;
    end;
end;
local v151 = l_FFlagEnableInGameExitModalNextUpUi_0 and function(v142, v143, v144, v145, v146) --[[ Line: 520 ]]
    -- upvalues: v76 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v142 or not v143 then
        return;
    elseif not v145 or #v145 == 0 then
        return;
    elseif not v146 or #v146 == 0 then
        return;
    else
        local v147, v148 = v76(v145, v146);
        v147 = v6.Dictionary.join(v147, {
            gameSetTypeId = v144, 
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v147_0 = v147;
            local l_l_AppStorageService_0_Item_4 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_4 and l_l_AppStorageService_0_Item_4 ~= "" then
                l_v147_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_4;
            end;
        end;
        v12(v142, "InGameExitPage", v147);
        v13(v143, "InGameExitPage", v148);
        return;
    end;
end or nil;
local v160 = l_FFlagTraversalHistoryDiscoveryTelemetry_0 and function(v152, v153, v154, v155, v156, v157) --[[ Line: 556 ]]
    -- upvalues: v76 (copy), v6 (copy), l_LocalizationService_0 (copy), v12 (copy), v13 (copy)
    if not v152 or not v153 then
        return;
    else
        local v158, v159 = v76(v154, v155, v156, false, v157);
        v158 = v6.Dictionary.join(v158, {
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        v12(v152, "InExpHistoryPage", v158);
        v13(v153, "InExpHistoryPage", v159);
        return;
    end;
end or nil;
return {
    sendFromTopicContents = v102, 
    sendFromSearch = v117, 
    sendFromGameDetails = v126, 
    sendFromSeeAll = v141, 
    sendFromInGameExitModal = if l_FFlagEnableInGameExitModalNextUpUi_0 then v151 else nil, 
    sendFromTraversalHistoryPage = v160
};