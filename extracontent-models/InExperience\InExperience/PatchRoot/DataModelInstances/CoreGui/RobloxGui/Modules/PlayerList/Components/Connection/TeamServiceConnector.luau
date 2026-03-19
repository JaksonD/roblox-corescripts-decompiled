local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Actions.SetTeamName);
local v5 = require(l_Parent_0.Actions.SetTeamColor);
local v6 = require(l_Parent_0.Actions.AddPlayerToTeam);
local v7 = require(l_Parent_0.Actions.RemovePlayerFromTeam);
local v8 = require(l_Parent_0.Actions.AddTeam);
local v9 = require(l_Parent_0.Actions.RemoveTeam);
local v10 = require(script.Parent.EventConnection);
local v11 = v1.PureComponent:extend("TeamServiceConnector");
v11.init = function(v12) --[[ Line: 21 ]] --[[ Name: init ]]
    v12.state = {
        teams = game:FindService("Teams")
    };
end;
v11.didMount = function(v13) --[[ Line: 28 ]] --[[ Name: didMount ]]
    if v13.state.teams then
        for _, v15 in ipairs(v13.state.teams:GetTeams()) do
            v13.props.addTeam(v15);
            for _, v17 in ipairs(v15:GetPlayers()) do
                v13.props.addPlayerToTeam(v17, v15);
            end;
        end;
    end;
end;
v11.render = function(v18) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy)
    local v19 = {};
    local v20 = {};
    local v21 = {};
    for v22, v23 in ipairs(v18.props.teams) do
        v19[v22] = v1.createElement(v10, {
            event = v23.Changed, 
            callback = function(v24) --[[ Line: 47 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy), v23 (copy)
                if v24 == "Name" then
                    v18.props.setTeamName(v23);
                    return;
                else
                    if v24 == "TeamColor" then
                        v18.props.setTeamColor(v23);
                    end;
                    return;
                end;
            end
        });
        v20[v22] = v1.createElement(v10, {
            event = v23.PlayerAdded, 
            callback = function(v25) --[[ Line: 58 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy), v23 (copy)
                v18.props.addPlayerToTeam(v25, v23);
            end
        });
        v21[v22] = v1.createElement(v10, {
            event = v23.PlayerRemoved, 
            callback = function(v26) --[[ Line: 65 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy), v23 (copy)
                v18.props.removePlayerFromTeam(v26, v23);
            end
        });
    end;
    local l_teams_0 = v18.state.teams;
    return v1.createFragment({
        TeamChangedConnections = v1.createFragment(v19), 
        PlayerAddedConnections = v1.createFragment(v20), 
        PlayerRemovedConnections = v1.createFragment(v21), 
        ServiceAddedConnection = not l_teams_0 and v1.createElement(v10, {
            event = game.ChildAdded, 
            callback = function(v28) --[[ Line: 80 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                if v28:IsA("Teams") then
                    v18:setState({
                        teams = v28
                    });
                end;
            end
        }), 
        TeamAddedConnection = l_teams_0 and v1.createElement(v10, {
            event = l_teams_0.ChildAdded, 
            callback = function(v29) --[[ Line: 91 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                if v29:IsA("Team") then
                    v18.props.addTeam(v29);
                end;
            end
        }), 
        TeamRemovedConnection = l_teams_0 and v1.createElement(v10, {
            event = l_teams_0.ChildRemoved, 
            callback = function(v30) --[[ Line: 100 ]] --[[ Name: callback ]]
                -- upvalues: v18 (copy)
                if v30:IsA("Team") then
                    v18.props.removeTeam(v30);
                end;
            end
        })
    });
end;
v11.didUpdate = function(v31, v32, _) --[[ Line: 109 ]] --[[ Name: didUpdate ]]
    if v31.props.teams ~= v32.teams then
        local v34 = {};
        for _, v36 in ipairs(v32.teams) do
            v34[v36] = true;
        end;
        for _, v38 in ipairs(v31.props.teams) do
            if not v34[v38] then
                for _, v40 in ipairs(v38:GetPlayers()) do
                    v31.props.addPlayerToTeam(v40, v38);
                end;
            end;
        end;
    end;
end;
v11.willUnmount = function(v41) --[[ Line: 125 ]] --[[ Name: willUnmount ]]
    if v41.state.teams then
        for _, v43 in ipairs(v41.state.teams:GetTeams()) do
            v41.props.removeTeam(v43);
        end;
    end;
end;
return v2.connect(function(v44) --[[ Line: 133 ]] --[[ Name: mapStateToProps ]]
    return {
        teams = v44.teams
    };
end, function(v45) --[[ Line: 139 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
    return {
        setTeamName = function(v46) --[[ Line: 141 ]] --[[ Name: setTeamName ]]
            -- upvalues: v45 (copy), v4 (ref)
            return v45(v4(v46, v46.Name));
        end, 
        setTeamColor = function(v47) --[[ Line: 145 ]] --[[ Name: setTeamColor ]]
            -- upvalues: v45 (copy), v5 (ref)
            return v45(v5(v47, v47.TeamColor));
        end, 
        addPlayerToTeam = function(v48, v49) --[[ Line: 149 ]] --[[ Name: addPlayerToTeam ]]
            -- upvalues: v45 (copy), v6 (ref)
            return v45(v6(v48, v49));
        end, 
        removePlayerFromTeam = function(v50, v51) --[[ Line: 153 ]] --[[ Name: removePlayerFromTeam ]]
            -- upvalues: v45 (copy), v7 (ref)
            return v45(v7(v50, v51));
        end, 
        addTeam = function(v52) --[[ Line: 157 ]] --[[ Name: addTeam ]]
            -- upvalues: v45 (copy), v8 (ref)
            return v45(v8(v52));
        end, 
        removeTeam = function(v53) --[[ Line: 161 ]] --[[ Name: removeTeam ]]
            -- upvalues: v45 (copy), v9 (ref)
            return v45(v9(v53));
        end
    };
end)(v11);