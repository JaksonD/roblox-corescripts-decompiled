local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.MessageBus);
local v5 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local v10 = require(l_CorePackages_0.Packages.ReactUtils);
local v11 = require(l_Modules_0.LuaApp.ExperienceEventReceiver);
local l_AppRunService_0 = v9.AppRunService;
local l_AppUserInputService_0 = v9.AppUserInputService;
local l_MessageBus_0 = v4.MessageBus;
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_EventConnection_0 = v10.EventConnection;
local v17 = require(l_Modules_0.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsActionReport);
local v18 = require(l_Modules_0.LuaApp.Http.Requests.UserHeartbeats.PostUserHeartbeatsPulse);
local l_selectCurrentLegacyPage_0 = v5.Selectors.selectCurrentLegacyPage;
local l_selectCurrentLegacyRoute_0 = v5.Selectors.selectCurrentLegacyRoute;
game:DefineFastInt("UserHeartbeatsActionReportRolloutPerMyriad", 0);
game:DefineFastInt("UserHeartbeatsPulseRolloutPerMyriad", 0);
local v21 = game:DefineFastInt("UserHeartbeatsPulseIntervalSeconds", 30);
local v22 = game:DefineFastFlag("UserHeartbeatsInExperienceTracking", false);
local v23 = v6.Component:extend("UserHeartbeatsManager");
local v24 = {
    Invalid = 0, 
    Foregrounded = 1, 
    Backgrounded = 2, 
    Idle = 3, 
    InExperience = 4
};
local v25 = l_MessageBus_0.getMessageId("Realtime", "appResume");
local v26 = l_MessageBus_0.getMessageId("Realtime", "appStop");
local v28 = {
    mid = v25, 
    validateParams = function(_) --[[ Line: 54 ]] --[[ Name: validateParams ]]
        return true;
    end
};
local v30 = {
    mid = v26, 
    validateParams = function(_) --[[ Line: 61 ]] --[[ Name: validateParams ]]
        return true;
    end
};
v23.init = function(v31) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v22 (copy), l_MessageBus_0 (copy), v11 (copy), v17 (copy), v21 (copy), v18 (copy)
    v31._isMounted = false;
    v31._nextPulseTick = tick();
    v31.state = {
        activeState = v24.Foregrounded, 
        inExperience = not v22 and nil
    };
    v31._subscriber = l_MessageBus_0.Subscriber.new();
    v31._rollout = Random.new():NextInteger(1, 10000);
    v31._isActionReportEnabled = v31._rollout <= game:GetFastInt("UserHeartbeatsActionReportRolloutPerMyriad");
    v31._isPulseEnabled = v31._rollout <= game:GetFastInt("UserHeartbeatsPulseRolloutPerMyriad");
    v31._experienceEventReceiver = if v22 then v11.new() else nil;
    v31.onDataModelClose = function() --[[ Line: 85 ]]
        -- upvalues: v31 (copy), v17 (ref)
        if not v31._isMounted then
            return;
        elseif not v31._isActionReportEnabled then
            return;
        else
            local v32 = {
                logoutActionInfo = {}
            };
            v17(v31.props.networking, v32);
            return;
        end;
    end;
    v31.onBackgrounded = function() --[[ Line: 98 ]]
        -- upvalues: v31 (copy), v24 (ref)
        v31:setState({
            activeState = v24.Backgrounded
        });
    end;
    v31.onForegrounded = function() --[[ Line: 104 ]]
        -- upvalues: v31 (copy), v22 (ref), v24 (ref)
        v31:setState({
            activeState = if v22 and v31.state.inExperience then v24.InExperience else v24.Foregrounded
        });
    end;
    v31.heartbeatCallback = function() --[[ Line: 112 ]]
        -- upvalues: v31 (copy), v21 (ref), v18 (ref)
        if not v31._isPulseEnabled then
            return;
        elseif v21 <= 0 then
            return;
        else
            local v33 = tick();
            if v33 < v31._nextPulseTick then
                return;
            else
                v31._nextPulseTick = v33 + v21;
                local l_currentPage_0 = v31.props.currentPage;
                v18(v31.props.networking, v31.state.activeState, l_currentPage_0.name);
                return;
            end;
        end;
    end;
    v31.onExperienceJoin = function() --[[ Line: 132 ]]
        -- upvalues: v31 (copy), v24 (ref)
        v31:setState({
            activeState = v24.InExperience, 
            inExperience = true
        });
    end;
    v31.onExperienceLeave = function() --[[ Line: 139 ]]
        -- upvalues: v31 (copy), v24 (ref)
        v31:setState({
            activeState = v24.Foregrounded, 
            inExperience = false
        });
    end;
