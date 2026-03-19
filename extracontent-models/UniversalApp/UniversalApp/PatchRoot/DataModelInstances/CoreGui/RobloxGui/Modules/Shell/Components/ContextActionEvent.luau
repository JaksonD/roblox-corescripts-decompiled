local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact).Component:extend("ContextActionEvent");
v2.render = function(_) --[[ Line: 29 ]] --[[ Name: render ]]
    return nil;
end;
v2.didMount = function(v4) --[[ Line: 33 ]] --[[ Name: didMount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v4.props.actionPriority then
        l_ContextActionService_0:BindCoreActionAtPriority(v4.props.name, v4.props.callback, false, 2000 + v4.props.actionPriority, unpack(v4.props.binds));
        return;
    else
        l_ContextActionService_0:BindCoreAction(v4.props.name, v4.props.callback, false, unpack(v4.props.binds));
        return;
    end;
end;
v2.didUpdate = function(v5, v6) --[[ Line: 41 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_ContextActionService_0 (copy)
    if v5.props.callback ~= v6.callback or v5.props.name ~= v6.name then
        l_ContextActionService_0:UnbindCoreAction(v6.name);
        if v5.props.actionPriority then
            l_ContextActionService_0:BindCoreActionAtPriority(v5.props.name, v5.props.callback, false, 2000 + v5.props.actionPriority, unpack(v5.props.binds));
            return;
        else
            l_ContextActionService_0:BindCoreAction(v5.props.name, v5.props.callback, false, unpack(v5.props.binds));
        end;
    end;
end;
v2.willUnmount = function(v7) --[[ Line: 52 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindCoreAction(v7.props.name);
end;
return v2;