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
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local function v65(v25, v26, v27, v28, v29, v30) --[[ Line: 53 ]] --[[ Name: addGameFields ]]
    -- upvalues: l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_GameCollectionItemTypes_0 (copy), l_calculateRowPositionFields_0 (copy), v4 (copy), l_getGameTileLayoutData_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), l_ItemLayoutDataParsingUtils_0 (copy), l_getValidTileBadges_0 (copy), v6 (copy)
    local v31 = {};
    local v32 = {};
    local v33 = {};
    local v34 = {};
    local v35 = {};
    local v36 = {};
    local v37 = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then {} else nil;
    local v38 = {};
    local v39 = {};
    local v40 = {};
    local v41 = {};
    local v42 = {};
    local v43 = {};
    local v44 = {};
    local v45 = {};
    local v46 = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then {} else nil;
    local v47 = false;
    for _, v49 in ipairs(v25) do
        local v50 = v26[v49];
        if v50 ~= nil then
            local v51 = v50.uiIndex or v49;
            local v52 = v50.topicContentsIndex or v49;
            table.insert(v31, v50.placeId or 0);
            table.insert(v32, v49);
            table.insert(v34, v50.universeId or 0);
            table.insert(v33, v52);
            if v50.isSponsored then
                v47 = true;
                table.insert(v38, 1);
                table.insert(v39, v50.adId or 0);
            else
                table.insert(v38, 0);
                table.insert(v39, 0);
            end;
            if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v46 then
                table.insert(v46, v50.gameCollectionItemTypeOverride or l_GameCollectionItemTypes_0.GameCollectionItemType.GameTile);
            end;
            local v53 = l_calculateRowPositionFields_0(v51, v27, v29);
            if v27 and v27 > 0 then
                table.insert(v40, v53.rowInSort);
                if v29 then
                    table.insert(v41, v53.rowOnPage);
                    table.insert(v42, v53.positionInRow);
                end;
            else
                v4.assert(v27 ~= 0);
                if v29 then
                    table.insert(v41, v29);
                    table.insert(v42, v51);
                end;
            end;
            if v28 then
                local v54 = l_getGameTileLayoutData_0(v50, v30);
                if v50 and v50.thumbnailAssetId then
                    table.insert(v35, v50.thumbnailAssetId);
                else
                    table.insert(v35, (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then l_ItemLayoutDataParsingUtils_0.getWideImageAssetId(v54) else v54 and v54.primaryMediaAsset and v54.primaryMediaAsset.wideImageAssetId) or v50 and v50.primaryWideAssetId or nil or "0");
                end;
                if v50 and v50.thumbnailListId then
                    table.insert(v36, v50.thumbnailListId);
                else
                    table.insert(v36, v54 and v54.primaryMediaAsset and v54.primaryMediaAsset.wideImageListId or v50 and v50.primaryWideListId or "0");
                end;
                if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then
                    if v50 and v50.videoThumbnailAssetId then
                        table.insert(v37, v50.videoThumbnailAssetId);
                    else
                        table.insert(v37, v54 and v54.primaryMediaAsset and v54.primaryMediaAsset.wideVideoAssetId or "0");
                    end;
                end;
                local v55 = nil;
                if v50 and v50.tileBadgeIds then
                    v55 = v50.tileBadgeIds;
                elseif v54 and v54.tileBadgesByPosition then
                    local v56 = l_getValidTileBadges_0(v54.tileBadgesByPosition);
                    local v57 = {};
                    for v58, v59 in v56 do
                        local v61 = v6.List.map(v59, function(v60) --[[ Line: 177 ]]
                            return v60.analyticsId;
                        end);
                        if #v61 > 0 then
                            table.insert(v57, v58 .. "=" .. table.concat(v61, "+"));
                        end;
                    end;
                    if #v57 > 0 then
                        v55 = table.concat(v57, "&");
                    end;
                end;
                table.insert(v43, v55 or "0");
                local v62 = nil;
                if v50 and v50.footer and v50.footer.analytics then
                    v62 = v50.footer.analytics;
                elseif v54 and v54.footer and v54.footer.analytics then
                    v62 = v54.footer.analytics;
                end;
                if v62 and v62.textLiteral then
                    table.insert(v44, v62.textLiteral);
                else
                    table.insert(v44, "0");
                end;
                if v62 and v62.locKey then
                    table.insert(v45, v62.locKey);
                else
                    table.insert(v45, "0");
                end;
            end;
        end;
    end;
    local v63 = #v31;
    v4.assert(v63 == #v32);
    v4.assert(v63 == #v33);
    v4.assert(v63 == #v34);
    v4.assert(v63 == #v38);
    v4.assert(v63 == #v39);
    if #v40 > 0 then
        v4.assert(v63 == #v40);
    end;
    if #v41 > 0 then
        v4.assert(v63 == #v41);
    end;
    if #v42 > 0 then
        v4.assert(v63 == #v42);
    end;
    local v64 = {
        rootPlaceIds = table.concat(v31, ","), 
        absPositions = table.concat(v32, ","), 
        topicDataPositions = table.concat(v33, ","), 
        universeIds = table.concat(v34, ",")
    };
    if v47 then
        v64.adFlags = table.concat(v38, ",");
        v64.adIds = table.concat(v39, ",");
    end;
    if #v40 > 0 then
        v64.rows = table.concat(v40, ",");
    end;
    if #v41 > 0 then
        v64.rowsOnPage = table.concat(v41, ",");
    end;
    if #v42 > 0 then
        v64.positionsInRows = table.concat(v42, ",");
    end;
    if v28 and #v35 > 0 then
        v64.thumbnailAssetIds = table.concat(v35, ",");
    end;
    if v28 and #v36 > 0 then
        v64.thumbnailListIds = table.concat(v36, ",");
    end;
    if l_FFlagLuaAppGameTileWideVideoThumbnail_0 and v28 and #v37 > 0 then
        v64.videoThumbnailAssetIds = table.concat(v37, ",");
    end;
    if v28 and #v43 > 0 then
        v64.tileBadgeContexts = table.concat(v43, ",");
    end;
    if v44 and #v44 > 0 then
        v64.footerTextLiterals = table.concat(v44, ",");
    end;
    if v45 and #v45 > 0 then
        v64.footerLocalizationKeys = table.concat(v45, ",");
    end;
    if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 and v46 and #v46 > 0 then
        v64.tileTypes = table.concat(v46, ",");
    end;
    return v64, v63;
end;
local function _(v66) --[[ Line: 285 ]] --[[ Name: addMobileAdvertisingIdToEventParams ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        v66.mobileAdvertisingId = l_l_AppStorageService_0_Item_0;
    end;
end;
local function v90(v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) --[[ Line: 292 ]]
    -- upvalues: v5 (copy), v14 (copy), v15 (copy), v65 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v69 or not v70 then
        if v84 then
            v84((("Missing analytics service eventIngest: %* appAnalytics: %*"):format(v69, v70)));
        end;
        return;
    elseif not v71 or #v71 == 0 then
        if v84 then
            v84((("Missing impressionsToSend or impressionsToSend == 0 %*"):format(v71)));
        end;
        return;
    elseif not v72 or #v72 == 0 then
        if v84 then
            v84((("Missing topicContentsEntries or topicContentsEntries == 0 %*"):format(v72)));
        end;
        return;
    else
        if v76 then
            v5.default:logRobloxTelemetryCounter(v14);
        else
            v5.default:logRobloxTelemetryCounter(v15);
        end;
        local v86 = nil;
        local v87 = nil;
        local v88, v89 = v65(v71, v72, v79, v80, v76, v74);
        v86 = v88;
        v87 = v89;
        v86 = v6.Dictionary.join(v86, {
            sortPos = v75, 
            gameSetTypeId = v74, 
            gameSetTargetId = v77, 
            pageId = v78, 
            componentType = v81, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            appliedFilters = v82, 
            loadSource = v83, 
            sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v85 else nil
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            v88 = v86;
            v89 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if v89 and v89 ~= "" then
                v88.mobileAdvertisingId = v89;
            end;
        end;
        v12(v69, v73, v86);
        v13(v70, v73, v87);
        return;
    end;
end;
local function v105(v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) --[[ Line: 362 ]]
    -- upvalues: v65 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v91 or not v92 then
        return;
    elseif not v93 or #v93 == 0 then
        return;
    elseif not v94 or #v94 == 0 then
        return;
    else
        local v101, v102 = v65(v93, v94, v97, if l_FFlagLuaAppSearchGridTiles_0 then v99 else nil, v98);
        if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then
            v101 = v6.Dictionary.join(v101, v96, {
                locale = l_LocalizationService_0.RobloxLocaleId, 
                componentType = v100
            });
        else
            v101.locale = l_LocalizationService_0.RobloxLocaleId;
            v101 = v6.Dictionary.join(v101, v96);
        end;
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v101_0 = v101;
            local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
                l_v101_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_1;
            end;
        end;
        v12(v91, v95, v101);
        v13(v92, v95, v102);
        return;
    end;
end;
local function v114(v106, v107, v108, v109, v110) --[[ Line: 411 ]]
    -- upvalues: v65 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    local v111, v112 = v65(v108, v109);
    v111.locale = l_LocalizationService_0.RobloxLocaleId;
    v111.refId = v110;
    if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
        if l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then
            v111.mobileAdvertisingId = l_l_AppStorageService_0_Item_2;
        end;
    end;
    v12(v106, "recommended", v111);
    v13(v107, "recommended", v112);
end;
local function v129(v115, v116, v117, v118, v119, v120, v121, v122, v123, v124) --[[ Line: 431 ]]
    -- upvalues: v65 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v115 or not v116 then
        return;
    elseif not v117 or #v117 == 0 then
        return;
    elseif not v118 or #v118 == 0 then
        return;
    else
        local v125, v126 = v65(v117, v118, nil, v124);
        v125 = v6.Dictionary.join(v125, {
            gameSetTypeId = v120, 
            gameSetTargetId = v121, 
            pageId = v122, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            seeAllFlag = 1, 
            appliedFilters = v123
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v125_0 = v125;
            local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then
                l_v125_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_3;
            end;
        end;
        v12(v115, v119, v125);
        v13(v116, v119, v126, 1);
        return;
    end;
end;
local v139 = l_FFlagEnableInGameExitModalNextUpUi_0 and function(v130, v131, v132, v133, v134) --[[ Line: 479 ]]
    -- upvalues: v65 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppGameImpressionsMobileAdsId_0 (copy), l_AppStorageService_0 (copy), v12 (copy), v13 (copy)
    if not v130 or not v131 then
        return;
    elseif not v133 or #v133 == 0 then
        return;
    elseif not v134 or #v134 == 0 then
        return;
    else
        local v135, v136 = v65(v133, v134);
        v135 = v6.Dictionary.join(v135, {
            gameSetTypeId = v132, 
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        if l_FFlagLuaAppGameImpressionsMobileAdsId_0 then
            local l_v135_0 = v135;
            local l_l_AppStorageService_0_Item_4 = l_AppStorageService_0:GetItem("MobileAdvertisingId");
            if l_l_AppStorageService_0_Item_4 and l_l_AppStorageService_0_Item_4 ~= "" then
                l_v135_0.mobileAdvertisingId = l_l_AppStorageService_0_Item_4;
            end;
        end;
        v12(v130, "InGameExitPage", v135);
        v13(v131, "InGameExitPage", v136);
        return;
    end;
end or nil;
local v148 = l_FFlagTraversalHistoryDiscoveryTelemetry_0 and function(v140, v141, v142, v143, v144, v145) --[[ Line: 515 ]]
    -- upvalues: v65 (copy), v6 (copy), l_LocalizationService_0 (copy), v12 (copy), v13 (copy)
    if not v140 or not v141 then
        return;
    else
        local v146, v147 = v65(v142, v143, v144, false, v145);
        v146 = v6.Dictionary.join(v146, {
            locale = l_LocalizationService_0.RobloxLocaleId
        });
        v12(v140, "InExpHistoryPage", v146);
        v13(v141, "InExpHistoryPage", v147);
        return;
    end;
end or nil;
return {
    sendFromTopicContents = v90, 
    sendFromSearch = v105, 
    sendFromGameDetails = v114, 
    sendFromSeeAll = v129, 
    sendFromInGameExitModal = if l_FFlagEnableInGameExitModalNextUpUi_0 then v139 else nil, 
    sendFromTraversalHistoryPage = v148
};