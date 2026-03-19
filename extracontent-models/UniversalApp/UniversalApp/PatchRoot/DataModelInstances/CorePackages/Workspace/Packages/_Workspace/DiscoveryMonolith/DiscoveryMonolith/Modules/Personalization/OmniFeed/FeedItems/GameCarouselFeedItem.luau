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
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v6.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local v23 = v2.PureComponent:extend("GameCarouselFeedItem");
v23.validateProps = v4.strictInterface({
    [v15.key] = v15.interface, 
    sortIndex = v4.number, 
    isOmni = v4.boolean, 
    topicLayoutData = v4.optional(v4.table), 
    formFactor = v4.string, 
    sortName = v4.string
});
v23.render = function(v24) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), l_OmniFeedConstants_0 (copy), l_mutedError_0 (copy), v19 (copy), l_FFlagLuaAppHeaderButtonText_0 (copy), l_parseBooleanString_0 (copy), l_AppPage_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v2 (copy), v14 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), v20 (copy), l_FIntLuaAppDelayImpressionsMaxUpdates_0 (copy)
    local l_sortIndex_0 = v24.props.sortIndex;
    local l_sortName_0 = v24.props.sortName;
    local l_formFactor_0 = v24.props.formFactor;
    local l_scrollViewPositionChangedSignal_0 = v24.props[v15.key].scrollViewPositionChangedSignal;
    local l_appPage_0 = v24.props[v15.key].appPage;
    local l_feedItemStartRow_0 = v24.props[v15.key].feedItemStartRow;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = "Narrow";
    if v24.props.topicLayoutData then
        v33 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ComponentType];
        if v33 then
            if v33 == l_OmniFeedConstants_0.ComponentTypeDataKeys.EventTile then
                v37 = "Event";
            elseif v33 == l_OmniFeedConstants_0.ComponentTypeDataKeys.GridTile then
                v37 = "Wide";
            end;
            local v38 = true;
            if v37 ~= "Wide" then
                v38 = v37 == "Event";
            end;
            v31 = v38;
        end;
        v34 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.LinkPath];
        v35 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.SubtitleLinkPath];
        v32 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayerCountStyle];
        v36 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.PlayButtonStyle];
    end;
    local v39 = nil;
    if v24.props.topicLayoutData then
        local v40 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.IsSponsoredFooterAllowed];
        local v41 = false;
        if v40 ~= nil then
            v41 = v40 == "true";
        end;
        v39 = v41;
    end;
    local v42 = nil;
    if v24.props.topicLayoutData then
        local v43 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideSeeAll];
        local v44 = false;
        if v43 ~= nil then
            v44 = v43 == "true";
        end;
        v42 = v44;
    end;
    local v45 = if v24.props.topicLayoutData then v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.InfoText] else nil;
    local v46 = nil;
    if v24.props.topicLayoutData then
        local v47 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.EndTimestamp];
        if v47 then
            v46 = tonumber(v47);
            if v46 == nil then
                l_mutedError_0(string.format("Unable to convert `endTimestamp` to number with value: %s", v47));
            end;
        end;
    end;
    local v48 = nil;
    if v24.props.topicLayoutData then
        v48 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.CountdownString];
        if v48 ~= nil and v48 ~= "" and (not v48:find("{hours}") or not v48:find("{minutes}")) then
            l_mutedError_0(string.format("Invalid `countdownString` missing placeholder strings {hours} or {minutes}: %s", v48));
            v48 = nil;
        end;
    end;
    local v49 = nil;
    if v24.props.topicLayoutData then
        local v50 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.BackgroundImageAssetId];
        if v50 and v50 ~= "" then
            v49 = if v19 then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v50) else ("rbxthumb://type=Asset&id=%*&w=768&h=432"):format(v50);
        end;
    end;
    local v51 = nil;
    if l_FFlagLuaAppHeaderButtonText_0 and v24.props.topicLayoutData then
        v51 = v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HeaderButtonText];
    end;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    if v24.props.topicLayoutData then
        v52 = l_parseBooleanString_0(v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileMetadata]);
        v53 = l_parseBooleanString_0(v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.HideTileTitle]);
        v54 = l_parseBooleanString_0(v24.props.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.ContainedTile]);
    end;
    local v55 = true;
    if l_appPage_0 ~= l_AppPage_0.Games then
        v55 = l_appPage_0 == l_AppPage_0.Home;
    end;
    local v56 = nil;
    v56 = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
    return v2.createElement(v14, {
        gameSortId = l_sortName_0, 
        sortIndex = l_sortIndex_0, 
        pageContext = l_appPage_0, 
        scrollViewPositionChangedSignal = l_scrollViewPositionChangedSignal_0, 
        friendFooterEnabled = true, 
        isHoverSupportEnabled = v55 or l_appPage_0 == l_AppPage_0.Games and v31, 
        gridSupportAllowed = v55, 
        useGridTiles = v31, 
        playerCountStyle = v32, 
        isSponsoredFooterAllowed = v39, 
        componentType = v33, 
        linkPath = v34, 
        subtitleLinkPath = v35, 
        hideSeeAll = v42, 
        gameTileLayoutType = v37, 
        infoText = v45, 
        endTimestamp = v46, 
        countdownString = v48, 
        startRow = l_feedItemStartRow_0, 
        playButtonStyle = v36, 
        sideMargin = v56, 
        backgroundMuralUrl = v49, 
        headerButtonText = if l_FFlagLuaAppHeaderButtonText_0 then v51 else nil, 
        shouldHideTileMetadata = v52, 
        shouldHideTileTitle = v53, 
        containedTile = v54, 
        shouldUseFrameBoundsForImpressions = if l_FFlagSearchOmniAutocompletePage_0 then l_appPage_0 == l_AppPage_0.SearchLandingPage else nil, 
        layoutOverrides = if l_FFlagSearchOmniAutocompletePage_0 then if l_appPage_0 == l_AppPage_0.SearchLandingPage then {
            sideMargin = if l_formFactor_0 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else v20
        } else nil else nil, 
        numUpdatesToDelayImpressions = l_FIntLuaAppDelayImpressionsMaxUpdates_0, 
        selectionOrderBase = v24.props[v15.key].selectionOrderBase, 
        defaultContainerSize = v24.props[v15.key].defaultContainerSize
    });
