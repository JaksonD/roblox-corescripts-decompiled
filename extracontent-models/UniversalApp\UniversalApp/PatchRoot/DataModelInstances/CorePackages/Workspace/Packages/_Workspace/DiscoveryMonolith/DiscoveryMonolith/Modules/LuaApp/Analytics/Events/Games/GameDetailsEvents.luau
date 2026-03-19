local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_FFlagMediaAccordionAndFullTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagMediaAccordionAndFullTelemetry;
local l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry;
local l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local function _(v7) --[[ Line: 15 ]] --[[ Name: gameDetailsBasicEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    return function(v8, v9, v10, v11) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v7 (copy)
        assert(type(v9) == "string", "Expected eventContext to be a string");
        assert(type(v10) == "string", "Expected placeId to be a string");
        assert(type(v11) == "table", "Expected state to be a table");
        local v12 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v10
        };
        v12 = l_Immutable_0.JoinDictionaries(v12, v11);
        v8:setRBXEventStream(v9, v7, v12);
    end;
end;
local function _(v14) --[[ Line: 34 ]] --[[ Name: gameDetailsToggleEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local function v20(v15, v16, v17, v18) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v14 (copy)
        assert(type(v16) == "string", "Expected eventContext to be a string");
        assert(type(v17) == "string", "Expected placeId to be a string");
        assert(type(v18) == "table", "Expected state to be a table");
        local v19 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v17
        };
        v19 = l_Immutable_0.JoinDictionaries(v19, v18);
        v15:setRBXEventStream(v16, v14, v19);
    end;
    return function(v21, v22, v23, v24, v25) --[[ Line: 36 ]]
        -- upvalues: l_Immutable_0 (ref), v20 (copy)
        assert(type(v24) == "boolean", "Expected state to be a boolean");
        if v25 ~= nil then
            assert(type(v25) == "table", "Expected extraData to be a table");
        end;
        local v26 = l_Immutable_0.JoinDictionaries(v25 or {}, {
            state = v24 and "on" or "off"
        });
        return v20(v21, v22, v23, v26);
    end;
end;
local function _(v28) --[[ Line: 50 ]] --[[ Name: gameDetailsSimpleEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local function v34(v29, v30, v31, v32) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v28 (copy)
        assert(type(v30) == "string", "Expected eventContext to be a string");
        assert(type(v31) == "string", "Expected placeId to be a string");
        assert(type(v32) == "table", "Expected state to be a table");
        local v33 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v31
        };
        v33 = l_Immutable_0.JoinDictionaries(v33, v32);
        v29:setRBXEventStream(v30, v28, v33);
    end;
    return function(v35, v36, v37, v38) --[[ Line: 52 ]]
        -- upvalues: v34 (copy)
        return v34(v35, v36, v37, v38 or {});
    end;
end;
local v40 = {};
local v41 = "copyExperienceLink";
local l_v41_0 = v41 --[[ copy: 14 -> 15 ]];
local function v48(v43, v44, v45, v46) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_0 (copy)
    assert(type(v44) == "string", "Expected eventContext to be a string");
    assert(type(v45) == "string", "Expected placeId to be a string");
    assert(type(v46) == "table", "Expected state to be a table");
    local v47 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v45
    };
    v47 = l_Immutable_0.JoinDictionaries(v47, v46);
    v43:setRBXEventStream(v44, l_v41_0, v47);
end;
local l_v48_0 = v48 --[[ copy: 13 -> 16 ]];
v40.CopyExperienceLink = function(v50, v51, v52, v53) --[[ Line: 52 ]]
    -- upvalues: l_v48_0 (copy)
    return l_v48_0(v50, v51, v52, v53 or {});
end;
v41 = "favorite";
local l_v41_1 = v41 --[[ copy: 14 -> 17 ]];
v48 = function(v55, v56, v57, v58) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_1 (copy)
    assert(type(v56) == "string", "Expected eventContext to be a string");
    assert(type(v57) == "string", "Expected placeId to be a string");
    assert(type(v58) == "table", "Expected state to be a table");
    local v59 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v57
    };
    v59 = l_Immutable_0.JoinDictionaries(v59, v58);
    v55:setRBXEventStream(v56, l_v41_1, v59);
end;
local l_v48_1 = v48 --[[ copy: 13 -> 18 ]];
v40.Favorite = function(v61, v62, v63, v64, v65) --[[ Line: 36 ]]
    -- upvalues: l_Immutable_0 (copy), l_v48_1 (copy)
    assert(type(v64) == "boolean", "Expected state to be a boolean");
    if v65 ~= nil then
        assert(type(v65) == "table", "Expected extraData to be a table");
    end;
    local v66 = l_Immutable_0.JoinDictionaries(v65 or {}, {
        state = v64 and "on" or "off"
    });
    return l_v48_1(v61, v62, v63, v66);
end;
v41 = "follow";
local l_v41_2 = v41 --[[ copy: 14 -> 19 ]];
v48 = function(v68, v69, v70, v71) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_2 (copy)
    assert(type(v69) == "string", "Expected eventContext to be a string");
    assert(type(v70) == "string", "Expected placeId to be a string");
    assert(type(v71) == "table", "Expected state to be a table");
    local v72 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v70
    };
    v72 = l_Immutable_0.JoinDictionaries(v72, v71);
    v68:setRBXEventStream(v69, l_v41_2, v72);
