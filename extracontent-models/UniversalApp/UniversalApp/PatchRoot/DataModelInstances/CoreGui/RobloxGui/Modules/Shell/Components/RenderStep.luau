local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact).Component:extend("RenderStep");
v2.render = function(_) --[[ Line: 23 ]] --[[ Name: render ]]
    return nil;
end;
v2.didMount = function(v4) --[[ Line: 27 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0:BindToRenderStep(v4.props.name, v4.props.priority, v4.props.callback);
end;
v2.didUpdate = function(v5, v6) --[[ Line: 31 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_RunService_0 (copy)
    if v5.props.callback ~= v6.callback or v5.props.name ~= v6.name then
        l_RunService_0:UnbindFromRenderStep(v6.name);
        l_RunService_0:BindToRenderStep(v5.props.name, v5.props.priority, v5.props.callback);
    end;
end;
v2.willUnmount = function(v7) --[[ Line: 38 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_RunService_0 (copy)
    l_RunService_0:UnbindFromRenderStep(v7.props.name);
end;
return v2;