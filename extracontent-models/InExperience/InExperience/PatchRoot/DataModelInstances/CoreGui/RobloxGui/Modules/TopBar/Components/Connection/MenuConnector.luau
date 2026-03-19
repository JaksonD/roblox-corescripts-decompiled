local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.Common.PerfUtils);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.SetMenuOpen);
local v9 = require(l_Parent_0.Actions.SetRespawnBehaviour);
local v10 = require(l_Parent_0.Parent.Common.EventConnection);
local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = require(l_RobloxGui_1.Modules.isNewInGameMenuEnabled);
local v13 = require(l_RobloxGui_1.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger);
local l_FFlagTopBarSignalizeMenuOpen_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen;
local v15 = require(l_Parent_0.Flags.FFlagTopBarDeprecateRespawnRodux);
local v16 = v4.PureComponent:extend("MenuConnector");
v16.validateProps = v6.strictInterface({
    setMenuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v6.callback, 
    setRespawnBehaviour = v6.callback
});
v16.didMount = function(v17) --[[ Line: 38 ]] --[[ Name: didMount ]]
    -- upvalues: v12 (copy), l_RobloxGui_1 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy)
    if v12() then
        local v18 = require(l_RobloxGui_1.Modules.InGameMenuInit);
        if not l_FFlagTopBarSignalizeMenuOpen_0 then
            v17.props.setMenuOpen(v18.getOpen());
        end;
        local v19, v20 = v18.getRespawnBehaviour();
        v17.props.setRespawnBehaviour(v19, v20);
        return;
    else
        local v21 = require(l_RobloxGui_1.Modules.Settings.SettingsHub);
        if not l_FFlagTopBarSignalizeMenuOpen_0 then
            v17.props.setMenuOpen(v21:GetVisibility());
        end;
        local l_v21_RespawnBehaviour_0, v23 = v21:GetRespawnBehaviour();
        v17.props.setRespawnBehaviour(l_v21_RespawnBehaviour_0, v23);
        return;
    end;
end;
v16.render = function(v24) --[[ Line: 58 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), l_RobloxGui_1 (copy), v4 (copy), l_FFlagTopBarSignalizeMenuOpen_0 (copy), v10 (copy), v13 (copy), v3 (copy)
    if v12() then
        local v25 = require(l_RobloxGui_1.Modules.InGameMenuInit);
        local v26 = v25.getOpenChangedEvent();
        local v27 = nil;
        v27 = v25.getRespawnBehaviourChangedEvent();
        return v4.createFragment({
            MenuOpenChangedConnection = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v4.createElement(v10, {
                event = v26.Event, 
                callback = function(v28) --[[ Line: 70 ]] --[[ Name: callback ]]
                    -- upvalues: v24 (copy)
                    v24.props.setMenuOpen(v28);
                end
            }), 
            RespawnBehaviourConnection = v4.createElement(v10, {
                event = v27.Event, 
                callback = function(v29, v30) --[[ Line: 77 ]] --[[ Name: callback ]]
                    -- upvalues: v24 (copy)
                    v24.props.setRespawnBehaviour(v29, v30);
                end
            })
        });
    else
        local v31 = require(l_RobloxGui_1.Modules.Settings.SettingsHub);
        local l_SettingsShowEvent_0 = v31.SettingsShowEvent;
        local l_RespawnBehaviourChangedEvent_0 = v31.RespawnBehaviourChangedEvent;
        return v4.createFragment({
            MenuOpenChangedConnection = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else v4.createElement(v10, {
                event = l_SettingsShowEvent_0.Event, 
                callback = function(v34) --[[ Line: 91 ]] --[[ Name: callback ]]
                    -- upvalues: v13 (ref), v3 (ref), v24 (copy)
                    if v13() and v34 then
                        v3.menuOpenBegin();
                    end;
                    v24.props.setMenuOpen(v34);
                end
            }), 
            RespawnBehaviourConnection = v4.createElement(v10, {
                event = l_RespawnBehaviourChangedEvent_0.Event, 
                callback = function(v35, v36) --[[ Line: 101 ]] --[[ Name: callback ]]
                    -- upvalues: v24 (copy)
                    v24.props.setRespawnBehaviour(v35, v36);
                end
            })
        });
    end;
end;
return v5.UNSTABLE_connect2(nil, function(v37) --[[ Line: 109 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_FFlagTopBarSignalizeMenuOpen_0 (copy), v8 (copy), v15 (copy), v9 (copy)
    return {
        setMenuOpen = if l_FFlagTopBarSignalizeMenuOpen_0 then nil else function(v38) --[[ Line: 111 ]]
            -- upvalues: v37 (copy), v8 (ref)
            return v37(v8(v38));
        end, 
        setRespawnBehaviour = if v15 then nil else function(v39, v40) --[[ Line: 115 ]]
            -- upvalues: v37 (copy), v9 (ref)
            return v37(v9(v39, v40));
        end or nil
    };
end)(v16);