end;
local l_v48_2 = v48 --[[ copy: 13 -> 20 ]];
v40.Follow = function(v74, v75, v76, v77, v78) --[[ Line: 36 ]]
    -- upvalues: l_Immutable_0 (copy), l_v48_2 (copy)
    assert(type(v77) == "boolean", "Expected state to be a boolean");
    if v78 ~= nil then
        assert(type(v78) == "table", "Expected extraData to be a table");
    end;
    local v79 = l_Immutable_0.JoinDictionaries(v78 or {}, {
        state = v77 and "on" or "off"
    });
    return l_v48_2(v74, v75, v76, v79);
end;
v41 = "navigateToInviteFriends";
local l_v41_3 = v41 --[[ copy: 14 -> 21 ]];
v48 = function(v81, v82, v83, v84) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_3 (copy)
    assert(type(v82) == "string", "Expected eventContext to be a string");
    assert(type(v83) == "string", "Expected placeId to be a string");
    assert(type(v84) == "table", "Expected state to be a table");
    local v85 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v83
    };
    v85 = l_Immutable_0.JoinDictionaries(v85, v84);
    v81:setRBXEventStream(v82, l_v41_3, v85);
end;
local l_v48_3 = v48 --[[ copy: 13 -> 22 ]];
v40.ShareGameToChat = function(v87, v88, v89, v90) --[[ Line: 52 ]]
    -- upvalues: l_v48_3 (copy)
    return l_v48_3(v87, v88, v89, v90 or {});
end;
v40.GameDetailsSubpage = function(v91, v92, v93, v94, v95) --[[ Line: 62 ]] --[[ Name: GameDetailsSubpage ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy)
    local v96 = "gameDetailsSubpage";
    (function(v97, v98, v99, v100) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v96 (copy)
        assert(type(v98) == "string", "Expected eventContext to be a string");
        assert(type(v99) == "string", "Expected placeId to be a string");
        assert(type(v100) == "table", "Expected state to be a table");
        local v101 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v99
        };
        v101 = l_Immutable_0.JoinDictionaries(v101, v100);
        v97:setRBXEventStream(v98, v96, v101);
    end)(v91, v92, v93, {
        subpage = v94, 
        universeId = if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then v95 else nil
    });
end;
v40.Vote = function(v102, v103, v104, v105, v106) --[[ Line: 68 ]] --[[ Name: Vote ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local v107 = "vote";
    (function(v108, v109, v110, v111) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v107 (copy)
        assert(type(v109) == "string", "Expected eventContext to be a string");
        assert(type(v110) == "string", "Expected placeId to be a string");
        assert(type(v111) == "table", "Expected state to be a table");
        local v112 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v110
        };
        v112 = l_Immutable_0.JoinDictionaries(v112, v111);
        v108:setRBXEventStream(v109, v107, v112);
    end)(v102, v103, v104, {
        vote = v105, 
        prevVote = v106
    });
end;
v41 = "openMore";
local l_v41_4 = v41 --[[ copy: 14 -> 23 ]];
v48 = function(v114, v115, v116, v117) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_4 (copy)
    assert(type(v115) == "string", "Expected eventContext to be a string");
    assert(type(v116) == "string", "Expected placeId to be a string");
    assert(type(v117) == "table", "Expected state to be a table");
    local v118 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v116
    };
    v118 = l_Immutable_0.JoinDictionaries(v118, v117);
    v114:setRBXEventStream(v115, l_v41_4, v118);
