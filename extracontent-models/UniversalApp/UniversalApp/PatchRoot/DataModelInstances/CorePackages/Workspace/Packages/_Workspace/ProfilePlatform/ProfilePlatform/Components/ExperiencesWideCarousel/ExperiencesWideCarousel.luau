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
    -- upvalues: v10 (copy), l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_useLocalization_0 (copy), v12 (copy), v2 (copy), l_useDispatch_0 (copy), v13 (copy), v14 (copy), l_script_FirstAncestor_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), v15 (copy), v19 (copy), v20 (copy), v40 (copy), v47 (copy), v16 (copy), v29 (copy), l_Url_0 (copy), l_SetGameVotes_0 (copy), l_dependencyArray_0 (copy), v18 (copy), v17 (copy), l_ContentType_0 (copy), l_formatExperienceThumbnail_0 (copy), l_GameStats_0 (copy), l_GameTileView_0 (copy), l_GameTileViewConfig_0 (copy), l_AppPage_0 (copy), l_OpenGameDetails_0 (copy), v38 (copy), l_IXPService_0 (copy), v39 (copy), l_CollectionHeader_0 (copy), l_CollectionCarousel_0 (copy)
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
    local v73 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v74 = l_useNavigation_0();
    local v76 = l_useSelector_0(function(v75) --[[ Line: 124 ]]
        -- upvalues: v15 (ref)
        return v15(v75, "GameVotes") or {};
    end);
    local v77 = (v19(v20.Components.Experiences) or {}).experiences or {};
    local v81 = v2.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v77 (copy)
        local v78 = {};
        for _, v80 in ipairs(v77) do
            if v80.universeId ~= nil then
                table.insert(v78, (tostring(v80.universeId)));
            end;
        end;
        return v78;
    end, {
        v77
    });
    v2.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v81 (copy)
        if #v81 == 0 then
            return;
        else
            return;
        end;
    end, {
        v81
    });
    local v83 = l_useSelector_0(function(v82) --[[ Line: 146 ]]
        -- upvalues: v15 (ref)
        return v15(v82, "ProfilePlatform.Games.byGameId") or {};
    end);
    local v84 = v2.useRef({
        key = "", 
        at = 0
    });
    v2.useEffect(function() --[[ Line: 155 ]]
        -- upvalues: v81 (copy), v84 (copy), v40 (ref), v83 (copy), v47 (ref), v68 (copy), v16 (ref), v76 (copy), v29 (ref), l_Url_0 (ref), l_SetGameVotes_0 (ref)
        if #v81 == 0 then
            return;
        else
            local v85 = os.clock();
            local v86 = table.concat(v81, ",");
            local l_current_0 = v84.current;
            if v86 == l_current_0.key and v85 - l_current_0.at < 2 then
                return;
            else
                v84.current = {
                    key = v86, 
                    at = v85
                };
                local v88 = {};
                for _, v90 in v81 do
                    if not v40[v90] and v83[v90] == nil then
                        table.insert(v88, v90);
                    end;
                end;
                for _, v92 in v47(v88, 10) do
                    v68(v16.GetExperiencesDetails.API(v92)):catch(function() --[[ Line: 180 ]]
                        -- upvalues: v92 (copy), v40 (ref)
                        for _, v94 in v92 do
                            v40[v94] = true;
                        end;
                    end);
                end;
                for v95 = 1, math.min(6, #v81) do
                    local v96 = v81[v95];
                    if v76[v96] == nil then
                        v29(string.format("%sv1/games/%s/votes", l_Url_0.GAME_URL, v96), "GET"):andThen(function(v97) --[[ Line: 193 ]]
                            -- upvalues: v68 (ref), l_SetGameVotes_0 (ref), v96 (copy)
                            local l_responseBody_0 = v97.responseBody;
                            if l_responseBody_0 ~= nil and l_responseBody_0.upVotes ~= nil and l_responseBody_0.downVotes ~= nil then
                                v68(l_SetGameVotes_0(v96, l_responseBody_0.upVotes < 0 and 0 or l_responseBody_0.upVotes, l_responseBody_0.downVotes < 0 and 0 or l_responseBody_0.downVotes));
                            end;
                        end):catch(function() --[[ Line: 205 ]]

                        end);
                    end;
                end;
                return;
            end;
        end;
    end, l_dependencyArray_0(v81, v83, v76));
    local v103 = v2.useMemo(function() --[[ Line: 210 ]]
        -- upvalues: v81 (copy), v83 (copy)
        local v99 = {};
        for _, v101 in v81 do
            local v102 = v83[v101];
            if v102 then
                table.insert(v99, v102);
            end;
        end;
        return v99;
    end, l_dependencyArray_0(v81, v83));
    local v104 = v2.useMemo(function() --[[ Line: 222 ]]
        -- upvalues: v18 (ref), v103 (copy)
        return v18(v103);
    end, l_dependencyArray_0(v103));
    local v105 = v17(v104, 2, l_ContentType_0.Game, 1, "ExperiencesWideCarousel");
    local v113 = v2.useCallback(function(v106, v107, v108, v109, v110, v111, v112) --[[ Line: 237 ]]
        -- upvalues: v71 (copy), v72 (copy), v70 (copy)
        v71.fireAnalyticsEvent(v72.ExperienceOpened, {
            profileUserId = v70, 
            experienceId = v106, 
            position = v107, 
            row = 1, 
            ccu = v108 or 0, 
            votePercentage = v109, 
            upVotes = v110 or 0, 
            downVotes = v111 or 0, 
            visits = v112 or 0, 
            section = "Experiences", 
            layoutType = "Wide"
        });
    end, l_dependencyArray_0(v71, v70));
    local v127 = v2.useCallback(function(v114, v115, v116) --[[ Line: 267 ]]
        -- upvalues: l_formatExperienceThumbnail_0 (ref), v2 (ref), l_GameStats_0 (ref), v76 (copy), l_GameTileView_0 (ref), l_GameTileViewConfig_0 (ref), v113 (copy), v103 (copy), v73 (copy), l_AppPage_0 (ref), v56 (copy), v68 (copy), l_OpenGameDetails_0 (ref), v74 (copy)
        local v117 = l_formatExperienceThumbnail_0(nil, v114.rootPlaceId);
        local v118 = v2.createElement(l_GameStats_0, {
            stats = {
                playerCount = v114.playing or 0, 
                totalUpVotes = v76[v114.experienceId] and v76[v114.experienceId].upVotes or 0, 
                totalDownVotes = v76[v114.experienceId] and v76[v114.experienceId].downVotes or 0
            }, 
            isGridTile = true, 
            gameTileLayoutType = "Wide"
        });
        return v2.createElement("Frame", {
            Size = v116, 
            BackgroundTransparency = 1, 
            LayoutOrder = v115
        }, {
            Tile = v2.createElement(l_GameTileView_0, {
                Size = UDim2.fromScale(1, 1), 
                image = v117, 
                title = v114.name, 
                imageAspectRatio = l_GameTileViewConfig_0.getImageAspectRatio("Wide"), 
                footerMetadata = v118, 
                isHovered = false, 
                onActivated = function() --[[ Line: 297 ]] --[[ Name: onActivated ]]
                    -- upvalues: v76 (ref), v114 (copy), v113 (ref), v115 (copy), v103 (ref), v73 (ref), l_AppPage_0 (ref), v56 (ref), v68 (ref), l_OpenGameDetails_0 (ref), v74 (ref)
                    local v119 = false;
                    local v120 = v76[v114.experienceId];
                    local v121;
                    if v120 then
                        local l_upVotes_0 = v120.upVotes;
                        local l_downVotes_0 = v120.downVotes;
                        local v124 = math.max(0, l_upVotes_0 or 0);
                        local v125 = v124 + math.max(0, l_downVotes_0 or 0);
                        v121 = if v125 == 0 then nil else tostring((math.floor(v124 / v125 * 100 + 0.5))) .. "%";
                        v119 = v121;
                    end;
                    if not v119 then
                        v121 = nil;
                    end;
                    v119 = false;
                    v113(v114.experienceId, v115, v114.playing, v121, v120 and v120.upVotes or 0, v120 and v120.downVotes or 0, 0);
                    local v126 = #v103;
                    v73.reportOpenGameDetailFromProfile(v114.rootPlaceId, v115, v126, v114.experienceId, l_AppPage_0.ProfilePlatform, v56.layoutOrder, 1, nil);
                    v68(l_OpenGameDetails_0(v114.experienceId, v74, {
                        mountAsFullView = false, 
                        showBackButton = true
                    }));
                end, 
                hidePlayButton = true, 
                isContained = false
            })
        }), "EXP_Tile";
    end, l_dependencyArray_0(v113, v62, v57, v68, v74, v73, v56.layoutOrder, v103, v76));
    local v129 = v2.useCallback(function(v128) --[[ Line: 351 ]]
        -- upvalues: v66 (copy), v67 (copy), l_GameTileViewConfig_0 (ref), v59 (copy), v60 (copy)
        if v66 ~= v128 then
            v67(v128);
        end;
        return (l_GameTileViewConfig_0.getTileHeight(v59, v128, "Wide", false, false, false, v60, nil, nil, nil, nil, nil));
    end, l_dependencyArray_0(v59, v60, v66));
    local v132 = v2.useCallback(function(v130, v131) --[[ Line: 373 ]]
        return (math.max(1, (math.max(0, v130 - v131 * 2) - 12) / 2));
    end, {});
    v2.useEffect(function() --[[ Line: 378 ]]
        -- upvalues: v62 (copy), v132 (copy), v57 (copy), v103 (copy), v65 (copy)
        if v62 <= 0 then
            return;
        else
            local v133 = v132(v62, v57);
            local v134 = 0;
            if #v103 > 2 then
                v134 = math.clamp(60 / (v133 + 12), 0, 0.5);
            end;
            v65(v134);
            return;
        end;
    end, l_dependencyArray_0(v62, v57, v103, v132));
    v2.useEffect(function() --[[ Line: 393 ]]
        -- upvalues: v103 (copy), v105 (copy)
        if #v103 > 0 then
            local v135 = {};
            for v136 = 1, math.min(2, #v103) do
                table.insert(v135, v136);
            end;
            v105(v135);
        end;
    end, l_dependencyArray_0(v103, v105));
    v2.useEffect(function() --[[ Line: 405 ]]
        -- upvalues: v103 (copy), v38 (ref), l_IXPService_0 (ref), v39 (ref)
        if #v103 > 0 and v38 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v39);
        end;
    end, {
        v103
    });
    if #v103 == 0 then
        return nil;
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v56.layoutOrder, 
            [v2.Change.AbsoluteSize] = function(v137) --[[ Line: 421 ]]
                -- upvalues: v58 (copy), v63 (copy)
                v58(v137);
                v63(v137.AbsoluteSize.X);
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
                items = v103, 
                renderItem = v127, 
                getItemHeight = v129, 
                numColumns = 2, 
                fractionalItemAmount = #v103 > 2 and v64 or 0, 
                columnGap = 12, 
                sideMargin = v57
            })
        });
    end;
end);