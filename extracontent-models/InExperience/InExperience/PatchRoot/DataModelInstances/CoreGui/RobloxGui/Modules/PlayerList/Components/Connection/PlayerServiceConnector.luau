local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.AddPlayer);
local v7 = require(l_Parent_0.Actions.RemovePlayer);
local v8 = require(l_Parent_0.Thunks.MakePlayerInfoRequests);
local v9 = require(script.Parent.EventConnection);
local l_FFlagBadgeVisibilitySettingEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled;
local l_FFlagReplacePlayerIconRoduxWithSignal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal;
local v12 = game:DefineFastFlag("DeferPlayerInfoRequests", false);
local l_PlayerIconInfoStore_0 = require(l_CorePackages_0.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore;
local v14 = v3.PureComponent:extend("PlayerServiceConnector");
v14.didMount = function(v15) --[[ Line: 23 ]] --[[ Name: didMount ]]
    -- upvalues: l_Players_0 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), l_RobloxReplicatedStorage_0 (copy), v12 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    for _, v18 in ipairs(l_l_Players_0_Players_0) do
        v15.props.addPlayer(v18);
        v15.props.makePlayerInfoRequests(v18);
    end;
    if l_FFlagBadgeVisibilitySettingEnabled_0 then
        spawn(function() --[[ Line: 31 ]]
            -- upvalues: l_RobloxReplicatedStorage_0 (ref), v15 (copy), l_Players_0 (ref), v12 (ref)
            v15.sendPlayerProfileSettingsConnection = l_RobloxReplicatedStorage_0:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(v19) --[[ Line: 33 ]]
                -- upvalues: l_Players_0 (ref), v12 (ref), v15 (ref)
                local v20 = tonumber(v19);
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v20);
                if l_l_Players_0_PlayerByUserId_0 then
                    if v12 then
                        task.defer(function() --[[ Line: 38 ]]
                            -- upvalues: v15 (ref), l_l_Players_0_PlayerByUserId_0 (copy)
                            v15.props.makePlayerInfoRequests(l_l_Players_0_PlayerByUserId_0);
                        end);
                        return;
                    else
                        v15.props.makePlayerInfoRequests(l_l_Players_0_PlayerByUserId_0);
                    end;
                end;
            end);
        end);
    end;
end;
v14.render = function(v22) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy), l_Players_0 (copy)
    return v3.createFragment({
        PlayerAddedConnection = v3.createElement(v9, {
            event = l_Players_0.PlayerAdded, 
            callback = function(v23) --[[ Line: 54 ]] --[[ Name: callback ]]
                -- upvalues: v22 (copy)
                v22.props.addPlayer(v23);
                v22.props.makePlayerInfoRequests(v23);
            end
        }), 
        PlayerRemovingConnection = v3.createElement(v9, {
            event = l_Players_0.PlayerRemoving, 
            callback = function(v24) --[[ Line: 62 ]] --[[ Name: callback ]]
                -- upvalues: v22 (copy)
                v22.props.removePlayer(v24);
            end
        })
    });
end;
v14.willUnmount = function(v25) --[[ Line: 69 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_Players_0 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy)
    local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
    for _, v28 in ipairs(l_l_Players_0_Players_1) do
        v25.props.removePlayer(v28);
    end;
    if l_FFlagBadgeVisibilitySettingEnabled_0 and v25.sendPlayerProfileSettingsConnection then
        v25.sendPlayerProfileSettingsConnection:Disconnect();
    end;
end;
return v4.connect(nil, function(v29) --[[ Line: 80 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy), v8 (copy), l_FFlagReplacePlayerIconRoduxWithSignal_0 (copy), l_PlayerIconInfoStore_0 (copy), v7 (copy)
    return {
        addPlayer = function(v30) --[[ Line: 82 ]] --[[ Name: addPlayer ]]
            -- upvalues: v29 (copy), v6 (ref)
            return v29(v6(v30));
        end, 
        makePlayerInfoRequests = function(v31) --[[ Line: 86 ]] --[[ Name: makePlayerInfoRequests ]]
            -- upvalues: v29 (copy), v8 (ref)
            return v29(v8(v31));
        end, 
        removePlayer = function(v32) --[[ Line: 90 ]] --[[ Name: removePlayer ]]
            -- upvalues: l_FFlagReplacePlayerIconRoduxWithSignal_0 (ref), l_PlayerIconInfoStore_0 (ref), v29 (copy), v7 (ref)
            if l_FFlagReplacePlayerIconRoduxWithSignal_0 then
                l_PlayerIconInfoStore_0.removePlayer(v32.UserId);
            end;
            return v29(v7(v32));
        end
    };
end)(v14);