end;
local l_v48_4 = v48 --[[ copy: 13 -> 24 ]];
v40.OpenMore = function(v120, v121, v122, v123) --[[ Line: 52 ]]
    -- upvalues: l_v48_4 (copy)
    return l_v48_4(v120, v121, v122, v123 or {});
end;
v41 = "openGameDetailsPT";
local l_v41_5 = v41 --[[ copy: 14 -> 25 ]];
v48 = function(v125, v126, v127, v128) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_5 (copy)
    assert(type(v126) == "string", "Expected eventContext to be a string");
    assert(type(v127) == "string", "Expected placeId to be a string");
    assert(type(v128) == "table", "Expected state to be a table");
    local v129 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v127
    };
    v129 = l_Immutable_0.JoinDictionaries(v129, v128);
    v125:setRBXEventStream(v126, l_v41_5, v129);
end;
local l_v48_5 = v48 --[[ copy: 13 -> 26 ]];
v40.OpenPlayTogether = function(v131, v132, v133, v134) --[[ Line: 52 ]]
    -- upvalues: l_v48_5 (copy)
    return l_v48_5(v131, v132, v133, v134 or {});
end;
v41 = "createPrivateGame";
local l_v41_6 = v41 --[[ copy: 14 -> 27 ]];
v48 = function(v136, v137, v138, v139) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_6 (copy)
    assert(type(v137) == "string", "Expected eventContext to be a string");
    assert(type(v138) == "string", "Expected placeId to be a string");
    assert(type(v139) == "table", "Expected state to be a table");
    local v140 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v138
    };
    v140 = l_Immutable_0.JoinDictionaries(v140, v139);
    v136:setRBXEventStream(v137, l_v41_6, v140);
end;
local l_v48_6 = v48 --[[ copy: 13 -> 28 ]];
v40.CreatePrivateGame = function(v142, v143, v144, v145) --[[ Line: 52 ]]
    -- upvalues: l_v48_6 (copy)
    return l_v48_6(v142, v143, v144, v145 or {});
end;
v41 = "joinFriendsInGame";
local l_v41_7 = v41 --[[ copy: 14 -> 29 ]];
v48 = function(v147, v148, v149, v150) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_7 (copy)
    assert(type(v148) == "string", "Expected eventContext to be a string");
    assert(type(v149) == "string", "Expected placeId to be a string");
    assert(type(v150) == "table", "Expected state to be a table");
    local v151 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v149
    };
    v151 = l_Immutable_0.JoinDictionaries(v151, v150);
    v147:setRBXEventStream(v148, l_v41_7, v151);
end;
local l_v48_7 = v48 --[[ copy: 13 -> 30 ]];
v40.JoinFriendsInGame = function(v153, v154, v155, v156) --[[ Line: 52 ]]
    -- upvalues: l_v48_7 (copy)
    return l_v48_7(v153, v154, v155, v156 or {});
end;
v41 = "shareExperienceLink";
local l_v41_8 = v41 --[[ copy: 14 -> 31 ]];
v48 = function(v158, v159, v160, v161) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_8 (copy)
    assert(type(v159) == "string", "Expected eventContext to be a string");
    assert(type(v160) == "string", "Expected placeId to be a string");
    assert(type(v161) == "table", "Expected state to be a table");
    local v162 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v160
    };
    v162 = l_Immutable_0.JoinDictionaries(v162, v161);
    v158:setRBXEventStream(v159, l_v41_8, v162);
end;
local l_v48_8 = v48 --[[ copy: 13 -> 32 ]];
v40.ShareExperienceLink = function(v164, v165, v166, v167) --[[ Line: 52 ]]
    -- upvalues: l_v48_8 (copy)
    return l_v48_8(v164, v165, v166, v167 or {});
