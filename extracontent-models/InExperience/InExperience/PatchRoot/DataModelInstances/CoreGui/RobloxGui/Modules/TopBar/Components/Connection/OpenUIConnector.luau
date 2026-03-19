local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
    return nil;
else
    local v6 = require(l_Parent_0.Actions.SetBackpackOpen);
    local v7 = require(l_Parent_0.Actions.SetEmotesOpen);
    local v8 = require(l_Parent_0.Actions.SetLeaderboardOpen);
    local v9 = require(l_Parent_0.Actions.SetEmotesEnabled);
    local v10 = require(l_Parent_0.Parent.Common.EventConnection);
    local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
    local v12 = require(l_RobloxGui_0.Modules.BackpackScript);
    local v13 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
    local v14 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
    local v15 = v2.PureComponent:extend("OpenUIConnector");
    v15.validateProps = v4.strictInterface({
        setBackpackOpen = v4.callback, 
        setEmotesOpen = v4.callback, 
        setLeaderboardOpen = v4.callback, 
        setEmotesEnabled = v4.callback
    });
    v15.didMount = function(v16) --[[ Line: 40 ]] --[[ Name: didMount ]]
        -- upvalues: v14 (copy), v12 (copy), v13 (copy)
        v16.props.setLeaderboardOpen(v14:GetSetVisible());
        v16.props.setBackpackOpen(v12.IsOpen);
        v16.props.setEmotesOpen(v13:isOpen());
        v16.props.setEmotesEnabled(v13.MenuIsVisible);
    end;
    v15.render = function(v17) --[[ Line: 48 ]] --[[ Name: render ]]
        -- upvalues: v14 (copy), v2 (copy), v10 (copy), v12 (copy), v13 (copy)
        local l_v14_SetVisibleChangedEvent_0 = v14:GetSetVisibleChangedEvent();
        return v2.createFragment({
            LeaderboardOpenChangedConnection = v2.createElement(v10, {
                event = l_v14_SetVisibleChangedEvent_0.Event, 
                callback = function(v19) --[[ Line: 54 ]] --[[ Name: callback ]]
                    -- upvalues: v17 (copy)
                    v17.props.setLeaderboardOpen(v19);
                end
            }), 
            BackpackOpenChangedConnection = v2.createElement(v10, {
                event = v12.StateChanged.Event, 
                callback = function(v20) --[[ Line: 61 ]] --[[ Name: callback ]]
                    -- upvalues: v17 (copy)
                    v17.props.setBackpackOpen(v20);
                end
            }), 
            EmotesOpenChangedConnection = v2.createElement(v10, {
                event = v13.EmotesMenuToggled.Event, 
                callback = function(v21) --[[ Line: 68 ]] --[[ Name: callback ]]
                    -- upvalues: v17 (copy)
                    v17.props.setEmotesOpen(v21);
                end
            }), 
            EmotesEnabledChangedConnection = v2.createElement(v10, {
                event = v13.MenuVisibilityChanged.Event, 
                callback = function(v22) --[[ Line: 75 ]] --[[ Name: callback ]]
                    -- upvalues: v17 (copy)
                    v17.props.setEmotesEnabled(v22);
                end
            })
        });
    end;
    return v3.UNSTABLE_connect2(nil, function(v23) --[[ Line: 82 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v9 (copy)
        return {
            setBackpackOpen = function(v24) --[[ Line: 84 ]] --[[ Name: setBackpackOpen ]]
                -- upvalues: v23 (copy), v6 (ref)
                return v23(v6(v24));
            end, 
            setEmotesOpen = function(v25) --[[ Line: 88 ]] --[[ Name: setEmotesOpen ]]
                -- upvalues: v23 (copy), v7 (ref)
                return v23(v7(v25));
            end, 
            setLeaderboardOpen = function(v26) --[[ Line: 92 ]] --[[ Name: setLeaderboardOpen ]]
                -- upvalues: v23 (copy), v8 (ref)
                return v23(v8(v26));
            end, 
            setEmotesEnabled = function(v27) --[[ Line: 96 ]] --[[ Name: setEmotesEnabled ]]
                -- upvalues: v23 (copy), v9 (ref)
                return v23(v9(v27));
            end
        };
    end)(v15);
end;