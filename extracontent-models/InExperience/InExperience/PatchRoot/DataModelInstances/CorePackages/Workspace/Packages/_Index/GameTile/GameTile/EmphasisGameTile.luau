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
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
local v34 = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false);
local l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone;
local l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSupportPrimaryMediaContentMetadata;
return function(v37) --[[ Line: 83 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), v17 (copy), l_ApiFetchGameDetails_0 (copy), v3 (copy), l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v13 (copy), v5 (copy), l_BigGameIconReducer_0 (copy), v8 (copy), v34 (copy), l_IsVRAppBuild_0 (copy), v11 (copy), v14 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_GameCollectionItemTypes_0 (copy), l_sponsoredGamesRecordClick_0 (copy), v10 (copy), v12 (copy), v9 (copy), v6 (copy), v7 (copy), v31 (copy), l_ImpressionsTagUtility_0 (copy), v2 (copy), l_UserGameSettings_0 (copy), l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 (copy)
    local v38 = l_useDesignTokens_0();
    local v39 = l_useTokens_0();
    local l_universeId_0 = v37.entry.universeId;
    local v42 = l_useSelector_0(function(v41) --[[ Line: 91 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v41.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 94 ]]
        -- upvalues: l_universeId_0 (copy)
        return v43.GameDetails[l_universeId_0];
    end);
    local v45 = l_useRoactService_0(l_RoactNetworking_0);
    local v46 = l_useDispatch_0();
    v17.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v44 (copy), v46 (copy), l_ApiFetchGameDetails_0 (ref), v45 (copy), l_universeId_0 (copy)
        if v44 then
            return;
        else
            v46(l_ApiFetchGameDetails_0.Fetch(v45, {
                l_universeId_0
            }));
            return;
        end;
    end, {
        v44, 
        l_universeId_0, 
        v45, 
        v46
    });
    local v47 = v3(v42, v37.topicId);
    local v48 = v37.gameTileLayoutType or "Narrow";
    local v49 = true;
    if v48 ~= "Wide" then
        v49 = v48 == "Event";
    end;
    local v50 = (if l_FFlagLuaAppSupportPrimaryMediaContentMetadata_0 and v37.entry.primaryWideImageAssetId then v37.entry.primaryWideImageAssetId else if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v13.getWideImageAssetId(v47) else v47 and v47.primaryMediaAsset and v47.primaryMediaAsset.wideImageAssetId) or v42 and v42.primaryWideAssetId or nil;
    local v51 = v5(v50, v37.entry.placeId, true);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 124 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), l_universeId_0 (copy)
        return v52[l_BigGameIconReducer_0.key][l_universeId_0] and v52[l_BigGameIconReducer_0.key][l_universeId_0].url or "";
    end);
    local v54 = if v49 then v51 else v53;
    local v55 = v8.getImageAspectRatio(v48);
    local v56 = v47 and v47.title or v42 and v42.name or "";
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if v34 then
        v57 = not l_IsVRAppBuild_0() and (v37.useHoverTile and v37.impressionsTag ~= nil or false);
        v58 = v17.useRef(nil);
        v59 = ("%*_%*_%*"):format(v37.impressionsTag or "", v37.index, v48);
        v60 = v11(v58, v59, v57);
    end;
    local v62 = v17.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v34 (ref), v60 (ref), v14 (ref), v37 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_GameCollectionItemTypes_0 (ref), l_universeId_0 (copy), l_sponsoredGamesRecordClick_0 (ref), v45 (copy)
        if v34 and v60 then
            v14.default:reset();
        end;
        local v61 = {
            source = v37.source, 
            index = v37.index, 
            referralSource = v37.referralSource, 
            onPeekViewClosed = v37.onPeekViewClosed, 
            experienceJoinData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then {
                tileType = v37.entry.tileType or l_GameCollectionItemTypes_0.GameCollectionItemType.EmphasisTile, 
                nativeAdData = v37.entry.adId
            } else nil
        };
        v37.navigateToGameDetails(l_universeId_0, v61);
        v37.reportGameDetailOpened(v37.index, l_universeId_0);
        if v37.entry.isSponsored then
            l_sponsoredGamesRecordClick_0(v45, v37.entry.adId);
        end;
    end, {
        l_universeId_0, 
        v37.source, 
        v37.onPeekViewClosed, 
        v37.entry.isSponsored, 
        v37.entry.adId, 
        v37.reportGameDetailOpened, 
        v45, 
        v37.navigateToGameDetails, 
        v37.referralSource, 
        v37.index, 
        if v34 then v60 else nil
    });
    if not v34 then
        v57 = not l_IsVRAppBuild_0() and (v37.useHoverTile and v37.impressionsTag ~= nil or false);
        v58 = v17.useRef(nil);
        v59 = ("%*_%*_%*"):format(v37.impressionsTag or "", v37.index, v48);
        v60 = v11(v58, v59, v57);
    end;
    local v63 = v37.showDescription or false;
    local v64 = v42 and v42.totalUpVotes or 0;
    local v65 = v42 and v42.totalDownVotes or 0;
    local v66 = v44 and v44.creator and v44.creator.hasVerifiedBadge;
    local v67 = v44 and v44.description or "";
    local v68 = v44 and v44.licenseDescription or nil;
    local v69 = v44 and v44.localizedFiatPrice or nil;
    local v70 = v68 or v69;
    local v71 = v37.hideGameStats or v63 or v70 ~= nil;
    local v72 = v42 and v42.creatorName ~= "" and v42.creatorName or v44 and v44.creator and v44.creator.name;
    local v73 = v70 and 2 or 3;
    local v75 = v17.useMemo(function() --[[ Line: 221 ]]
        -- upvalues: v72 (copy), v63 (copy), v73 (copy), v71 (copy), v70 (copy)
        local v74 = 0;
        if v72 and v72 ~= "" then
            v74 = v74 + 1;
        end;
        if v63 then
            v74 = v74 + v73;
        end;
        if not v71 then
            v74 = v74 + 1;
        end;
        if v70 then
            v74 = v74 + 1;
        end;
        return v74;
    end, {
        v72, 
        v63, 
        v71, 
        v70, 
        v73
    });
    local v76 = v37.isContained or false;
    local l_playButtonHeight_0 = v8.getElementSizes(v38, v37.textSizeOffset, 1, v39, true, v75).playButtonHeight;
    local v78 = if v34 then v17.useCallback(function(...) --[[ Line: 255 ]]
        -- upvalues: v60 (ref), v14 (ref), v37 (copy)
        if v60 then
            v14.default:reset();
        end;
        if v37.reportExperienceLaunched then
            v37.reportExperienceLaunched(...);
        end;
    end, {
        v60, 
        v37.reportExperienceLaunched
    }) else nil;
    local v79 = v17.useMemo(function() --[[ Line: 267 ]]
        -- upvalues: v17 (ref), v10 (ref), l_universeId_0 (copy), v37 (copy), v34 (ref), v78 (copy), v62 (copy), v55 (copy), l_playButtonHeight_0 (copy)
        return v17.createElement(v10, {
            universeId = l_universeId_0, 
            referralSource = v37.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = if v34 then v78 else v37.reportExperienceLaunched, 
            openGameDetails = v62, 
            entry = v37.entry, 
            launchExperienceEventContext = v37.launchExperienceEventContext, 
            showButtonText = v55 > 1, 
            horizontalPadding = 0, 
            verticalPadding = 0, 
            height = l_playButtonHeight_0, 
            index = v37.index, 
            isUnifiedGameTileEnabled = true
        });
    end, {
        l_universeId_0, 
        v37.referralSource, 
        if v34 then v78 else v37.reportExperienceLaunched, 
        v62, 
        v37.entry, 
        v37.launchExperienceEventContext, 
        l_playButtonHeight_0, 
        v37.index, 
        v55
    });
    local v80 = v17.useMemo(function() --[[ Line: 300 ]]
        -- upvalues: v17 (ref), v70 (copy), v12 (ref), v9 (ref), v72 (copy), v66 (copy), v6 (ref), v64 (copy), v65 (copy), v37 (copy), v7 (ref), v49 (copy), v71 (copy), v48 (copy), v63 (copy), v67 (copy), v73 (copy), v31 (ref)
        return v17.createElement(v17.Fragment, {}, {
            UIListLayout = v17.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ExtraMetadata = if v70 then v17.createElement(v12, {
                text = v70, 
                LayoutOrder = 1, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }) else nil, 
            CreatorName = v17.createElement(v9, {
                name = v72, 
                hasVerifiedBadge = v66, 
                LayoutOrder = 2
            }), 
            GameStats = v17.createElement(v6, {
                stats = {
                    totalUpVotes = v64, 
                    totalDownVotes = v65, 
                    playerCount = if v37.playerCountStyle == v7.PlayerCountStyleValues.Footer then v37.entry.playerCount else nil
                }, 
                isGridTile = v49, 
                hideGameStats = v71, 
                gameTileLayoutType = v48, 
                LayoutOrder = 3, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }), 
            Description = if v63 then v17.createElement(v12, {
                text = v67, 
                LayoutOrder = 4, 
                linesOfText = v73, 
                useLargerFont = true, 
                isUnifiedGameTile = true, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                ClipsDescendants = true, 
                TextWrapped = v31 and true or nil
            }) else nil
        });
    end, {
        v72, 
        v64, 
        v65, 
        v37.playerCountStyle, 
        v37.entry.playerCount, 
        v49, 
        v71, 
        v48, 
        v63, 
        v67, 
        v70, 
        v66, 
        v73
    });
    local v81, v82 = v17.useState(Vector2.new(0, 0));
    local v84 = v17.useMemo(function() --[[ Line: 369 ]]
        -- upvalues: v8 (ref), v38 (copy), v81 (copy), v48 (copy), v76 (copy), v37 (copy), v75 (copy), v39 (copy)
        local v83 = v8.getTileHeight(v38, v81.X, v48, v76, false, false, v37.textSizeOffset, nil, 1, v75, v39, true);
        return v81.Y - v83;
    end, {
        v38, 
        v81, 
        v48, 
        v76, 
        v37.textSizeOffset, 
        1, 
        v75, 
        v39
    });
    local v85 = v17.useRef(nil);
    v17.useEffect(function() --[[ Line: 400 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v85 (copy), v37 (copy)
        l_ImpressionsTagUtility_0.AddTag(v85, v37.impressionsTag, v37.index);
        return function() --[[ Line: 402 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v85 (ref), v37 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v85, v37.impressionsTag, v37.index);
        end;
    end, {
        v37.impressionsTag, 
        v37.index
    });
    return v17.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v37.layoutOrder, 
        ZIndex = -v37.index
    }, {
        EmphasisTileContainer = v17.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            Size = v37.size, 
            BackgroundTransparency = 1, 
            ref = v85, 
            [v17.Change.AbsoluteSize] = function(v86) --[[ Line: 419 ]]
                -- upvalues: v82 (copy)
                v82(v86.AbsoluteSize);
            end
        }, {
            GameTileView = v17.createElement(v2, {
                forwardRef = v58, 
                selectionOrder = v37.selectionOrder, 
                isDisabled = v37.isDisabled, 
                onActivated = v62, 
                onSelectionGained = v37.onSelectionGained, 
                onSelectionLost = v37.onSelectionLost, 
                image = v54, 
                title = v56, 
                numLinesForTitle = 1, 
                numLinesForMetadata = v75, 
                isHovered = v60, 
                footerMetadata = v80, 
                isUnifiedGameTile = true, 
                imageAspectRatio = v55, 
                isContained = v76, 
                extraFooterContent = if v63 then nil else v79, 
                extraFooterSpace = if v63 then nil else v84, 
                hidePlayButton = true, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion, 
                onTileImageLoaded = if l_FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone_0 then v37.onTileImageLoaded else nil
            })
        })
    });
end;