end;
v23.render = function(v35) --[[ Line: 147 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), l_EventConnection_0 (copy)
    local l_runService_0 = v35.props.runService;
    local l_userInputService_0 = v35.props.userInputService;
    return v6.createFragment({
        HeartbeatListener = v6.createElement(l_EventConnection_0, {
            callback = v35.heartbeatCallback, 
            event = l_runService_0.Heartbeat
        }), 
        WindowFocusedListener = v6.createElement(l_EventConnection_0, {
            callback = v35.onForegrounded, 
            event = l_userInputService_0.WindowFocused
        }), 
        WindowFocusLostListener = v6.createElement(l_EventConnection_0, {
            callback = v35.onBackgrounded, 
            event = l_userInputService_0.WindowFocusReleased
        })
    });
end;
v23.didMount = function(v38) --[[ Line: 167 ]] --[[ Name: didMount ]]
    -- upvalues: v28 (copy), v30 (copy), v22 (copy), l_RunService_0 (copy), v17 (copy)
    v38._isMounted = true;
    v38._subscriber:subscribe(v28, v38.onForegrounded);
    v38._subscriber:subscribe(v30, v38.onBackgrounded);
    if v22 then
        v38._onLaunchedConnection = v38._experienceEventReceiver:onLaunched(v38.onExperienceJoin);
        v38._onLeftConnection = v38._experienceEventReceiver:onLeft(v38.onExperienceLeave);
    end;
    if v38._isActionReportEnabled then
        if not l_RunService_0:IsStudio() then
            game:BindToClose(v38.onDataModelClose);
        end;
        local v39 = {
            loginActionInfo = {}
        };
        v17(v38.props.networking, v39);
    end;
end;
v23.didUpdate = function(v40, _, v42) --[[ Line: 190 ]] --[[ Name: didUpdate ]]
    -- upvalues: v17 (copy)
    if not v40._isActionReportEnabled then
        return;
    else
        if v42.activeState ~= v40.state.activeState then
            local v43 = {
                universalAppActiveStateChangeActionInfo = {
                    currentActiveState = v40.state.activeState, 
                    previousActiveState = v42.activeState
                }
            };
            v17(v40.props.networking, v43);
        end;
        return;
    end;
end;
v23.willUnmount = function(v44) --[[ Line: 206 ]] --[[ Name: willUnmount ]]
    -- upvalues: v22 (copy)
    v44._subscriber:unsubscribeFromAllMessages();
    if v22 then
        v44._onLaunchedConnection:disconnect();
        v44._onLeftConnection:disconnect();
        v44._experienceEventReceiver:UnsubscribeFromAllMessages();
    end;
    v44._isMounted = false;
end;
v23 = v7.connect(function(v45) --[[ Line: 218 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_selectCurrentLegacyPage_0 (copy), l_selectCurrentLegacyRoute_0 (copy)
    local v46 = l_selectCurrentLegacyPage_0(v45);
    local v47 = l_selectCurrentLegacyRoute_0(v45);
    return {
        currentPage = v46, 
        route = v47
    };
end, nil)(v23);
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    runService = l_AppRunService_0, 
    userInputService = l_AppUserInputService_0
})(v23);