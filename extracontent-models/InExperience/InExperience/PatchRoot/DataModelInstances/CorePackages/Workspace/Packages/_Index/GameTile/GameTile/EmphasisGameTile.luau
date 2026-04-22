local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_script_FirstAncestor_0.GameTileView);
local v3 = require(l_script_FirstAncestor_0.getGameTileLayoutData);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v5 = require(l_script_FirstAncestor_0.formatExperienceThumbnail);
local v6 = require(l_script_FirstAncestor_0.Footer.GameStats);
local v7 = require(l_script_FirstAncestor_0.GameTileConstants);
local v8 = require(l_script_FirstAncestor_0.GameTileViewConfig);
local v9 = require(l_script_FirstAncestor_0.Footer.CreatorNameMetadata);
local v10 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local v11 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v12 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v13 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local v14 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GameCollectionItemTypes_0 = require(l_Parent_0.DiscoveryTypes).GameCollectionItemTypes;
local v17 = require(l_Parent_0.React);
local v18 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v18.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v18.Hooks.RoactRodux.useDispatch;
local l_GameInfosReducer_0 = require(l_Parent_0.GameInfosRodux).GameInfosReducer;
local l_BigGameIconReducer_0 = require(l_Parent_0.GameIconRodux).BigGameIcons.BigGameIconReducer;
local l_ApiFetchGameDetails_0 = require(l_Parent_0.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_sponsoredGamesRecordClick_0 = require(l_Parent_0.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick;
local v31 = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false);
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local v33 = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false);
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
return function(v36) --[[ Line: 81 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), v17 (copy), l_ApiFetchGameDetails_0 (copy), v3 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), v13 (copy), v5 (copy), l_BigGameIconReducer_0 (copy), v8 (copy), v33 (copy), l_IsVRAppBuild_0 (copy), v11 (copy), v14 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_sponsoredGamesRecordClick_0 (copy), v10 (copy), v12 (copy), v9 (copy), v6 (copy), v7 (copy), v31 (copy), l_ImpressionsTagUtility_0 (copy), v2 (copy), l_UserGameSettings_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local v37 = l_useDesignTokens_0();
    local v38 = l_useTokens_0();
    local l_universeId_0 = v36.entry.universeId;
    local v41 = l_useSelector_0(function(v40) --[[ Line: 89 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v40.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v43 = l_useSelector_0(function(v42) --[[ Line: 92 ]]
        -- upvalues: l_universeId_0 (copy)
        return v42.GameDetails[l_universeId_0];
    end);
    local v44 = l_useRoactService_0(l_RoactNetworking_0);
    local v45 = l_useDispatch_0();
    v17.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v43 (copy), v45 (copy), l_ApiFetchGameDetails_0 (ref), v44 (copy), l_universeId_0 (copy)
        if v43 then
            return;
        else
            v45(l_ApiFetchGameDetails_0.Fetch(v44, {
                l_universeId_0
            }));
            return;
        end;
    end, {
        v43, 
        l_universeId_0, 
        v44, 
        v45
    });
    local v46 = v3(v41, v36.topicId);
    local v47 = v36.gameTileLayoutType or "Narrow";
    local v48 = true;
    if v47 ~= "Wide" then
        v48 = v47 == "Event";
    end;
    local v49 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v36.entry.primaryWideImageAssetId then v36.entry.primaryWideImageAssetId else v13.getWideImageAssetId(v46)) or v41 and v41.primaryWideAssetId or nil;
    local v50 = v5(v49, v36.entry.placeId, true);
    local v52 = l_useSelector_0(function(v51) --[[ Line: 120 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), l_universeId_0 (copy)
        return v51[l_BigGameIconReducer_0.key][l_universeId_0] and v51[l_BigGameIconReducer_0.key][l_universeId_0].url or "";
    end);
    local v53 = if v48 then v50 else v52;
    local v54 = v8.getImageAspectRatio(v47);
    local v55 = v46 and v46.title or v41 and v41.name or "";
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if v33 then
        v56 = not l_IsVRAppBuild_0() and (v36.useHoverTile and v36.impressionsTag ~= nil or false);
        v57 = v17.useRef(nil);
        v58 = ("%*_%*_%*"):format(v36.impressionsTag or "", v36.index, v47);
        v59 = v11(v57, v58, v56);
    end;
    local v61 = v17.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v33 (ref), v59 (ref), v14 (ref), v36 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_universeId_0 (copy), l_sponsoredGamesRecordClick_0 (ref), v44 (copy)
        if v33 and v59 then
            v14.default:reset();
        end;
        local v60 = {
            source = v36.source, 
            index = v36.index, 
            referralSource = v36.referralSource, 
            onPeekViewClosed = v36.onPeekViewClosed, 
            experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                tileType = v36.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile, 
                nativeAdData = v36.entry.adId
            } else nil
        };
        v36.navigateToGameDetails(l_universeId_0, v60);
        v36.reportGameDetailOpened(v36.index, l_universeId_0);
        if v36.entry.isSponsored then
            l_sponsoredGamesRecordClick_0(v44, v36.entry.adId);
        end;
    end, {
        l_universeId_0, 
        v36.source, 
        v36.onPeekViewClosed, 
        v36.entry.isSponsored, 
        v36.entry.adId, 
        v36.reportGameDetailOpened, 
        v44, 
        v36.navigateToGameDetails, 
        v36.referralSource, 
        v36.index, 
        if v33 then v59 else nil
    });
    if not v33 then
        v56 = not l_IsVRAppBuild_0() and (v36.useHoverTile and v36.impressionsTag ~= nil or false);
        v57 = v17.useRef(nil);
        v58 = ("%*_%*_%*"):format(v36.impressionsTag or "", v36.index, v47);
        v59 = v11(v57, v58, v56);
    end;
    local v62 = v36.showDescription or false;
    local v63 = v41 and v41.totalUpVotes or 0;
    local v64 = v41 and v41.totalDownVotes or 0;
    local v65 = v43 and v43.creator and v43.creator.hasVerifiedBadge;
    local v66 = v43 and v43.description or "";
    local v67 = v43 and v43.licenseDescription or nil;
    local v68 = v43 and v43.localizedFiatPrice or nil;
    local v69 = v67 or v68;
    local v70 = v36.hideGameStats or v62 or v69 ~= nil;
    local v71 = v41 and v41.creatorName ~= "" and v41.creatorName or v43 and v43.creator and v43.creator.name;
    local v72 = v69 and 2 or 3;
    local v74 = v17.useMemo(function() --[[ Line: 217 ]]
        -- upvalues: v71 (copy), v62 (copy), v72 (copy), v70 (copy), v69 (copy)
        local v73 = 0;
        if v71 and v71 ~= "" then
            v73 = v73 + 1;
        end;
        if v62 then
            v73 = v73 + v72;
        end;
        if not v70 then
            v73 = v73 + 1;
        end;
        if v69 then
            v73 = v73 + 1;
        end;
        return v73;
    end, {
        v71, 
        v62, 
        v70, 
        v69, 
        v72
    });
    local v75 = v36.isContained or false;
    local l_playButtonHeight_0 = v8.getElementSizes(v37, v36.textSizeOffset, 1, v38, true, v74).playButtonHeight;
    local v77 = if v33 then v17.useCallback(function(...) --[[ Line: 251 ]]
        -- upvalues: v59 (ref), v14 (ref), v36 (copy)
        if v59 then
            v14.default:reset();
        end;
        if v36.reportExperienceLaunched then
            v36.reportExperienceLaunched(...);
        end;
    end, {
        v59, 
        v36.reportExperienceLaunched
    }) else nil;
    local v78 = v17.useMemo(function() --[[ Line: 263 ]]
        -- upvalues: v17 (ref), v10 (ref), l_universeId_0 (copy), v36 (copy), v33 (ref), v77 (copy), v61 (copy), v54 (copy), l_playButtonHeight_0 (copy)
        return v17.createElement(v10, {
            universeId = l_universeId_0, 
            referralSource = v36.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = if v33 then v77 else v36.reportExperienceLaunched, 
            openGameDetails = v61, 
            entry = v36.entry, 
            launchExperienceEventContext = v36.launchExperienceEventContext, 
            showButtonText = v54 > 1, 
            horizontalPadding = 0, 
            verticalPadding = 0, 
            height = l_playButtonHeight_0, 
            index = v36.index, 
            isUnifiedGameTileEnabled = true
        });
    end, {
        l_universeId_0, 
        v36.referralSource, 
        if v33 then v77 else v36.reportExperienceLaunched, 
        v61, 
        v36.entry, 
        v36.launchExperienceEventContext, 
        l_playButtonHeight_0, 
        v36.index, 
        v54
    });
    local v79 = v17.useMemo(function() --[[ Line: 296 ]]
        -- upvalues: v17 (ref), v69 (copy), v12 (ref), v9 (ref), v71 (copy), v65 (copy), v6 (ref), v63 (copy), v64 (copy), v36 (copy), v7 (ref), v48 (copy), v70 (copy), v47 (copy), v62 (copy), v66 (copy), v72 (copy), v31 (ref)
        return v17.createElement(v17.Fragment, {}, {
            UIListLayout = v17.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ExtraMetadata = if v69 then v17.createElement(v12, {
                text = v69, 
                LayoutOrder = 1, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }) else nil, 
            CreatorName = v17.createElement(v9, {
                name = v71, 
                hasVerifiedBadge = v65, 
                LayoutOrder = 2
            }), 
            GameStats = v17.createElement(v6, {
                stats = {
                    totalUpVotes = v63, 
                    totalDownVotes = v64, 
                    playerCount = if v36.playerCountStyle == v7.PlayerCountStyleValues.Footer then v36.entry.playerCount else nil
                }, 
                isGridTile = v48, 
                hideGameStats = v70, 
                gameTileLayoutType = v47, 
                LayoutOrder = 3, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }), 
            Description = if v62 then v17.createElement(v12, {
                text = v66, 
                LayoutOrder = 4, 
                linesOfText = v72, 
                useLargerFont = true, 
                isUnifiedGameTile = true, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                ClipsDescendants = true, 
                TextWrapped = v31 and true or nil
            }) else nil
        });
    end, {
        v71, 
        v63, 
        v64, 
        v36.playerCountStyle, 
        v36.entry.playerCount, 
        v48, 
        v70, 
        v47, 
        v62, 
        v66, 
        v69, 
        v65, 
        v72
    });
    local v80, v81 = v17.useState(Vector2.new(0, 0));
    local v83 = v17.useMemo(function() --[[ Line: 365 ]]
        -- upvalues: v8 (ref), v37 (copy), v80 (copy), v47 (copy), v75 (copy), v36 (copy), v74 (copy), v38 (copy)
        local v82 = v8.getTileHeight(v37, v80.X, v47, v75, false, false, v36.textSizeOffset, nil, 1, v74, v38, true);
        return v80.Y - v82;
    end, {
        v37, 
        v80, 
        v47, 
        v75, 
        v36.textSizeOffset, 
        1, 
        v74, 
        v38
    });
    local v84 = v17.useRef(nil);
    v17.useEffect(function() --[[ Line: 396 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v84 (copy), v36 (copy)
        l_ImpressionsTagUtility_0.AddTag(v84, v36.impressionsTag, v36.index);
        return function() --[[ Line: 398 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v84 (ref), v36 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v84, v36.impressionsTag, v36.index);
        end;
    end, {
        v36.impressionsTag, 
        v36.index
    });
    return v17.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v36.layoutOrder, 
        ZIndex = -v36.index
    }, {
        EmphasisTileContainer = v17.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            Size = v36.size, 
            BackgroundTransparency = 1, 
            ref = v84, 
            [v17.Change.AbsoluteSize] = function(v85) --[[ Line: 415 ]]
                -- upvalues: v81 (copy)
                v81(v85.AbsoluteSize);
            end
        }, {
            GameTileView = v17.createElement(v2, {
                forwardRef = v57, 
                selectionOrder = v36.selectionOrder, 
                isDisabled = v36.isDisabled, 
                onActivated = v61, 
                onSelectionGained = v36.onSelectionGained, 
                onSelectionLost = v36.onSelectionLost, 
                image = v53, 
                title = v55, 
                numLinesForTitle = 1, 
                numLinesForMetadata = v74, 
                isHovered = v59, 
                footerMetadata = v79, 
                isUnifiedGameTile = true, 
                imageAspectRatio = v54, 
                isContained = v75, 
                extraFooterContent = if v62 then nil else v78, 
                extraFooterSpace = if v62 then nil else v83, 
                hidePlayButton = true, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion, 
                onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v36.onTileImageLoaded else nil
            })
        })
    });
end;