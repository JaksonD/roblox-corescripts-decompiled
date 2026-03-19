local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.CoreScriptsRoactCommon);
local l_createSignalMap_0 = v4.Utilities.createSignalMap;
local l_sortTableByValue_0 = v4.Utilities.sortTableByValue;
local v7 = require(script.Parent.createPlayerStore);
local v8 = require(script.Parent.createTeamStore);
local _ = require(script.Parent.LeaderboardStoreTypes);
local v10 = game:DefineFastFlag("FilterNewPlayerListValueStat", false);
local v11 = game:DefineFastFlag("PlayerListHideUnusedStats", false);
local l_FFlagPlayerListFixLeaderstatsStacking_0 = v2.FFlagPlayerListFixLeaderstatsStacking;
local v13 = game:DefineFastFlag("PlayerListSortByLowercaseUsername", false);
local v14 = {};
v14.__index = v14;
v14.new = function(v15, v16) --[[ Line: 54 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), v3 (copy), l_createSignalMap_0 (copy), v8 (copy)
    local v17 = setmetatable({
        _leaderboardConnections = {}
    }, v14);
    v17._teamStores = {};
    v17._playerStores = {};
    v17._teamsService = v15;
    v17._playersService = v16;
    local v18, v19 = v3.createSignal({});
    v17._getServerAddOrder = v18;
    v17._setServerAddOrder = v19;
    v17._serverAddOrderConnection = {};
    v17._serverInstanceAddedConnection = nil;
    v17._serverAddOrderEffectCleanup = nil;
    v17._gameStatMetadata = {};
    v17._topGameStatsOrder = l_createSignalMap_0();
    v17._topGameStatsOrderSetter = {};
    v17._topGameStatSortOrder = {};
    v17._gameStatsUsage = {};
    v17._virtualTeamList = l_createSignalMap_0();
    v17._teamStores.Neutral = v8("Neutral", v15);
    v18 = v17._teamStores.Neutral;
    v17._virtualTeamList.setData("Neutral", {
        name = v18.getName, 
        color = v18.getColor, 
        order = v18.getOrder, 
        stats = v18.getStats, 
        players = v18.getPlayers
    }, false);
    v17:_connectPlayers();
    v17:_connectTeams();
    v17:_updateServerAddOrder();
    return v17;
end;
v14.destroy = function(v20) --[[ Line: 105 ]] --[[ Name: destroy ]]
    for _, v22 in pairs(v20._serverAddOrderConnection) do
        if v22.Disconnect then
            v22:Disconnect();
        end;
    end;
    v20._serverAddOrderConnection = {};
    if v20._serverAddOrderEffectCleanup then
        v20._serverAddOrderEffectCleanup();
    end;
    if v20._serverInstanceAddedConnection then
        v20._serverInstanceAddedConnection:Disconnect();
    end;
    v20._serverInstanceAddedConnection = nil;
    for _, v24 in pairs(v20._leaderboardConnections) do
        if v24.Disconnect then
            v24:Disconnect();
        end;
    end;
    v20._leaderboardConnections = {};
    for _, v26 in pairs(v20._teamStores) do
        v26.destroy();
    end;
    v20._teamStores = {};
    for _, v28 in pairs(v20._playerStores) do
        v28.destroy();
    end;
    v20._playerStores = {};
end;
v14.getGameStatsList = function(v29) --[[ Line: 140 ]] --[[ Name: getGameStatsList ]]
    return v29._topGameStatsOrder;
end;
v14.getTeamList = function(v30) --[[ Line: 144 ]] --[[ Name: getTeamList ]]
    return v30._virtualTeamList;
end;
v14.getTeamPlayerList = function(v31, v32, _) --[[ Line: 148 ]] --[[ Name: getTeamPlayerList ]]
    -- upvalues: l_createSignalMap_0 (copy)
    local v34 = v31._teamStores[v32];
    if not v34 then
        return l_createSignalMap_0();
    else
        return v34.getPlayers;
    end;
end;
v14.getPlayerEntry = function(v35, v36, _) --[[ Line: 159 ]] --[[ Name: getPlayerEntry ]]
    local v38 = v35._playerStores[v36];
    if not v38 then
        return nil;
    else
        return v38.getPlayerEntry();
    end;
end;
v14._updateTeamStats = function(v39, v40, v41) --[[ Line: 170 ]] --[[ Name: _updateTeamStats ]]
    local v42 = v39._teamStores[v40];
    if v42 then
        v42.updateStat(v41, function(v43, v44, v45) --[[ Line: 173 ]]
            -- upvalues: v39 (copy)
            local v46 = v39._playerStores[v43];
            if v46 then
                return v46.getStatValue(v44, v45);
            else
                return nil;
            end;
        end);
    end;
end;
v14._removeTeamStats = function(v47, v48, v49) --[[ Line: 183 ]] --[[ Name: _removeTeamStats ]]
    local v50 = v47._teamStores[v48];
    if v50 then
        v50.removeStat(v49);
    end;
end;
v14._updateAllTeamStats = function(v51, v52) --[[ Line: 190 ]] --[[ Name: _updateAllTeamStats ]]
    for v53, _ in pairs(v51._teamStores) do
        v51:_updateTeamStats(v53, v52);
    end;
end;
v14._removeAllTeamStats = function(v55, v56) --[[ Line: 197 ]] --[[ Name: _removeAllTeamStats ]]
    for v57, _ in pairs(v55._teamStores) do
        v55:_removeTeamStats(v57, v56);
    end;
end;
v14._shouldSortPlayers = function(v59, _, v61) --[[ Line: 204 ]] --[[ Name: _shouldSortPlayers ]]
    if v61 then
        if v61 == v59._topGameStatSortOrder[1] and v59._gameStatMetadata[v61] and v59._gameStatMetadata[v61].isNumber then
            return true;
        elseif v59._gameStatMetadata[v61] and v59._gameStatMetadata[v61].priority == 1e999 then
            return true;
        elseif not v59._topGameStatSortOrder[1] and v59._gameStatMetadata[v61] and v59._gameStatMetadata[v61].isNumber then
            return true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
v14._sortPlayers = function(v62, v63, v64) --[[ Line: 233 ]] --[[ Name: _sortPlayers ]]
    -- upvalues: l_sortTableByValue_0 (copy)
    if not v62:_shouldSortPlayers(v63, v64) then
        return;
    else
        local v65 = v62._teamStores[v63];
        if not v65 then
            return;
        else
            local v66 = v65.getPlayers.getAllData(false);
            local v67 = l_sortTableByValue_0(v66, v62:_compareStatsValue(v62._topGameStatSortOrder));
            for v68, v69 in ipairs(v67) do
                local l_key_0 = v69.key;
                local v71 = v62._playerStores[l_key_0];
                if v71 then
                    v71.setOrder(v68);
                end;
            end;
            return;
        end;
    end;
end;
v14._compareStatsValue = function(v72, v73) --[[ Line: 266 ]] --[[ Name: _compareStatsValue ]]
    -- upvalues: v13 (copy)
    return function(v74, v75) --[[ Line: 267 ]]
        -- upvalues: v73 (copy), v72 (copy), v13 (ref)
        local v76 = v73[1];
        if v76 then
            local v77 = v72._playerStores[v74.key];
            local v78 = v72._playerStores[v75.key];
            if not v77 then
                return false;
            elseif not v78 then
                return true;
            else
                local v79 = v77.getPlayerEntry().stats.getData(v76, false);
                if v79 == nil then
                    return false;
                else
                    local v80 = v78.getPlayerEntry().stats.getData(v76, false);
                    if v80 == nil then
                        return true;
                    else
                        local v81 = v79(false);
                        local v82 = v80(false);
                        if typeof(v81) == typeof(v82) and v81 ~= v82 then
                            return v72:_compareRawStatsValue(v81, v82);
                        elseif not v13 then
                            return v74.key.Name < v75.key.Name;
                        end;
                    end;
                end;
            end;
        end;
        if v13 then
            return v74.key.Name:lower() < v75.key.Name:lower();
        else
            return v74.key.Name < v75.key.Name;
        end;
    end;
end;
v14._compareRawStatsValue = function(_, v84, v85) --[[ Line: 310 ]] --[[ Name: _compareRawStatsValue ]]
    if v84 ~= nil and v85 ~= nil then
        return v85 < v84;
    else
        return v85 ~= nil;
    end;
end;
local function _(v86) --[[ Line: 319 ]] --[[ Name: isGameStatValidNumber ]]
    return v86:IsA("NumberValue") or v86:IsA("IntValue") or v86:IsA("DoubleConstrainedValue") or v86:IsA("IntConstrainedValue");
end;
local function v90(v88, v89) --[[ Line: 326 ]] --[[ Name: compareGameStats ]]
    if v88.value.priority == nil and v89.value.priority == nil then
        return true;
    elseif v88.value.priority == nil then
        return v89.value.priority < 0;
    elseif v89.value.priority == nil then
        return v88.value.priority > 0;
    else
        return v88.value.priority > v89.value.priority;
    end;
end;
v14._updateGameStatsToShow = function(v91) --[[ Line: 339 ]] --[[ Name: _updateGameStatsToShow ]]
    -- upvalues: l_sortTableByValue_0 (copy), v90 (copy), v11 (copy), v3 (copy)
    local v92 = {};
    local v93 = l_sortTableByValue_0(v91._gameStatMetadata, v90);
    v91._topGameStatSortOrder = {};
    local v94 = 0;
    for v95, v96 in ipairs(v93) do
        if v94 < 4 then
            if not v11 or v91._gameStatMetadata[v96.key].isUsed then
                local l_key_1 = v96.key;
                v92[l_key_1] = v95;
                if v91._topGameStatsOrder.getData(l_key_1, false) == nil then
                    local v98, v99 = v3.createSignal(v95);
                    v91._topGameStatsOrder.setData(l_key_1, {
                        order = v98
                    }, false);
                    v91._topGameStatsOrderSetter[l_key_1] = v99;
                else
                    v91._topGameStatsOrderSetter[l_key_1](v95);
                end;
                table.insert(v91._topGameStatSortOrder, l_key_1);
                v94 = v94 + 1;
            end;
        else
            break;
        end;
    end;
    for v100, _ in pairs(v91._topGameStatsOrder.getAllData(false)) do
        if not v92[v100] then
            v91._topGameStatsOrder.removeData(v100, false);
            v91._topGameStatsOrderSetter[v100] = nil;
        end;
    end;
end;
v14._updateGameStatOrder = function(v102, v103, v104) --[[ Line: 386 ]] --[[ Name: _updateGameStatOrder ]]
    local v105 = v102._gameStatMetadata[v103.Name];
    local v106 = v104 or 0;
    if v105 then
        if v104 == nil then
            v102._gameStatMetadata[v103.Name].hasPriority = false;
        else
            v102._gameStatMetadata[v103.Name].hasPriority = true;
        end;
    end;
    if v105.priority ~= v106 then
        v102._gameStatMetadata[v103.Name].priority = v106;
        v102:_updateGameStatsToShow();
    end;
end;
v14._updateServerAddOrder = function(v107) --[[ Line: 403 ]] --[[ Name: _updateServerAddOrder ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v3 (copy), v10 (copy), v11 (copy)
    local v108 = {};
    v108 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
    l_RobloxReplicatedStorage_0:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function() --[[ Line: 409 ]]
        -- upvalues: v108 (ref), l_RobloxReplicatedStorage_0 (ref), v107 (copy)
        v108 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
        v107._setServerAddOrder(v108);
    end);
    local l_HttpService_0 = game:GetService("HttpService");
    local function v111(v110) --[[ Line: 418 ]] --[[ Name: decodeJSON ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONDecode(v110);
    end;
    local function _(v112) --[[ Line: 422 ]] --[[ Name: decodeAddOrder ]]
        -- upvalues: v111 (copy)
        local l_status_0, l_result_0 = pcall(v111, v112);
        return l_status_0 and l_result_0 or {};
    end;
    v107._serverInstanceAddedConnection = nil;
    local function v123(v116) --[[ Line: 429 ]] --[[ Name: childAdded ]]
        -- upvalues: v107 (copy), v108 (ref), v111 (copy)
        if v116.Name ~= "LeaderstatsOrder" then
            return;
        else
            if v107._serverInstanceAddedConnection then
                v107._serverInstanceAddedConnection:Disconnect();
            end;
            local l_Value_0 = v116.Value;
            local l_status_1, l_result_1 = pcall(v111, l_Value_0);
            v108 = l_status_1 and l_result_1 or {};
            v107._serverAddOrderConnection[v116] = v116.Changed:Connect(function(v120) --[[ Line: 437 ]]
                -- upvalues: v108 (ref), v111 (ref), v107 (ref)
                local l_status_2, l_result_2 = pcall(v111, v120);
                v108 = l_status_2 and l_result_2 or {};
                v107._setServerAddOrder(v108);
            end);
            return;
        end;
    end;
    v107._serverInstanceAddedConnection = l_RobloxReplicatedStorage_0.ChildAdded:Connect(v123);
    for _, v125 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
        v123(v125);
    end;
    v107._serverAddOrderEffectCleanup = v3.createEffect(function(v126) --[[ Line: 450 ]]
        -- upvalues: v107 (copy), v10 (ref), v11 (ref)
        local v127 = v107._getServerAddOrder(v126);
        local v128 = false;
        for v129, v130 in pairs(v127) do
            if not v10 or v130 ~= 0 then
                if v107._gameStatMetadata[v129] then
                    if v107._gameStatMetadata[v129].hasPriority ~= true then
                        v107._gameStatMetadata[v129].priority = v130 * -1;
                        v128 = true;
                    end;
                elseif not v11 then
                    v107._gameStatMetadata[v129] = {
                        priority = v130 * -1, 
                        hasPriority = false
                    };
                end;
            end;
        end;
        if v128 then
            v107:_updateGameStatsToShow();
        end;
    end);
end;
v14._updateGameStatPriority = function(v131, v132) --[[ Line: 483 ]] --[[ Name: _updateGameStatPriority ]]
    local v133 = nil;
    local l_Priority_0 = v132:FindFirstChild("Priority");
    if l_Priority_0 and (l_Priority_0:IsA("IntValue") or l_Priority_0:IsA("NumberValue")) then
        v133 = l_Priority_0.Value;
    end;
    local l_IsPrimary_0 = v132:FindFirstChild("IsPrimary");
    if l_IsPrimary_0 then
        if l_IsPrimary_0:IsA("BoolValue") then
            if l_IsPrimary_0.Value then
                v133 = 1e999;
            end;
        else
            v133 = 1e999;
        end;
    end;
    v131:_updateGameStatOrder(v132, v133);
end;
v14._addGameStat = function(v136, v137) --[[ Line: 503 ]] --[[ Name: _addGameStat ]]
    -- upvalues: v11 (copy)
    if v136._gameStatMetadata[v137.Name] == nil then
        v136._gameStatMetadata[v137.Name] = {};
    end;
    v136._gameStatMetadata[v137.Name].isNumber = v137:IsA("NumberValue") or v137:IsA("IntValue") or v137:IsA("DoubleConstrainedValue") or v137:IsA("IntConstrainedValue");
    v136:_updateGameStatPriority(v137);
    if v11 and not v136._gameStatMetadata[v137.Name].isUsed then
        v136._gameStatMetadata[v137.Name].isUsed = true;
        v136:_updateGameStatsToShow();
    end;
    v136._gameStatsUsage[v137.Name] = if v136._gameStatsUsage[v137.Name] then v136._gameStatsUsage[v137.Name] + 1 else 1;
    v136:_updateAllTeamStats(v137.Name);
end;
v14._removeGameStat = function(v138, v139) --[[ Line: 522 ]] --[[ Name: _removeGameStat ]]
    v138._gameStatsUsage[v139.Name] = if v138._gameStatsUsage[v139.Name] then v138._gameStatsUsage[v139.Name] - 1 else 0;
    if v138._gameStatsUsage[v139.Name] <= 0 then
        v138._gameStatsUsage[v139.Name] = nil;
        v138._topGameStatsOrder.removeData(v139.Name, false);
        v138._topGameStatsOrderSetter[v139.Name] = nil;
        v138._gameStatMetadata[v139.Name] = nil;
        v138:_updateGameStatsToShow();
        v138:_updateAllTeamStats(v139.Name);
        return;
    else
        v138:_updateGameStatPriority(v139);
        return;
    end;
end;
if l_FFlagPlayerListFixLeaderstatsStacking_0 then
    v14._checkGameStatsExist = function(v140) --[[ Line: 543 ]] --[[ Name: _checkGameStatsExist ]]
        local v141 = {};
        for v142, _ in v140._gameStatMetadata do
            v141[v142] = false;
        end;
        for v144, _ in v140._playerStores do
            local l_leaderstats_0 = v144:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                for v147, _ in v141 do
                    if l_leaderstats_0:FindFirstChild(v147) then
                        v141[v147] = true;
                    end;
                end;
            end;
        end;
        for v149, v150 in v141 do
            if not v150 then
                v140._gameStatsUsage[v149] = nil;
                v140._topGameStatsOrder.removeData(v149, false);
                v140._topGameStatsOrderSetter[v149] = nil;
                v140._gameStatMetadata[v149] = nil;
                v140:_updateGameStatsToShow();
                v140:_updateAllTeamStats(v149);
            end;
        end;
    end;
end;
v14._createPlayerStore = function(v151, v152) --[[ Line: 573 ]] --[[ Name: _createPlayerStore ]]
    -- upvalues: v7 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy)
    return v7(v152, function(v153) --[[ Line: 576 ]]
        -- upvalues: v151 (copy)
        v151:_addGameStat(v153);
    end, function(v154) --[[ Line: 579 ]]
        -- upvalues: v151 (copy)
        v151:_removeGameStat(v154);
    end, function(v155, v156) --[[ Line: 582 ]]
        -- upvalues: v151 (copy)
        v151:_updateTeamStats(v155, v156);
    end, function(v157, v158) --[[ Line: 585 ]]
        -- upvalues: v151 (copy)
        v151:_sortPlayers(v157, v158);
    end, l_FFlagPlayerListFixLeaderstatsStacking_0 and function() --[[ Line: 589 ]]
        -- upvalues: v151 (copy)
        v151:_checkGameStatsExist();
    end or nil);
end;
v14._createTeamStore = function(v159, v160) --[[ Line: 596 ]] --[[ Name: _createTeamStore ]]
    -- upvalues: v8 (copy)
    return v8(v160, v159._teamsService);
end;
v14._getOrCreateTeamStore = function(v161, v162) --[[ Line: 600 ]] --[[ Name: _getOrCreateTeamStore ]]
    local v163 = v161._teamStores[v162];
    if not v163 then
        v163 = v161:_createTeamStore(v162);
        v161._teamStores[v162] = v163;
        if v162 ~= "Neutral" then
            v161._virtualTeamList.setData(v162, {
                name = v163.getName, 
                color = v163.getColor, 
                order = v163.getOrder, 
                stats = v163.getStats, 
                players = v163.getPlayers
            }, false);
        end;
    end;
    return v163;
end;
v14._addPlayerStore = function(v164, v165) --[[ Line: 620 ]] --[[ Name: _addPlayerStore ]]
    if v164._playerStores[v165] then
        return;
    else
        local v166 = if v165.Team then v165.Team else "Neutral";
        v164:_getOrCreateTeamStore(v166).addPlayer(v165);
        local v167 = v164:_createPlayerStore(v165);
        v164._playerStores[v165] = v167;
        v164:_connectPlayerTeamChange(v165);
        v164:_sortPlayers(v166);
        return;
    end;
end;
v14._removePlayerStore = function(v168, v169) --[[ Line: 641 ]] --[[ Name: _removePlayerStore ]]
    local v170 = v168._playerStores[v169];
    if not v170 then
        return;
    else
        local v171 = v170.getTeam();
        local v172 = v168._teamStores[v171];
        if v172 then
            v172.removePlayer(v169);
        end;
        local v173 = "PlayerTeamChanged_" .. v169.Name;
        local v174 = v168._leaderboardConnections[v173];
        if v174 and v174.Disconnect then
            v174:Disconnect();
            v168._leaderboardConnections[v173] = nil;
        end;
        v170.destroy();
        v168._playerStores[v169] = nil;
        v168:_sortPlayers(v171);
        return;
    end;
end;
v14._connectPlayerTeamChange = function(v175, v176) --[[ Line: 670 ]] --[[ Name: _connectPlayerTeamChange ]]
    local v182 = v176.Changed:Connect(function(v177) --[[ Line: 671 ]]
        -- upvalues: v175 (copy), v176 (copy)
        if v177 == "Team" then
            local v178 = v175._playerStores[v176];
            if not v178 then
                return;
            else
                local v179 = v178.getTeam();
                local v180 = if v176.Team then v176.Team else "Neutral";
                local v181 = v175._teamStores[v179];
                if v181 then
                    v181.removePlayer(v176);
                end;
                v175:_getOrCreateTeamStore(v180).addPlayer(v176);
                v178.setTeam(v180);
                v175:_sortPlayers(v179);
                v175:_sortPlayers(v180);
            end;
        end;
    end);
    v175._leaderboardConnections["PlayerTeamChanged_" .. v176.Name] = v182;
end;
v14._addTeamStore = function(v183, v184) --[[ Line: 703 ]] --[[ Name: _addTeamStore ]]
    if v183._teamStores[v184] then
        return;
    else
        local v185 = v183:_createTeamStore(v184);
        v183._teamStores[v184] = v185;
        v183._virtualTeamList.setData(v184, {
            name = v185.getName, 
            color = v185.getColor, 
            order = v185.getOrder, 
            stats = v185.getStats, 
            players = v185.getPlayers
        }, false);
        return;
    end;
end;
v14._removeTeamStore = function(v186, v187) --[[ Line: 721 ]] --[[ Name: _removeTeamStore ]]
    local v188 = v186._teamStores[v187];
    if not v188 then
        return;
    else
        local v189 = v186:_getOrCreateTeamStore("Neutral");
        local v190 = v188.getPlayers.getAllData(false);
        for v191, _ in pairs(v190) do
            v188.removePlayer(v191);
            v189.addPlayer(v191);
            local v193 = v186._playerStores[v191];
            if v193 then
                v193.setTeam("Neutral");
            end;
        end;
        v188.destroy();
        v186._teamStores[v187] = nil;
        v186._virtualTeamList.removeData(v187, false);
        return;
    end;
end;
v14._connectTeams = function(v194) --[[ Line: 753 ]] --[[ Name: _connectTeams ]]
    local v196 = v194._teamsService.ChildAdded:Connect(function(v195) --[[ Line: 754 ]]
        -- upvalues: v194 (copy)
        if v195:IsA("Team") then
            v194:_addTeamStore(v195);
        end;
    end);
    v194._leaderboardConnections.TeamAdded = v196;
    local v198 = v194._teamsService.ChildRemoved:Connect(function(v197) --[[ Line: 761 ]]
        -- upvalues: v194 (copy)
        if v197:IsA("Team") then
            v194:_removeTeamStore(v197);
        end;
    end);
    v194._leaderboardConnections.TeamRemoved = v198;
    for _, v200 in pairs(v194._teamsService:GetTeams()) do
        v194:_addTeamStore(v200);
    end;
end;
v14._connectPlayers = function(v201) --[[ Line: 776 ]] --[[ Name: _connectPlayers ]]
    local v203 = v201._playersService.PlayerAdded:Connect(function(v202) --[[ Line: 777 ]]
        -- upvalues: v201 (copy)
        v201:_addPlayerStore(v202);
    end);
    v201._leaderboardConnections.PlayerAdded = v203;
    local v205 = v201._playersService.PlayerRemoving:Connect(function(v204) --[[ Line: 782 ]]
        -- upvalues: v201 (copy)
        v201:_removePlayerStore(v204);
    end);
    v201._leaderboardConnections.PlayerRemoving = v205;
    for _, v207 in pairs(v201._playersService:GetPlayers()) do
        v201:_addPlayerStore(v207);
    end;
end;
return v14;