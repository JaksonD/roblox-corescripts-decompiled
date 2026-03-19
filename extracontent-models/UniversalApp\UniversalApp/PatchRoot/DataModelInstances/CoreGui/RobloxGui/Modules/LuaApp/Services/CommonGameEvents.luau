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
local l_FFlagLuaAppLogOmniAnalyticsData_0 = v4.FFlagLuaAppLogOmniAnalyticsData;
return {
    get = function(v23, v24, v25) --[[ Line: 36 ]] --[[ Name: get ]]
        -- upvalues: v13 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_LocalizationService_0 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy), v12 (copy), l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 (copy), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (copy), v8 (copy), v9 (copy), l_Players_0 (copy), v16 (copy), v6 (copy), v7 (copy), v10 (copy), v5 (copy), v11 (copy)
        local v26 = {
            [v13.Home] = "home", 
            [v13.Games] = "games", 
            [v13.SearchPage] = "gameSearch", 
            [v13.GameDetail] = "gameDetails", 
            [v13.Chat] = "chat", 
            [v13.SongDetail] = l_FFlagEnableTopSongsSort_0 and "songDetails" or nil
        };
        local function _(v27) --[[ Line: 46 ]] --[[ Name: getPageName ]]
            -- upvalues: v26 (copy)
            local v28 = v26[v27];
            if v28 then
                return v28;
            else
                return v27;
            end;
        end;
        local function _() --[[ Line: 55 ]] --[[ Name: startGameDetailSourceSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
        end;
        local function _() --[[ Line: 59 ]] --[[ Name: startGamePlayFromFriendsListSession ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref)
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
        end;
        local v40 = {
            reportSeeAllWithId = function(v32, v33, v34) --[[ Line: 65 ]] --[[ Name: reportSeeAllWithId ]]
                -- upvalues: v25 (copy)
                local v35 = {
                    aType = "touch", 
                    aValue = tostring(v32), 
                    gameSetTargetId = v33, 
                    pos = tonumber(v34)
                };
                v25:setRBXEventStream("SeeAll", "gamesPageInteraction", v35);
            end, 
            reportFilterChangeWithId = function(v36, v37, v38) --[[ Line: 78 ]] --[[ Name: reportFilterChangeWithId ]]
                -- upvalues: v25 (copy)
                local v39 = {
                    aType = "touch", 
                    aValue = tostring(v36), 
                    gameSetTargetId = v37, 
                    pos = tonumber(v38)
                };
                v25:setRBXEventStream("SFMenu", "gamesPageInteraction", v39);
            end
        };
        local function v66(v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62) --[[ Line: 91 ]] --[[ Name: reportGameDetailReferralWithId ]]
            -- upvalues: l_LocalizationService_0 (ref), l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v12 (ref), v25 (copy)
            local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
            local v64 = v49 or "";
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v65 = {
                pg = v41, 
                tis = v47, 
                sortPos = v45, 
                pid = v42, 
                ad = v48 and "yes" or "no", 
                isAd = v48, 
                nativeAdData = v64, 
                universeId = v50, 
                navigationUniverseId = v51, 
                pos = v46, 
                gameSetTypeId = v43, 
                gameSetTargetId = v44, 
                locale = l_RobloxLocaleId_0, 
                appliedFilters = v52, 
                topicDataPosition = v53 or v46, 
                isSdui = v54, 
                positionInRow = v55, 
                rowNumber = v56, 
                rowOnPage = v57, 
                heroUnitId = v58, 
                loadSource = v59, 
                tileType = if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v60 else nil, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v61 else nil, 
                analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v62 else nil
            };
            v12(v25, v41, v65);
        end;
        v40.reportOpenGameDetailWithId = function(v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88) --[[ Line: 149 ]] --[[ Name: reportOpenGameDetailWithId ]]
            -- upvalues: v66 (copy), v26 (copy), l_FFlagLuaAppEnableHomepageTwoByOneTile_0 (ref), l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref)
            v66(v26[v76] or v76, v67, v68, v69, v70, v71, v72, v73, v74 or "", v75, v77, v78, v79, v80, v81, v82, v83, v84, v85, if l_FFlagLuaAppEnableHomepageTwoByOneTile_0 then v86 else nil, if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v87 else nil, if l_FFlagLuaAppLogOmniAnalyticsData_0 then v88 else nil);
        end;
        v40.reportOpenGameDetailFromGameDetail = function(v89, v90, v91, v92, v93, v94, v95, v96) --[[ Line: 199 ]] --[[ Name: reportOpenGameDetailFromGameDetail ]]
            -- upvalues: v26 (copy), v12 (ref), v25 (copy)
            local v97 = v26[v95] or v95;
            local v98 = v92 and "yes" or "no";
            local v99 = v93 or "";
            local v100 = {
                pg = v97, 
                pos = v90, 
                tis = v91, 
                sortPos = 0, 
                refId = v96, 
                pid = v89, 
                ad = v98, 
                nativeAdData = v99, 
                src = "recommended", 
                universeId = v94
            };
            v12(v25, v97, v100);
        end;
        if l_FFlagProfilePlatformFavoritesEnableGameDetailAnalytics_0 then
            v40.reportOpenGameDetailFromProfile = function(v101, v102, v103, v104, v105, v106, v107, v108) --[[ Line: 230 ]] --[[ Name: reportOpenGameDetailFromProfile ]]
                -- upvalues: v26 (copy), l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 (ref), v12 (ref), v25 (copy)
                local v109 = v26[v105] or v105;
                l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v110 = {
                    ad = "no", 
                    friendId = if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then v108 else nil, 
                    pg = v109, 
                    pid = v101, 
                    pos = v102, 
                    rowOnPage = v107, 
                    sortPos = v106, 
                    tis = v103, 
                    universeId = v104
                };
                v12(v25, v109, v110);
            end;
        end;
        if l_FFlagProfilePlatformImproveGameDetailsAnalytics_0 then
            v40.reportOpenGameDetailFromProfileContext = function(v111, v112, v113, v114, v115) --[[ Line: 260 ]] --[[ Name: reportOpenGameDetailFromProfileContext ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), v26 (copy), v12 (ref), v25 (copy)
                l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v116 = {
                    ad = "no", 
                    friendId = v114, 
                    pg = v26[v113] or v113, 
                    pid = v111, 
                    universeId = v112
                };
                v12(v25, v115, v116);
            end;
        end;
        v40.reportOpenGameDetailFromSearch = function(v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127) --[[ Line: 275 ]] --[[ Name: reportOpenGameDetailFromSearch ]]
            -- upvalues: v26 (copy), l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), v12 (ref), v25 (copy)
            local v128 = v26[v123] or v123;
            local v129 = v121 or "";
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            local v130 = {
                pg = v26[v123] or v123, 
                tis = v119, 
                pid = v117, 
                ad = v120 and "yes" or "no", 
                nativeAdData = v129, 
                universeId = v122, 
                pos = v118, 
                sortPos = v124, 
                gameSetTypeId = v125, 
                rowOnPage = v126, 
                topicDataPosition = v127 or v118
            };
            v12(v25, v128, v130);
        end;
        v40.reportOpenGameDetailFromPeopleList = function(v131, v132, v133, v134, v135, v136, v137) --[[ Line: 309 ]] --[[ Name: reportOpenGameDetailFromPeopleList ]]
            -- upvalues: v13 (ref), v26 (copy), l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), v12 (ref), v25 (copy)
            local l_Home_0 = v13.Home;
            local v139 = v26[l_Home_0] or l_Home_0;
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Home_0 = {
                pg = v139, 
                friendId = v131, 
                position = v132, 
                absolutePosition = v133, 
                pid = v134, 
                universeId = v135, 
                fromWhere = v136
            };
            v12(v25, v137, l_Home_0);
        end;
        v40.reportOpenGameDetailFromChat = function(v140, v141, v142, v143) --[[ Line: 334 ]] --[[ Name: reportOpenGameDetailFromChat ]]
            -- upvalues: v13 (ref), v26 (copy), l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), v12 (ref), v25 (copy)
            local l_Chat_0 = v13.Chat;
            local v145 = v26[l_Chat_0] or l_Chat_0;
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
            l_Chat_0 = {
                pg = v145, 
                pid = v140, 
                universeId = v142, 
                conversationId = v141
            };
            v12(v25, v143, l_Chat_0);
        end;
        v40.reportPeopleListInteraction = function(v146, v147, v148, v149, v150, v151) --[[ Line: 347 ]] --[[ Name: reportPeopleListInteraction ]]
            -- upvalues: v8 (ref), v24 (copy)
            v8(v24.EventStream, v146, v147, v148, v150, v149, v151);
        end;
        v40.reportViewProfileFromPeopleList = function(v152, v153, v154, v155, v156) --[[ Line: 359 ]] --[[ Name: reportViewProfileFromPeopleList ]]
            -- upvalues: v9 (ref), v24 (copy)
            v9(v24.EventStream, v152, v153, v154, v155, v156);
        end;
        v40.reportPeopleListJoinGame = function(v157, v158, v159, v160, v161, v162, v163, v164, v165) --[[ Line: 370 ]] --[[ Name: reportPeopleListJoinGame ]]
            -- upvalues: l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), l_Players_0 (ref), v25 (copy), v16 (ref), v6 (ref)
            l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GamePlayFromFriendsList, true);
            local v166 = {
                uid = tostring(l_Players_0.LocalPlayer.UserId), 
                friendId = v157, 
                position = v158, 
                absolutePosition = v159, 
                rootPlaceId = v161, 
                gameInstanceId = v162, 
                inGameFriendCount = v163, 
                joinAttemptId = v164, 
                source = v165
            };
            v25:setRBXEventStream("contactFriendFinder", "joinGameInPeopleList", v166);
            local l_PeopleListInHomePage_0 = v16.AnalyticsContext.PeopleListInHomePage;
            v6(v25, l_PeopleListInHomePage_0, {
                placeId = v160, 
                rootPlaceId = v161, 
                joinAttemptId = v164, 
                friendId = v157
            });
        end;
        v40.reportJoinGameInPlacesList = function(v168, v169, v170, v171, v172) --[[ Line: 405 ]] --[[ Name: reportJoinGameInPlacesList ]]
            -- upvalues: v7 (ref), v24 (copy), v16 (ref), v6 (ref), v25 (copy)
            v7(v24.EventStream, v168, v169, v170, v171, v172);
            local l_GamePlayIntentInPlacesList_0 = v16.AnalyticsContext.GamePlayIntentInPlacesList;
            v6(v25, l_GamePlayIntentInPlacesList_0, {
                placeId = v169, 
                rootPlaceId = v170, 
                joinAttemptId = v172, 
                friendId = v168
            });
        end;
        if l_FFlagEnableTopSongsSort_0 then
            v40.reportOpenGameDetailFromSongDetail = function(v174, v175, v176, v177, v178, v179, v180, v181) --[[ Line: 417 ]] --[[ Name: reportOpenGameDetailFromSongDetail ]]
                -- upvalues: l_SetGamePlaySession_0 (ref), v23 (copy), l_SessionType_0 (ref), v26 (copy), v12 (ref), v25 (copy)
                l_SetGamePlaySession_0(v23, l_SessionType_0.StructuralIdentifier.GameDetailSource, false);
                local v182 = v26[v180] or v180;
                local v183 = v177 and "yes" or "no";
                local v184 = v178 or "";
                local v185 = {
                    pg = v182, 
                    pos = v175, 
                    tis = v176, 
                    sortPos = 0, 
                    refSongId = v181, 
                    pid = v174, 
                    ad = v183, 
                    nativeAdData = v184, 
                    src = "songDetails", 
                    universeId = v179
                };
                v12(v25, v182, v185);
            end;
        end;
        v40.reportOpenModalFromGameTileForPlacesList = function(v186) --[[ Line: 449 ]] --[[ Name: reportOpenModalFromGameTileForPlacesList ]]
            -- upvalues: v10 (ref), v24 (copy)
            v10(v24.EventStream, v186);
        end;
        v40.reportButtonClicked = function(v187, v188) --[[ Line: 453 ]] --[[ Name: reportButtonClicked ]]
            -- upvalues: v5 (ref), v24 (copy)
            v5(v24.EventStream, v187, v188);
        end;
        v40.reportTouchSearchInsteadForPlayerNamed = function(v189, v190) --[[ Line: 457 ]] --[[ Name: reportTouchSearchInsteadForPlayerNamed ]]
            -- upvalues: v5 (ref), v24 (copy), v26 (copy)
            v5(v24.EventStream, v26[v190] or v190, "searchInsteadForPlayerNamed", v189);
        end;
        v40.reportTouchSwipe = function(v191, v192, v193, v194) --[[ Line: 461 ]] --[[ Name: reportTouchSwipe ]]
            -- upvalues: v11 (ref), v24 (copy)
            v11(v24.EventStream, v191, v192, v193, v194);
        end;
        return v40;
    end
};