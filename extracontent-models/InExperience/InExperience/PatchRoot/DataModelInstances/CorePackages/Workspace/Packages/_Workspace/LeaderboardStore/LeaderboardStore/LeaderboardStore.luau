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
local v14 = game:DefineFastFlag("PlayerListSortByLowercaseDisplayName", false);
local v15 = {};
v15.__index = v15;
v15.new = function(v16, v17) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy), v3 (copy), l_createSignalMap_0 (copy), v8 (copy)
    local v18 = setmetatable({
        _leaderboardConnections = {}
    }, v15);
    v18._teamStores = {};
    v18._playerStores = {};
    v18._teamsService = v16;
    v18._playersService = v17;
    local v19, v20 = v3.createSignal({});
    v18._getServerAddOrder = v19;
    v18._setServerAddOrder = v20;
    v18._serverAddOrderConnection = {};
    v18._serverInstanceAddedConnection = nil;
    v18._serverAddOrderEffectCleanup = nil;
    v18._gameStatMetadata = {};
    v18._topGameStatsOrder = l_createSignalMap_0();
    v18._topGameStatsOrderSetter = {};
    v18._topGameStatSortOrder = {};
    v18._gameStatsUsage = {};
    v18._virtualTeamList = l_createSignalMap_0();
    v18._teamStores.Neutral = v8("Neutral", v16);
    v19 = v18._teamStores.Neutral;
    v18._virtualTeamList.setData("Neutral", {
        name = v19.getName, 
        color = v19.getColor, 
        order = v19.getOrder, 
        stats = v19.getStats, 
        players = v19.getPlayers
    }, false);
    v18:_connectPlayers();
    v18:_connectTeams();
    v18:_updateServerAddOrder();
    return v18;
end;
v15.destroy = function(v21) --[[ Line: 106 ]] --[[ Name: destroy ]]
    for _, v23 in pairs(v21._serverAddOrderConnection) do
        if v23.Disconnect then
            v23:Disconnect();
        end;
    end;
    v21._serverAddOrderConnection = {};
    if v21._serverAddOrderEffectCleanup then
        v21._serverAddOrderEffectCleanup();
    end;
    if v21._serverInstanceAddedConnection then
        v21._serverInstanceAddedConnection:Disconnect();
    end;
    v21._serverInstanceAddedConnection = nil;
    for _, v25 in pairs(v21._leaderboardConnections) do
        if v25.Disconnect then
            v25:Disconnect();
        end;
    end;
    v21._leaderboardConnections = {};
    for _, v27 in pairs(v21._teamStores) do
        v27.destroy();
    end;
    v21._teamStores = {};
    for _, v29 in pairs(v21._playerStores) do
        v29.destroy();
    end;
    v21._playerStores = {};
end;
v15.getGameStatsList = function(v30) --[[ Line: 141 ]] --[[ Name: getGameStatsList ]]
    return v30._topGameStatsOrder;
end;
v15.getTeamList = function(v31) --[[ Line: 145 ]] --[[ Name: getTeamList ]]
    return v31._virtualTeamList;
end;
v15.getTeamPlayerList = function(v32, v33, _) --[[ Line: 149 ]] --[[ Name: getTeamPlayerList ]]
    -- upvalues: l_createSignalMap_0 (copy)
    local v35 = v32._teamStores[v33];
    if not v35 then
        return l_createSignalMap_0();
    else
        return v35.getPlayers;
    end;
end;
v15.getPlayerEntry = function(v36, v37, _) --[[ Line: 160 ]] --[[ Name: getPlayerEntry ]]
    local v39 = v36._playerStores[v37];
    if not v39 then
        return nil;
    else
        return v39.getPlayerEntry();
    end;
end;
v15._updateTeamStats = function(v40, v41, v42) --[[ Line: 171 ]] --[[ Name: _updateTeamStats ]]
    local v43 = v40._teamStores[v41];
    if v43 then
        v43.updateStat(v42, function(v44, v45, v46) --[[ Line: 174 ]]
            -- upvalues: v40 (copy)
            local v47 = v40._playerStores[v44];
            if v47 then
                return v47.getStatValue(v45, v46);
            else
                return nil;
            end;
        end);
    end;
