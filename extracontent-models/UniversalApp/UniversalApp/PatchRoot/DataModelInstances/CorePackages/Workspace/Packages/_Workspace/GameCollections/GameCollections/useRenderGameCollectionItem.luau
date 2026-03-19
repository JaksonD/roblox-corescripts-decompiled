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
local l_GameCollectionItemType_0 = l_GameCollectionItemTypes_0.GameCollectionItemType;
return function(v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 42 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), l_useNavigateToGameDetails_0 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v10 (copy), v3 (copy), l_useBreakpointXOrSmaller_0 (copy), l_GameTileConstants_0 (copy), l_GameTileLayoutType_0 (copy), v2 (copy), v11 (copy), l_FFlagSduiServerCompat_0 (copy), l_GameCollectionItemType_0 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (copy), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (copy), l_AppGameTile_0 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (copy), l_FFlagLuaAppSupportAdRatingFooter_0 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (copy)
    local v69 = l_usePreferredInput_0();
    local v70 = l_useNavigateToGameDetails_0();
    local v71 = nil;
    local v72 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v73, v74 = v10();
        v71 = v73;
        v72 = v74;
    end;
    local v75 = v33 and v69 == v3.Input.Pointer;
    local v76 = true;
    if v29 ~= "Wide" then
        v76 = v29 == "Event";
    end;
    local v77 = nil;
    local _ = nil;
    local v79 = nil;
    v77 = l_useBreakpointXOrSmaller_0(v3.Keys.Small);
    local v80 = l_useBreakpointXOrSmaller_0(v3.Keys.XSmall);
    v79 = if v77 and v50 > 0 then l_GameTileConstants_0.TileTextLines[v29 or l_GameTileLayoutType_0.Narrow].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v29 or l_GameTileLayoutType_0.Narrow].metadataTextLines;
    return (v2.useCallback(function(v81, v82, v83, v84) --[[ Line: 164 ]]
        -- upvalues: v41 (copy), v39 (copy), v2 (ref), v11 (ref), l_FFlagSduiServerCompat_0 (ref), l_GameCollectionItemType_0 (ref), v49 (copy), l_FFlagLuaAppEnableSponsoredReportAd_0 (ref), l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 (ref), v58 (copy), v56 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), v64 (copy), v47 (copy), v48 (copy), v40 (copy), v38 (copy), v37 (copy), v27 (copy), v42 (copy), v29 (copy), v75 (copy), v44 (copy), v34 (copy), v35 (copy), v36 (copy), v55 (copy), v70 (copy), v32 (copy), v50 (copy), l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 (ref), v60 (copy), v59 (copy), v61 (copy), v62 (copy), v63 (copy), v57 (copy), l_FFlagLuaAppTwoByOneTileExperimentVariants_0 (ref), l_AppGameTile_0 (ref), v30 (copy), v31 (copy), v76 (copy), v28 (copy), v43 (copy), v45 (copy), v46 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v71 (ref), v72 (ref), v51 (copy), v79 (ref), v52 (copy), v53 (copy), l_FFlagLuaAppGameTileWideVideoThumbnail_0 (ref), v54 (copy), v80 (copy), l_FFlagLuaAppEnableWhyThisAdModal_0 (ref), l_FFlagLuaAppSupportAdRatingFooter_0 (ref), v65 (copy), l_FFlagLuaAppSupportAdRatingFooterExperiment_0 (ref), v66 (copy), v67 (copy), v68 (copy)
        if v41 and v82 == v41 and v39 then
            return v2.createElement(v11, {
                onActivated = v39, 
                Size = if not l_FFlagSduiServerCompat_0 then v83 else nil, 
                size = if l_FFlagSduiServerCompat_0 then v83 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then v82 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then v82 else nil
            }), l_GameCollectionItemType_0.SeeAllTile;
        else
            local v85 = nil;
            if v49 then
                v85 = v49(v82);
            end;
            local v86 = nil;
            local v87 = nil;
            if l_FFlagLuaAppEnableSponsoredReportAd_0 and not l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then
                local v88 = v58 and v58[v81.universeId];
                if v88 then
                    v86 = v88.isHidden;
                    v87 = v88.hiddenTileType;
                end;
            else
                v86 = v58 and v58[v81.universeId];
            end;
            local v89 = if v56 then v56 + v82 else nil;
            if v81.customRenderFunction then
                return v81.customRenderFunction({
                    item = v81, 
                    index = v82, 
                    itemSize = v83, 
                    rowNum = v84, 
                    zIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then -v82 else nil, 
                    maxItemIndex = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v64 else nil, 
                    selectionOrder = v89, 
                    isDisabled = v85, 
                    onSelectionGained = v47, 
                    onSelectionLost = v48, 
                    topicId = v40, 
                    source = v38, 
                    referralSource = v37, 
                    playerCountStyle = v27, 
                    hideGameStats = v42, 
                    gameTileLayoutType = v29, 
                    hoverTileEnabled = v75, 
                    isContained = v44, 
                    reportGameDetailOpened = v34, 
                    reportExperienceLaunched = v35, 
                    launchExperienceEventContext = v36, 
                    onPeekViewClosed = v55, 
                    navigateToGameDetails = v70, 
                    impressionsTag = v32, 
                    textSizeOffset = v50, 
                    appPage = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v60 else nil, 
                    setGameHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v59 else nil, 
                    isHidden = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v86 else nil, 
                    sponsoredUserCohort = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v61 else nil, 
                    enableSponsoredFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v62 else nil, 
                    enableReportAd = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v63 else nil, 
                    enableExplicitFeedback = if l_FFlagLuaAppSupportSponsoredExplicitFeedback_0 then v57 else nil
                });
            else
                local v90 = nil;
                if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 and v81.badgePosition and v81.badgeAnalyticsId and v81.badgeType and (v81.badgeText or v81.badgeIcon) then
                    v90 = {
                        [v81.badgePosition] = {
                            {
                                analyticsId = v81.badgeAnalyticsId, 
                                tileBadgeType = v81.badgeType, 
                                text = v81.badgeText, 
                                icons = if v81.badgeIcon then {
                                    v81.badgeIcon
                                } else nil, 
                                tileBadgeComponentType = v81.badgeComponentType
                            }
                        }
                    };
                end;
                return v2.createElement(l_AppGameTile_0, {
                    Size = v83, 
                    entry = v81, 
                    layoutOrder = v82, 
                    ZIndex = -v82, 
                    reportGameDetailOpened = v34, 
                    reportExperienceLaunched = v35, 
                    index = v82, 
                    friendFooterEnabled = v30, 
                    showFriendActivity = v31, 
                    impressionsTag = v32, 
                    useGridTile = v76, 
                    playerCountStyle = v27, 
                    isSponsoredFooterAllowed = v28, 
                    gameTileLayoutType = v29, 
                    useHoverTile = v75, 
                    topicId = v40, 
                    launchExperienceEventContext = v36, 
                    referralSource = v37, 
                    source = v38, 
                    rowNum = v84, 
                    navigateToGameDetails = v70, 
                    hideGameStats = v42, 
                    playButtonStyle = v43, 
                    isContained = v44, 
                    hideTitle = v45, 
                    hideMetadata = v46, 
                    onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v71 else nil, 
                    onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v72 else nil, 
                    isDisabled = v85, 
                    onSelectionGained = v47, 
                    onSelectionLost = v48, 
                    textSizeOffset = v50, 
                    contentTextLineCount = v51, 
                    metadataTextLineCount = v79, 
                    useExperienceTileMetadata = v52, 
                    forceHideAgeRatings = v53, 
                    videoAnalytics = if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v54 else nil, 
                    onPeekViewClosed = v55, 
                    SelectionOrder = v89, 
                    enableExplicitFeedback = v57, 
                    setGameHidden = v59, 
                    appPage = v60, 
                    isHidden = v86, 
                    isNarrowScreenXSmall = v80, 
                    sponsoredUserCohort = if l_FFlagLuaAppEnableWhyThisAdModal_0 then v61 else nil, 
                    enableSponsoredFeedback = v62, 
                    hiddenTileType = if not l_FFlagLuaAppEnableSponsoredReportAd_0 or l_FFlagLuaAppRemoveSponsoredReportHiddenState_0 then nil else v87, 
                    enableReportAd = if l_FFlagLuaAppEnableSponsoredReportAd_0 then v63 else nil, 
                    isSponsoredRatingFooterAllowed = if l_FFlagLuaAppSupportAdRatingFooter_0 then v65 else nil, 
                    sponsoredFooterAdLabelText = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v66 else nil, 
                    sponsoredFooterAdLabelFirst = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
                    sponsoredFooterIncludeRatingContent = if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil, 
                    badgeOverride = if l_FFlagLuaAppTwoByOneTileExperimentVariants_0 then v90 else nil
                }), l_GameCollectionItemType_0.GameTile;
            end;
        end;
    end, {
        v76, 
        v30, 
        v42, 
        v31, 
        v32, 
        v27, 
        v28, 
        v29, 
        v40, 
        v34, 
        v35, 
        v39, 
        v36, 
        v38, 
        v37, 
        v41, 
        v75, 
        v43, 
        v44, 
        v45, 
        v46, 
        v50, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v71 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v72 else nil, 
        v47, 
        v48, 
        v49, 
        v51, 
        v52, 
        v53, 
        if l_FFlagLuaAppGameTileWideVideoThumbnail_0 then v54 else nil, 
        v55, 
        v56, 
        v79, 
        v57, 
        v58, 
        v59, 
        v60, 
        v80, 
        if l_FFlagLuaAppEnableWhyThisAdModal_0 then v61 else nil, 
        v62, 
        if l_FFlagLuaAppEnableSponsoredReportAd_0 then v63 else nil, 
        v70, 
        if l_FFlagLuaAppSupportAdRatingFooter_0 then v65 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v66 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v67 else nil, 
        if l_FFlagLuaAppSupportAdRatingFooterExperiment_0 then v68 else nil
    }));
end;