local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_BlockedStatusChangedEvent_0 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility):GetBlockedStatusChangedEvent();
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetPerformanceStatsVisible);
local v8 = require(l_Parent_0.Actions.SetPlayerIsBlocked);
local v9 = require(script.Parent.EventConnection);
local v10 = v2.PureComponent:extend("CoreGuiConnector");
v10.didMount = function(v11) --[[ Line: 22 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    v11.props.setPerformanceStatsVisible(l_UserGameSettings_0.PerformanceStatsVisible);
end;
v10.render = function(v12) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v9 (copy), l_UserGameSettings_0 (copy), l_BlockedStatusChangedEvent_0 (copy), l_Players_0 (copy)
    return v2.createFragment({
        PerformanceStatsChangedConnection = v2.createElement(v9, {
            event = l_UserGameSettings_0.PerformanceStatsVisibleChanged, 
            callback = function(v13) --[[ Line: 30 ]] --[[ Name: callback ]]
                -- upvalues: v12 (copy)
                v12.props.setPerformanceStatsVisible(v13);
            end
        }), 
        BlockedStatusChangedConnection = v2.createElement(v9, {
            event = l_BlockedStatusChangedEvent_0, 
            callback = function(v14, v15) --[[ Line: 37 ]] --[[ Name: callback ]]
                -- upvalues: l_Players_0 (ref), v12 (copy)
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v14);
                if l_l_Players_0_PlayerByUserId_0 then
                    v12.props.setPlayerIsBlocked(l_l_Players_0_PlayerByUserId_0, v15);
                end;
            end
        })
    });
end;
return v3.connect(nil, function(v17) --[[ Line: 47 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy), v8 (copy)
    return {
        setPerformanceStatsVisible = function(v18) --[[ Line: 49 ]] --[[ Name: setPerformanceStatsVisible ]]
            -- upvalues: v17 (copy), v7 (ref)
            return v17(v7(v18));
        end, 
        setPlayerIsBlocked = function(v19, v20) --[[ Line: 53 ]] --[[ Name: setPlayerIsBlocked ]]
            -- upvalues: v17 (copy), v8 (ref)
            return v17(v8(v19, v20));
        end
    };
end)(v10);