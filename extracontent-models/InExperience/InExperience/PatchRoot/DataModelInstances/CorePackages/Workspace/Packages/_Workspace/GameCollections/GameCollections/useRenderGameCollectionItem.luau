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
local l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportSponsoredExplicitFeedback;
local l_FFlagLuaAppSupportAdRatingFooter_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooter;
local l_FFlagLuaAppTwoByOneTileExperimentVariants_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileExperimentVariants;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagLuaAppSupportAdRatingFooterExperiment_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportAdRatingFooterExperiment;
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_GameCollectionItemType_0 = l_GameCollectionItemTypes_0.GameCollectionItemType;
return function(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70) --[[ Line: 44 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useNavigateToGameDetails_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), v3 (copy), l_useBreakpointXOrSmaller_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), v2 (copy), v11 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameCollectionItemType_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local v71 = l_usePreferredInput_0();
    local v72 = l_useNavigateToGameDetails_0();
    local v73 = nil;
    local v74 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v75, v76 = v10();
        v73 = v75;
        v74 = v76;
    end;
    local v77 = v34 and v71 == v3.Input.Pointer;
    local v78 = true;
    if v30 ~= "Wide" then
        v78 = v30 == "Event";
    end;
    local v79 = nil;
    local _ = nil;
    local v81 = nil;
    v79 = l_useBreakpointXOrSmaller_0(v3.Keys.Small);
    local v82 = l_useBreakpointXOrSmaller_0(v3.Keys.XSmall);
    v81 = if v79 and v51 > 0 then l_GameTileConstants_0.TileTextLines[v30 or l_GameTileLayoutType_0.Narrow].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v30 or l_GameTileLayoutType_0.Narrow].metadataTextLines;
    return (v2.useCallback(function(v83, v84, v85, v86) --[[ Line: 169 ]]
        -- upvalues: v42 (copy), v40 (copy), v2 (ref), v11 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameCollectionItemType_0 (ref), v50 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), v59 (copy), v57 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v65 (copy), v48 (copy), v49 (copy), v41 (copy), v39 (copy), v38 (copy), v28 (copy), v43 (copy), v30 (copy), v77 (copy), v45 (copy), v35 (copy), v36 (copy), v37 (copy), v56 (copy), v72 (copy), v33 (copy), v51 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v61 (copy), v60 (copy), v62 (copy), v63 (copy), v64 (copy), v58 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (ref), v70 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), l_AppGameTile_0 (ref), v31 (copy), v32 (copy), v78 (copy), v29 (copy), v44 (copy), v46 (copy), v47 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v73 (ref), v74 (ref), v52 (copy), v81 (ref), v53 (copy), v54 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), v55 (copy), v82 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportAdRatingFooter_0 (ref), v66 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref), v67 (copy), v68 (copy), v69 (copy)
        if v42 and v84 == v42 and v40 then
            return v2.createElement(v11, {
                onActivated = v40, 
                Size = if not l_FFlagSduiServerCompat_0 then v85 else nil, 
                size = if l_FFlagSduiServerCompat_0 then v85 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v84 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v84 else nil
            }), l_GameCollectionItemType_0.SeeAllTile;
        else
            local v87 = nil;
            if v50 then
                v87 = v50(v84);
            end;
            local v88 = nil;
            local v89 = nil;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then
                local v90 = v59 and v59[v83.universeId];
                if v90 then
                    v88 = v90.isHidden;
                    v89 = v90.hiddenTileType;
                end;
            else
                v88 = v59 and v59[v83.universeId];
            end;
            local v91 = if v57 then v57 + v84 else nil;
            if v83.customRenderFunction then
                return v83.customRenderFunction({
                    item = v83, 
                    index = v84, 
                    itemSize = v85, 
                    rowNum = v86, 
                    zIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then -v84 else nil, 
                    maxItemIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v65 else nil, 
                    selectionOrder = v91, 
                    isDisabled = v87, 
                    onSelectionGained = v48, 
                    onSelectionLost = v49, 
                    topicId = v41, 
                    source = v39, 
                    referralSource = v38, 
                    playerCountStyle = v28, 
                    hideGameStats = v43, 
                    gameTileLayoutType = v30, 
                    hoverTileEnabled = v77, 
                    isContained = v45, 
                    reportGameDetailOpened = v35, 
                    reportExperienceLaunched = v36, 
                    launchExperienceEventContext = v37, 
                    onPeekViewClosed = v56, 
                    navigateToGameDetails = v72, 
                    impressionsTag = v33, 
                    textSizeOffset = v51, 
                    appPage = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v61 else nil, 
                    setGameHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v60 else nil, 
                    isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v88 else nil, 
                    sponsoredUserCohort = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v62 else nil, 
                    enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v63 else nil, 
                    enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v64 else nil, 
                    enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v58 else nil, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v70) or v88 then nil else v70
                });
            else
                local v92 = nil;
                if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v83.badgePosition and v83.badgeAnalyticsId and v83.badgeType and (v83.badgeText or v83.badgeIcon) then
                    v92 = {
                        [v83.badgePosition] = {
                            {
                                analyticsId = v83.badgeAnalyticsId, 
                                tileBadgeType = v83.badgeType, 
                                text = v83.badgeText, 
                                icons = if v83.badgeIcon then {
                                    v83.badgeIcon
                                } else nil, 
                                tileBadgeComponentType = v83.badgeComponentType
                            }
                        }
                    };
                end;
                return v2.createElement(l_AppGameTile_0, {
                    Size = v85, 
                    entry = v83, 
                    layoutOrder = v84, 
                    ZIndex = -v84, 
                    reportGameDetailOpened = v35, 
                    reportExperienceLaunched = v36, 
                    index = v84, 
                    friendFooterEnabled = v31, 
                    showFriendActivity = v32, 
                    impressionsTag = v33, 
                    useGridTile = v78, 
                    playerCountStyle = v28, 
                    isSponsoredFooterAllowed = v29, 
                    gameTileLayoutType = v30, 
                    useHoverTile = v77, 
                    topicId = v41, 
                    launchExperienceEventContext = v37, 
                    referralSource = v38, 
                    source = v39, 
                    rowNum = v86, 
                    navigateToGameDetails = v72, 
                    hideGameStats = v43, 
                    playButtonStyle = v44, 
                    isContained = v45, 
                    hideTitle = v46, 
                    hideMetadata = v47, 
                    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v73 else nil, 
                    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v74 else nil, 
                    isDisabled = v87, 
                    onSelectionGained = v48, 
                    onSelectionLost = v49, 
                    textSizeOffset = v51, 
                    contentTextLineCount = v52, 
                    metadataTextLineCount = v81, 
                    useExperienceTileMetadata = v53, 
                    forceHideAgeRatings = v54, 
                    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v55 else nil, 
                    onPeekViewClosed = v56, 
                    SelectionOrder = v91, 
                    enableExplicitFeedback = v58, 
                    setGameHidden = v60, 
                    appPage = v61, 
                    isHidden = v88, 
                    isNarrowScreenXSmall = v82, 
                    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v62 else nil, 
                    enableSponsoredFeedback = v63, 
                    hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v89, 
                    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v64 else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v66 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
                    badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v92 else nil, 
                    onTileImageLoaded = if not (l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 and v70) or v88 then nil else v70
                }), l_GameCollectionItemType_0.GameTile;
            end;
        end;
    end, {
        v78, 
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
        v77, 
        v44, 
        v45, 
        v46, 
        v47, 
        v51, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v73 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v74 else nil, 
        v48, 
        v49, 
        v50, 
        v52, 
        v53, 
        v54, 
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v55 else nil, 
        v56, 
        v57, 
        v81, 
        v58, 
        v59, 
        v60, 
        v61, 
        v82, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v62 else nil, 
        v63, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v64 else nil, 
        v72, 
        if l_FFlagLuaAppSupportAdRatingFooter_0 then v66 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v69 else nil, 
        if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v70 else nil
    }));
end;