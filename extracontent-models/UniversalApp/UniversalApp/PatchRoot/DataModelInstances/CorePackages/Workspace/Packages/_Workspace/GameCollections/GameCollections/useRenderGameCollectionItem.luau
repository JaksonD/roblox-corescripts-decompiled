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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppNarrowTileSmallerFooterFont_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileSmallerFooterFont;
local l_FFlagLuaAppNarrowTileHideRating_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHideRating;
local l_FFlagLuaAppNarrowTileHidePlayerCount_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppNarrowTileHidePlayerCount;
local l_GameCollectionItemType_0 = l_GameCollectionItemTypes_0.GameCollectionItemType;
return function(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 42 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useNavigateToGameDetails_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), v3 (copy), l_useBreakpointXOrSmaller_0 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), v2 (copy), v11 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameCollectionItemType_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (copy)
    local v75 = l_usePreferredInput_0();
    local v76 = l_useNavigateToGameDetails_0();
    local v77 = nil;
    local v78 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v79, v80 = v10();
        v77 = v79;
        v78 = v80;
    end;
    local v81 = v35 and v75 == v3.Input.Pointer;
    local v82 = true;
    if v31 ~= "Wide" then
        v82 = v31 == "Event";
    end;
    local v83 = nil;
    local _ = nil;
    local v85 = nil;
    v83 = l_useBreakpointXOrSmaller_0(v3.Keys.Small);
    local v86 = l_useBreakpointXOrSmaller_0(v3.Keys.XSmall);
    local v87 = l_FFlagLuaAppNarrowTileHideRating_0 and v73 or l_FFlagLuaAppNarrowTileHidePlayerCount_0 and v74;
    v85 = if v83 and v52 > 0 and not v87 then l_GameTileConstants_0.TileTextLines[v31 or l_GameTileLayoutType_0.Narrow].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v31 or l_GameTileLayoutType_0.Narrow].metadataTextLines;
    return (v2.useCallback(function(v88, v89, v90, v91) --[[ Line: 169 ]]
        -- upvalues: v43 (copy), v41 (copy), v2 (ref), v11 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameCollectionItemType_0 (ref), v51 (copy), v60 (copy), v58 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v66 (copy), v49 (copy), v50 (copy), v42 (copy), v40 (copy), v39 (copy), v29 (copy), v44 (copy), v31 (copy), v81 (copy), v46 (copy), v36 (copy), v37 (copy), v38 (copy), v57 (copy), v76 (copy), v34 (copy), v52 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v62 (copy), v61 (copy), v63 (copy), v64 (copy), v65 (copy), v59 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref), v71 (copy), l_AppGameTile_0 (ref), v32 (copy), v33 (copy), v82 (copy), v30 (copy), v45 (copy), v47 (copy), v48 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v77 (ref), v78 (ref), v53 (copy), v85 (ref), v54 (copy), v55 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), v56 (copy), v86 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppSupportAdRatingFooter_0 (ref), v67 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref), v68 (copy), v69 (copy), v70 (copy), l_FFlagLuaAppNarrowTileSmallerFooterFont_0 (ref), v72 (copy), l_FFlagLuaAppNarrowTileHideRating_0 (ref), v73 (copy), l_FFlagLuaAppNarrowTileHidePlayerCount_0 (ref), v74 (copy)
        if v43 and v89 == v43 and v41 then
            return v2.createElement(v11, {
                onActivated = v41, 
                Size = if not l_FFlagSduiServerCompat_0 then v90 else nil, 
                size = if l_FFlagSduiServerCompat_0 then v90 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v89 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v89 else nil
            }), l_GameCollectionItemType_0.SeeAllTile;
        else
            local v92 = nil;
            if v51 then
                v92 = v51(v89);
            end;
            local v93 = v60 and v60[v88.universeId];
            local v94 = if v58 then v58 + v89 else nil;
            if v88.customRenderFunction then
                return v88.customRenderFunction({
                    item = v88, 
                    index = v89, 
                    itemSize = v90, 
                    rowNum = v91, 
                    zIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then -v89 else nil, 
                    maxItemIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v66 else nil, 
                    selectionOrder = v94, 
                    isDisabled = v92, 
                    onSelectionGained = v49, 
                    onSelectionLost = v50, 
                    topicId = v42, 
                    source = v40, 
                    referralSource = v39, 
                    playerCountStyle = v29, 
                    hideGameStats = v44, 
                    gameTileLayoutType = v31, 
                    hoverTileEnabled = v81, 
                    isContained = v46, 
                    reportGameDetailOpened = v36, 
                    reportExperienceLaunched = v37, 
                    launchExperienceEventContext = v38, 
                    onPeekViewClosed = v57, 
                    navigateToGameDetails = v76, 
                    impressionsTag = v34, 
                    textSizeOffset = v52, 
                    appPage = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v62 else nil, 
                    setGameHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v61 else nil, 
                    isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v93 else nil, 
                    sponsoredUserCohort = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v63 else nil, 
                    enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v64 else nil, 
                    enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v65 else nil, 
                    enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v59 else nil, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v71) or v93 then nil else v71
                });
            else
                local v95 = nil;
                if v88.badgePosition and v88.badgeAnalyticsId and v88.badgeType and (v88.badgeText or v88.badgeIcon) then
                    v95 = {
                        [v88.badgePosition] = {
                            {
                                analyticsId = v88.badgeAnalyticsId, 
                                tileBadgeType = v88.badgeType, 
                                text = v88.badgeText, 
                                icons = if v88.badgeIcon then {
                                    v88.badgeIcon
                                } else nil, 
                                tileBadgeComponentType = v88.badgeComponentType
                            }
                        }
                    };
                end;
                return v2.createElement(l_AppGameTile_0, {
                    Size = v90, 
                    entry = v88, 
                    layoutOrder = v89, 
                    ZIndex = -v89, 
                    reportGameDetailOpened = v36, 
                    reportExperienceLaunched = v37, 
                    index = v89, 
                    friendFooterEnabled = v32, 
                    showFriendActivity = v33, 
                    impressionsTag = v34, 
                    useGridTile = v82, 
                    playerCountStyle = v29, 
                    isSponsoredFooterAllowed = v30, 
                    gameTileLayoutType = v31, 
                    useHoverTile = v81, 
                    topicId = v42, 
                    launchExperienceEventContext = v38, 
                    referralSource = v39, 
                    source = v40, 
                    rowNum = v91, 
                    navigateToGameDetails = v76, 
                    hideGameStats = v44, 
                    playButtonStyle = v45, 
                    isContained = v46, 
                    hideTitle = v47, 
                    hideMetadata = v48, 
                    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v77 else nil, 
                    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v78 else nil, 
                    isDisabled = v92, 
                    onSelectionGained = v49, 
                    onSelectionLost = v50, 
                    textSizeOffset = v52, 
                    contentTextLineCount = v53, 
                    metadataTextLineCount = v85, 
                    useExperienceTileMetadata = v54, 
                    forceHideAgeRatings = v55, 
                    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v56 else nil, 
                    onPeekViewClosed = v57, 
                    SelectionOrder = v94, 
                    enableExplicitFeedback = v59, 
                    setGameHidden = v61, 
                    appPage = v62, 
                    isHidden = v93, 
                    isNarrowScreenXSmall = v86, 
                    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v63 else nil, 
                    enableSponsoredFeedback = v64, 
                    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v65 else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v67 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v70 else nil, 
                    badgeOverride = v95, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v71) or v93 then nil else v71, 
                    compactMetadataFormat = if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v72 else nil, 
                    hideRating = if l_FFlagLuaAppNarrowTileHideRating_0 then v73 else nil, 
                    hidePlayerCount = if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v74 else nil
                }), l_GameCollectionItemType_0.GameTile;
            end;
        end;
    end, {
        v82, 
        v32, 
        v44, 
        v33, 
        v34, 
        v29, 
        v30, 
        v31, 
        v42, 
        v36, 
        v37, 
        v41, 
        v38, 
        v40, 
        v39, 
        v43, 
        v81, 
        v45, 
        v46, 
        v47, 
        v48, 
        v52, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v77 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v78 else nil, 
        v49, 
        v50, 
        v51, 
        v53, 
        v54, 
        v55, 
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v56 else nil, 
        v57, 
        v58, 
        v85, 
        v59, 
        v60, 
        v61, 
        v62, 
        v86, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v63 else nil, 
        v64, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v65 else nil, 
        v76, 
        if l_FFlagLuaAppSupportAdRatingFooter_0 then v67 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v70 else nil, 
        if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v71 else nil, 
        if l_FFlagLuaAppNarrowTileSmallerFooterFont_0 then v72 else nil, 
        if l_FFlagLuaAppNarrowTileHideRating_0 then v73 else nil, 
        if l_FFlagLuaAppNarrowTileHidePlayerCount_0 then v74 else nil
    }));
end;