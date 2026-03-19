local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local v4 = l_Roact_0.PureComponent:extend("RootedConnection");
v4.validateProps = l_t_0.strictInterface({
    render = l_t_0.callback
});
v4.init = function(v5) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v5.state = {
        isRooted = false
    };
    v5.rootRef = l_Roact_0.createRef();
    v5.onAncestryChanged = function(v6) --[[ Line: 24 ]]
        -- upvalues: v5 (copy)
        if v6:IsDescendantOf(game) then
            v5:setState({
                isRooted = true
            });
        end;
    end;
end;
v4.render = function(v7) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.createFragment({
        Content = v7.props.render(v7.state.isRooted), 
        Folder = l_Roact_0.createElement("Folder", {
            [l_Roact_0.Event.AncestryChanged] = v7.onAncestryChanged, 
            [l_Roact_0.Ref] = v7.rootRef
        })
    });
end;
v4.didMount = function(v8) --[[ Line: 43 ]] --[[ Name: didMount ]]
    if v8.rootRef:getValue():IsDescendantOf(game) then
        v8:setState({
            isRooted = true
        });
    end;
end;
return v4;