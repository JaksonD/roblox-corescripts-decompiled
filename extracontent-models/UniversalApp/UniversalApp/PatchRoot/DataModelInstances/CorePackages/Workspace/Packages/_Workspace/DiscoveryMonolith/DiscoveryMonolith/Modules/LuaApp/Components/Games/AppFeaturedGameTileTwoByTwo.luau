local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.t);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local v7 = require(l_Parent_0.GameTile);
local l_SponsoredGamesRecordClick_0 = v7.SponsoredGamesRecordClick;
local l_AppExperienceActionRow_0 = v7.AppExperienceActionRow;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_BigGameIconReducer_0 = require(l_Parent_0.GameIconRodux).BigGameIcons.BigGameIconReducer;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local v15 = require(l_Parent_0.DiscoveryTypes);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v17 = require(l_Parent_0.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v20 = require(l_Modules_0.LuaApp.getRatingText);
local v21 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedTile);
local v22 = require(l_Modules_0.LuaApp.Components.Games.FeaturedContentPanel);
local v23 = require(l_Modules_0.LuaApp.Components.Games.FeaturedStaticPanel);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP);
local l_FFlagLuaAppUnifyPlayButtonTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUnifyPlayButtonTile;
local l_GAME_GRID_CHILD_PADDING_0 = v15.Constants.GAME_GRID_CHILD_PADDING;
local v27 = v15.Constants.GAME_GRID_CHILD_PADDING * 2;
local v28 = l_FFlagLuaAppUnifyPlayButtonTile_0 and 6 or nil;
local v29 = v2.PureComponent:extend("AppFeaturedGameTileTwoByTwo");
v29.validateProps = v4.strictInterface({
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
v29.init = function(v30) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_SponsoredGamesRecordClick_0 (copy), l_AppExperienceActionRow_0 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (copy), v28 (copy), v20 (copy), v22 (copy), v23 (copy)
    v30.isMounted = false;
    v30.gameTileRef = v2.createRef();
    v30.onActivated = function() --[[ Line: 86 ]]
        -- upvalues: v30 (copy), l_SponsoredGamesRecordClick_0 (ref)
        if not v30.isMounted then
            return;
        else
            local l_universeId_0 = v30.props.universeId;
            local v32 = {
                source = v30.props.source, 
                index = v30.props.index, 
                onPeekViewClosed = v30.props.onPeekViewClosed
            };
            v30.props.openGameDetails(l_universeId_0, v32, v30.props.navigation);
            local l_index_0 = v30.props.index;
            local l_reportGameDetailOpened_0 = v30.props.reportGameDetailOpened;
            if l_index_0 and l_reportGameDetailOpened_0 then
                l_reportGameDetailOpened_0(l_index_0);
            end;
            local l_networking_0 = v30.props.networking;
            local l_entry_0 = v30.props.entry;
            if l_entry_0.isSponsored then
                l_SponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
            end;
            return;
        end;
    end;
    v30.renderActionRow = function() --[[ Line: 116 ]]
        -- upvalues: v2 (ref), l_AppExperienceActionRow_0 (ref), v30 (copy), l_FFlagLuaAppUnifyPlayButtonTile_0 (ref), v28 (ref)
        return v2.createElement(l_AppExperienceActionRow_0, {
            universeId = v30.props.universeId, 
            referralSource = v30.props.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = v30.props.reportExperienceLaunched, 
            openGameDetails = v30.onActivated, 
            entry = v30.props.entry, 
            launchExperienceEventContext = v30.props.launchExperienceEventContext, 
            showButtonText = true, 
            width = if l_FFlagLuaAppUnifyPlayButtonTile_0 then UDim.new(1, -2 * v28) else nil, 
            horizontalPadding = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v28 else nil, 
            verticalPadding = if l_FFlagLuaAppUnifyPlayButtonTile_0 then v28 else nil, 
            isUnifiedGameTileEnabled = l_FFlagLuaAppUnifyPlayButtonTile_0 and true or nil
        });
    end;
    v30.renderBottomPanel = function() --[[ Line: 133 ]]
        -- upvalues: v30 (copy), v20 (ref), v2 (ref), v22 (ref), v23 (ref)
        local l_entry_1 = v30.props.entry;
        local l_name_0 = v30.props.name;
        local l_totalUpVotes_0 = v30.props.totalUpVotes;
        local l_totalDownVotes_0 = v30.props.totalDownVotes;
        local l_gameDetail_0 = v30.props.gameDetail;
        local v42 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.hasVerifiedBadge;
        local v43 = l_gameDetail_0 and l_gameDetail_0.creator and l_gameDetail_0.creator.id;
        local v44 = l_gameDetail_0 and l_gameDetail_0.description or "";
        local l_shouldShowFeaturedTileCreatorName_0 = v30.props.shouldShowFeaturedTileCreatorName;
        local l_isDynamic_0 = v30.props.isDynamic;
        local v47 = if l_gameDetail_0 then l_gameDetail_0.licenseDescription else nil;
        local v48 = if l_gameDetail_0 then l_gameDetail_0.localizedFiatPrice else nil;
        local v49 = {
            hasBackground = v30.props.hasBackground, 
            padding = 8, 
            title = l_name_0, 
            creatorName = if l_shouldShowFeaturedTileCreatorName_0 then v30.props.creatorName else nil, 
            creatorVerified = v42, 
            creatorId = v43, 
            description = v44, 
            licenseDescription = v47, 
            paidAccessDescription = v48, 
            footerData = {
                rating = v20(l_totalUpVotes_0, l_totalDownVotes_0), 
                playingCount = l_entry_1.playerCount
            }
        };
        if l_isDynamic_0 then
            return v2.createElement(v22, v49);
        else
            return v2.createElement(v23, v49);
        end;
    end;
end;
v29.didMount = function(v50) --[[ Line: 173 ]] --[[ Name: didMount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v50.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v50.gameTileRef, v50.props.impressionsTag, v50.props.index);
    local l_networking_1 = v50.props.networking;
    local l_universeId_1 = v50.props.universeId;
    v50.props.fetchGameDetails(l_networking_1, l_universeId_1);
end;
v29.willUnmount = function(v53) --[[ Line: 183 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    v53.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v53.gameTileRef, v53.props.impressionsTag, v53.props.index);
end;
v29.didUpdate = function(v54, v55) --[[ Line: 188 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ImpressionsTagUtility_0 (copy)
    if v55.impressionsTag ~= v54.props.impressionsTag or v55.index ~= v54.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v54.gameTileRef, v55.impressionsTag, v55.index);
        l_ImpressionsTagUtility_0.AddTag(v54.gameTileRef, v54.props.impressionsTag, v54.props.index);
    end;
end;
v29.render = function(v56) --[[ Line: 195 ]] --[[ Name: render ]]
    -- upvalues: l_GAME_GRID_CHILD_PADDING_0 (copy), v27 (copy), v2 (copy), v21 (copy)
    local l_layoutOrder_0 = v56.props.layoutOrder;
    local l_size_0 = v56.props.size;
    local l_position_0 = v56.props.position;
    local l_thumbnail_0 = v56.props.thumbnail;
    l_thumbnail_0 = l_thumbnail_0 and l_thumbnail_0.url;
    local v61 = if l_size_0 then l_size_0.X else nil;
    local v62 = if l_size_0 then l_size_0.Y else nil;
    local v63 = if l_size_0 then v61 * 2 + l_GAME_GRID_CHILD_PADDING_0 else nil;
    local v64 = if l_size_0 then v62 * 2 + v27 else nil;
    local l_hasBackground_0 = v56.props.hasBackground;
    local l_hasActionRow_0 = v56.props.hasActionRow;
    local v67 = v2.createElement(v21, {
        hasBackground = l_hasBackground_0, 
        hasOutline = l_hasBackground_0, 
        thumbnail = l_thumbnail_0, 
        renderActionRow = if l_hasActionRow_0 then v56.renderActionRow else nil, 
        renderBottomPanel = v56.renderBottomPanel, 
        onActivated = v56.onActivated
    });
    return v2.createElement("Frame", {
        Position = if l_size_0 and l_position_0 then UDim2.fromOffset(l_position_0.X, l_position_0.Y) else nil, 
        Size = if l_size_0 then UDim2.new(0, v61, 0, v62) else UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0, 
        ref = v56.gameTileRef
    }, {
        FeaturedTile = if l_size_0 then v2.createElement("Frame", {
            Size = UDim2.new(0, v63, 0, v64), 
            Position = UDim2.new(0, 0, 0, -v62 - v27), 
            BackgroundTransparency = 1
        }, {
            Tile = v67
        }) else v67
    });
end;
v29 = l_withNavigation_0((v3.connect(function(v68, v69) --[[ Line: 241 ]]
    -- upvalues: l_GameInfosReducer_0 (copy), l_BigGameIconReducer_0 (copy)
    local l_universeId_2 = v69.entry.universeId;
    local v71 = v68.Personalization[l_GameInfosReducer_0.key][l_universeId_2];
    return {
        universeId = l_universeId_2, 
        name = v71.name, 
        creatorName = v71.creatorName, 
        placeId = v71.placeId, 
        totalUpVotes = v71.totalUpVotes, 
        totalDownVotes = v71.totalDownVotes, 
        gameDetail = v68.GameDetails[l_universeId_2], 
        thumbnail = v68[l_BigGameIconReducer_0.key][l_universeId_2]
    };
end, function(v72) --[[ Line: 254 ]]
    -- upvalues: l_OpenGameDetails_0 (copy), l_ApiFetchGameDetails_0 (copy)
    return {
        openGameDetails = function(v73, v74, v75) --[[ Line: 256 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v72 (copy), l_OpenGameDetails_0 (ref)
            v72(l_OpenGameDetails_0(v73, v75, v74));
        end, 
        fetchGameDetails = function(v76, v77) --[[ Line: 259 ]] --[[ Name: fetchGameDetails ]]
            -- upvalues: v72 (copy), l_ApiFetchGameDetails_0 (ref)
            v72(l_ApiFetchGameDetails_0.Fetch(v76, {
                v77
            }));
        end
    };
end)(v29)));
v29 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v29);
return (v17.connectUserLayer({
    v24() and l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer or nil
}, function(v78, _) --[[ Line: 273 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        shouldShowFeaturedTileCreatorName = (v78[l_AppUserLayers_0.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
    };
end)(v29));