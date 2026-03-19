local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_SendGameImpressions_0 = require(l_Parent_0.GameCollections).SendGameImpressions;
local _ = require(l_Parent_0.UnifiedLogging);
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiBuilder_0 = v4.SduiBuilder;
local l_SduiErrors_0 = v4.SduiErrors;
local l_SduiParsers_0 = v4.SduiParsers;
local l_SduiParseHelpers_0 = v4.SduiParseHelpers;
local l_findAnalyticsFieldInAncestors_0 = v4.findAnalyticsFieldInAncestors;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local v12 = {};
return function(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22) --[[ Line: 28 ]] --[[ Name: sendLegacyGameImpressionsForSdui ]]
    -- upvalues: v12 (copy), v1 (copy), l_SduiParsers_0 (copy), l_SduiBuilder_0 (copy), l_AppPage_0 (copy), l_findAnalyticsFieldInAncestors_0 (copy), l_SendGameImpressions_0 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), l_SduiParseHelpers_0 (copy), l_SduiErrors_0 (copy)
    local v23 = {};
    local v24 = v14 or v12;
    for _, v26 in v24 do
        table.insert(v23, (v1.Dictionary.join(v26, {
            isSponsored = l_SduiParsers_0.safeParseBoolean(v26.adFlag or false, v19, v16)
        })));
    end;
    if #v23 > 0 and #v13 > 0 then
        v24 = v23[v13[1]] and v23[v13[1]].itemComponentType or "unknown";
        local v27 = nil;
        local v28 = v15[v13[1]];
        if v28 then
            local v29 = l_SduiBuilder_0.getComponentType(v28, v19);
            local v30 = true;
            if v29 ~= "Tile" then
                v30 = v29 == "GameTile";
            end;
            local v31 = v28.props and (v28.props.imageAspectRatio or 0) > 1;
            v27 = v30 and v31;
        end;
        if v20 then
            v20(v13, v23, v17.itemsPerRow, v18, v27);
            return;
        elseif v19.appPage == l_AppPage_0.SearchPage then
            local v32 = {
                searchUuid = l_findAnalyticsFieldInAncestors_0("searchUuid", v16), 
                emphasisFlag = 0, 
                seeAllFlag = 0, 
                sortPos = v17.collectionPosition, 
                gameSetTypeId = tostring(v17.collectionId)
            };
            l_SendGameImpressions_0.sendFromSearch(v19.dependencies.eventIngest, v19.dependencies.appAnalytics, v13, v23, v19.appPage, v32, v21, v18, if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v27 or false else nil, if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v24 else nil);
            return;
        else
            l_SendGameImpressions_0.sendFromTopicContents(v19.dependencies.eventIngest, v19.dependencies.appAnalytics, v13, v23, v19.appPage, tostring(v17.collectionId), v17.collectionPosition, v18, nil, nil, v21, v27 or false, v24, nil, nil, function(v33) --[[ Line: 121 ]]
                -- upvalues: v16 (copy), l_SduiParseHelpers_0 (ref), v19 (copy), l_SduiErrors_0 (ref), v24 (copy), v22 (copy)
                local v34 = if v16 then l_SduiParseHelpers_0.stringifyValue(v16.analyticsData) else nil;
                v19.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogGameImpressions, {
                    componentType = v24, 
                    name = v22, 
                    message = ("Failed to log game impressions. reason: %*. analyticsContext: %*"):format(v33, v34)
                }, v19.appPage);
            end, nil);
        end;
    end;
end;