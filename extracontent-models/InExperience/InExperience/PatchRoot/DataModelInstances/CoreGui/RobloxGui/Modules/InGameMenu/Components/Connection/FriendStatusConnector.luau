local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetFriendStatus);
local v7 = require(l_Parent_0.Utility.ExternalEventConnection);
local v8 = l_Roact_0.PureComponent:extend("FriendStatusConnector");
v8.init = function(v9) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy)
    v9.state = {
        localPlayer = l_Players_0.LocalPlayer
    };
end;
v8.render = function(v10) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v7 (copy), l_Players_0 (copy)
    local v13 = {
        PlayerAdded = l_Roact_0.createElement(v7, {
            event = l_Players_0.PlayerAdded, 
            callback = function(v11) --[[ Line: 25 ]] --[[ Name: callback ]]
                -- upvalues: l_Players_0 (ref), v10 (copy)
                if v11 == l_Players_0.LocalPlayer then
                    v10:setState({
                        localPlayer = v11
                    });
                    return;
                else
                    v10.props.setFriendStatus(v11.UserId, Enum.FriendStatus.Unknown);
                    return;
                end;
            end
        }), 
        PlayerRemoving = l_Roact_0.createElement(v7, {
            event = l_Players_0.PlayerRemoving, 
            callback = function(v12) --[[ Line: 38 ]] --[[ Name: callback ]]
                -- upvalues: v10 (copy)
                v10.props.setFriendStatus(v12.UserId, nil);
            end
        })
    };
    if v10.state.localPlayer then
        v13.FriendStatusChanged = l_Roact_0.createElement(v7, {
            event = l_Players_0.LocalPlayer.FriendStatusChanged, 
            callback = function(v14, v15) --[[ Line: 47 ]] --[[ Name: callback ]]
                -- upvalues: v10 (copy)
                v10.props.setFriendStatus(v14.UserId, v15);
            end
        });
    end;
    return l_Roact_0.createFragment(v13);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16) --[[ Line: 56 ]]
    -- upvalues: v6 (copy)
    return {
        setFriendStatus = function(v17, v18) --[[ Line: 58 ]] --[[ Name: setFriendStatus ]]
            -- upvalues: v16 (copy), v6 (ref)
            return v16(v6(v17, v18));
        end
    };
end)(v8);