end;
return (v3.connect(function(v57, v58) --[[ Line: 210 ]]
    -- upvalues: v15 (copy), l_AppPage_0 (copy), l_GameSortGroups_0 (copy), l_FFlagSearchOmniAutocompletePage_0 (copy), l_mutedError_0 (copy)
    local l_appPage_1 = v58[v15.key].appPage;
    local v60 = nil;
    if v58.isOmni then
        assert(l_appPage_1 == l_AppPage_0.Home, "Omni only on Home Page");
        local v61 = v57.OmniRecommendations[l_appPage_1];
        local v62 = (v61 and v61.sorts or {})[v58.sortIndex];
        if v62 and v62.topicId then
            v60 = tostring(v62.topicId);
        end;
    else
        local v63 = nil;
        if l_appPage_1 == l_AppPage_0.Home then
            v63 = l_GameSortGroups_0.HomeGames;
        elseif l_appPage_1 == l_AppPage_0.Games then
            v63 = l_GameSortGroups_0.Games;
        elseif l_FFlagSearchOmniAutocompletePage_0 and l_appPage_1 == l_AppPage_0.SearchLandingPage then
            v63 = l_GameSortGroups_0.SearchLandingPage;
        else
            l_mutedError_0("Unsupported page for GameCarouselFeedItem data: " .. tostring(l_appPage_1));
        end;
        v60 = v57.GameSortGroups[v63].sorts[v58.sortIndex];
    end;
    return {
        sortName = v60, 
        formFactor = v57.FormFactor
    };
end)(v23));