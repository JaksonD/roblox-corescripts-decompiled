local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent;
local v9 = require(l_Parent_0.PlayerListDisplay);
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v11 = require(l_Parent_1.GetFakeNeutralTeam);
local v12 = require(l_Parent_1.PlayerSorting);
local v13 = v2.PureComponent:extend("PlayerListSorter");
v13.init = function(v14) --[[ Line: 23 ]] --[[ Name: init ]]
    v14.state = {
        sortedPlayers = {}, 
        playerKeys = {}
    };
end;
local function _(v15, v16) --[[ Line: 30 ]] --[[ Name: playerInTeam ]]
    if v16 == nil then
        return v15.Team == nil;
    else
        return v15.TeamColor == v16.TeamColor;
    end;
end;
local function v28(v18, v19, v20, v21) --[[ Line: 37 ]] --[[ Name: getTeamScores ]]
    local v22 = {};
    for _, v24 in ipairs(v18) do
        for _, v26 in ipairs(v19) do
            if if v21 == nil then v26.Team == nil else v26.TeamColor == v21.TeamColor then
                local v27 = v20[v26.UserId][v24.name];
                if type(v27) == "number" then
                    v22[v24.name] = v22[v24.name] or 0;
                    v22[v24.name] = v22[v24.name] + v27;
                end;
            end;
        end;
    end;
    return v22;
end;
local function v36(v29, v30, v31, v32) --[[ Line: 53 ]] --[[ Name: buildTeamScores ]]
    -- upvalues: v28 (copy), v11 (copy)
    local v33 = {};
    for _, v35 in ipairs(v30) do
        v33[v35] = v28(v29, v31, v32, v35);
    end;
    v33[v11] = v28(v29, v31, v32, nil);
    return v33;
end;
local _ = function(v37) --[[ Line: 62 ]] --[[ Name: shouldShowNeutralTeam ]]
    for _, v39 in ipairs(v37) do
        if v39.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v51(_, _, v43, v44) --[[ Line: 71 ]] --[[ Name: buildSortedTeams ]]
    -- upvalues: v11 (copy)
    local v45 = {};
    local v46 = {};
    for _, v48 in ipairs(v43) do
        if v46[v48.TeamColor.Number] == nil then
            v46[v48.TeamColor.Number] = true;
            v45[#v45 + 1] = {
                team = v48, 
                originalPos = v48.ChildOrder
            };
        end;
    end;
    if v44 then
        v45[#v45 + 1] = {
            team = v11, 
            originalPos = #v45 + 1
        };
    end;
    table.sort(v45, function(v49, v50) --[[ Line: 91 ]]
        -- upvalues: v11 (ref)
        if v49.team == v11 then
            return false;
        elseif v50.team == v11 then
            return true;
        else
            return v49.originalPos < v50.originalPos;
        end;
    end);
    return v45;
end;
v13.validateProps = v5.strictInterface({
    screenSizeY = v5.number, 
    entrySize = v5.number, 
    players = v5.array(v7), 
    teams = v5.array(v5.instanceIsA("Team")), 
    playerTeam = v5.map(v5.integer, v5.instanceIsA("Team")), 
    playerKeys = v5.strictInterface({
        keys = v5.map(v7, v5.strictInterface({
            name = v5.string, 
            stat = v5.union(v5.number, v5.string, v5.none)
        })), 
        primaryStat = v5.optional(v5.string)
    }), 
    playerStats = v5.map(v5.integer, v5.map(v5.string, v5.any)), 
    gameStats = v5.array(v5.strictInterface({
        name = v5.string, 
        text = v5.string, 
        addId = v5.integer, 
        serverAddId = v5.integer, 
        isPrimary = v5.boolean, 
        priority = v5.number
    }))
});
v13.render = function(v52) --[[ Line: 133 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v36 (copy), v51 (copy), v2 (copy), v9 (copy)
    local v53 = false;
    local v54 = v52.props.gameStats[1] and v52.props.gameStats[1].name or nil;
    local l_sortedPlayers_0 = v52.state.sortedPlayers;
    if not v4.isEmpty(v52.props.teams) then
        local v56 = v36(v52.props.gameStats, v52.props.teams, v52.props.players, v52.props.playerStats);
        local l_players_0 = v52.props.players;
        local v58;
        for _, v60 in ipairs(l_players_0) do
            if v60.Team == nil then
                v58 = true;
                v53 = true;
            end;
            if v53 then
                break;
            end;
        end;
        if not v53 then
            v58 = false;
        end;
        v53 = false;
        l_players_0 = v51(v56, v54, v52.props.teams, v58);
        local v61 = {};
        for _, v63 in ipairs(l_sortedPlayers_0) do
            if v63.TeamColor and v52.props.playerTeam[v63.UserId] ~= nil then
                if v61[v63.TeamColor.Number] then
                    table.insert(v61[v63.TeamColor.Number], v63);
                else
                    v61[v63.TeamColor.Number] = {
                        v63
                    };
                end;
            end;
        end;
        return v2.createElement(v9, {
            sortedPlayers = l_sortedPlayers_0, 
            sortedTeams = l_players_0, 
            teamColorToPlayerMap = v61, 
            teamScores = v56, 
            screenSizeY = v52.props.screenSizeY, 
            entrySize = v52.props.entrySize
        });
    else
        return v2.createElement(v9, {
            sortedPlayers = l_sortedPlayers_0, 
            sortedTeams = nil, 
            teamColorToPlayerMap = nil, 
            teamScores = nil, 
            screenSizeY = v52.props.screenSizeY, 
            entrySize = v52.props.entrySize
        });
    end;
end;
v13.getDerivedStateFromProps = v12.getDerivedStateFromProps;
return v3.connect(function(v64) --[[ Line: 180 ]] --[[ Name: mapStateToProps ]]
    return {
        gameStats = v64.gameStats, 
        teams = v64.teams, 
        players = v64.players, 
        playerKeys = v64.playerKeys, 
        playerStats = v64.playerStats, 
        playerTeam = v64.playerTeam
    };
end, nil)(v13);