local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetPlayerFriendStatus);
local v6 = require(script.Parent.EventConnection);
local v7 = v2.PureComponent:extend("SocialConnector");
v7.didMount = function(v8) --[[ Line: 17 ]] --[[ Name: didMount ]]
    v8.mounted = true;
end;
v7.render = function(v9) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), l_Players_0 (copy)
    return v2.createFragment({
        FriendStatusChangedConnection = v2.createElement(v6, {
            event = l_Players_0.LocalPlayer.FriendStatusChanged, 
            callback = function(v10, v11) --[[ Line: 25 ]] --[[ Name: callback ]]
                -- upvalues: v9 (copy)
                v9.props.setPlayerFriendStatus(v10, v11);
            end
        })
    });
end;
v7.willUnmount = function(v12) --[[ Line: 32 ]] --[[ Name: willUnmount ]]
    v12.mounted = false;
end;
return v3.connect(nil, function(v13) --[[ Line: 36 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy)
    return {
        setPlayerFriendStatus = function(v14, v15) --[[ Line: 38 ]] --[[ Name: setPlayerFriendStatus ]]
            -- upvalues: v13 (copy), v5 (ref)
            return v13(v5(v14, v15));
        end
    };
end)(v7);