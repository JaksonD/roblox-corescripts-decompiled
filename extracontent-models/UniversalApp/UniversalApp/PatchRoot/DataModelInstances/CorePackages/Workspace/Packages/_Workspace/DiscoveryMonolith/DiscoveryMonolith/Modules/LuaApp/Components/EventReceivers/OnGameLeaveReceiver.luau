local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v6 = require(l_Parent_0.t);
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_AppOmniRecommendationsRequest_0 = require(l_Parent_0.RoactServiceTags).AppOmniRecommendationsRequest;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v11 = require(l_Modules_0.LuaApp.Thunks.Games.FetchDataOnGameExit);
local v12 = v2.PureComponent:extend("OnGameLeaveReceiver");
v12.init = function(v13) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: l_MessageBus_0 (copy), v6 (copy)
    v13.returnedFromGame = function() --[[ Line: 19 ]]
        -- upvalues: v13 (copy)
        local l_networking_0 = v13.props.networking;
        local l_omniRecommendationsRequest_0 = v13.props.omniRecommendationsRequest;
        v13.props.fetchDataOnGameExit(l_networking_0, l_omniRecommendationsRequest_0, v13.props.loggingProtocol);
    end;
    v13.subscriber = l_MessageBus_0.Subscriber.new();
    v13.subscriber:subscribe({
        mid = l_MessageBus_0.getMessageId("Game", "onGameLeave"), 
        validateParams = v6.table
    }, function(_) --[[ Line: 29 ]]
        -- upvalues: v13 (copy)
        v13.returnedFromGame();
    end);
end;
v12.render = function(_) --[[ Line: 35 ]] --[[ Name: render ]]

end;
v12 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    omniRecommendationsRequest = l_AppOmniRecommendationsRequest_0, 
    loggingProtocol = l_AppLogging_0
})(v12);
return v3.connect(nil, function(v18) --[[ Line: 43 ]]
    -- upvalues: v11 (copy)
    return {
        fetchDataOnGameExit = function(v19, v20, v21) --[[ Line: 45 ]] --[[ Name: fetchDataOnGameExit ]]
            -- upvalues: v18 (copy), v11 (ref)
            v18(v11(v19, v20, v21));
        end
    };
end)(v12);