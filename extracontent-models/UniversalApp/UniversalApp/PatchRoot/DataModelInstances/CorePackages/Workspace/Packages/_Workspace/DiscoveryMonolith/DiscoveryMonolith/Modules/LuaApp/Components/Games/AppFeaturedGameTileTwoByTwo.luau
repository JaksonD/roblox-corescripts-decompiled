local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.t);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local v7 = require(l_Parent_0.GameTile);
local l_sponsoredGamesRecordClick_0 = require(l_Parent_0.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick;
local l_AppExperienceActionRow_0 = v7.AppExperienceActionRow;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_BigGameIconReducer_0 = require(l_Parent_0.GameIconRodux).BigGameIcons.BigGameIconReducer;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v15 = require(l_Parent_0.DiscoveryTypes);
local l_GameCollectionItemTypes_0 = v15.GameCollectionItemTypes;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v18 = require(l_Parent_0.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v21 = require(l_Modules_0.LuaApp.getRatingText);
local v22 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedTile);
local v23 = require(l_Modules_0.LuaApp.Components.Games.FeaturedContentPanel);
local v24 = require(l_Modules_0.LuaApp.Components.Games.FeaturedStaticPanel);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local l_GAME_GRID_CHILD_PADDING_0 = v15.Constants.GAME_GRID_CHILD_PADDING;
local v29 = v15.Constants.GAME_GRID_CHILD_PADDING * 2;
local v30 = l_FFlagLuaAppUnifyPlayButtonTile_0 and 6 or nil;
local v31 = v2.PureComponent:extend("AppFeaturedGameTileTwoByTwo");
v31.validateProps = v4.strictInterface({
    entry = v4.table, 
    index = v4.optional(v4.number), 
    layoutOrder = v4.optional(v4.number), 
    reportGameDetailOpened = v4.optional(v4.callback), 
    reportExperienceLaunched = v4.optional(v4.callback), 
    size = v4.optional(v4.Vector2), 
    position = v4.optional(v4.Vector2), 
    source = v4.optional(v4.string), 
    referralSource = v4.optional(v4.string), 
    hasBackground = v4.optional(v4.boolean), 
    hasActionRow = v4.optional(v4.boolean), 
    isDynamic = v4.optional(v4.boolean), 
    impressionsTag = v4.optional(v4.string), 
    launchExperienceEventContext = v4.optional(v4.string), 
    universeId = v4.optional(v4.string), 
    name = v4.optional(v4.string), 
    creatorName = v4.optional(v4.string), 
    placeId = v4.optional(v4.string), 
    totalUpVotes = v4.optional(v4.number), 
    totalDownVotes = v4.optional(v4.number), 
    gameDetail = v4.optional(v4.table), 
    thumbnail = v4.optional(v4.table), 
    openGameDetails = v4.callback, 
    fetchGameDetails = v4.callback, 
    navigation = v4.any, 
    networking = v4.callback, 
    shouldShowFeaturedTileCreatorName = v4.optional(v4.boolean)
});
v31.init = function(v32) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_sponsoredGamesRecordClick_0 (copy), l_AppExperienceActionRow_0 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), v30 (copy), v21 (copy), v23 (copy), v24 (copy)
    v32.isMounted = false;
    v32.gameTileRef = v2.createRef();
    v32.onActivated = function() --[[ Line: 88 ]]
        -- upvalues: v32 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_sponsoredGamesRecordClick_0 (ref)
        if not v32.isMounted then
            return;
        else
            local l_universeId_0 = v32.props.universeId;
            local v34 = {
                source = v32.props.source, 
                index = v32.props.index, 
                onPeekViewClosed = v32.props.onPeekViewClosed, 
                experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                    tileType = v32.props.entry and v32.props.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile, 
                    nativeAdData = v32.props.entry and v32.props.entry.adId
                } else nil
            };
            v32.props.openGameDetails(l_universeId_0, v34, v32.props.navigation);
            local l_index_0 = v32.props.index;
            local l_reportGameDetailOpened_0 = v32.props.reportGameDetailOpened;
            if l_index_0 and l_reportGameDetailOpened_0 then
                l_reportGameDetailOpened_0(l_index_0);
            end;
            local l_networking_0 = v32.props.networking;
            local l_entry_0 = v32.props.entry;
            if l_entry_0.isSponsored then
                l_sponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
            end;
            return;
        end;
    end;
    v32.renderActionRow = function() --[[ Line: 125 ]]
        -- upvalues: v2 (ref), l_AppExperienceActionRow_0 (ref), v32 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), v30 (ref)
        return v2.createElement(l_AppExperienceActionRow_0, {
            universeId = v32.props.universeId, 
            referralSource = v32.props.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = v32.props.reportExperienceLaunched, 
            openGameDetails = v32.onActivated, 
            entry = v32.props.entry, 
            launchExperienceEventContext = v32.props.launchExperienceEventContext, 
            showButtonText = true, 
            width = if l_FFlagLuaAppUnifyPlayButtonTile_0 then UDim.new(1, -2 * v30) else nil, 
            horizontalPadding = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v30 else nil, 
            verticalPadding = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v30 else nil, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil
        });
    end;
    v32.renderBottomPanel = function() --[[ Line: 142 ]]
        -- upvalues: v32 (copy), v21 (ref), v2 (ref), v23 (ref), v24 (ref)
        local l_entry_1 = v32.props.entry;
        local l_name_0 = v32.props.name;
        local l_totalUpVotes_0 = v32.props.totalUpVotes;
        local l_totalDownVotes_0 = v32.props.totalDownVotes;
        local l_gameDetail_0 = v32.props.gameDetail;
        local v44 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.hasVerifiedBadge;
        local v45 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.id;
        local v46 = l_gameDetail_0 and l_gameDetail_0.description or "";
        local l_shouldShowFeaturedTileCreatorName_0 = v32.props.shouldShowFeaturedTileCreatorName;
        local l_isDynamic_0 = v32.props.isDynamic;
        local v49 = if l_gameDetail_0 then l_gameDetail_0.licenseDescription else nil;
        local v50 = if l_gameDetail_0 then l_gameDetail_0.localizedFiatPrice else nil;
        local v51 = {
            hasBackground = v32.props.hasBackground, 
            padding = 8, 
            title = l_name_0, 
            creatorName = if l_shouldShowFeaturedTileCreatorName_0 then v32.props.creatorName else nil, 
            creatorVerified = v44, 
            creatorId = v45, 
            description = v46, 
            licenseDescription = v49, 
            paidAccessDescription = v50, 
            footerData = {
                rating = v21(l_totalUpVotes_0, l_totalDownVotes_0), 
                playingCount = l_entry_1.playerCount
            }
        };
        if l_isDynamic_0 then
            return v2.createElement(v23, v51);
        else
            return v2.createElement(v24, v51);
        end;
    end;
