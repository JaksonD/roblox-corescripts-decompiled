local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Players_0 = game:GetService("Players");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v6 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gamePlayIntent);
local v7 = require(l_Modules_0.LuaApp.Analytics.Events.joinGameInPlacesList);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.peopleListInteractionV2);
local v9 = require(l_Modules_0.LuaApp.Analytics.Events.peopleListViewGameDetail);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.openModalFromGameTile);
local v11 = require(l_Modules_0.LuaApp.Analytics.Events.touchSwipe);
local v12 = require(l_Modules_0.LuaApp.Analytics.Events.Games.gameDetailReferral);
local v13 = require(l_Modules_0.LuaApp.AppPage);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v16 = require(l_Modules_0.LuaApp.Constants);
local l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 = v4.FFlagProfilePlatformFavoritesEnableGameDetailAnalytics;
local l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 = v4.FFlagProfilePlatformImproveGameDetailsAnalytics;
local l_FFlagEnableTopSongsSort_0 = v4.FFlagEnableTopSongsSort;
local l_FFlagLuaAppEnableHomepageTwoByOneTile_0 = v4.FFlagLuaAppEnableHomepageTwoByOneTile;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = v4.FFlagLuaAppTwoByOneTileTelemetryFix;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = v4.FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = v4.FFlagLuaAppLogOmniAnalyticsData;
return {
    get = function(v24, v25, v26) --[[ Line: 37 ]] --[[ Name: get ]]
        -- upvalues: v13 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v12 (copy), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), v8 (copy), v9 (copy), l_Players_0 (copy), v16 (copy), v6 (copy), v7 (copy), v10 (copy), v5 (copy), v11 (copy)
        local v27 = {
            [v13.Home] = "home", 
            [v13.Games] = "games", 
            [v13.SearchPage] = "gameSearch", 
            [v13.GameDetail] = "gameDetails", 
            [v13.Chat] = "chat", 
            [v13.SongDetail] = l_FFlagEnableTopSongsSort_0 and "songDetails" or nil
        };
        local function _(v28) --[[ Line: 47 ]] --[[ Name: getPageName ]]
            -- upvalues: v27 (copy)
            local v29 = v27[v28];
            if v29 then
                return v29;
            else
                return v28;
            end;
        end;
        local function _() --[[ Line: 56 ]] --[[ Name: startGameDetailSourceSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
        end;
        local function _() --[[ Line: 60 ]] --[[ Name: startGamePlayFromFriendsListSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
        end;
        local v41 = {
            reportSeeAllWithId = function(v33, v34, v35) --[[ Line: 66 ]] --[[ Name: reportSeeAllWithId ]]
                -- upvalues: v26 (copy)
                local v36 = {
                    aType = "touch", 
                    aValue = tostring(v33), 
                    gameSetTargetId = v34, 
                    pos = tonumber(v35)
                };
                v26:setRBXEventStream("SeeAll", "gamesPageInteraction", v36);
            end, 
            reportFilterChangeWithId = function(v37, v38, v39) --[[ Line: 79 ]] --[[ Name: reportFilterChangeWithId ]]
                -- upvalues: v26 (copy)
                local v40 = {
                    aType = "touch", 
                    aValue = tostring(v37), 
                    gameSetTargetId = v38, 
                    pos = tonumber(v39)
                };
                v26:setRBXEventStream("SFMenu", "gamesPageInteraction", v40);
            end
        };
        local function v67(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63) --[[ Line: 92 ]] --[[ Name: reportGameDetailReferralWithId ]]
            -- upvalues: l_LocalizationService_0 (ref), l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v12 (ref), v26 (copy)
            local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
            local v65 = v50 or "";
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v66 = {
                pg = v42, 
                tis = v48, 
                sortPos = v46, 
                pid = v43, 
                ad = v49 and "yes" or "no", 
                isAd = v49, 
                nativeAdData = v65, 
                universeId = v51, 
                navigationUniverseId = v52, 
                pos = v47, 
                gameSetTypeId = v44, 
                gameSetTargetId = v45, 
                locale = l_RobloxLocaleId_0, 
                appliedFilters = v53, 
                topicDataPosition = v54 or v47, 
                isSdui = v55, 
                positionInRow = v56, 
                rowNumber = v57, 
                rowOnPage = v58, 
                heroUnitId = v59, 
                loadSource = v60, 
                tileType = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v61 else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v62 else nil, 
                analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v63 else nil
            };
            v12(v26, v42, v66);
        end;
        v41.reportOpenGameDetailWithId = function(v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89) --[[ Line: 150 ]] --[[ Name: reportOpenGameDetailWithId ]]
            -- upvalues: v67 (copy), v27 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref)
            v67(v27[v77] or v77, v68, v69, v70, v71, v72, v73, v74, v75 or "", v76, v78, v79, v80, v81, v82, v83, v84, v85, v86, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v87 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v88 else nil, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v89 else nil);
        end;
        v41.reportOpenGameDetailFromGameDetail = function(v90, v91, v92, v93, v94, v95, v96, v97) --[[ Line: 200 ]] --[[ Name: reportOpenGameDetailFromGameDetail ]]
            -- upvalues: v27 (copy), v12 (ref), v26 (copy)
            local v98 = v27[v96] or v96;
            local v99 = v93 and "yes" or "no";
            local v100 = v94 or "";
            local v101 = {
                pg = v98, 
                pos = v91, 
                tis = v92, 
                sortPos = 0, 
                refId = v97, 
                pid = v90, 
                ad = v99, 
                nativeAdData = v100, 
                src = "recommended", 
                universeId = v95
            };
            v12(v26, v98, v101);
        end;
        if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then
            v41.reportOpenGameDetailFromProfile = function(v102, v103, v104, v105, v106, v107, v108, v109) --[[ Line: 231 ]] --[[ Name: reportOpenGameDetailFromProfile ]]
                -- upvalues: v27 (copy), l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v12 (ref), v26 (copy)
                local v110 = v27[v106] or v106;
                l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v111 = {
                    ad = "no", 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v109 else nil, 
                    pg = v110, 
                    pid = v102, 
                    pos = v103, 
                    rowOnPage = v108, 
                    sortPos = v107, 
                    tis = v104, 
                    universeId = v105
                };
                v12(v26, v110, v111);
            end;
        end;
        if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then
            v41.reportOpenGameDetailFromProfileContext = function(v112, v113, v114, v115, v116) --[[ Line: 261 ]] --[[ Name: reportOpenGameDetailFromProfileContext ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), v27 (copy), v12 (ref), v26 (copy)
                l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v117 = {
                    ad = "no", 
                    friendId = v115, 
                    pg = v27[v114] or v114, 
                    pid = v112, 
                    universeId = v113
                };
                v12(v26, v116, v117);
            end;
        end;
        v41.reportOpenGameDetailFromSearch = function(v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129) --[[ Line: 276 ]] --[[ Name: reportOpenGameDetailFromSearch ]]
            -- upvalues: v27 (copy), l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), v12 (ref), v26 (copy)
            local v130 = v27[v124] or v124;
            local v131 = v122 or "";
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v132 = {
                pg = v27[v124] or v124, 
                tis = v120, 
                pid = v118, 
                ad = v121 and "yes" or "no", 
                nativeAdData = v131, 
                universeId = v123, 
                pos = v119, 
                sortPos = v125, 
                gameSetTypeId = v126, 
                rowOnPage = v127, 
                topicDataPosition = v128 or v119, 
                tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v129 else nil
            };
            v12(v26, v130, v132);
        end;
        v41.reportOpenGameDetailFromPeopleList = function(v133, v134, v135, v136, v137, v138, v139) --[[ Line: 312 ]] --[[ Name: reportOpenGameDetailFromPeopleList ]]
            -- upvalues: v13 (ref), v27 (copy), l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), v12 (ref), v26 (copy)
            local l_Home_0 = v13.Home;
            local v141 = v27[l_Home_0] or l_Home_0;
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Home_0 = {
                pg = v141, 
                friendId = v133, 
                position = v134, 
                absolutePosition = v135, 
                pid = v136, 
                universeId = v137, 
                fromWhere = v138
            };
            v12(v26, v139, l_Home_0);
        end;
        v41.reportOpenGameDetailFromChat = function(v142, v143, v144, v145) --[[ Line: 337 ]] --[[ Name: reportOpenGameDetailFromChat ]]
            -- upvalues: v13 (ref), v27 (copy), l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), v12 (ref), v26 (copy)
            local l_Chat_0 = v13.Chat;
            local v147 = v27[l_Chat_0] or l_Chat_0;
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Chat_0 = {
                pg = v147, 
                pid = v142, 
                universeId = v144, 
                conversationId = v143
            };
            v12(v26, v145, l_Chat_0);
        end;
        v41.reportPeopleListInteraction = function(v148, v149, v150, v151, v152, v153) --[[ Line: 350 ]] --[[ Name: reportPeopleListInteraction ]]
            -- upvalues: v8 (ref), v25 (copy)
            v8(v25.EventStream, v148, v149, v150, v152, v151, v153);
        end;
        v41.reportViewProfileFromPeopleList = function(v154, v155, v156, v157, v158) --[[ Line: 362 ]] --[[ Name: reportViewProfileFromPeopleList ]]
            -- upvalues: v9 (ref), v25 (copy)
            v9(v25.EventStream, v154, v155, v156, v157, v158);
        end;
        v41.reportPeopleListJoinGame = function(v159, v160, v161, v162, v163, v164, v165, v166, v167) --[[ Line: 373 ]] --[[ Name: reportPeopleListJoinGame ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), l_Players_0 (ref), v26 (copy), v16 (ref), v6 (ref)
            l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
            local v168 = {
                uid = tostring(l_Players_0.LocalPlayer.UserId), 
                friendId = v159, 
                position = v160, 
                absolutePosition = v161, 
                rootPlaceId = v163, 
                gameInstanceId = v164, 
                inGameFriendCount = v165, 
                joinAttemptId = v166, 
                source = v167
            };
            v26:setRBXEventStream("contactFriendFinder", "joinGameInPeopleList", v168);
            local l_PeopleListInHomePage_0 = v16.AnalyticsContext.PeopleListInHomePage;
            v6(v26, l_PeopleListInHomePage_0, {
                placeId = v162, 
                rootPlaceId = v163, 
                joinAttemptId = v166, 
                friendId = v159
            });
        end;
        v41.reportJoinGameInPlacesList = function(v170, v171, v172, v173, v174) --[[ Line: 408 ]] --[[ Name: reportJoinGameInPlacesList ]]
            -- upvalues: v7 (ref), v25 (copy), v16 (ref), v6 (ref), v26 (copy)
            v7(v25.EventStream, v170, v171, v172, v173, v174);
            local l_GamePlayIntentInPlacesList_0 = v16.AnalyticsContext.GamePlayIntentInPlacesList;
            v6(v26, l_GamePlayIntentInPlacesList_0, {
                placeId = v171, 
                rootPlaceId = v172, 
                joinAttemptId = v174, 
                friendId = v170
            });
        end;
        if l_FFlagEnableTopSongsSort_0 then
            v41.reportOpenGameDetailFromSongDetail = function(v176, v177, v178, v179, v180, v181, v182, v183) --[[ Line: 420 ]] --[[ Name: reportOpenGameDetailFromSongDetail ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v24 (copy), l_SessionType_0 (ref), v27 (copy), v12 (ref), v26 (copy)
                l_SetGamePlaySession_0(v24, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v184 = v27[v182] or v182;
                local v185 = v179 and "yes" or "no";
                local v186 = v180 or "";
                local v187 = {
                    pg = v184, 
                    pos = v177, 
                    tis = v178, 
                    sortPos = 0, 
                    refSongId = v183, 
                    pid = v176, 
                    ad = v185, 
                    nativeAdData = v186, 
                    src = "songDetails", 
                    universeId = v181
                };
                v12(v26, v184, v187);
            end;
        end;
        v41.reportOpenModalFromGameTileForPlacesList = function(v188) --[[ Line: 452 ]] --[[ Name: reportOpenModalFromGameTileForPlacesList ]]
            -- upvalues: v10 (ref), v25 (copy)
            v10(v25.EventStream, v188);
        end;
        v41.reportButtonClicked = function(v189, v190) --[[ Line: 456 ]] --[[ Name: reportButtonClicked ]]
            -- upvalues: v5 (ref), v25 (copy)
            v5(v25.EventStream, v189, v190);
        end;
        v41.reportTouchSearchInsteadForPlayerNamed = function(v191, v192) --[[ Line: 460 ]] --[[ Name: reportTouchSearchInsteadForPlayerNamed ]]
            -- upvalues: v5 (ref), v25 (copy), v27 (copy)
            v5(v25.EventStream, v27[v192] or v192, "searchInsteadForPlayerNamed", v191);
        end;
        v41.reportTouchSwipe = function(v193, v194, v195, v196) --[[ Line: 464 ]] --[[ Name: reportTouchSwipe ]]
            -- upvalues: v11 (ref), v25 (copy)
            v11(v25.EventStream, v193, v194, v195, v196);
        end;
        return v41;
    end
};