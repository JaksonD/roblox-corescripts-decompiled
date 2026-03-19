local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_requestInternalWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper;
local l_MakeOmniRecommendationsRequest_0 = require(l_CorePackages_0.Workspace.Packages.GraphQlShared).MakeOmniRecommendationsRequest;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Promise);
local v8 = require(script.Parent.Telemetry);
local v9 = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache);
local v10 = l_requestInternalWrapper_0(nil);
local v11 = game:DefineFastString("InGameExitModalNextUpUiSortTopicId", "100000014");
local v12 = game:DefineFastFlag("InGameExitModalEnableFilterForCurrentExperience", false);
local function v18(v13, v14, v15) --[[ Line: 46 ]] --[[ Name: metadataToSortEntry ]]
    local l_wideImageAssetId_0 = (((v15.layoutDataBySort or {})[v13] or {}).primaryMediaAsset or {}).wideImageAssetId;
    local v17 = if l_wideImageAssetId_0 and l_wideImageAssetId_0 ~= "0" then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(l_wideImageAssetId_0) else ("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(v15.rootPlaceId);
    return {
        uiIndex = v14, 
        universeId = tostring(v15.universeId), 
        placeId = tostring(v15.rootPlaceId), 
        name = v15.name, 
        image = v17, 
        upVotes = v15.totalUpVotes, 
        downVotes = v15.totalDownVotes, 
        layoutDataBySort = v15.layoutDataBySort or {}
    };
end;
local v19 = v6.interface({
    contentType = v6.string, 
    contentId = v6.number
});
local v20 = v6.interface({
    name = v6.string, 
    universeId = v6.number, 
    rootPlaceId = v6.number, 
    totalUpVotes = v6.number, 
    totalDownVotes = v6.number, 
    layoutDataBySort = v6.optional(v6.table)
});
local function v28(v21, v22) --[[ Line: 88 ]] --[[ Name: parseSortEntries ]]
    -- upvalues: v19 (copy), v20 (copy), v18 (copy), v12 (copy)
    local v23 = {};
    for _, v25 in v21.recommendationList do
        if v19(v25) and v25.contentType == "Game" then
            local v26 = v22[tostring(v25.contentId)];
            if v20(v26) then
                local v27 = v18(v21.topicId, #v23 + 1, v26);
                if v27 and (not v12 or v27.universeId ~= tostring(game.GameId)) then
                    table.insert(v23, v27);
                end;
            end;
        end;
    end;
    return v23;
end;
local v29 = v6.interface({
    responseBody = v6.interface({
        sorts = v6.table, 
        contentMetadata = v6.interface({
            Game = v6.table
        })
    }), 
    responseTimeMs = v6.number
});
local v30 = v6.interface({
    topicId = v6.number, 
    recommendationList = v6.table
});
local function v37(v31) --[[ Line: 135 ]] --[[ Name: parseOmniResponse ]]
    -- upvalues: v29 (copy), v8 (copy), v30 (copy), v11 (copy), v28 (copy)
    if not v29(v31) then
        return nil;
    else
        v8.logRequestLatency("discovery-api/omni-recommendation", v31.responseTimeMs);
        local l_responseBody_0 = v31.responseBody;
        local l_sorts_0 = l_responseBody_0.sorts;
        local v34 = l_responseBody_0.contentMetadata and l_responseBody_0.contentMetadata.Game or nil;
        for _, v36 in l_sorts_0 do
            if v30(v36) and tostring(v36.topicId) == v11 then
                return {
                    entries = v28(v36, v34), 
                    topicId = tostring(v36.topicId)
                };
            end;
        end;
        return nil;
    end;
end;
return function() --[[ Line: 168 ]]
    -- upvalues: v5 (copy), v7 (copy), l_MakeOmniRecommendationsRequest_0 (copy), v10 (copy), l_HttpService_0 (copy), v11 (copy), v37 (copy), v9 (copy), l_ContentProvider_0 (copy)
    local v38, v39 = v5.useState(nil);
    local v40, v41 = v5.useState(false);
    v5.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v41 (copy), v39 (copy), v7 (ref), l_MakeOmniRecommendationsRequest_0 (ref), v10 (ref), l_HttpService_0 (ref), v11 (ref), v37 (ref), v9 (ref), l_ContentProvider_0 (ref)
        v41(true);
        v39(nil);
        local v50 = v7.new(function(_, _, v44) --[[ Line: 177 ]]
            -- upvalues: l_MakeOmniRecommendationsRequest_0 (ref), v10 (ref), l_HttpService_0 (ref), v11 (ref), v37 (ref), v9 (ref), l_ContentProvider_0 (ref), v39 (ref), v41 (ref)
            local v45 = l_MakeOmniRecommendationsRequest_0(v10, "InGameExitModal", l_HttpService_0:GenerateGUID(false):lower(), nil, {
                "Carousel", 
                "SortlessGrid"
            }, "gameExitRecommendation", {
                v11
            }, nil);
            v44(function() --[[ Line: 189 ]]
                -- upvalues: v45 (copy)
                v45:cancel();
            end);
            v45:andThen(function(v46) --[[ Line: 194 ]]
                -- upvalues: v37 (ref), v9 (ref), l_ContentProvider_0 (ref), v39 (ref)
                local v47 = v37(v46);
                if not v47 then
                    return;
                elseif #v47.entries < 4 then
                    return;
                else
                    if v9 then
                        local v48 = {};
                        table.insert(v48, v47.entries[1].image);
                        table.insert(v48, v47.entries[2].image);
                        table.insert(v48, v47.entries[3].image);
                        table.insert(v48, v47.entries[4].image);
                        l_ContentProvider_0:PreloadAsync(v48);
                    end;
                    v39(v47);
                    return;
                end;
            end, function(_) --[[ Line: 213 ]]

            end):finally(function() --[[ Line: 216 ]]
                -- upvalues: v41 (ref)
                v41(false);
            end);
        end);
        return function() --[[ Line: 221 ]]
            -- upvalues: v50 (copy)
            v50:cancel();
        end;
    end, {});
    return {
        data = v38, 
        loading = v40
    };
end;