end;
v15._removeTeamStats = function(v48, v49, v50) --[[ Line: 184 ]] --[[ Name: _removeTeamStats ]]
    local v51 = v48._teamStores[v49];
    if v51 then
        v51.removeStat(v50);
    end;
end;
v15._updateAllTeamStats = function(v52, v53) --[[ Line: 191 ]] --[[ Name: _updateAllTeamStats ]]
    for v54, _ in pairs(v52._teamStores) do
        v52:_updateTeamStats(v54, v53);
    end;
end;
v15._removeAllTeamStats = function(v56, v57) --[[ Line: 198 ]] --[[ Name: _removeAllTeamStats ]]
    for v58, _ in pairs(v56._teamStores) do
        v56:_removeTeamStats(v58, v57);
    end;
end;
v15._shouldSortPlayers = function(v60, _, v62) --[[ Line: 205 ]] --[[ Name: _shouldSortPlayers ]]
    if v62 then
        if v62 == v60._topGameStatSortOrder[1] and v60._gameStatMetadata[v62] and v60._gameStatMetadata[v62].isNumber then
            return true;
        elseif v60._gameStatMetadata[v62] and v60._gameStatMetadata[v62].priority == 1e999 then
            return true;
        elseif not v60._topGameStatSortOrder[1] and v60._gameStatMetadata[v62] and v60._gameStatMetadata[v62].isNumber then
            return true;
        else
            return false;
        end;
    else
        return true;
    end;
end;
v15._sortPlayers = function(v63, v64, v65) --[[ Line: 234 ]] --[[ Name: _sortPlayers ]]
    -- upvalues: l_sortTableByValue_0 (copy)
    if not v63:_shouldSortPlayers(v64, v65) then
        return;
    else
        local v66 = v63._teamStores[v64];
        if not v66 then
            return;
        else
            local v67 = v66.getPlayers.getAllData(false);
            local v68 = l_sortTableByValue_0(v67, v63:_compareStatsValue(v63._topGameStatSortOrder));
            for v69, v70 in ipairs(v68) do
                local l_key_0 = v70.key;
                local v72 = v63._playerStores[l_key_0];
                if v72 then
                    v72.setOrder(v69);
                end;
            end;
            return;
        end;
    end;
end;
v15._compareStatsValue = function(v73, v74) --[[ Line: 267 ]] --[[ Name: _compareStatsValue ]]
    -- upvalues: v13 (copy), v14 (copy)
    return function(v75, v76) --[[ Line: 268 ]]
        -- upvalues: v74 (copy), v73 (copy), v13 (ref), v14 (ref)
        local v77 = v74[1];
        if v77 then
            local v78 = v73._playerStores[v75.key];
            local v79 = v73._playerStores[v76.key];
            if not v78 then
                return false;
            elseif not v79 then
                return true;
            else
                local v80 = v78.getPlayerEntry().stats.getData(v77, false);
                if v80 == nil then
                    return false;
                else
                    local v81 = v79.getPlayerEntry().stats.getData(v77, false);
                    if v81 == nil then
                        return true;
                    else
                        local v82 = v80(false);
                        local v83 = v81(false);
                        if typeof(v82) == typeof(v83) and v82 ~= v83 then
                            return v73:_compareRawStatsValue(v82, v83);
                        elseif not v13 then
                            return v75.key.Name < v76.key.Name;
                        end;
                    end;
                end;
            end;
        end;
        if v14 then
            return v75.key.DisplayName:lower() < v76.key.DisplayName:lower();
        elseif v13 then
            return v75.key.Name:lower() < v76.key.Name:lower();
        else
            return v75.key.Name < v76.key.Name;
        end;
    end;
end;
v15._compareRawStatsValue = function(_, v85, v86) --[[ Line: 313 ]] --[[ Name: _compareRawStatsValue ]]
    if v85 ~= nil and v86 ~= nil then
        return v86 < v85;
    else
        return v86 ~= nil;
    end;