end;
v31.didMount = function(v52) --[[ Line: 182 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v52.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v52.gameTileRef, v52.props.impressionsTag, v52.props.index);
    local l_networking_1 = v52.props.networking;
    local l_universeId_1 = v52.props.universeId;
    v52.props.fetchGameDetails(l_networking_1, l_universeId_1);
end;
v31.willUnmount = function(v55) --[[ Line: 192 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v55.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v55.gameTileRef, v55.props.impressionsTag, v55.props.index);
end;
v31.didUpdate = function(v56, v57) --[[ Line: 197 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v57.impressionsTag ~= v56.props.impressionsTag or v57.index ~= v56.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v56.gameTileRef, v57.impressionsTag, v57.index);
        l_ImpressionsTagUtility_0.AddTag(v56.gameTileRef, v56.props.impressionsTag, v56.props.index);
    end;
end;
v31.render = function(v58) --[[ Line: 204 ]] --[[ Name: render ]]
    -- upvalues: l_GAME_GRID_CHILD_PADDING_0 (copy), v29 (copy), v2 (copy), v22 (copy)
    local l_layoutOrder_0 = v58.props.layoutOrder;
    local l_size_0 = v58.props.size;
    local l_position_0 = v58.props.position;
    local l_thumbnail_0 = v58.props.thumbnail;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local v63 = if l_size_0 then l_size_0.X else nil;
    local v64 = if l_size_0 then l_size_0.Y else nil;
    local v65 = if l_size_0 then v63 * 2 + l_GAME_GRID_CHILD_PADDING_0 else nil;
    local v66 = if l_size_0 then v64 * 2 + v29 else nil;
    local l_hasBackground_0 = v58.props.hasBackground;
    local l_hasActionRow_0 = v58.props.hasActionRow;
    local v69 = v2.createElement(v22, {
        hasBackground = l_hasBackground_0, 
        hasOutline = l_hasBackground_0, 
        thumbnail = l_thumbnail_0, 
        renderActionRow = if l_hasActionRow_0 then v58.renderActionRow else nil, 
        renderBottomPanel = v58.renderBottomPanel, 
        onActivated = v58.onActivated
    });
    return v2.createElement("Frame", {
        Position = if l_size_0 and l_position_0 then UDim2.fromOffset(l_position_0.X, l_position_0.Y) else nil, 
        Size = if l_size_0 then UDim2.new(0, v63, 0, v64) else UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        ref = v58.gameTileRef
    }, {
        FeaturedTile = if l_size_0 then v2.createElement("Frame", {
            Size = UDim2.new(0, v65, 0, v66), 
            Position = UDim2.new(0, 0, 0, -v64 - v29), 
            BackgroundTransparency = 1
        }, {
            Tile = v69
        }) else v69
    });
end;
v31 = l_withNavigation_0((v3.connect(function(v70, v71) --[[ Line: 250 ]]
    -- upvalues: l_GameInfosReducer_0 (copy), l_BigGameIconReducer_0 (copy)
    local l_universeId_2 = v71.entry.universeId;
    local v73 = v70.Personalization[l_GameInfosReducer_0.key][l_universeId_2];
    return {
        universeId = l_universeId_2, 
        name = v73.name, 
        creatorName = v73.creatorName, 
        placeId = v73.placeId, 
        totalUpVotes = v73.totalUpVotes, 
        totalDownVotes = v73.totalDownVotes, 
        gameDetail = v70.GameDetails[l_universeId_2], 
        thumbnail = v70[l_BigGameIconReducer_0.key][l_universeId_2]
    };
end, function(v74) --[[ Line: 263 ]]
    -- upvalues: l_OpenGameDetails_0 (copy), l_ApiFetchGameDetails_0 (copy)
    return {
        openGameDetails = function(v75, v76, v77) --[[ Line: 265 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v74 (copy), l_OpenGameDetails_0 (ref)
            v74(l_OpenGameDetails_0(v75, v77, v76));
        end, 
        fetchGameDetails = function(v78, v79) --[[ Line: 268 ]] --[[ Name: fetchGameDetails ]]
            -- upvalues: v74 (copy), l_ApiFetchGameDetails_0 (ref)
            v74(l_ApiFetchGameDetails_0.Fetch(v78, {
                v79
            }));
        end
    };
end)(v31)));
v31 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v31);
return (v18.connectUserLayer({
    v25() and l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer or nil
}, function(v80, _) --[[ Line: 282 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        shouldShowFeaturedTileCreatorName = (v80[l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
    };
end)(v31));