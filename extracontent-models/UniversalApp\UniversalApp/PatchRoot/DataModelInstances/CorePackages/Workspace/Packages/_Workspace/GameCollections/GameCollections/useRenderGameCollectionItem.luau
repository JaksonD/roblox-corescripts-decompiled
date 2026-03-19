local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v3.usePreferredInput;
local l_useBreakpointXOrSmaller_0 = v3.useBreakpointXOrSmaller;
local v6 = require(l_Parent_0.GameTile);
local l_GameTileConstants_0 = v6.GameTileConstants;
local l_GameTileLayoutType_0 = v6.GameTileTypes.GameTileLayoutType;
local l_AppGameTile_0 = v6.AppGameTile;
local v10 = require(l_script_FirstAncestor_0.useTriggerGameTileFeedbackCallbacks);
local v11 = require(l_script_FirstAncestor_0.SeeAllTile);
local l_useNavigateToGameDetails_0 = require(l_Parent_0.GameTile).useNavigateToGameDetails;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local _ = require(l_Parent_0.HoldToPlay);
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppGameTileWideVideoThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail;
local l_FFlagLuaAppEnableWhyThisAdModal_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableWhyThisAdModal;
local l_FFlagLuaAppEnableSponsoredReportAd_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableSponsoredReportAd;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRemoveSponsoredReportHiddenState;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local v27 = if l_FFlagLuaAppSearchGridTiles_0 then l_GameCollectionItemTypes_0.GameCollectionItemType else {
    GameTile = "GameTile", 
    SeeAllTile = "SeeAllTile"
};
return function(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69) --[[ Line: 48 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useNavigateToGameDetails_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), v3 (copy), l_useBreakpointXOrSmaller_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), v2 (copy), v11 (copy), l_FFlagSduiServerCompat_0 (copy), v27 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local v70 = l_usePreferredInput_0();
    local v71 = l_useNavigateToGameDetails_0();
    local v72 = nil;
    local v73 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v74, v75 = v10();
        v72 = v74;
        v73 = v75;
    end;
    local v76 = v34 and v70 == v3.Input.Pointer;
    local v77 = true;
    if v30 ~= "Wide" then
        v77 = v30 == "Event";
    end;
    local v78 = nil;
    local _ = nil;
    local v80 = nil;
    v78 = l_useBreakpointXOrSmaller_0(v3.Keys.Small);
    local v81 = l_useBreakpointXOrSmaller_0(v3.Keys.XSmall);
    v80 = if v78 and v51 > 0 then l_GameTileConstants_0.TileTextLines[v30 or l_GameTileLayoutType_0.Narrow].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v30 or l_GameTileLayoutType_0.Narrow].metadataTextLines;
    return (v2.useCallback(function(v82, v83, v84, v85) --[[ Line: 170 ]]
        -- upvalues: v42 (copy), v40 (copy), v2 (ref), v11 (ref), l_FFlagSduiServerCompat_0 (ref), v27 (ref), v50 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), v59 (copy), v57 (copy), l_FFlagLuaAppSearchGridTiles_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v65 (copy), v48 (copy), v49 (copy), v41 (copy), v39 (copy), v38 (copy), v28 (copy), v43 (copy), v30 (copy), v76 (copy), v45 (copy), v35 (copy), v36 (copy), v37 (copy), v56 (copy), v71 (copy), v33 (copy), v51 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v61 (copy), v60 (copy), v62 (copy), v63 (copy), v64 (copy), v58 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), l_AppGameTile_0 (ref), v31 (copy), v32 (copy), v77 (copy), v29 (copy), v44 (copy), v46 (copy), v47 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v72 (ref), v73 (ref), v52 (copy), v80 (ref), v53 (copy), v54 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), v55 (copy), v81 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportAdRatingFooter_0 (ref), v66 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref), v67 (copy), v68 (copy), v69 (copy)
        if v42 and v83 == v42 and v40 then
            return v2.createElement(v11, {
                onActivated = v40, 
                Size = if not l_FFlagSduiServerCompat_0 then v84 else nil, 
                size = if l_FFlagSduiServerCompat_0 then v84 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v83 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v83 else nil
            }), v27.SeeAllTile;
        else
            local v86 = nil;
            if v50 then
                v86 = v50(v83);
            end;
            local v87 = nil;
            local v88 = nil;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then
                local v89 = v59 and v59[v82.universeId];
                if v89 then
                    v87 = v89.isHidden;
                    v88 = v89.hiddenTileType;
                end;
            else
                v87 = v59 and v59[v82.universeId];
            end;
            local v90 = if v57 then v57 + v83 else nil;
            if l_FFlagLuaAppSearchGridTiles_0 and v82.customRenderFunction then
                return v82.customRenderFunction({
                    item = v82, 
                    index = v83, 
                    itemSize = v84, 
                    rowNum = v85, 
                    zIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then -v83 else nil, 
                    maxItemIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v65 else nil, 
                    selectionOrder = v90, 
                    isDisabled = v86, 
                    onSelectionGained = v48, 
                    onSelectionLost = v49, 
                    topicId = v41, 
                    source = v39, 
                    referralSource = v38, 
                    playerCountStyle = v28, 
                    hideGameStats = v43, 
                    gameTileLayoutType = v30, 
                    hoverTileEnabled = v76, 
                    isContained = v45, 
                    reportGameDetailOpened = v35, 
                    reportExperienceLaunched = v36, 
                    launchExperienceEventContext = v37, 
                    onPeekViewClosed = v56, 
                    navigateToGameDetails = v71, 
                    impressionsTag = v33, 
                    textSizeOffset = v51, 
                    appPage = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v61 else nil, 
                    setGameHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v60 else nil, 
                    isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v87 else nil, 
                    sponsoredUserCohort = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v62 else nil, 
                    enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v63 else nil, 
                    enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v64 else nil, 
                    enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v58 else nil
                });
            else
                local v91 = nil;
                if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v82.badgePosition and v82.badgeAnalyticsId and v82.badgeType and (v82.badgeText or v82.badgeIcon) then
                    v91 = {
                        [v82.badgePosition] = {
                            {
                                analyticsId = v82.badgeAnalyticsId, 
                                tileBadgeType = v82.badgeType, 
                                text = v82.badgeText, 
                                icons = if v82.badgeIcon then {
                                    v82.badgeIcon
                                } else nil, 
                                tileBadgeComponentType = v82.badgeComponentType
                            }
                        }
                    };
                end;
                return v2.createElement(l_AppGameTile_0, {
                    Size = v84, 
                    entry = v82, 
                    layoutOrder = v83, 
                    ZIndex = -v83, 
                    reportGameDetailOpened = v35, 
                    reportExperienceLaunched = v36, 
                    index = if l_FFlagLuaAppSearchGridTiles_0 then v83 else v82.realGameEntryIndex or v83, 
                    friendFooterEnabled = v31, 
                    showFriendActivity = v32, 
                    impressionsTag = v33, 
                    useGridTile = v77, 
                    playerCountStyle = v28, 
                    isSponsoredFooterAllowed = v29, 
                    gameTileLayoutType = v30, 
                    useHoverTile = v76, 
                    topicId = v41, 
                    launchExperienceEventContext = v37, 
                    referralSource = v38, 
                    source = v39, 
                    rowNum = v85, 
                    navigateToGameDetails = v71, 
                    hideGameStats = v43, 
                    playButtonStyle = v44, 
                    isContained = v45, 
                    hideTitle = v46, 
                    hideMetadata = v47, 
                    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v72 else nil, 
                    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v73 else nil, 
                    isDisabled = v86, 
                    onSelectionGained = v48, 
                    onSelectionLost = v49, 
                    textSizeOffset = v51, 
                    contentTextLineCount = v52, 
                    metadataTextLineCount = v80, 
                    useExperienceTileMetadata = v53, 
                    forceHideAgeRatings = v54, 
                    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v55 else nil, 
                    onPeekViewClosed = v56, 
                    SelectionOrder = v90, 
                    enableExplicitFeedback = v58, 
                    setGameHidden = v60, 
                    appPage = v61, 
                    isHidden = v87, 
                    isNarrowScreenXSmall = v81, 
                    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v62 else nil, 
                    enableSponsoredFeedback = v63, 
                    hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v88, 
                    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v64 else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v66 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
                    badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v91 else nil
                }), v27.GameTile;
            end;
        end;
    end, {
        v77, 
        v31, 
        v43, 
        v32, 
        v33, 
        v28, 
        v29, 
        v30, 
        v41, 
        v35, 
        v36, 
        v40, 
        v37, 
        v39, 
        v38, 
        v42, 
        v76, 
        v44, 
        v45, 
        v46, 
        v47, 
        v51, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v72 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v73 else nil, 
        v48, 
        v49, 
        v50, 
        v52, 
        v53, 
        v54, 
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v55 else nil, 
        v56, 
        v57, 
        v80, 
        v58, 
        v59, 
        v60, 
        v61, 
        v81, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v62 else nil, 
        v63, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v64 else nil, 
        if l_FFlagLuaAppSearchGridTiles_0 then v71 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooter_0 then v66 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil
    }));
end;