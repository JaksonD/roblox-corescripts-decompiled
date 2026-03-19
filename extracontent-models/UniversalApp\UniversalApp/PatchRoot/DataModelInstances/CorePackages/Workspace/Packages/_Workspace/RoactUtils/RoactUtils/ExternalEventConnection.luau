local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    return v2.EventConnection;
else
    local v3 = require(l_Parent_0.Roact);
    local v4 = v3.Component:extend("ExternalEventConnection");
    v4.init = function(v5) --[[ Line: 17 ]] --[[ Name: init ]]
        v5.connection = nil;
    end;
    v4.render = function(v6) --[[ Line: 34 ]] --[[ Name: render ]]
        -- upvalues: v3 (copy)
        return v3.oneChild(v6.props[v3.Children]);
    end;
    v4.didMount = function(v7) --[[ Line: 38 ]] --[[ Name: didMount ]]
        v7.connection = v7.props.event:Connect(v7.props.callback);
    end;
    v4.didUpdate = function(v8, v9) --[[ Line: 45 ]] --[[ Name: didUpdate ]]
        if v8.props.event ~= v9.event or v8.props.callback ~= v9.callback then
            v8.connection:Disconnect();
            v8.connection = v8.props.event:Connect(v8.props.callback);
        end;
    end;
    v4.willUnmount = function(v10) --[[ Line: 53 ]] --[[ Name: willUnmount ]]
        if v10.connection then
            v10.connection:Disconnect();
            v10.connection = nil;
        end;
    end;
    return v4;
end;