local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_IXPService_0 = game:GetService("IXPService");
local v4 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_CollectionCarousel_0 = require(l_Parent_0.CollectionViews).CollectionCarousel;
local l_CollectionHeader_0 = require(l_Parent_0.CollectionViews).CollectionHeader;
local v10 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v14 = require(l_script_FirstAncestor_0.Contexts.useProfileAnalyticsContext);
local v15 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v16 = require(l_script_FirstAncestor_0.Networking.NetworkingGames);
local v17 = require(l_script_FirstAncestor_0.Hooks.useSendItemImpressions);
local v18 = require(l_script_FirstAncestor_0.Hooks.formatExperienceDetailsForImpressions);
local v19 = require(l_script_FirstAncestor_0.Hooks.useProfileJsonComponent);
local v20 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_Parent_0.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_SetGameVotes_0 = require(l_Parent_0.GameVotesRodux).GameVotes.SetGameVotes;
local l_Url_0 = require(l_Parent_0.Http).Url;
local v29 = require(l_script_FirstAncestor_0.Networking.myRoduxNetworkingImpl);
local v30 = require(l_Parent_0.GameTile);
local l_GameTileView_0 = v30.GameTileView;
local l_GameTileViewConfig_0 = v30.GameTileViewConfig;
local l_GameStats_0 = v30.GameStats;
local l_formatExperienceThumbnail_0 = v30.formatExperienceThumbnail;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_ContentType_0 = require(l_Parent_0.UnifiedLogging).ContentType;
local v38 = game:DefineFastFlag("ExperiencesOnProfileIxpEnabled", false);
local v39 = game:DefineFastString("ExperiencesOnProfileIxpLayer", "");
local v40 = {};
local function v47(v41, v42) --[[ Line: 68 ]] --[[ Name: chunkList ]]
    local v43 = {};
    local v44 = 1;
    while v44 <= #v41 do
        local v45 = {};
        for v46 = v44, math.min(v44 + v42 - 1, #v41) do
            table.insert(v45, v41[v46]);
        end;
        table.insert(v43, v45);
        v44 = v44 + v42;
    end;
    return v43;
end;
local function _(v48, v49) --[[ Line: 82 ]] --[[ Name: formatVotePercent ]]
    local v50 = math.max(0, v48 or 0);
    local v51 = v50 + math.max(0, v49 or 0);
    if v51 == 0 then
        return nil;
    else
        return tostring((math.floor(v50 / v51 * 100 + 0.5))) .. "%";
    end;
end;
local function _(v53, v54) --[[ Line: 96 ]] --[[ Name: getGameVotes ]]
    -- upvalues: l_Url_0 (copy)
    return v53(string.format("%sv1/games/%s/votes", l_Url_0.GAME_URL, v54), "GET");
end;
return v2.memo(function(v56) --[[ Line: 105 ]] --[[ Name: ExperiencesWideCarousel ]]
    -- upvalues: v10 (copy), l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useLocalization_0 (copy), v12 (copy), v2 (copy), l_useDispatch_0 (copy), v13 (copy), v14 (copy), l_script_FirstAncestor_0 (copy), l_Parent_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), v15 (copy), v19 (copy), v20 (copy), v40 (copy), v47 (copy), v16 (copy), v29 (copy), l_Url_0 (copy), l_SetGameVotes_0 (copy), l_dependencyArray_0 (copy), v18 (copy), v17 (copy), l_ContentType_0 (copy), l_formatExperienceThumbnail_0 (copy), l_GameStats_0 (copy), l_GameTileView_0 (copy), l_GameTileViewConfig_0 (copy), l_AppPage_0 (copy), l_OpenGameDetails_0 (copy), v38 (copy), l_IXPService_0 (copy), v39 (copy), l_CollectionHeader_0 (copy), l_CollectionCarousel_0 (copy)
    local v57, v58 = v10();
    local v59 = l_useDesignTokens_0();
    local v60 = l_useTextSizeOffset_0();
    local v61 = l_useLocalization_0({
        title = v12.Experiences
    });
    local v62, v63 = v2.useState(0);
    local v64, v65 = v2.useState(0);
    local v66, v67 = v2.useState(0);
    local v68 = l_useDispatch_0();
    local v69 = v13();
    local v70 = v69 and v69.profileId;
    local v71 = v14();
    local v72 = require(l_script_FirstAncestor_0.Analytics.EventNames);
    local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
    local v74 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v75 = l_useNavigation_0();
    local v77 = l_useSelector_0(function(v76) --[[ Line: 126 ]]
        -- upvalues: v15 (ref)
        return v15(v76, "GameVotes") or {};
    end);
    local v78 = (v19(v20.Components.Experiences) or {}).experiences or {};
    local v82 = v2.useMemo(function() --[[ Line: 132 ]]
        -- upvalues: v78 (copy)
        local v79 = {};
        for _, v81 in ipairs(v78) do
            if v81.universeId ~= nil then
                table.insert(v79, (tostring(v81.universeId)));
            end;
        end;
        return v79;
    end, {
        v78
    });
    v2.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v82 (copy)
        if #v82 == 0 then
            return;
        else
            return;
        end;
    end, {
        v82
    });
    local v84 = l_useSelector_0(function(v83) --[[ Line: 148 ]]
        -- upvalues: v15 (ref)
        return v15(v83, "ProfilePlatform.Games.byGameId") or {};
    end);
    local v85 = v2.useRef({
        key = "", 
        at = 0
    });
    v2.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: v82 (copy), v85 (copy), v40 (ref), v84 (copy), v47 (ref), v68 (copy), v16 (ref), v77 (copy), v29 (ref), l_Url_0 (ref), l_SetGameVotes_0 (ref)
        if #v82 == 0 then
            return;
        else
            local v86 = os.clock();
            local v87 = table.concat(v82, ",");
            local l_current_0 = v85.current;
            if v87 == l_current_0.key and v86 - l_current_0.at < 2 then
                return;
            else
                v85.current = {
                    key = v87, 
                    at = v86
                };
                local v89 = {};
                for _, v91 in v82 do
                    if not v40[v91] and v84[v91] == nil then
                        table.insert(v89, v91);
                    end;
                end;
                for _, v93 in v47(v89, 10) do
                    v68(v16.GetExperiencesDetails.API(v93)):catch(function() --[[ Line: 183 ]]
                        -- upvalues: v93 (copy), v40 (ref)
                        for _, v95 in v93 do
                            v40[v95] = true;
                        end;
                    end);
                end;
                for v96 = 1, math.min(6, #v82) do
                    local v97 = v82[v96];
                    if v77[v97] == nil then
                        v29(string.format("%sv1/games/%s/votes", l_Url_0.GAME_URL, v97), "GET"):andThen(function(v98) --[[ Line: 196 ]]
                            -- upvalues: v68 (ref), l_SetGameVotes_0 (ref), v97 (copy)
                            local l_responseBody_0 = v98.responseBody;
                            if l_responseBody_0 ~= nil and l_responseBody_0.upVotes ~= nil and l_responseBody_0.downVotes ~= nil then
                                v68(l_SetGameVotes_0(v97, l_responseBody_0.upVotes < 0 and 0 or l_responseBody_0.upVotes, l_responseBody_0.downVotes < 0 and 0 or l_responseBody_0.downVotes));
                            end;
                        end):catch(function() --[[ Line: 208 ]]

                        end);
                    end;
                end;
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v82, 
        v84, 
        v77
    } else l_dependencyArray_0(v82, v84, v77));
    local v104 = v2.useMemo(function() --[[ Line: 218 ]]
        -- upvalues: v82 (copy), v84 (copy)
        local v100 = {};
        for _, v102 in v82 do
            local v103 = v84[v102];
            if v103 then
                table.insert(v100, v103);
            end;
        end;
        return v100;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v82, 
        v84
    } else l_dependencyArray_0(v82, v84));
    local v105 = v2.useMemo(function() --[[ Line: 234 ]]
        -- upvalues: v18 (ref), v104 (copy)
        return v18(v104);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v104
    } else l_dependencyArray_0(v104));
    local v106 = v17(v105, 2, l_ContentType_0.Game, 1, "ExperiencesWideCarousel");
    local v114 = v2.useCallback(function(v107, v108, v109, v110, v111, v112, v113) --[[ Line: 249 ]]
        -- upvalues: v71 (copy), v72 (copy), v70 (copy)
        v71.fireAnalyticsEvent(v72.ExperienceOpened, {
            profileUserId = v70, 
            experienceId = v107, 
            position = v108, 
            row = 1, 
            ccu = v109 or 0, 
            votePercentage = v110, 
            upVotes = v111 or 0, 
            downVotes = v112 or 0, 
            visits = v113 or 0, 
            section = "Experiences", 
            layoutType = "Wide"
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v71, 
        v70
    } else l_dependencyArray_0(v71, v70));
    local v128 = v2.useCallback(function(v115, v116, v117) --[[ Line: 281 ]]
        -- upvalues: l_formatExperienceThumbnail_0 (ref), v2 (ref), l_GameStats_0 (ref), v77 (copy), l_GameTileView_0 (ref), l_GameTileViewConfig_0 (ref), v114 (copy), v104 (copy), v74 (copy), l_AppPage_0 (ref), v56 (copy), v68 (copy), l_OpenGameDetails_0 (ref), v75 (copy)
        local v118 = l_formatExperienceThumbnail_0(nil, v115.rootPlaceId);
        local v119 = v2.createElement(l_GameStats_0, {
            stats = {
                playerCount = v115.playing or 0, 
                totalUpVotes = v77[v115.experienceId] and v77[v115.experienceId].upVotes or 0, 
                totalDownVotes = v77[v115.experienceId] and v77[v115.experienceId].downVotes or 0
            }, 
            isGridTile = true, 
            gameTileLayoutType = "Wide"
        });
        return v2.createElement("Frame", {
            Size = v117, 
            BackgroundTransparency = 1, 
            LayoutOrder = v116
        }, {
            Tile = v2.createElement(l_GameTileView_0, {
                Size = UDim2.fromScale(1, 1), 
                image = v118, 
                title = v115.name, 
                imageAspectRatio = l_GameTileViewConfig_0.getImageAspectRatio("Wide"), 
                footerMetadata = v119, 
                isHovered = false, 
                onActivated = function() --[[ Line: 311 ]] --[[ Name: onActivated ]]
                    -- upvalues: v77 (ref), v115 (copy), v114 (ref), v116 (copy), v104 (ref), v74 (ref), l_AppPage_0 (ref), v56 (ref), v68 (ref), l_OpenGameDetails_0 (ref), v75 (ref)
                    local v120 = false;
                    local v121 = v77[v115.experienceId];
                    local v122;
                    if v121 then
                        local l_upVotes_0 = v121.upVotes;
                        local l_downVotes_0 = v121.downVotes;
                        local v125 = math.max(0, l_upVotes_0 or 0);
                        local v126 = v125 + math.max(0, l_downVotes_0 or 0);
                        v122 = if v126 == 0 then nil else tostring((math.floor(v125 / v126 * 100 + 0.5))) .. "%";
                        v120 = v122;
                    end;
                    if not v120 then
                        v122 = nil;
                    end;
                    v120 = false;
                    v114(v115.experienceId, v116, v115.playing, v122, v121 and v121.upVotes or 0, v121 and v121.downVotes or 0, 0);
                    local v127 = #v104;
                    v74.reportOpenGameDetailFromProfile(v115.rootPlaceId, v116, v127, v115.experienceId, l_AppPage_0.ProfilePlatform, v56.layoutOrder, 1, nil);
                    v68(l_OpenGameDetails_0(v115.experienceId, v75, {
                        mountAsFullView = false, 
                        showBackButton = true
                    }));
                end, 
                hidePlayButton = true, 
                isContained = false
            })
        }), "EXP_Tile";
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v114, 
        v62, 
        v57, 
        v68, 
        v75, 
        v74, 
        v56.layoutOrder, 
        v104, 
        v77
    } else l_dependencyArray_0(v114, v62, v57, v68, v75, v74, v56.layoutOrder, v104, v77));
    local v130 = v2.useCallback(function(v129) --[[ Line: 378 ]]
        -- upvalues: v66 (copy), v67 (copy), l_GameTileViewConfig_0 (ref), v59 (copy), v60 (copy)
        if v66 ~= v129 then
            v67(v129);
        end;
        return (l_GameTileViewConfig_0.getTileHeight(v59, v129, "Wide", false, false, false, v60, nil, nil, nil, nil, nil));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v59, 
        v60, 
        v66
    } else l_dependencyArray_0(v59, v60, v66));
    local v133 = v2.useCallback(function(v131, v132) --[[ Line: 404 ]]
        return (math.max(1, (math.max(0, v131 - v132 * 2) - 12) / 2));
    end, {});
    v2.useEffect(function() --[[ Line: 410 ]]
        -- upvalues: v62 (copy), v133 (copy), v57 (copy), v104 (copy), v65 (copy)
        if v62 <= 0 then
            return;
        else
            local v134 = v133(v62, v57);
            local v135 = 0;
            if #v104 > 2 then
                v135 = math.clamp(60 / (v134 + 12), 0, 0.5);
            end;
            v65(v135);
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v62, 
        v57, 
        v104, 
        v133
    } else l_dependencyArray_0(v62, v57, v104, v133));
    v2.useEffect(function() --[[ Line: 430 ]]
        -- upvalues: v104 (copy), v106 (copy)
        if #v104 > 0 then
            local v136 = {};
            for v137 = 1, math.min(2, #v104) do
                table.insert(v136, v137);
            end;
            v106(v136);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v104, 
        v106
    } else l_dependencyArray_0(v104, v106));
    v2.useEffect(function() --[[ Line: 446 ]]
        -- upvalues: v104 (copy), v38 (ref), l_IXPService_0 (ref), v39 (ref)
        if #v104 > 0 and v38 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v39);
        end;
    end, {
        v104
    });
    if #v104 == 0 then
        return nil;
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v56.layoutOrder, 
            [v2.Change.AbsoluteSize] = function(v138) --[[ Line: 462 ]]
                -- upvalues: v58 (copy), v63 (copy)
                v58(v138);
                v63(v138.AbsoluteSize.X);
            end
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 16)
            }), 
            Header = v2.createElement("Frame", {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v57), 
                    PaddingRight = UDim.new(0, v57)
                }), 
                Content = v2.createElement(l_CollectionHeader_0, {
                    LayoutOrder = 1, 
                    title = v61.title, 
                    hideButton = true
                })
            }), 
            CollectionCarousel = v2.createElement(l_CollectionCarousel_0, {
                LayoutOrder = 2, 
                title = nil, 
                items = v104, 
                renderItem = v128, 
                getItemHeight = v130, 
                numColumns = 2, 
                fractionalItemAmount = #v104 > 2 and v64 or 0, 
                columnGap = 12, 
                sideMargin = v57
            })
        });
    end;
end);