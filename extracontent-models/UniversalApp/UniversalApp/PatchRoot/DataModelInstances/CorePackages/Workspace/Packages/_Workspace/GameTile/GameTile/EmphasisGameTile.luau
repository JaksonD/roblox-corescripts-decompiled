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
local v11 = require(l_script_FirstAncestor_0.SponsoredGamesRecordClick);
local v12 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v13 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v14 = require(l_script_FirstAncestor_0.ItemLayoutDataParsingUtils);
local v15 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
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
local v30 = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false);
local l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppIgnoreEmptyStringWideThumbnail;
local v32 = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false);
return function(v33) --[[ Line: 72 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), l_GameInfosReducer_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), v17 (copy), l_ApiFetchGameDetails_0 (copy), v3 (copy), l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 (copy), v14 (copy), v5 (copy), l_BigGameIconReducer_0 (copy), v8 (copy), v32 (copy), l_IsVRAppBuild_0 (copy), v12 (copy), v15 (copy), v11 (copy), v10 (copy), v13 (copy), v9 (copy), v6 (copy), v7 (copy), v30 (copy), l_ImpressionsTagUtility_0 (copy), v2 (copy), l_UserGameSettings_0 (copy)
    local v34 = l_useDesignTokens_0();
    local v35 = l_useTokens_0();
    local l_universeId_0 = v33.entry.universeId;
    local v38 = l_useSelector_0(function(v37) --[[ Line: 80 ]]
        -- upvalues: l_GameInfosReducer_0 (ref), l_universeId_0 (copy)
        return v37.Personalization[l_GameInfosReducer_0.key][l_universeId_0];
    end);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 83 ]]
        -- upvalues: l_universeId_0 (copy)
        return v39.GameDetails[l_universeId_0];
    end);
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = l_useDispatch_0();
    v17.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v40 (copy), v42 (copy), l_ApiFetchGameDetails_0 (ref), v41 (copy), l_universeId_0 (copy)
        if v40 then
            return;
        else
            v42(l_ApiFetchGameDetails_0.Fetch(v41, {
                l_universeId_0
            }));
            return;
        end;
    end, {
        v40, 
        l_universeId_0, 
        v41, 
        v42
    });
    local v43 = v3(v38, v33.topicId);
    local v44 = v33.gameTileLayoutType or "Narrow";
    local v45 = true;
    if v44 ~= "Wide" then
        v45 = v44 == "Event";
    end;
    local v46 = (if l_FFlagLuaAppIgnoreEmptyStringWideThumbnail_0 then v14.getWideImageAssetId(v43) else v43 and v43.primaryMediaAsset and v43.primaryMediaAsset.wideImageAssetId) or v38 and v38.primaryWideAssetId or nil;
    local v47 = v5(v46, v33.entry.placeId, true);
    local v49 = l_useSelector_0(function(v48) --[[ Line: 110 ]]
        -- upvalues: l_BigGameIconReducer_0 (ref), l_universeId_0 (copy)
        return v48[l_BigGameIconReducer_0.key][l_universeId_0] and v48[l_BigGameIconReducer_0.key][l_universeId_0].url or "";
    end);
    local v50 = if v45 then v47 else v49;
    local v51 = v8.getImageAspectRatio(v44);
    local v52 = v43 and v43.title or v38 and v38.name or "";
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if v32 then
        v53 = not l_IsVRAppBuild_0() and (v33.useHoverTile and v33.impressionsTag ~= nil or false);
        v54 = v17.useRef(nil);
        v55 = ("%*_%*_%*"):format(v33.impressionsTag or "", v33.index, v44);
        v56 = v12(v54, v55, v53);
    end;
    local v58 = v17.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v32 (ref), v56 (ref), v15 (ref), v33 (copy), l_universeId_0 (copy), v11 (ref), v41 (copy)
        if v32 and v56 then
            v15.default:reset();
        end;
        local v57 = {
            source = v33.source, 
            index = v33.index, 
            referralSource = v33.referralSource, 
            onPeekViewClosed = v33.onPeekViewClosed
        };
        v33.navigateToGameDetails(l_universeId_0, v57);
        v33.reportGameDetailOpened(v33.index, l_universeId_0);
        if v33.entry.isSponsored then
            v11(v41, v33.entry.adId);
        end;
    end, {
        l_universeId_0, 
        v33.source, 
        v33.onPeekViewClosed, 
        v33.entry.isSponsored, 
        v33.entry.adId, 
        v33.reportGameDetailOpened, 
        v41, 
        v33.navigateToGameDetails, 
        v33.referralSource, 
        v33.index, 
        if v32 then v56 else nil
    });
    if not v32 then
        v53 = not l_IsVRAppBuild_0() and (v33.useHoverTile and v33.impressionsTag ~= nil or false);
        v54 = v17.useRef(nil);
        v55 = ("%*_%*_%*"):format(v33.impressionsTag or "", v33.index, v44);
        v56 = v12(v54, v55, v53);
    end;
    local v59 = v33.showDescription or false;
    local v60 = v38 and v38.totalUpVotes or 0;
    local v61 = v38 and v38.totalDownVotes or 0;
    local v62 = v40 and v40.creator and v40.creator.hasVerifiedBadge;
    local v63 = v40 and v40.description or "";
    local v64 = v40 and v40.licenseDescription or nil;
    local v65 = v40 and v40.localizedFiatPrice or nil;
    local v66 = v64 or v65;
    local v67 = v33.hideGameStats or v59 or v66 ~= nil;
    local v68 = v38 and v38.creatorName ~= "" and v38.creatorName or v40 and v40.creator and v40.creator.name;
    local v69 = v66 and 2 or 3;
    local v71 = v17.useMemo(function() --[[ Line: 201 ]]
        -- upvalues: v68 (copy), v59 (copy), v69 (copy), v67 (copy), v66 (copy)
        local v70 = 0;
        if v68 and v68 ~= "" then
            v70 = v70 + 1;
        end;
        if v59 then
            v70 = v70 + v69;
        end;
        if not v67 then
            v70 = v70 + 1;
        end;
        if v66 then
            v70 = v70 + 1;
        end;
        return v70;
    end, {
        v68, 
        v59, 
        v67, 
        v66, 
        v69
    });
    local v72 = v33.isContained or false;
    local l_playButtonHeight_0 = v8.getElementSizes(v34, v33.textSizeOffset, 1, v35, true, v71).playButtonHeight;
    local v74 = if v32 then v17.useCallback(function(...) --[[ Line: 235 ]]
        -- upvalues: v56 (ref), v15 (ref), v33 (copy)
        if v56 then
            v15.default:reset();
        end;
        if v33.reportExperienceLaunched then
            v33.reportExperienceLaunched(...);
        end;
    end, {
        v56, 
        v33.reportExperienceLaunched
    }) else nil;
    local v75 = v17.useMemo(function() --[[ Line: 247 ]]
        -- upvalues: v17 (ref), v10 (ref), l_universeId_0 (copy), v33 (copy), v32 (ref), v74 (copy), v58 (copy), v51 (copy), l_playButtonHeight_0 (copy)
        return v17.createElement(v10, {
            universeId = l_universeId_0, 
            referralSource = v33.referralSource, 
            launchSource = "FeaturedSearchTile", 
            reportExperienceLaunched = if v32 then v74 else v33.reportExperienceLaunched, 
            openGameDetails = v58, 
            entry = v33.entry, 
            launchExperienceEventContext = v33.launchExperienceEventContext, 
            showButtonText = v51 > 1, 
            horizontalPadding = 0, 
            verticalPadding = 0, 
            height = l_playButtonHeight_0, 
            index = v33.index, 
            isUnifiedGameTileEnabled = true
        });
    end, {
        l_universeId_0, 
        v33.referralSource, 
        if v32 then v74 else v33.reportExperienceLaunched, 
        v58, 
        v33.entry, 
        v33.launchExperienceEventContext, 
        l_playButtonHeight_0, 
        v33.index, 
        v51
    });
    local v76 = v17.useMemo(function() --[[ Line: 280 ]]
        -- upvalues: v17 (ref), v66 (copy), v13 (ref), v9 (ref), v68 (copy), v62 (copy), v6 (ref), v60 (copy), v61 (copy), v33 (copy), v7 (ref), v45 (copy), v67 (copy), v44 (copy), v59 (copy), v63 (copy), v69 (copy), v30 (ref)
        return v17.createElement(v17.Fragment, {}, {
            UIListLayout = v17.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ExtraMetadata = if v66 then v17.createElement(v13, {
                text = v66, 
                LayoutOrder = 1, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }) else nil, 
            CreatorName = v17.createElement(v9, {
                name = v68, 
                hasVerifiedBadge = v62, 
                LayoutOrder = 2
            }), 
            GameStats = v17.createElement(v6, {
                stats = {
                    totalUpVotes = v60, 
                    totalDownVotes = v61, 
                    playerCount = if v33.playerCountStyle == v7.PlayerCountStyleValues.Footer then v33.entry.playerCount else nil
                }, 
                isGridTile = v45, 
                hideGameStats = v67, 
                gameTileLayoutType = v44, 
                LayoutOrder = 3, 
                useLargerFont = true, 
                isUnifiedGameTile = true
            }), 
            Description = if v59 then v17.createElement(v13, {
                text = v63, 
                LayoutOrder = 4, 
                linesOfText = v69, 
                useLargerFont = true, 
                isUnifiedGameTile = true, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                ClipsDescendants = true, 
                TextWrapped = v30 and true or nil
            }) else nil
        });
    end, {
        v68, 
        v60, 
        v61, 
        v33.playerCountStyle, 
        v33.entry.playerCount, 
        v45, 
        v67, 
        v44, 
        v59, 
        v63, 
        v66, 
        v62, 
        v69
    });
    local v77, v78 = v17.useState(Vector2.new(0, 0));
    local v80 = v17.useMemo(function() --[[ Line: 349 ]]
        -- upvalues: v8 (ref), v34 (copy), v77 (copy), v44 (copy), v72 (copy), v33 (copy), v71 (copy), v35 (copy)
        local v79 = v8.getTileHeight(v34, v77.X, v44, v72, false, false, v33.textSizeOffset, nil, 1, v71, v35, true);
        return v77.Y - v79;
    end, {
        v34, 
        v77, 
        v44, 
        v72, 
        v33.textSizeOffset, 
        1, 
        v71, 
        v35
    });
    local v81 = v17.useRef(nil);
    v17.useEffect(function() --[[ Line: 380 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v81 (copy), v33 (copy)
        l_ImpressionsTagUtility_0.AddTag(v81, v33.impressionsTag, v33.index);
        return function() --[[ Line: 382 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v81 (ref), v33 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v81, v33.impressionsTag, v33.index);
        end;
    end, {
        v33.impressionsTag, 
        v33.index
    });
    return v17.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v33.layoutOrder, 
        ZIndex = -v33.index
    }, {
        EmphasisTileContainer = v17.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0), 
            Position = UDim2.fromScale(0, 0), 
            Size = v33.size, 
            BackgroundTransparency = 1, 
            ref = v81, 
            [v17.Change.AbsoluteSize] = function(v82) --[[ Line: 399 ]]
                -- upvalues: v78 (copy)
                v78(v82.AbsoluteSize);
            end
        }, {
            GameTileView = v17.createElement(v2, {
                forwardRef = v54, 
                selectionOrder = v33.selectionOrder, 
                isDisabled = v33.isDisabled, 
                onActivated = v58, 
                onSelectionGained = v33.onSelectionGained, 
                onSelectionLost = v33.onSelectionLost, 
                image = v50, 
                title = v52, 
                numLinesForTitle = 1, 
                numLinesForMetadata = v71, 
                isHovered = v56, 
                footerMetadata = v76, 
                isUnifiedGameTile = true, 
                imageAspectRatio = v51, 
                isContained = v72, 
                extraFooterContent = if v59 then nil else v75, 
                extraFooterSpace = if v59 then nil else v80, 
                hidePlayButton = true, 
                reducedMotion = l_UserGameSettings_0.ReducedMotion
            })
        })
    });
end;