end;
v41 = "requestRefundClick";
local l_v41_9 = v41 --[[ copy: 14 -> 33 ]];
v48 = function(v169, v170, v171, v172) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_9 (copy)
    assert(type(v170) == "string", "Expected eventContext to be a string");
    assert(type(v171) == "string", "Expected placeId to be a string");
    assert(type(v172) == "table", "Expected state to be a table");
    local v173 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v171
    };
    v173 = l_Immutable_0.JoinDictionaries(v173, v172);
    v169:setRBXEventStream(v170, l_v41_9, v173);
end;
local l_v48_9 = v48 --[[ copy: 13 -> 34 ]];
v40.RequestRefundClick = function(v175, v176, v177, v178) --[[ Line: 52 ]]
    -- upvalues: l_v48_9 (copy)
    return l_v48_9(v175, v176, v177, v178 or {});
end;
v41 = "mediaGalleryActivated";
local l_v41_10 = v41 --[[ copy: 14 -> 35 ]];
v48 = function(v180, v181, v182, v183) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_10 (copy)
    assert(type(v181) == "string", "Expected eventContext to be a string");
    assert(type(v182) == "string", "Expected placeId to be a string");
    assert(type(v183) == "table", "Expected state to be a table");
    local v184 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v182
    };
    v184 = l_Immutable_0.JoinDictionaries(v184, v183);
    v180:setRBXEventStream(v181, l_v41_10, v184);
end;
local l_v48_10 = v48 --[[ copy: 13 -> 36 ]];
v40.MediaGalleryActivated = function(v186, v187, v188, v189) --[[ Line: 52 ]]
    -- upvalues: l_v48_10 (copy)
    return l_v48_10(v186, v187, v188, v189 or {});
end;
v41 = "mediaGallerySwiped";
local l_v41_11 = v41 --[[ copy: 14 -> 37 ]];
v48 = function(v191, v192, v193, v194) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_11 (copy)
    assert(type(v192) == "string", "Expected eventContext to be a string");
    assert(type(v193) == "string", "Expected placeId to be a string");
    assert(type(v194) == "table", "Expected state to be a table");
    local v195 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v193
    };
    v195 = l_Immutable_0.JoinDictionaries(v195, v194);
    v191:setRBXEventStream(v192, l_v41_11, v195);
end;
local l_v48_11 = v48 --[[ copy: 13 -> 38 ]];
v40.MediaGallerySwiped = function(v197, v198, v199, v200) --[[ Line: 52 ]]
    -- upvalues: l_v48_11 (copy)
    return l_v48_11(v197, v198, v199, v200 or {});
end;
local v201;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v41 = "mediaGalleryFullViewClosed";
    local l_v41_12 = v41 --[[ copy: 14 -> 47 ]];
    v48 = function(v203, v204, v205, v206) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_12 (copy)
        assert(type(v204) == "string", "Expected eventContext to be a string");
        assert(type(v205) == "string", "Expected placeId to be a string");
        assert(type(v206) == "table", "Expected state to be a table");
        local v207 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v205
        };
        v207 = l_Immutable_0.JoinDictionaries(v207, v206);
        v203:setRBXEventStream(v204, l_v41_12, v207);
    end;
    local l_v48_12 = v48 --[[ copy: 13 -> 48 ]];
    v201 = function(v209, v210, v211, v212) --[[ Line: 52 ]]
        -- upvalues: l_v48_12 (copy)
        return l_v48_12(v209, v210, v211, v212 or {});
    end;
else
    v201 = nil;
end;
v40.MediaGalleryClosed = v201;
if l_FFlagLuaAppDesktopMediaGalleryTelemetry_0 then
    v41 = "mediaGalleryMediaChanged";
    local l_v41_13 = v41 --[[ copy: 14 -> 45 ]];
    v48 = function(v214, v215, v216, v217) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_13 (copy)
        assert(type(v215) == "string", "Expected eventContext to be a string");
        assert(type(v216) == "string", "Expected placeId to be a string");
        assert(type(v217) == "table", "Expected state to be a table");
        local v218 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v216
        };
        v218 = l_Immutable_0.JoinDictionaries(v218, v217);
        v214:setRBXEventStream(v215, l_v41_13, v218);
    end;
    local l_v48_13 = v48 --[[ copy: 13 -> 46 ]];
    v201 = function(v220, v221, v222, v223) --[[ Line: 52 ]]
        -- upvalues: l_v48_13 (copy)
        return l_v48_13(v220, v221, v222, v223 or {});
    end;
