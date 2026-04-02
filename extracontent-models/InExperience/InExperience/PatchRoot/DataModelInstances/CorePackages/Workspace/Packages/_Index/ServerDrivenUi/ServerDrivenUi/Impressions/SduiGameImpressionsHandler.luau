local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_SendGameImpressions_0 = require(l_Parent_0.GameCollections).SendGameImpressions;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_SduiErrors_0 = v4.SduiErrors;
local l_SduiParseHelpers_0 = v4.SduiParseHelpers;
local l_SduiParsers_0 = v4.SduiParsers;
local l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions;
local v9 = {};
return function(v10, v11, v12, v13, v14) --[[ Line: 22 ]] --[[ Name: SduiGameImpressionsHandler ]]
    -- upvalues: l_SduiErrors_0 (copy), v9 (copy), v1 (copy), l_SduiParsers_0 (copy), l_AppPage_0 (copy), l_SendGameImpressions_0 (copy), l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 (copy), l_SduiParseHelpers_0 (copy)
    if not v13 then
        v10.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogGameImpressions, {
            name = "SduiGameImpressionsHandler", 
            message = "Missing collectionAnalyticsData"
        }, v10.appPage);
        return;
    else
        local v15 = {};
        local v16 = v12 or v9;
        for _, v18 in v16 do
            table.insert(v15, (v1.Dictionary.join(v18, {
                isSponsored = l_SduiParsers_0.safeParseBoolean(v18.adFlag or false, v10, v9)
            })));
        end;
        if #v11 == 0 or #v15 == 0 then
            v10.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogGameImpressions, {
                name = "SduiGameImpressionsHandler", 
                message = ("No entries to log: impressionIndexes=%*, gameImpressionEntries=%*"):format(#v11, #v15)
            }, v10.appPage);
            return;
        else
            v16 = v15[v11[1]];
            local v19 = if v16 then v16.itemComponentType else "unknown";
            if v10.appPage == l_AppPage_0.SearchPage then
                local v20 = {
                    searchUuid = v13.searchUuid, 
                    emphasisFlag = 0, 
                    seeAllFlag = 0, 
                    sortPos = v13.collectionPosition, 
                    gameSetTypeId = tostring(v13.collectionId)
                };
                l_SendGameImpressions_0.sendFromSearch(v10.dependencies.eventIngest, v10.dependencies.appAnalytics, v11, v15, v10.appPage, v20, v13.itemsPerRow, v14, if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v13.isWideTiles or false else nil, if l_FFlagLuaAppAddComponentTypeToSearchImpressions_0 then v19 else nil);
                return;
            else
                l_SendGameImpressions_0.sendFromTopicContents(v10.dependencies.eventIngest, v10.dependencies.appAnalytics, v11, v15, v10.appPage, tostring(v13.collectionId), v13.collectionPosition, v14, nil, nil, v13.itemsPerRow, v13.isWideTiles or false, v19, nil, nil, function(v21) --[[ Line: 93 ]]
                    -- upvalues: l_SduiParseHelpers_0 (ref), v13 (copy), v10 (copy), l_SduiErrors_0 (ref), v19 (copy)
                    local v22 = l_SduiParseHelpers_0.stringifyValue(v13);
                    v10.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.FailedToLogGameImpressions, {
                        componentType = v19, 
                        name = "SduiGameImpressionsHandler", 
                        message = ("Failed to log game impressions. reason: %*. analyticsContext: %*"):format(v21, v22)
                    }, v10.appPage);
                end, nil);
                return;
            end;
        end;
    end;
end;