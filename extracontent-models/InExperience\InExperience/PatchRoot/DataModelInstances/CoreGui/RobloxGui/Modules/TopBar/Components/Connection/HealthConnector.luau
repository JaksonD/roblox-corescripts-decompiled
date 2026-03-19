local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local l_FFlagTopBarSignalizeHealthBar_0 = require(l_CorePackages_0.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar;
local v7 = require(l_Parent_0.Actions.SetIsDead);
local v8 = require(l_Parent_0.Actions.UpdateHealth);
local v9 = require(l_Parent_0.Parent.Common.EventConnection);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = v2.PureComponent:extend("HealthConnector");
v11.validateProps = v4.strictInterface({
    setIsDead = v4.callback, 
    updateHealth = v4.callback
});
v11.init = function(v12) --[[ Line: 34 ]] --[[ Name: init ]]
    v12:setState({
        character = nil, 
        humanoid = nil
    });
end;
v11.didMount = function(v13) --[[ Line: 41 ]] --[[ Name: didMount ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v15 = nil;
    if l_Character_0 then
        v15 = l_Character_0:FindFirstChildOfClass("Humanoid");
    end;
    v13:setState({
        character = l_Character_0, 
        humanoid = v15
    });
end;
v11.render = function(v16) --[[ Line: 54 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v9 (copy), l_LocalPlayer_0 (ref)
    local v17 = {};
    if v16.state.humanoid then
        v17.HealthChangedConnection = v2.createElement(v9, {
            event = v16.state.humanoid.HealthChanged, 
            callback = function(_) --[[ Line: 60 ]] --[[ Name: callback ]]
                -- upvalues: v16 (copy)
                v16.props.updateHealth(v16.state.humanoid.Health, v16.state.humanoid.MaxHealth);
            end
        });
        v17.HumanoidDiedConnection = v2.createElement(v9, {
            event = v16.state.humanoid.Died, 
            callback = function() --[[ Line: 67 ]] --[[ Name: callback ]]
                -- upvalues: v16 (copy)
                v16.props.setIsDead(true);
            end
        });
    elseif v16.state.character then
        v17.ChildAddedConnection = v2.createElement(v9, {
            event = v16.state.character.ChildAdded, 
            callback = function(v19) --[[ Line: 74 ]] --[[ Name: callback ]]
                -- upvalues: v16 (copy)
                if v19:IsA("Humanoid") then
                    v16:setState({
                        humanoid = v19
                    });
                end;
            end
        });
    end;
    v17.CharacterAddedConnection = v2.createElement(v9, {
        event = l_LocalPlayer_0.CharacterAdded, 
        callback = function(v20) --[[ Line: 86 ]] --[[ Name: callback ]]
            -- upvalues: v16 (copy), v2 (ref)
            v16:setState({
                humanoid = v20:FindFirstChildOfClass("Humanoid") or v2.None, 
                character = v20
            });
            v16.props.setIsDead(false);
        end
    });
    v17.CharacterRemovingConnection = v2.createElement(v9, {
        event = l_LocalPlayer_0.CharacterRemoving, 
        callback = function() --[[ Line: 97 ]] --[[ Name: callback ]]
            -- upvalues: v16 (copy), v2 (ref)
            v16:setState({
                humanoid = v2.None, 
                character = v2.None
            });
        end
    });
    return v2.createFragment(v17);
end;
v11.didUpdate = function(v21, _, v23) --[[ Line: 108 ]] --[[ Name: didUpdate ]]
    if v21.state.humanoid == nil then
        v21.props.updateHealth(0, 0);
    elseif v21.state.humanoid ~= v23.humanoid then
        v21.props.setIsDead(false);
        v21.props.updateHealth(v21.state.humanoid.Health, v21.state.humanoid.MaxHealth);
    end;
    if v21.state.character and v21.state.character ~= v23.character then
        local l_Humanoid_0 = v21.state.character:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_0 and l_Humanoid_0 ~= v21.state.humanoid then
            v21:setState({
                humanoid = l_Humanoid_0
            });
        end;
    end;
end;
local function v29(v25) --[[ Line: 126 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v7 (copy), v8 (copy)
    return {
        setIsDead = function(v26) --[[ Line: 128 ]] --[[ Name: setIsDead ]]
            -- upvalues: v25 (copy), v7 (ref)
            return v25(v7(v26));
        end, 
        updateHealth = function(v27, v28) --[[ Line: 132 ]] --[[ Name: updateHealth ]]
            -- upvalues: v25 (copy), v8 (ref)
            return v25(v8(v27, v28));
        end
    };
end;
return if l_FFlagTopBarSignalizeHealthBar_0 then nil else v3.UNSTABLE_connect2(nil, v29)(v11);