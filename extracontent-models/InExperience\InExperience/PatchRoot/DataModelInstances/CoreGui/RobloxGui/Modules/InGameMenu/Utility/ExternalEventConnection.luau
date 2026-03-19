local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Roact;
local v2 = l_Roact_0.Component:extend("ExternalEventConnection");
v2.init = function(v3) --[[ Line: 12 ]] --[[ Name: init ]]
    v3.connection = nil;
end;
v2.render = function(v4) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    return l_Roact_0.oneChild(v4.props[l_Roact_0.Children]);
end;
v2.didMount = function(v5) --[[ Line: 33 ]] --[[ Name: didMount ]]
    v5.connection = v5.props.event:Connect(v5.props.callback);
end;
v2.didUpdate = function(v6, v7) --[[ Line: 40 ]] --[[ Name: didUpdate ]]
    if v6.props.event ~= v7.event or v6.props.callback ~= v7.callback then
        v6.connection:Disconnect();
        v6.connection = v6.props.event:Connect(v6.props.callback);
    end;
end;
v2.willUnmount = function(v8) --[[ Line: 48 ]] --[[ Name: willUnmount ]]
    if v8.connection then
        v8.connection:Disconnect();
        v8.connection = nil;
    end;
end;
return v2;