else
    v201 = nil;
end;
v40.MediaGalleryMediaChanged = v201;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v41 = "mediaAccordionExpanded";
    local l_v41_14 = v41 --[[ copy: 14 -> 43 ]];
    v48 = function(v225, v226, v227, v228) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_14 (copy)
        assert(type(v226) == "string", "Expected eventContext to be a string");
        assert(type(v227) == "string", "Expected placeId to be a string");
        assert(type(v228) == "table", "Expected state to be a table");
        local v229 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v227
        };
        v229 = l_Immutable_0.JoinDictionaries(v229, v228);
        v225:setRBXEventStream(v226, l_v41_14, v229);
    end;
    local l_v48_14 = v48 --[[ copy: 13 -> 44 ]];
    v201 = function(v231, v232, v233, v234) --[[ Line: 52 ]]
        -- upvalues: l_v48_14 (copy)
        return l_v48_14(v231, v232, v233, v234 or {});
    end;
else
    v201 = nil;
end;
v40.MediaAccordionExpanded = v201;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v41 = "mediaAccordionCollapsed";
    local l_v41_15 = v41 --[[ copy: 14 -> 41 ]];
    v48 = function(v236, v237, v238, v239) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_15 (copy)
        assert(type(v237) == "string", "Expected eventContext to be a string");
        assert(type(v238) == "string", "Expected placeId to be a string");
        assert(type(v239) == "table", "Expected state to be a table");
        local v240 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v238
        };
        v240 = l_Immutable_0.JoinDictionaries(v240, v239);
        v236:setRBXEventStream(v237, l_v41_15, v240);
    end;
    local l_v48_15 = v48 --[[ copy: 13 -> 42 ]];
    v201 = function(v242, v243, v244, v245) --[[ Line: 52 ]]
        -- upvalues: l_v48_15 (copy)
        return l_v48_15(v242, v243, v244, v245 or {});
    end;
else
    v201 = nil;
end;
v40.MediaAccordionCollapsed = v201;
if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then
    v41 = "mediaGalleryEnterFullscreen";
    local l_v41_16 = v41 --[[ copy: 14 -> 39 ]];
    v48 = function(v247, v248, v249, v250) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v41_16 (copy)
        assert(type(v248) == "string", "Expected eventContext to be a string");
        assert(type(v249) == "string", "Expected placeId to be a string");
        assert(type(v250) == "table", "Expected state to be a table");
        local v251 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v249
        };
        v251 = l_Immutable_0.JoinDictionaries(v251, v250);
        v247:setRBXEventStream(v248, l_v41_16, v251);
    end;
    local l_v48_16 = v48 --[[ copy: 13 -> 40 ]];
    v201 = function(v253, v254, v255, v256) --[[ Line: 52 ]]
        -- upvalues: l_v48_16 (copy)
        return l_v48_16(v253, v254, v255, v256 or {});
    end;
else
    v201 = nil;
end;
v40.MediaGalleryEnterFullscreen = v201;
if l_FFlagLuaAppEdpMediaGalleryRedesignTelemetry_0 then
    v41 = "mediaGalleryExitFullscreen";
    v48 = function(v257, v258, v259, v260) --[[ Line: 16 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), v41 (copy)
        assert(type(v258) == "string", "Expected eventContext to be a string");
        assert(type(v259) == "string", "Expected placeId to be a string");
        assert(type(v260) == "table", "Expected state to be a table");
        local v261 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v259
        };
        v261 = l_Immutable_0.JoinDictionaries(v261, v260);
        v257:setRBXEventStream(v258, v41, v261);
    end;
    v201 = function(v262, v263, v264, v265) --[[ Line: 52 ]]
        -- upvalues: v48 (copy)
        return v48(v262, v263, v264, v265 or {});
    end;
else
    v201 = nil;
end;
v40.MediaGalleryExitFullscreen = v201;
return v40;