local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact).Component:extend("EventConnection");
v1.init = function(v2) --[[ Line: 7 ]] --[[ Name: init ]]
    v2.connection = nil;
end;
v1.didMount = function(v3) --[[ Line: 11 ]] --[[ Name: didMount ]]
    v3.connection = v3.props.event:Connect(v3.props.callback);
end;
v1.render = function(_) --[[ Line: 15 ]] --[[ Name: render ]]
    return nil;
end;
v1.didUpdate = function(v5, v6) --[[ Line: 19 ]] --[[ Name: didUpdate ]]
    if v5.props.event ~= v6.event or v5.props.callback ~= v6.callback then
        v5.connection:Disconnect();
        v5.connection = v5.props.event:Connect(v5.props.callback);
    end;
end;
v1.willUnmount = function(v7) --[[ Line: 27 ]] --[[ Name: willUnmount ]]
    if v7.connection then
        v7.connection:Disconnect();
        v7.connection = nil;
    end;
end;
return v1;