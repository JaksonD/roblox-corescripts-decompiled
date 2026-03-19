local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DiscoveryTypes);
local l_OmniRecommendationsContentType_0 = v2.OmniRecommendationsContentType;
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local l_parseAndAddGameInfos_0 = require(l_Parent_0.GameInfosRodux).parseAndAddGameInfos;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_PYMKCarouselModel_0 = require(l_Parent_0.PYMKCarousel).PYMKCarouselModel;
local l_OmniFeedConstants_0 = v2.OmniFeedConstants;
local l_OmniFeedTypes_0 = v2.OmniFeedTypes;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.GameCoPlay);
local v12 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogAsset);
local v13 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogBundle);
local v14 = require(l_Modules_0.LuaApp.Actions.Games.AddContentMetadata);
local v15 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchIconsForOmniData);
local l_FFlagLuaAppReduceGameIconFetches_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppReduceGameIconFetches;
local v17 = {
    [l_OmniRecommendationsContentType_0.GameCoPlay] = v11.fromJsonData, 
    [l_OmniRecommendationsContentType_0.CatalogAsset] = v12.fromJsonData, 
    [l_OmniRecommendationsContentType_0.CatalogBundle] = v13.fromJsonData, 
    [l_OmniRecommendationsContentType_0.RecommendedFriend] = l_PYMKCarouselModel_0.fromJsonData
};
local function v33(v18, v19, v20, v21, v22) --[[ Line: 29 ]] --[[ Name: parseAndAddContentEntries ]]
    -- upvalues: v2 (copy), l_parseAndAddGameInfos_0 (copy), l_GameInfoModel_0 (copy), l_FFlagLuaAppReduceGameIconFetches_0 (copy), v17 (copy), l_mutedError_0 (copy)
    for v23, v24 in pairs(v20) do
        if not v21[v23] then
            v21[v23] = {};
        end;
        if v23 == v2.OmniRecommendationsContentType.Game then
            l_parseAndAddGameInfos_0(v18, v19, v24, l_GameInfoModel_0.fromOmniApi, function(_, v26) --[[ Line: 36 ]]
                -- upvalues: v21 (copy), v23 (copy)
                local l_universeId_0 = v26.universeId;
                v21[v23][l_universeId_0] = v26;
            end, if l_FFlagLuaAppReduceGameIconFetches_0 then v22 else nil);
        else
            local v28 = v17[v23];
            if v28 then
                for v29, v30 in pairs(v24) do
                    v28(v30):match(function(v31) --[[ Line: 57 ]]
                        -- upvalues: v21 (copy), v23 (copy), v29 (copy), l_mutedError_0 (ref)
                        if v21[v23][v29] then
                            l_mutedError_0((("Duplicate contentStringId %* found for type %*"):format(v29, v23)));
                            return;
                        else
                            v21[v23][v29] = v31;
                            return;
                        end;
                    end):matchError(function(v32) --[[ Line: 64 ]]
                        warn(v32);
                    end);
                end;
            end;
        end;
    end;
end;
local function _(v34) --[[ Line: 72 ]] --[[ Name: isGameIconSort ]]
    -- upvalues: l_OmniFeedTypes_0 (copy), l_OmniFeedConstants_0 (copy)
    if v34.treatmentType ~= l_OmniFeedTypes_0.Carousel and v34.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid then
        return false;
    else
        local v35 = v34.topicLayoutData and v34.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        if v35 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile or v35 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
            return false;
        else
            return v34.recommendationList ~= nil;
        end;
    end;
end;
return function(v37, v38, v39) --[[ Line: 88 ]] --[[ Name: parseAndAddContentMetadata ]]
    -- upvalues: l_FFlagLuaAppReduceGameIconFetches_0 (copy), l_OmniFeedTypes_0 (copy), l_OmniFeedConstants_0 (copy), v33 (copy), v14 (copy), v15 (copy)
    if not v39 then
        return {};
    elseif not v39.contentMetadata and not v39.contentMetadataByStringId then
        return {};
    else
        local v40 = nil;
        if l_FFlagLuaAppReduceGameIconFetches_0 and v39.sorts then
            local v41 = {};
            for _, v43 in v39.sorts do
                local v44;
                if v43.treatmentType ~= l_OmniFeedTypes_0.Carousel and v43.treatmentType ~= l_OmniFeedTypes_0.HomeGameGrid then
                    v44 = false;
                else
                    local v45 = v43.topicLayoutData and v43.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
                    v44 = v45 ~= l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile and not (v45 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile) and v43.recommendationList ~= nil;
                end;
                if v44 then
                    for _, v47 in v43.recommendationList do
                        if v47.contentType == "Game" then
                            v41[tostring(v47.contentId)] = true;
                        end;
                    end;
                end;
            end;
            local l_v41_0 = v41 --[[ copy: 4 -> 15 ]];
            v40 = function(v49) --[[ Line: 109 ]]
                -- upvalues: l_v41_0 (copy)
                return l_v41_0[v49];
            end;
        end;
        local v50 = {};
        v33(v37, v38, v39.contentMetadata, v50, if l_FFlagLuaAppReduceGameIconFetches_0 then v40 else nil);
        if v39.contentMetadataByStringId then
            v33(v37, v38, v39.contentMetadataByStringId, v50, if l_FFlagLuaAppReduceGameIconFetches_0 then v40 else nil);
        end;
        if next(v50) then
            v38:dispatch(v14(v50));
            v38:dispatch(v15(v37, v50));
        end;
        return v50;
    end;
end;