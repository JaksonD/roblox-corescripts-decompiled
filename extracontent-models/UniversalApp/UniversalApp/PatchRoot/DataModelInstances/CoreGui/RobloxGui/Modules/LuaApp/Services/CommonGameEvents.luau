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
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = v4.FFlagLuaAppAddSubIdToHomeEvents;
return {
    get = function(v22, v23, v24) --[[ Line: 35 ]] --[[ Name: get ]]
        -- upvalues: v13 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), v12 (copy), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v8 (copy), v9 (copy), l_Players_0 (copy), v16 (copy), v6 (copy), v7 (copy), v10 (copy), v5 (copy), v11 (copy)
        local v25 = {
            [v13.Home] = "home", 
            [v13.Games] = "games", 
            [v13.SearchPage] = "gameSearch", 
            [v13.GameDetail] = "gameDetails", 
            [v13.Chat] = "chat", 
            [v13.SongDetail] = l_FFlagEnableTopSongsSort_0 and "songDetails" or nil
        };
        local function _(v26) --[[ Line: 45 ]] --[[ Name: getPageName ]]
            -- upvalues: v25 (copy)
            local v27 = v25[v26];
            if v27 then
                return v27;
            else
                return v26;
            end;
        end;
        local function _() --[[ Line: 54 ]] --[[ Name: startGameDetailSourceSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
        end;
        local function _() --[[ Line: 58 ]] --[[ Name: startGamePlayFromFriendsListSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
        end;
        local v39 = {
            reportSeeAllWithId = function(v31, v32, v33) --[[ Line: 64 ]] --[[ Name: reportSeeAllWithId ]]
                -- upvalues: v24 (copy)
                local v34 = {
                    aType = "touch", 
                    aValue = tostring(v31), 
                    gameSetTargetId = v32, 
                    pos = tonumber(v33)
                };
                v24:setRBXEventStream("SeeAll", "gamesPageInteraction", v34);
            end, 
            reportFilterChangeWithId = function(v35, v36, v37) --[[ Line: 77 ]] --[[ Name: reportFilterChangeWithId ]]
                -- upvalues: v24 (copy)
                local v38 = {
                    aType = "touch", 
                    aValue = tostring(v35), 
                    gameSetTargetId = v36, 
                    pos = tonumber(v37)
                };
                v24:setRBXEventStream("SFMenu", "gamesPageInteraction", v38);
            end
        };
        local function v64(v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60) --[[ Line: 90 ]] --[[ Name: reportGameDetailReferralWithId ]]
            -- upvalues: l_LocalizationService_0 (ref), l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), v12 (ref), v24 (copy)
            local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
            local v62 = v48 or "";
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v63 = {
                pg = v40, 
                tis = v46, 
                sortPos = v44, 
                pid = v41, 
                ad = v47 and "yes" or "no", 
                isAd = v47, 
                nativeAdData = v62, 
                universeId = v49, 
                navigationUniverseId = v50, 
                pos = v45, 
                gameSetTypeId = v42, 
                gameSetTargetId = v43, 
                locale = l_RobloxLocaleId_0, 
                appliedFilters = v51, 
                topicDataPosition = v52 or v45, 
                isSdui = v53, 
                positionInRow = v54, 
                rowNumber = v55, 
                rowOnPage = v56, 
                heroUnitId = v57, 
                loadSource = v58, 
                tileType = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v59 else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v60 else nil
            };
            v12(v24, v40, v63);
        end;
        v39.reportOpenGameDetailWithId = function(v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) --[[ Line: 146 ]] --[[ Name: reportOpenGameDetailWithId ]]
            -- upvalues: v64 (copy), v25 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref)
            v64(v25[v74] or v74, v65, v66, v67, v68, v69, v70, v71, v72 or "", v73, v75, v76, v77, v78, v79, v80, v81, v82, v83, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v84 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v85 else nil);
        end;
        v39.reportOpenGameDetailFromGameDetail = function(v86, v87, v88, v89, v90, v91, v92, v93) --[[ Line: 194 ]] --[[ Name: reportOpenGameDetailFromGameDetail ]]
            -- upvalues: v25 (copy), v12 (ref), v24 (copy)
            local v94 = v25[v92] or v92;
            local v95 = v89 and "yes" or "no";
            local v96 = v90 or "";
            local v97 = {
                pg = v94, 
                pos = v87, 
                tis = v88, 
                sortPos = 0, 
                refId = v93, 
                pid = v86, 
                ad = v95, 
                nativeAdData = v96, 
                src = "recommended", 
                universeId = v91
            };
            v12(v24, v94, v97);
        end;
        if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then
            v39.reportOpenGameDetailFromProfile = function(v98, v99, v100, v101, v102, v103, v104, v105) --[[ Line: 225 ]] --[[ Name: reportOpenGameDetailFromProfile ]]
                -- upvalues: v25 (copy), l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v12 (ref), v24 (copy)
                local v106 = v25[v102] or v102;
                l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v107 = {
                    ad = "no", 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v105 else nil, 
                    pg = v106, 
                    pid = v98, 
                    pos = v99, 
                    rowOnPage = v104, 
                    sortPos = v103, 
                    tis = v100, 
                    universeId = v101
                };
                v12(v24, v106, v107);
            end;
        end;
        if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then
            v39.reportOpenGameDetailFromProfileContext = function(v108, v109, v110, v111, v112) --[[ Line: 255 ]] --[[ Name: reportOpenGameDetailFromProfileContext ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), v25 (copy), v12 (ref), v24 (copy)
                l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v113 = {
                    ad = "no", 
                    friendId = v111, 
                    pg = v25[v110] or v110, 
                    pid = v108, 
                    universeId = v109
                };
                v12(v24, v112, v113);
            end;
        end;
        v39.reportOpenGameDetailFromSearch = function(v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124) --[[ Line: 270 ]] --[[ Name: reportOpenGameDetailFromSearch ]]
            -- upvalues: v25 (copy), l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), v12 (ref), v24 (copy)
            local v125 = v25[v120] or v120;
            local v126 = v118 or "";
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v127 = {
                pg = v25[v120] or v120, 
                tis = v116, 
                pid = v114, 
                ad = v117 and "yes" or "no", 
                nativeAdData = v126, 
                universeId = v119, 
                pos = v115, 
                sortPos = v121, 
                gameSetTypeId = v122, 
                rowOnPage = v123, 
                topicDataPosition = v124 or v115
            };
            v12(v24, v125, v127);
        end;
        v39.reportOpenGameDetailFromPeopleList = function(v128, v129, v130, v131, v132, v133, v134) --[[ Line: 304 ]] --[[ Name: reportOpenGameDetailFromPeopleList ]]
            -- upvalues: v13 (ref), v25 (copy), l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), v12 (ref), v24 (copy)
            local l_Home_0 = v13.Home;
            local v136 = v25[l_Home_0] or l_Home_0;
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Home_0 = {
                pg = v136, 
                friendId = v128, 
                position = v129, 
                absolutePosition = v130, 
                pid = v131, 
                universeId = v132, 
                fromWhere = v133
            };
            v12(v24, v134, l_Home_0);
        end;
        v39.reportOpenGameDetailFromChat = function(v137, v138, v139, v140) --[[ Line: 329 ]] --[[ Name: reportOpenGameDetailFromChat ]]
            -- upvalues: v13 (ref), v25 (copy), l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), v12 (ref), v24 (copy)
            local l_Chat_0 = v13.Chat;
            local v142 = v25[l_Chat_0] or l_Chat_0;
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Chat_0 = {
                pg = v142, 
                pid = v137, 
                universeId = v139, 
                conversationId = v138
            };
            v12(v24, v140, l_Chat_0);
        end;
        v39.reportPeopleListInteraction = function(v143, v144, v145, v146, v147, v148) --[[ Line: 342 ]] --[[ Name: reportPeopleListInteraction ]]
            -- upvalues: v8 (ref), v23 (copy)
            v8(v23.EventStream, v143, v144, v145, v147, v146, v148);
        end;
        v39.reportViewProfileFromPeopleList = function(v149, v150, v151, v152, v153) --[[ Line: 354 ]] --[[ Name: reportViewProfileFromPeopleList ]]
            -- upvalues: v9 (ref), v23 (copy)
            v9(v23.EventStream, v149, v150, v151, v152, v153);
        end;
        v39.reportPeopleListJoinGame = function(v154, v155, v156, v157, v158, v159, v160, v161, v162) --[[ Line: 365 ]] --[[ Name: reportPeopleListJoinGame ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), l_Players_0 (ref), v24 (copy), v16 (ref), v6 (ref)
            l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
            local v163 = {
                uid = tostring(l_Players_0.LocalPlayer.UserId), 
                friendId = v154, 
                position = v155, 
                absolutePosition = v156, 
                rootPlaceId = v158, 
                gameInstanceId = v159, 
                inGameFriendCount = v160, 
                joinAttemptId = v161, 
                source = v162
            };
            v24:setRBXEventStream("contactFriendFinder", "joinGameInPeopleList", v163);
            local l_PeopleListInHomePage_0 = v16.AnalyticsContext.PeopleListInHomePage;
            v6(v24, l_PeopleListInHomePage_0, {
                placeId = v157, 
                rootPlaceId = v158, 
                joinAttemptId = v161, 
                friendId = v154
            });
        end;
        v39.reportJoinGameInPlacesList = function(v165, v166, v167, v168, v169) --[[ Line: 400 ]] --[[ Name: reportJoinGameInPlacesList ]]
            -- upvalues: v7 (ref), v23 (copy), v16 (ref), v6 (ref), v24 (copy)
            v7(v23.EventStream, v165, v166, v167, v168, v169);
            local l_GamePlayIntentInPlacesList_0 = v16.AnalyticsContext.GamePlayIntentInPlacesList;
            v6(v24, l_GamePlayIntentInPlacesList_0, {
                placeId = v166, 
                rootPlaceId = v167, 
                joinAttemptId = v169, 
                friendId = v165
            });
        end;
        if l_FFlagEnableTopSongsSort_0 then
            v39.reportOpenGameDetailFromSongDetail = function(v171, v172, v173, v174, v175, v176, v177, v178) --[[ Line: 412 ]] --[[ Name: reportOpenGameDetailFromSongDetail ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v22 (copy), l_SessionType_0 (ref), v25 (copy), v12 (ref), v24 (copy)
                l_SetGamePlaySession_0(v22, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v179 = v25[v177] or v177;
                local v180 = v174 and "yes" or "no";
                local v181 = v175 or "";
                local v182 = {
                    pg = v179, 
                    pos = v172, 
                    tis = v173, 
                    sortPos = 0, 
                    refSongId = v178, 
                    pid = v171, 
                    ad = v180, 
                    nativeAdData = v181, 
                    src = "songDetails", 
                    universeId = v176
                };
                v12(v24, v179, v182);
            end;
        end;
        v39.reportOpenModalFromGameTileForPlacesList = function(v183) --[[ Line: 444 ]] --[[ Name: reportOpenModalFromGameTileForPlacesList ]]
            -- upvalues: v10 (ref), v23 (copy)
            v10(v23.EventStream, v183);
        end;
        v39.reportButtonClicked = function(v184, v185) --[[ Line: 448 ]] --[[ Name: reportButtonClicked ]]
            -- upvalues: v5 (ref), v23 (copy)
            v5(v23.EventStream, v184, v185);
        end;
        v39.reportTouchSearchInsteadForPlayerNamed = function(v186, v187) --[[ Line: 452 ]] --[[ Name: reportTouchSearchInsteadForPlayerNamed ]]
            -- upvalues: v5 (ref), v23 (copy), v25 (copy)
            v5(v23.EventStream, v25[v187] or v187, "searchInsteadForPlayerNamed", v186);
        end;
        v39.reportTouchSwipe = function(v188, v189, v190, v191) --[[ Line: 456 ]] --[[ Name: reportTouchSwipe ]]
            -- upvalues: v11 (ref), v23 (copy)
            v11(v23.EventStream, v188, v189, v190, v191);
        end;
        return v39;
    end
};