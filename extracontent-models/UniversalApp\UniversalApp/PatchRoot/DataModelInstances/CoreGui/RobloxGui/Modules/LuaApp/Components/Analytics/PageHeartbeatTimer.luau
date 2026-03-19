local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAppRouter);
local v5 = {
    2, 
    10
};
local v6 = v2.PureComponent:extend("PageHeartbeatTimer");
v6.init = function(v7) --[[ Line: 11 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v7.tasks = {};
    v7.createDelayedTask = function(v8, v9, v10, v11) --[[ Line: 14 ]]
        -- upvalues: v7 (copy)
        local v12 = false;
        (v7.props.mockTaskDelay and v7.props.mockTaskDelay or task.delay)(v8, function() --[[ Line: 17 ]]
            -- upvalues: v12 (ref), v11 (copy), v9 (copy), v10 (copy)
            if not v12 then
                v11(v9, v10);
            end;
        end);
        return function() --[[ Line: 22 ]]
            -- upvalues: v12 (ref)
            v12 = true;
        end;
    end;
    v7.cancelTasks = function() --[[ Line: 27 ]]
        -- upvalues: v7 (copy)
        for _, v14 in ipairs(v7.tasks) do
            if v14 ~= nil then
                v14();
            end;
        end;
        v7.tasks = {};
    end;
    v7.onPageChanged = function() --[[ Line: 36 ]]
        -- upvalues: v7 (copy), v5 (ref)
        local l_analytics_0 = v7.props.analytics;
        local l_currentPageGoal_0 = v7.props.currentPageGoal;
        v7.cancelTasks();
        for v17, v18 in ipairs(v5) do
            v7.tasks[v17] = v7.createDelayedTask(v18, v17, l_currentPageGoal_0, function(v19, v20) --[[ Line: 45 ]]
                -- upvalues: v7 (ref), l_analytics_0 (copy)
                if v7.props.currentPageGoal == v20 then
                    l_analytics_0.reportPageHeartbeat(v19, v20);
                end;
            end);
        end;
    end;
end;
v6.render = function(_) --[[ Line: 55 ]] --[[ Name: render ]]

end;
v6.didUpdate = function(v22) --[[ Line: 57 ]] --[[ Name: didUpdate ]]
    v22.onPageChanged();
end;
v6.didMount = function(v23) --[[ Line: 61 ]] --[[ Name: didMount ]]
    v23.onPageChanged();
end;
v6.willUnmount = function(v24) --[[ Line: 65 ]] --[[ Name: willUnmount ]]
    v24.cancelTasks();
end;
return l_RoactServices_0.connect({
    analytics = v4
})(v6);