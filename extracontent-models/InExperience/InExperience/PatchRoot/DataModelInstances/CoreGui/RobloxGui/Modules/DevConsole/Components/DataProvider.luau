local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Components_0 = script.Parent.Parent.Components;
local v4 = require(l_Components_0.Log.LogData);
local v5 = require(l_Components_0.Memory.ClientMemoryData);
local v6 = require(l_Components_0.Memory.ServerMemoryData);
local v7 = require(l_Components_0.Network.NetworkData);
local v8 = require(l_Components_0.Scripts.ServerScriptsData);
local v9 = require(l_Components_0.DataStores.DataStoresData);
local v10 = require(l_Components_0.ServerStats.ServerStatsData);
local v11 = require(l_Components_0.ActionBindings.ActionBindingsData);
local v12 = require(l_Components_0.ServerJobs.ServerJobsData);
local v13 = require(l_Components_0.DebugVisualizations.DebugVisualizationsData);
local v14 = require(l_Components_0.LuauHeap.LuauHeapData);
local v15 = require(l_Components_0.VoiceChat.VoiceChatData);
local v16 = require(l_Components_0.DataContext);
local v17 = v1.Component:extend("DataProvider");
local l_game_EngineFeature_0 = game:GetEngineFeature("VoiceChatDevConsoleTabEnabled");
v17.init = function(v19) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v15 (copy)
    v19:setState({
        DevConsoleData = {
            ClientLogData = v4.new(true), 
            ServerLogData = v4.new(false), 
            ClientMemoryData = v5.new(), 
            ServerMemoryData = v6.new(), 
            ClientNetworkData = v7.new(true), 
            ServerNetworkData = v7.new(false), 
            ServerScriptsData = v8.new(), 
            DataStoresData = v9.new(), 
            ServerStatsData = v10.new(), 
            ActionBindingsData = v11.new(), 
            ServerJobsData = v12.new(), 
            DebugVisualizationsData = v13.new(), 
            LuauHeapData = v14.new(), 
            VoiceChatData = if l_game_EngineFeature_0 then v15.new() else nil
        }
    });
end;
v17.didMount = function(v20) --[[ Line: 46 ]] --[[ Name: didMount ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    v20.state.DevConsoleData.ClientLogData:start();
    v20.state.DevConsoleData.ClientMemoryData:start();
    if l_game_EngineFeature_0 then
        v20.state.DevConsoleData.VoiceChatData:start();
    end;
end;
v17.willUpdate = function(v21, v22, _) --[[ Line: 55 ]] --[[ Name: willUpdate ]]
    if v22.isDeveloperView and not v21.props.isDeveloperView then
        for _, v25 in pairs(v21.state.DevConsoleData) do
            if not v25:isRunning() then
                v25:start();
            end;
        end;
    end;
end;
v17.render = function(v26) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v16 (copy)
    return v1.createElement(v16.Provider, {
        value = v26.state.DevConsoleData
    }, v1.oneChild(v26.props[v1.Children]));
end;
return v2.UNSTABLE_connect2(function(v27, _) --[[ Line: 71 ]] --[[ Name: mapStateToProps ]]
    return {
        isDeveloperView = v27.MainView.isDeveloperView
    };
end, nil)(v17);