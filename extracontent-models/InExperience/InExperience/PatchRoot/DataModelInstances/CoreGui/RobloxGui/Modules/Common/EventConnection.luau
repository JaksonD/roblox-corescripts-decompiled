local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = v1.Component:extend("EventConnection");
v2.init = function(v3) --[[ Line: 11 ]] --[[ Name: init ]]
    v3.connection = nil;
end;
v2.render = function(v4) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.oneChild(v4.props[v1.Children]);
end;
v2.didMount = function(v5) --[[ Line: 32 ]] --[[ Name: didMount ]]
    v5.connection = v5.props.event:Connect(v5.props.callback);
end;
v2.didUpdate = function(v6, v7) --[[ Line: 39 ]] --[[ Name: didUpdate ]]
    if v6.props.event ~= v7.event or v6.props.callback ~= v7.callback then
        v6.connection:Disconnect();
        v6.connection = v6.props.event:Connect(v6.props.callback);
    end;
end;
v2.willUnmount = function(v8) --[[ Line: 47 ]] --[[ Name: willUnmount ]]
    if v8.connection then
        v8.connection:Disconnect();
        v8.connection = nil;
    end;
end;
return v2;