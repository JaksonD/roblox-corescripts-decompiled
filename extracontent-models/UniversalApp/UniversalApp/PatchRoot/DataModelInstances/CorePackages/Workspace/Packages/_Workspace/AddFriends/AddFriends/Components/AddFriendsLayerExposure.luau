local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.Roact);
local _ = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactAppExperiment);
local l_getFStringSocialAddFriendsPageLayer_0 = require(l_Parent_0.SharedFlags).getFStringSocialAddFriendsPageLayer;
local v5 = v1.PureComponent:extend("AddFriendsLayerExposure");
v5.init = function(v6) --[[ Line: 19 ]] --[[ Name: init ]]
    v6.state = {
        layerExposedOnMount = false
    };
end;
v5.didMount = function(v7) --[[ Line: 25 ]] --[[ Name: didMount ]]
    v7:setState({
        layerExposedOnMount = true
    });
end;
v5.render = function(v8) --[[ Line: 31 ]] --[[ Name: render ]]
    if v8.state.layerExposedOnMount then
        return (v8.props.renderChild({}));
    else
        return nil;
    end;
end;
return v3.connectUserLayer({
    l_getFStringSocialAddFriendsPageLayer_0()
}, function(v9, _) --[[ Line: 37 ]]
    -- upvalues: l_getFStringSocialAddFriendsPageLayer_0 (copy)
    if not v9[l_getFStringSocialAddFriendsPageLayer_0()] then
        local _ = {};
    end;
    return {};
end)(v5);