local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.t);
local _ = require(l_Parent_0.GameTile);
local v6 = require(l_Parent_0.DiscoveryTypes);
local l_GameSortGroups_0 = v6.GameSortGroups;
local l_OmniFeedConstants_0 = v6.OmniFeedConstants;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_parseBooleanString_0 = require(l_Parent_0.DiscoveryUtils).parseBooleanString;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v14 = require(l_Modules_0.Personalization.Games.GameCollectionCarousel);
local v15 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedProps);
local l_FFlagLuaAppHeaderButtonText_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHeaderButtonText;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FIntLuaAppDelayImpressionsMaxUpdates_0 = require(l_Parent_0.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates;
local v19 = game:DefineFastFlag("LuaAppForceLowResMural", false);
local v20 = require(l_Modules_0.Personalization.Search.FIntSearchLandingPageSideMargin);
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v26 = v2.PureComponent:extend("GameCarouselFeedItem");
v26.validateProps = v4.strictInterface({
    [v15.key] = v15.interface, 
    sortIndex = v4.number, 
    isOmni = v4.boolean, 
    topicLayoutData = v4.optional(v4.table), 
    formFactor = v4.string, 
    sortName = v4.string
});
v26.render = function(v27) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), l_OmniFeedConstants_0 (copy), l_mutedError_0 (copy), v19 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_parseBooleanString_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_AppPage_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v2 (copy), v14 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v20 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local l_sortIndex_0 = v27.props.sortIndex;
    local l_sortName_0 = v27.props.sortName;
    local l_formFactor_0 = v27.props.formFactor;
    local l_scrollViewPositionChangedSignal_0 = v27.props[v15.key].scrollViewPositionChangedSignal;
    local l_appPage_0 = v27.props[v15.key].appPage;
    local l_feedItemStartRow_0 = v27.props[v15.key].feedItemStartRow;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = "Narrow";
    if v27.props.topicLayoutData then
        v36 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        if v36 then
            if v36 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                v40 = "Event";
            elseif v36 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                v40 = "Wide";
            end;
            local v41 = true;
            if v40 ~= "Wide" then
                v41 = v40 == "Event";
            end;
            v34 = v41;
        end;
        v37 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.LinkPath];
        v38 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SubtitleLinkPath];
        v35 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayerCountStyle];
        v39 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayButtonStyle];
    end;
    local v42 = nil;
    if v27.props.topicLayoutData then
        local v43 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v44 = false;
        if v43 ~= nil then
            v44 = v43 == "true";
        end;
        v42 = v44;
    end;
    local v45 = nil;
    if v27.props.topicLayoutData then
        local v46 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideSeeAll];
        local v47 = false;
        if v46 ~= nil then
            v47 = v46 == "true";
        end;
        v45 = v47;
    end;
    local v48 = if v27.props.topicLayoutData then v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.InfoText] else nil;
    local v49 = nil;
    if v27.props.topicLayoutData then
        local v50 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EndTimestamp];
        if v50 then
            v49 = tonumber(v50);
            if v49 == nil then
                l_mutedError_0(string.format("Unable to convert `endTimestamp` to number with value: %s", v50));
            end;
        end;
    end;
    local v51 = nil;
    if v27.props.topicLayoutData then
        v51 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.CountdownString];
        if v51 ~= nil and v51 ~= "" and (not v51:find("{hours}") or not v51:find("{minutes}")) then
            l_mutedError_0(string.format("Invalid `countdownString` missing placeholder strings {hours} or {minutes}: %s", v51));
            v51 = nil;
        end;
    end;
    local v52 = nil;
    if v27.props.topicLayoutData then
        local v53 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.BackgroundImageAssetId];
        if v53 and v53 ~= "" then
            v52 = if v19 then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v53) else ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format(v53);
        end;
    end;
    local v54 = nil;
    if l_FFlagLuaAppHeaderButtonText_0 and v27.props.topicLayoutData then
        v54 = v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HeaderButtonText];
    end;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if v27.props.topicLayoutData then
        v55 = l_parseBooleanString_0(v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileMetadata]);
        v56 = l_parseBooleanString_0(v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileTitle]);
        v57 = l_parseBooleanString_0(v27.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile]);
    end;
    local v58 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v27.props[v15.key].appCompositionEnabled else nil;
    local v59 = true;
    if l_appPage_0 ~= l_AppPage_0.Games then
        v59 = l_appPage_0 == l_AppPage_0.Home;
    end;
    local v60 = nil;
    v60 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    return v2.createElement(v14, {
        gameSortId = l_sortName_0, 
        sortIndex = l_sortIndex_0, 
        pageContext = l_appPage_0, 
        scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
        friendFooterEnabled = true, 
        isHoverSupportEnabled = v59 or l_appPage_0 == l_AppPage_0.Games and v34, 
        gridSupportAllowed = v59, 
        useGridTiles = v34, 
        playerCountStyle = v35, 
        isSponsoredFooterAllowed = v42, 
        componentType = v36, 
        linkPath = v37, 
        subtitleLinkPath = v38, 
        hideSeeAll = v45, 
        gameTileLayoutType = v40, 
        infoText = v48, 
        endTimestamp = v49, 
        countdownString = v51, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = v39, 
        sideMargin = if v58 then nil else v60, 
        appCompositionEnabled = if l_FFlagLuaAppCompositionSupport_0 then v58 else nil, 
        backgroundMuralUrl = v52, 
        headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v54 else nil, 
        shouldHideTileMetadata = v55, 
        shouldHideTileTitle = v56, 
        containedTile = v57, 
        shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then l_appPage_0 == l_AppPage_0.SearchLandingPage else nil, 
        layoutOverrides = if v58 then nil else if l_FFlagSearchOmniAutocompletePage_0 then if l_appPage_0 == l_AppPage_0.SearchLandingPage then {
            sideMargin = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else v20
        } else nil else nil, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v27.props[v15.key].selectionOrderBase, 
        defaultContainerSize = v27.props[v15.key].defaultContainerSize, 
        onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v27.props[v15.key].onTileImageLoaded else nil
    });
end;
return (v3.connect(function(v61, v62) --[[ Line: 226 ]]
    -- upvalues: v15 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_mutedError_0 (copy)
    local l_appPage_1 = v62[v15.key].appPage;
    local v64 = nil;
    if v62.isOmni then
        assert(l_appPage_1 == l_AppPage_0.Home, "Omni only on Home Page");
        local v65 = v61.OmniRecommendations[l_appPage_1];
        local v66 = (v65 and v65.sorts or {})[v62.sortIndex];
        if v66 and v66.topicId then
            v64 = tostring(v66.topicId);
        end;
    else
        local v67 = nil;
        if l_appPage_1 == l_AppPage_0.Home then
            v67 = l_GameSortGroups_0.HomeGames;
        elseif l_appPage_1 == l_AppPage_0.Games then
            v67 = l_GameSortGroups_0.Games;
        elseif l_FFlagSearchOmniAutocompletePage_0 and l_appPage_1 == l_AppPage_0.SearchLandingPage then
            v67 = l_GameSortGroups_0.SearchLandingPage;
        else
            l_mutedError_0("Unsupported page for GameCarouselFeedItem data: " .. tostring(l_appPage_1));
        end;
        v64 = v61.GameSortGroups[v67].sorts[v62.sortIndex];
    end;
    return {
        sortName = v64, 
        formFactor = v61.FormFactor
    };
end)(v26));