end;
local function _(v87) --[[ Line: 322 ]] --[[ Name: isGameStatValidNumber ]]
    return v87:IsA("NumberValue") or v87:IsA("IntValue") or v87:IsA("DoubleConstrainedValue") or v87:IsA("IntConstrainedValue");
end;
local function v91(v89, v90) --[[ Line: 329 ]] --[[ Name: compareGameStats ]]
    if v89.value.priority == nil and v90.value.priority == nil then
        return true;
    elseif v89.value.priority == nil then
        return v90.value.priority < 0;
    elseif v90.value.priority == nil then
        return v89.value.priority > 0;
    else
        return v89.value.priority > v90.value.priority;
    end;
end;
v15._updateGameStatsToShow = function(v92) --[[ Line: 342 ]] --[[ Name: _updateGameStatsToShow ]]
    -- upvalues: l_sortTableByValue_0 (copy), v91 (copy), v11 (copy), v3 (copy)
    local v93 = {};
    local v94 = l_sortTableByValue_0(v92._gameStatMetadata, v91);
    v92._topGameStatSortOrder = {};
    local v95 = 0;
    for v96, v97 in ipairs(v94) do
        if v95 < 4 then
            if not v11 or v92._gameStatMetadata[v97.key].isUsed then
                local l_key_1 = v97.key;
                v93[l_key_1] = v96;
                if v92._topGameStatsOrder.getData(l_key_1, false) == nil then
                    local v99, v100 = v3.createSignal(v96);
                    v92._topGameStatsOrder.setData(l_key_1, {
                        order = v99
                    }, false);
                    v92._topGameStatsOrderSetter[l_key_1] = v100;
                else
                    v92._topGameStatsOrderSetter[l_key_1](v96);
                end;
                table.insert(v92._topGameStatSortOrder, l_key_1);
                v95 = v95 + 1;
            end;
        else
            break;
        end;
    end;
    for v101, _ in pairs(v92._topGameStatsOrder.getAllData(false)) do
        if not v93[v101] then
            v92._topGameStatsOrder.removeData(v101, false);
            v92._topGameStatsOrderSetter[v101] = nil;
        end;
    end;
end;
v15._updateGameStatOrder = function(v103, v104, v105) --[[ Line: 389 ]] --[[ Name: _updateGameStatOrder ]]
    local v106 = v103._gameStatMetadata[v104.Name];
    local v107 = v105 or 0;
    if v106 then
        if v105 == nil then
            v103._gameStatMetadata[v104.Name].hasPriority = false;
        else
            v103._gameStatMetadata[v104.Name].hasPriority = true;
        end;
    end;
    if v106.priority ~= v107 then
        v103._gameStatMetadata[v104.Name].priority = v107;
        v103:_updateGameStatsToShow();
    end;
