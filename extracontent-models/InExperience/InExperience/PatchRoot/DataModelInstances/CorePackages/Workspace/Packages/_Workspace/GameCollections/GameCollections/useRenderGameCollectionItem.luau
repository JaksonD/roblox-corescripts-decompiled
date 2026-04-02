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
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local l_GameCollectionItemType_0 = l_GameCollectionItemTypes_0.GameCollectionItemType;
return function(v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 44 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useNavigateToGameDetails_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), v3 (copy), l_useBreakpointXOrSmaller_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), v2 (copy), v11 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameCollectionItemType_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy)
    local v76 = l_usePreferredInput_0();
    local v77 = l_useNavigateToGameDetails_0();
    local v78 = nil;
    local v79 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v80, v81 = v10();
        v78 = v80;
        v79 = v81;
    end;
    local v82 = v36 and v76 == v3.Input.Pointer;
    local v83 = true;
    if v32 ~= "Wide" then
        v83 = v32 == "Event";
    end;
    local v84 = nil;
    local _ = nil;
    local v86 = nil;
    v84 = l_useBreakpointXOrSmaller_0(v3.Keys.Small);
    local v87 = l_useBreakpointXOrSmaller_0(v3.Keys.XSmall);
    local v88 = l_FFlagLuaAppNarrowTileHideRating_0 and v74 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 and v75;
    v86 = if v84 and v53 > 0 and not v88 then l_GameTileConstants_0.TileTextLines[v32 or l_GameTileLayoutType_0.Narrow].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v32 or l_GameTileLayoutType_0.Narrow].metadataTextLines;
    return (v2.useCallback(function(v89, v90, v91, v92) --[[ Line: 171 ]]
        -- upvalues: v44 (copy), v42 (copy), v2 (ref), v11 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameCollectionItemType_0 (ref), v52 (copy), v61 (copy), v59 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v67 (copy), v50 (copy), v51 (copy), v43 (copy), v41 (copy), v40 (copy), v30 (copy), v45 (copy), v32 (copy), v82 (copy), v47 (copy), v37 (copy), v38 (copy), v39 (copy), v58 (copy), v77 (copy), v35 (copy), v53 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v63 (copy), v62 (copy), v64 (copy), v65 (copy), v66 (copy), v60 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref), v72 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), l_AppGameTile_0 (ref), v33 (copy), v34 (copy), v83 (copy), v31 (copy), v46 (copy), v48 (copy), v49 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v78 (ref), v79 (ref), v54 (copy), v86 (ref), v55 (copy), v56 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), v57 (copy), v87 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppSupportAdRatingFooter_0 (ref), v68 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref), v69 (copy), v70 (copy), v71 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (ref), v73 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (ref), v74 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (ref), v75 (copy)
        if v44 and v90 == v44 and v42 then
            return v2.createElement(v11, {
                onActivated = v42, 
                Size = if not l_FFlagSduiServerCompat_0 then v91 else nil, 
                size = if l_FFlagSduiServerCompat_0 then v91 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v90 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v90 else nil
            }), l_GameCollectionItemType_0.SeeAllTile;
        else
            local v93 = nil;
            if v52 then
                v93 = v52(v90);
            end;
            local v94 = v61 and v61[v89.universeId];
            local v95 = if v59 then v59 + v90 else nil;
            if v89.customRenderFunction then
                return v89.customRenderFunction({
                    item = v89, 
                    index = v90, 
                    itemSize = v91, 
                    rowNum = v92, 
                    zIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then -v90 else nil, 
                    maxItemIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v67 else nil, 
                    selectionOrder = v95, 
                    isDisabled = v93, 
                    onSelectionGained = v50, 
                    onSelectionLost = v51, 
                    topicId = v43, 
                    source = v41, 
                    referralSource = v40, 
                    playerCountStyle = v30, 
                    hideGameStats = v45, 
                    gameTileLayoutType = v32, 
                    hoverTileEnabled = v82, 
                    isContained = v47, 
                    reportGameDetailOpened = v37, 
                    reportExperienceLaunched = v38, 
                    launchExperienceEventContext = v39, 
                    onPeekViewClosed = v58, 
                    navigateToGameDetails = v77, 
                    impressionsTag = v35, 
                    textSizeOffset = v53, 
                    appPage = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v63 else nil, 
                    setGameHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v62 else nil, 
                    isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v94 else nil, 
                    sponsoredUserCohort = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v64 else nil, 
                    enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v65 else nil, 
                    enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v66 else nil, 
                    enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v60 else nil, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v72) or v94 then nil else v72
                });
            else
                local v96 = nil;
                if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v89.badgePosition and v89.badgeAnalyticsId and v89.badgeType and (v89.badgeText or v89.badgeIcon) then
                    v96 = {
                        [v89.badgePosition] = {
                            {
                                analyticsId = v89.badgeAnalyticsId, 
                                tileBadgeType = v89.badgeType, 
                                text = v89.badgeText, 
                                icons = if v89.badgeIcon then {
                                    v89.badgeIcon
                                } else nil, 
                                tileBadgeComponentType = v89.badgeComponentType
                            }
                        }
                    };
                end;
                return v2.createElement(l_AppGameTile_0, {
                    Size = v91, 
                    entry = v89, 
                    layoutOrder = v90, 
                    ZIndex = -v90, 
                    reportGameDetailOpened = v37, 
                    reportExperienceLaunched = v38, 
                    index = v90, 
                    friendFooterEnabled = v33, 
                    showFriendActivity = v34, 
                    impressionsTag = v35, 
                    useGridTile = v83, 
                    playerCountStyle = v30, 
                    isSponsoredFooterAllowed = v31, 
                    gameTileLayoutType = v32, 
                    useHoverTile = v82, 
                    topicId = v43, 
                    launchExperienceEventContext = v39, 
                    referralSource = v40, 
                    source = v41, 
                    rowNum = v92, 
                    navigateToGameDetails = v77, 
                    hideGameStats = v45, 
                    playButtonStyle = v46, 
                    isContained = v47, 
                    hideTitle = v48, 
                    hideMetadata = v49, 
                    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v78 else nil, 
                    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v79 else nil, 
                    isDisabled = v93, 
                    onSelectionGained = v50, 
                    onSelectionLost = v51, 
                    textSizeOffset = v53, 
                    contentTextLineCount = v54, 
                    metadataTextLineCount = v86, 
                    useExperienceTileMetadata = v55, 
                    forceHideAgeRatings = v56, 
                    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v57 else nil, 
                    onPeekViewClosed = v58, 
                    SelectionOrder = v95, 
                    enableExplicitFeedback = v60, 
                    setGameHidden = v62, 
                    appPage = v63, 
                    isHidden = v94, 
                    isNarrowScreenXSmall = v87, 
                    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v64 else nil, 
                    enableSponsoredFeedback = v65, 
                    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v66 else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v68 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v70 else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v71 else nil, 
                    badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v96 else nil, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v72) or v94 then nil else v72, 
                    compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v73 else nil, 
                    hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v74 else nil, 
                    hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v75 else nil
                }), l_GameCollectionItemType_0.GameTile;
            end;
        end;
    end, {
        v83, 
        v33, 
        v45, 
        v34, 
        v35, 
        v30, 
        v31, 
        v32, 
        v43, 
        v37, 
        v38, 
        v42, 
        v39, 
        v41, 
        v40, 
        v44, 
        v82, 
        v46, 
        v47, 
        v48, 
        v49, 
        v53, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v78 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v79 else nil, 
        v50, 
        v51, 
        v52, 
        v54, 
        v55, 
        v56, 
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v57 else nil, 
        v58, 
        v59, 
        v86, 
        v60, 
        v61, 
        v62, 
        v63, 
        v87, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v64 else nil, 
        v65, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v66 else nil, 
        v77, 
        if l_FFlagLuaAppSupportAdRatingFooter_0 then v68 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v70 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v71 else nil, 
        if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v72 else nil, 
        if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v73 else nil, 
        if l_FFlagLuaAppNarrowTileHideRating_0 then v74 else nil, 
        if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v75 else nil
    }));
end;