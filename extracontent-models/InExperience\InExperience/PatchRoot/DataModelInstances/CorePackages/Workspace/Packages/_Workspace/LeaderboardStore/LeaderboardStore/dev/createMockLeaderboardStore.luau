local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local l_createSignalMap_0 = require(l_Parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap;
local _ = require(l_Parent_0.LeaderboardStoreTypes);
return function() --[[ Line: 19 ]] --[[ Name: createMockLeaderboardStore ]]
    -- upvalues: v2 (copy), l_createSignalMap_0 (copy)
    return function() --[[ Line: 20 ]]
        -- upvalues: v2 (ref), l_createSignalMap_0 (ref)
        Instance.new("Team").Name = "Neutral";
        local l_Team_0 = Instance.new("Team");
        l_Team_0.Name = "Team 1";
        local l_Team_1 = Instance.new("Team");
        l_Team_1.Name = "Team 2";
        local v7 = {
            Name = "player1", 
            Team = l_Team_0, 
            UserId = math.random(1, 1234567890), 
            leaderstats = {
                stat1 = {
                    Value = 100
                }, 
                stat2 = {
                    Value = 200
                }
            }
        };
        local v8 = {
            order = v2.createSignal(1), 
            stats = l_createSignalMap_0()
        };
        v8.stats.setData("stat1", v2.createSignal(v7.leaderstats.stat1.Value), false);
        v8.stats.setData("stat2", v2.createSignal(v7.leaderstats.stat2.Value), false);
        local v9 = {
            Name = "player2", 
            Team = l_Team_0, 
            leaderstats = {
                stat1 = {
                    Value = 30
                }, 
                stat2 = {
                    Value = 40
                }
            }
        };
        local v10 = {
            order = v2.createSignal(2), 
            stats = l_createSignalMap_0()
        };
        v10.stats.setData("stat1", v2.createSignal(v9.leaderstats.stat1.Value), false);
        v10.stats.setData("stat2", v2.createSignal(v9.leaderstats.stat2.Value), false);
        local v11 = {
            Name = "player3", 
            Team = l_Team_1, 
            UserId = math.random(1, 1234567890), 
            leaderstats = {
                stat1 = {
                    Value = 500
                }, 
                stat2 = {
                    Value = 600
                }
            }
        };
        local v12 = {
            order = v2.createSignal(1), 
            stats = l_createSignalMap_0()
        };
        v12.stats.setData("stat1", v2.createSignal(v11.leaderstats.stat1.Value), false);
        v12.stats.setData("stat2", v2.createSignal(v11.leaderstats.stat2.Value), false);
        local v13 = {
            Name = "player4", 
            Team = l_Team_1, 
            UserId = math.random(1, 1234567890), 
            leaderstats = {
                stat1 = {
                    Value = 70
                }, 
                stat2 = {
                    Value = 80
                }
            }
        };
        local v14 = {
            order = v2.createSignal(2), 
            stats = l_createSignalMap_0()
        };
        v14.stats.setData("stat1", v2.createSignal(v13.leaderstats.stat1.Value), false);
        v14.stats.setData("stat2", v2.createSignal(v13.leaderstats.stat2.Value), false);
        local v15 = {
            Name = "player5", 
            UserId = math.random(1, 1234567890), 
            leaderstats = {
                stat1 = {
                    Value = 90
                }, 
                stat2 = {
                    Value = 100
                }
            }
        };
        local v16 = {
            order = v2.createSignal(1), 
            stats = l_createSignalMap_0()
        };
        v16.stats.setData("stat1", v2.createSignal(v15.leaderstats.stat1.Value), false);
        v16.stats.setData("stat2", v2.createSignal(v15.leaderstats.stat2.Value), false);
        local v17 = l_createSignalMap_0();
        v17.setData(v7, v8, false);
        v17.setData(v9, v10, false);
        v17.setData(v11, v12, false);
        v17.setData(v13, v14, false);
        v17.setData(v15, v16, false);
        local v18 = l_createSignalMap_0();
        local v19 = l_createSignalMap_0();
        v19.setData("Neutral", {
            name = v2.createSignal("Neutral"), 
            color = v2.createSignal(Color3.fromRGB(0, 0, 0)), 
            order = v2.createSignal(1), 
            stats = l_createSignalMap_0(), 
            players = l_createSignalMap_0()
        }, false);
        local v20 = v19.getData("Neutral", false);
        v20.players.setData("player5", v15, false);
        v20.stats.setData("stat1", v2.createSignal(v15.leaderstats.stat1.Value), false);
        v20.stats.setData("stat2", v2.createSignal(v15.leaderstats.stat2.Value), false);
        v19.setData(l_Team_0, {
            name = v2.createSignal("Team 1"), 
            color = v2.createSignal(Color3.fromRGB(255, 0, 0)), 
            order = v2.createSignal(2), 
            stats = l_createSignalMap_0(), 
            players = l_createSignalMap_0()
        }, false);
        local v21 = v19.getData(l_Team_0, false);
        v21.players.setData("player1", v7, false);
        v21.players.setData("player2", v9, false);
        v21.stats.setData("stat1", v2.createSignal(v7.leaderstats.stat1.Value + v9.leaderstats.stat1.Value), false);
        v21.stats.setData("stat2", v2.createSignal(v7.leaderstats.stat2.Value + v9.leaderstats.stat2.Value), false);
        v19.setData(l_Team_1, {
            name = v2.createSignal("Team 2"), 
            color = v2.createSignal(Color3.fromRGB(0, 255, 0)), 
            order = v2.createSignal(3), 
            stats = l_createSignalMap_0(), 
            players = l_createSignalMap_0()
        }, false);
        local v22 = v19.getData(l_Team_1, false);
        v22.players.setData("player3", v11, false);
        v22.players.setData("player4", v13, false);
        v22.stats.setData("stat1", v2.createSignal(v11.leaderstats.stat1.Value + v13.leaderstats.stat1.Value), false);
        v22.stats.setData("stat2", v2.createSignal(v11.leaderstats.stat2.Value + v13.leaderstats.stat2.Value), false);
        local v23 = l_createSignalMap_0();
        v23.setData("Neutral", v19.getData("Neutral", false), false);
        v23.setData(l_Team_0, v19.getData(l_Team_0, false), false);
        v23.setData(l_Team_1, v19.getData(l_Team_1, false), false);
        return {
            getGameStatsList = function() --[[ Line: 206 ]] --[[ Name: getGameStatsList ]]
                -- upvalues: v18 (ref)
                return v18;
            end, 
            getTeamList = function() --[[ Line: 209 ]] --[[ Name: getTeamList ]]
                -- upvalues: v23 (ref)
                return v23;
            end, 
            getTeamPlayerList = function(v24, _) --[[ Line: 212 ]] --[[ Name: getTeamPlayerList ]]
                -- upvalues: v19 (ref)
                return v19.getData(v24, false).players;
            end, 
            getPlayerEntry = function(v26) --[[ Line: 216 ]] --[[ Name: getPlayerEntry ]]
                -- upvalues: v17 (ref)
                return (v17.getData(v26, false));
            end, 
            cleanUp = function() --[[ Line: 219 ]] --[[ Name: cleanUp ]]
                -- upvalues: v18 (ref), v23 (ref), v19 (ref), v17 (ref)
                v18 = nil;
                v23 = nil;
                v19 = nil;
                v17 = nil;
            end
        };
    end;
end;