end;
v15._updateServerAddOrder = function(v108) --[[ Line: 406 ]] --[[ Name: _updateServerAddOrder ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v3 (copy), v10 (copy), v11 (copy)
    local v109 = {};
    v109 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
    l_RobloxReplicatedStorage_0:GetAttributeChangedSignal("LeaderstatsOrder"):Connect(function() --[[ Line: 412 ]]
        -- upvalues: v109 (ref), l_RobloxReplicatedStorage_0 (ref), v108 (copy)
        v109 = l_RobloxReplicatedStorage_0:GetAttribute("LeaderstatsOrder") or {};
        v108._setServerAddOrder(v109);
    end);
    local l_HttpService_0 = game:GetService("HttpService");
    local function v112(v111) --[[ Line: 421 ]] --[[ Name: decodeJSON ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:JSONDecode(v111);
    end;
    local function _(v113) --[[ Line: 425 ]] --[[ Name: decodeAddOrder ]]
        -- upvalues: v112 (copy)
        local l_status_0, l_result_0 = pcall(v112, v113);
        return l_status_0 and l_result_0 or {};
    end;
    v108._serverInstanceAddedConnection = nil;
    local function v124(v117) --[[ Line: 432 ]] --[[ Name: childAdded ]]
        -- upvalues: v108 (copy), v109 (ref), v112 (copy)
        if v117.Name ~= "LeaderstatsOrder" then
            return;
        else
            if v108._serverInstanceAddedConnection then
                v108._serverInstanceAddedConnection:Disconnect();
            end;
            local l_Value_0 = v117.Value;
            local l_status_1, l_result_1 = pcall(v112, l_Value_0);
            v109 = l_status_1 and l_result_1 or {};
            v108._serverAddOrderConnection[v117] = v117.Changed:Connect(function(v121) --[[ Line: 440 ]]
                -- upvalues: v109 (ref), v112 (ref), v108 (ref)
                local l_status_2, l_result_2 = pcall(v112, v121);
                v109 = l_status_2 and l_result_2 or {};
                v108._setServerAddOrder(v109);
            end);
            return;
        end;
    end;
    v108._serverInstanceAddedConnection = l_RobloxReplicatedStorage_0.ChildAdded:Connect(v124);
    for _, v126 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
        v124(v126);
    end;
    v108._serverAddOrderEffectCleanup = v3.createEffect(function(v127) --[[ Line: 453 ]]
        -- upvalues: v108 (copy), v10 (ref), v11 (ref)
        local v128 = v108._getServerAddOrder(v127);
        local v129 = false;
        for v130, v131 in pairs(v128) do
            if not v10 or v131 ~= 0 then
                if v108._gameStatMetadata[v130] then
                    if v108._gameStatMetadata[v130].hasPriority ~= true then
                        v108._gameStatMetadata[v130].priority = v131 * -1;
                        v129 = true;
                    end;
                elseif not v11 then
                    v108._gameStatMetadata[v130] = {
                        priority = v131 * -1, 
                        hasPriority = false
                    };
                end;
            end;
        end;
        if v129 then
            v108:_updateGameStatsToShow();
        end;
    end);
end;
v15._updateGameStatPriority = function(v132, v133) --[[ Line: 486 ]] --[[ Name: _updateGameStatPriority ]]
    local v134 = nil;
    local l_Priority_0 = v133:FindFirstChild("Priority");
    if l_Priority_0 and (l_Priority_0:IsA("IntValue") or l_Priority_0:IsA("NumberValue")) then
        v134 = l_Priority_0.Value;
    end;
    local l_IsPrimary_0 = v133:FindFirstChild("IsPrimary");
    if l_IsPrimary_0 then
        if l_IsPrimary_0:IsA("BoolValue") then
            if l_IsPrimary_0.Value then
                v134 = 1e999;
            end;
        else
            v134 = 1e999;
        end;
    end;
    v132:_updateGameStatOrder(v133, v134);
end;
v15._addGameStat = function(v137, v138) --[[ Line: 506 ]] --[[ Name: _addGameStat ]]
    -- upvalues: v11 (copy)
    if v137._gameStatMetadata[v138.Name] == nil then
        v137._gameStatMetadata[v138.Name] = {};
    end;
    v137._gameStatMetadata[v138.Name].isNumber = v138:IsA("NumberValue") or v138:IsA("IntValue") or v138:IsA("DoubleConstrainedValue") or v138:IsA("IntConstrainedValue");
    v137:_updateGameStatPriority(v138);
    if v11 and not v137._gameStatMetadata[v138.Name].isUsed then
        v137._gameStatMetadata[v138.Name].isUsed = true;
        v137:_updateGameStatsToShow();
    end;
    v137._gameStatsUsage[v138.Name] = if v137._gameStatsUsage[v138.Name] then v137._gameStatsUsage[v138.Name] + 1 else 1;
    v137:_updateAllTeamStats(v138.Name);
end;
v15._removeGameStat = function(v139, v140) --[[ Line: 525 ]] --[[ Name: _removeGameStat ]]
    v139._gameStatsUsage[v140.Name] = if v139._gameStatsUsage[v140.Name] then v139._gameStatsUsage[v140.Name] - 1 else 0;
    if v139._gameStatsUsage[v140.Name] <= 0 then
        v139._gameStatsUsage[v140.Name] = nil;
        v139._topGameStatsOrder.removeData(v140.Name, false);
        v139._topGameStatsOrderSetter[v140.Name] = nil;
        v139._gameStatMetadata[v140.Name] = nil;
        v139:_updateGameStatsToShow();
        v139:_updateAllTeamStats(v140.Name);
        return;
    else
        v139:_updateGameStatPriority(v140);
        return;
    end;
end;
if l_FFlagPlayerListFixLeaderstatsStacking_0 then
    v15._checkGameStatsExist = function(v141) --[[ Line: 546 ]] --[[ Name: _checkGameStatsExist ]]
        local v142 = {};
        for v143, _ in v141._gameStatMetadata do
            v142[v143] = false;
        end;
        for v145, _ in v141._playerStores do
            local l_leaderstats_0 = v145:FindFirstChild("leaderstats");
            if l_leaderstats_0 then
                for v148, _ in v142 do
                    if l_leaderstats_0:FindFirstChild(v148) then
                        v142[v148] = true;
                    end;
                end;
            end;
        end;
        for v150, v151 in v142 do
            if not v151 then
                v141._gameStatsUsage[v150] = nil;
                v141._topGameStatsOrder.removeData(v150, false);
                v141._topGameStatsOrderSetter[v150] = nil;
                v141._gameStatMetadata[v150] = nil;
                v141:_updateGameStatsToShow();
                v141:_updateAllTeamStats(v150);
            end;
        end;
    end;
end;
v15._createPlayerStore = function(v152, v153) --[[ Line: 576 ]] --[[ Name: _createPlayerStore ]]
    -- upvalues: v7 (copy), l_FFlagPlayerListFixLeaderstatsStacking_0 (copy)
    return v7(v153, function(v154) --[[ Line: 579 ]]
        -- upvalues: v152 (copy)
        v152:_addGameStat(v154);
    end, function(v155) --[[ Line: 582 ]]
        -- upvalues: v152 (copy)
        v152:_removeGameStat(v155);
    end, function(v156, v157) --[[ Line: 585 ]]
        -- upvalues: v152 (copy)
        v152:_updateTeamStats(v156, v157);
    end, function(v158, v159) --[[ Line: 588 ]]
        -- upvalues: v152 (copy)
        v152:_sortPlayers(v158, v159);
    end, l_FFlagPlayerListFixLeaderstatsStacking_0 and function() --[[ Line: 592 ]]
        -- upvalues: v152 (copy)
        v152:_checkGameStatsExist();
    end or nil);
end;
v15._createTeamStore = function(v160, v161) --[[ Line: 599 ]] --[[ Name: _createTeamStore ]]
    -- upvalues: v8 (copy)
    return v8(v161, v160._teamsService);
end;
v15._getOrCreateTeamStore = function(v162, v163) --[[ Line: 603 ]] --[[ Name: _getOrCreateTeamStore ]]
    local v164 = v162._teamStores[v163];
    if not v164 then
        v164 = v162:_createTeamStore(v163);
        v162._teamStores[v163] = v164;
        if v163 ~= "Neutral" then
            v162._virtualTeamList.setData(v163, {
                name = v164.getName, 
                color = v164.getColor, 
                order = v164.getOrder, 
                stats = v164.getStats, 
                players = v164.getPlayers
            }, false);
        end;
    end;
    return v164;
end;
v15._addPlayerStore = function(v165, v166) --[[ Line: 623 ]] --[[ Name: _addPlayerStore ]]
    if v165._playerStores[v166] then
        return;
    else
        local v167 = if v166.Team then v166.Team else "Neutral";
        v165:_getOrCreateTeamStore(v167).addPlayer(v166);
        local v168 = v165:_createPlayerStore(v166);
        v165._playerStores[v166] = v168;
        v165:_connectPlayerTeamChange(v166);
        v165:_sortPlayers(v167);
        return;
    end;
end;
v15._removePlayerStore = function(v169, v170) --[[ Line: 644 ]] --[[ Name: _removePlayerStore ]]
    local v171 = v169._playerStores[v170];
    if not v171 then
        return;
    else
        local v172 = v171.getTeam();
        local v173 = v169._teamStores[v172];
        if v173 then
            v173.removePlayer(v170);
        end;
        local v174 = "PlayerTeamChanged_" .. v170.Name;
        local v175 = v169._leaderboardConnections[v174];
        if v175 and v175.Disconnect then
            v175:Disconnect();
            v169._leaderboardConnections[v174] = nil;
        end;
        v171.destroy();
        v169._playerStores[v170] = nil;
        v169:_sortPlayers(v172);
        return;
    end;
end;
v15._connectPlayerTeamChange = function(v176, v177) --[[ Line: 673 ]] --[[ Name: _connectPlayerTeamChange ]]
    local v183 = v177.Changed:Connect(function(v178) --[[ Line: 674 ]]
        -- upvalues: v176 (copy), v177 (copy)
        if v178 == "Team" then
            local v179 = v176._playerStores[v177];
            if not v179 then
                return;
            else
                local v180 = v179.getTeam();
                local v181 = if v177.Team then v177.Team else "Neutral";
                local v182 = v176._teamStores[v180];
                if v182 then
                    v182.removePlayer(v177);
                end;
                v176:_getOrCreateTeamStore(v181).addPlayer(v177);
                v179.setTeam(v181);
                v176:_sortPlayers(v180);
                v176:_sortPlayers(v181);
            end;
        end;
    end);
    v176._leaderboardConnections["PlayerTeamChanged_" .. v177.Name] = v183;
end;
v15._addTeamStore = function(v184, v185) --[[ Line: 706 ]] --[[ Name: _addTeamStore ]]
    if v184._teamStores[v185] then
        return;
    else
        local v186 = v184:_createTeamStore(v185);
        v184._teamStores[v185] = v186;
        v184._virtualTeamList.setData(v185, {
            name = v186.getName, 
            color = v186.getColor, 
            order = v186.getOrder, 
            stats = v186.getStats, 
            players = v186.getPlayers
        }, false);
        return;
    end;
end;
v15._removeTeamStore = function(v187, v188) --[[ Line: 724 ]] --[[ Name: _removeTeamStore ]]
    local v189 = v187._teamStores[v188];
    if not v189 then
        return;
    else
        local v190 = v187:_getOrCreateTeamStore("Neutral");
        local v191 = v189.getPlayers.getAllData(false);
        for v192, _ in pairs(v191) do
            v189.removePlayer(v192);
            v190.addPlayer(v192);
            local v194 = v187._playerStores[v192];
            if v194 then
                v194.setTeam("Neutral");
            end;
        end;
        v189.destroy();
        v187._teamStores[v188] = nil;
        v187._virtualTeamList.removeData(v188, false);
        return;
    end;
end;
v15._connectTeams = function(v195) --[[ Line: 756 ]] --[[ Name: _connectTeams ]]
    local v197 = v195._teamsService.ChildAdded:Connect(function(v196) --[[ Line: 757 ]]
        -- upvalues: v195 (copy)
        if v196:IsA("Team") then
            v195:_addTeamStore(v196);
        end;
    end);
    v195._leaderboardConnections.TeamAdded = v197;
    local v199 = v195._teamsService.ChildRemoved:Connect(function(v198) --[[ Line: 764 ]]
        -- upvalues: v195 (copy)
        if v198:IsA("Team") then
            v195:_removeTeamStore(v198);
        end;
    end);
    v195._leaderboardConnections.TeamRemoved = v199;
    for _, v201 in pairs(v195._teamsService:GetTeams()) do
        v195:_addTeamStore(v201);
    end;
end;
v15._connectPlayers = function(v202) --[[ Line: 779 ]] --[[ Name: _connectPlayers ]]
    local v204 = v202._playersService.PlayerAdded:Connect(function(v203) --[[ Line: 780 ]]
        -- upvalues: v202 (copy)
        v202:_addPlayerStore(v203);
    end);
    v202._leaderboardConnections.PlayerAdded = v204;
    local v206 = v202._playersService.PlayerRemoving:Connect(function(v205) --[[ Line: 785 ]]
        -- upvalues: v202 (copy)
        v202:_removePlayerStore(v205);
    end);
    v202._leaderboardConnections.PlayerRemoving = v206;
    for _, v208 in pairs(v202._playersService:GetPlayers()) do
        v202:_addPlayerStore(v208);
    end;
end;
return v15;