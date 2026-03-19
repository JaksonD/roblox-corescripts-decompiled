local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_DevConsole_0 = script.Parent.DevConsole;
local v9 = require(l_DevConsole_0.Constants);
local l_Components_0 = l_DevConsole_0.Components;
local v11 = require(l_Components_0.DevConsoleWindow);
local v12 = require(l_Components_0.DataProvider);
local v13 = require(l_Components_0.Log.MainViewLog);
local v14 = require(l_Components_0.Memory.MainViewMemory);
local v15 = require(l_Components_0.Network.MainViewNetwork);
local v16 = require(l_Components_0.Scripts.MainViewScripts);
local v17 = require(l_Components_0.DataStores.MainViewDataStores);
local v18 = require(l_Components_0.ServerStats.MainViewServerStats);
local v19 = require(l_Components_0.ActionBindings.MainViewActionBindings);
local v20 = require(l_Components_0.ServerJobs.MainViewServerJobs);
local v21 = require(l_Components_0.MicroProfiler.MainViewMicroProfiler);
local v22 = require(l_Components_0.ScriptProfiler.MainViewScriptProfiler);
local v23 = require(l_Components_0.DebugVisualizations.MainViewDebugVisualizations);
local v24 = require(l_Components_0.LuauHeap.MainViewLuauHeap);
local v25 = require(l_Components_0.VoiceChat.MainViewVoiceChat);
local v26 = require(l_Components_0.MicroProfiler.RCCProfilerDataCompleteListener);
local v27 = require(l_DevConsole_0.Util.getClientReplicator);
local v28 = require(l_DevConsole_0.Reducers.MainView);
local v29 = require(l_DevConsole_0.Reducers.DevConsoleReducer);
local l_Actions_0 = l_DevConsole_0.Actions;
local v31 = require(l_Actions_0.SetDevConsoleVisibility);
local v32 = require(l_Actions_0.SetTabList);
local l_MiddleWare_0 = l_DevConsole_0.MiddleWare;
local v34 = require(l_MiddleWare_0.DevConsoleAnalytics);
local v35 = require(l_CoreGui_0.RobloxGui.Modules.PlayerPermissionsModule);
local l_game_EngineFeature_0 = game:GetEngineFeature("ScriptProfiler");
local l_default_0 = require(l_CoreGui_0.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default;
local v38 = {
    Log = {
        tab = v13, 
        layoutOrder = 1, 
        hasClientServer = true
    }, 
    Memory = {
        tab = v14, 
        layoutOrder = 2, 
        hasClientServer = true
    }, 
    Network = {
        tab = v15, 
        layoutOrder = 3, 
        hasClientServer = true
    }, 
    Scripts = {
        tab = v16, 
        layoutOrder = 4
    }, 
    DataStores = {
        tab = v17, 
        layoutOrder = 5
    }, 
    ServerStats = {
        tab = v18, 
        layoutOrder = 6
    }, 
    ActionBindings = {
        tab = v19, 
        layoutOrder = 7
    }, 
    ServerJobs = {
        tab = v20, 
        layoutOrder = 8
    }, 
    MicroProfiler = {
        tab = v21, 
        layoutOrder = 9
    }, 
    DebugVisualizations = {
        tab = v23, 
        layoutOrder = 10
    }, 
    ScriptProfiler = if l_game_EngineFeature_0 then {
        tab = v22, 
        layoutOrder = 11
    } else nil, 
    LuauHeap = {
        tab = v24, 
        layoutOrder = 12
    }
};
local v39 = {
    Log = {
        tab = v13, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v14, 
        layoutOrder = 2
    }, 
    ScriptProfiler = if l_game_EngineFeature_0 then {
        tab = v22, 
        layoutOrder = 3
    } else nil, 
    LuauHeap = {
        tab = v24, 
        layoutOrder = 4
    }, 
    VoiceChat = if game:GetEngineFeature("VoiceChatDevConsoleTabEnabled") and l_default_0 and l_default_0:canUseService() then {
        tab = v25, 
        layoutOrder = 5
    } else nil
};
local v40 = {
    Log = {
        tab = v13, 
        layoutOrder = 1
    }, 
    Memory = {
        tab = v14, 
        layoutOrder = 2
    }
};
local v41 = {};
v41.__index = v41;
local v42 = {
    [Enum.Platform.Windows] = v9.FormFactor.Large, 
    [Enum.Platform.OSX] = v9.FormFactor.Large, 
    [Enum.Platform.IOS] = v9.FormFactor.Small, 
    [Enum.Platform.Android] = v9.FormFactor.Small, 
    [Enum.Platform.XBoxOne] = v9.FormFactor.Console, 
    [Enum.Platform.PS4] = v9.FormFactor.Console, 
    [Enum.Platform.PS3] = v9.FormFactor.Console, 
    [Enum.Platform.XBox360] = v9.FormFactor.Console, 
    [Enum.Platform.WiiU] = v9.FormFactor.Console, 
    [Enum.Platform.NX] = v9.FormFactor.Console, 
    [Enum.Platform.Ouya] = v9.FormFactor.Console, 
    [Enum.Platform.AndroidTV] = v9.FormFactor.Console, 
    [Enum.Platform.Chromecast] = v9.FormFactor.Console, 
    [Enum.Platform.Linux] = v9.FormFactor.Large, 
    [Enum.Platform.SteamOS] = v9.FormFactor.Console, 
    [Enum.Platform.WebOS] = v9.FormFactor.Large, 
    [Enum.Platform.DOS] = v9.FormFactor.Large, 
    [Enum.Platform.BeOS] = v9.FormFactor.Large, 
    [Enum.Platform.UWP] = v9.FormFactor.Large, 
    [Enum.Platform.None] = v9.FormFactor.Large
};
local function _() --[[ Line: 170 ]] --[[ Name: isAdminAsync ]]
    -- upvalues: v35 (copy), l_Players_0 (copy)
    return v35.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
end;
v41.new = function() --[[ Line: 174 ]] --[[ Name: new ]]
    -- upvalues: v41 (copy)
    local v44 = {};
    setmetatable(v44, v41);
    v44.init = false;
    v44.isDeveloperTabListActive = false;
    v44.waitForStart = true;
    v44.waitForStartBindable = Instance.new("BindableEvent");
    coroutine.wrap(function() --[[ Line: 184 ]]
        -- upvalues: v44 (copy)
        v44:SetupDevConsole();
    end)();
    return v44;
end;
v41.SetupDevConsole = function(v45) --[[ Line: 191 ]] --[[ Name: SetupDevConsole ]]
    -- upvalues: l_UserInputService_0 (copy), v42 (copy), v28 (copy), v32 (copy), v40 (copy), v34 (copy), v6 (copy), v29 (copy), v5 (copy), v7 (copy), v12 (copy), v11 (copy), v9 (copy), v26 (copy)
    local v46 = v42[l_UserInputService_0:GetPlatform()];
    local v47 = {
        MainView = v28(nil, v32(v40, "Log"))
    };
    local v48 = {
        v34
    };
    v45.store = v6.Store.new(v29, v47, v48);
    local l_isVisible_0 = v45.store:getState().DisplayOptions.isVisible;
    v45.root = v5.createElement(v7.StoreProvider, {
        store = v45.store
    }, {
        DataProvider = v5.createElement(v12, {
            isDeveloperView = false
        }, {
            App = v5.createElement("ScreenGui", {
                OnTopOfCoreBlur = true, 
                DisplayOrder = 10
            }, {
                DevConsoleWindow = v5.createElement(v11, {
                    formFactor = v46, 
                    isDeveloperView = false, 
                    isVisible = l_isVisible_0, 
                    isMinimized = false, 
                    position = v9.MainWindowInit.Position, 
                    size = v9.MainWindowInit.Size, 
                    tabList = v40, 
                    onCloseCallback = function(v50) --[[ Line: 226 ]] --[[ Name: onCloseCallback ]]
                        -- upvalues: v45 (copy)
                        v45:SetServerStatsConnection(v50);
                    end
                }), 
                RCCProfilerDataCompleteListener = v5.createElement(v26)
            })
        })
    });
    v45.waitForStart = false;
    v45.waitForStartBindable:Fire();
end;
local v51 = v41.new();
v41.Start = function(v52) --[[ Line: 242 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy), l_CoreGui_0 (copy), v27 (copy), v35 (copy), l_Players_0 (copy), v32 (copy), v39 (copy), v38 (copy)
    if not v52.init then
        if v52.waitForStart then
            v52.waitForStartBindable.Event:Wait();
        end;
        v52.init = true;
        v52.element = v5.mount(v52.root, l_CoreGui_0, "DevConsoleMaster");
        local v53 = v27();
        task.spawn(function() --[[ Line: 252 ]]
            -- upvalues: v35 (ref), l_Players_0 (ref), v52 (copy), v32 (ref), v39 (ref)
            if v35.IsPlayerAdminAsync(l_Players_0.LocalPlayer) and not v52.isDeveloperTabListActive then
                v52.store:dispatch(v32(v39, "Log", false));
            end;
        end);
        if v53 then
            v52._statsConnector = v53.StatsReceived:connect(function(_) --[[ Line: 260 ]]
                -- upvalues: v52 (copy), v32 (ref), v38 (ref)
                if not v52._statsConnector then
                    return;
                else
                    v52._statsConnector:Disconnect();
                    v52._statsConnector = nil;
                    v52.isDeveloperTabListActive = true;
                    v52.store:dispatch(v32(v38, "Log", true));
                    return;
                end;
            end);
            v52:SetServerStatsConnection(true);
        end;
    end;
end;
v41.ToggleVisibility = function(v55) --[[ Line: 277 ]] --[[ Name: ToggleVisibility ]]
    -- upvalues: v51 (copy)
    if not v55.init then
        v51:Start();
    end;
    v55:SetVisibility(not v55.store:getState().DisplayOptions.isVisible);
end;
v41.GetVisibility = function(v56) --[[ Line: 286 ]] --[[ Name: GetVisibility ]]
    if not v56.init then
        return false;
    else
        local v57 = v56.store:getState();
        if v57 and v57.DisplayOptions then
            return v57.DisplayOptions.isVisible and not v57.DisplayOptions.isMinimized;
        else
            return false;
        end;
    end;
end;
v41.SetServerStatsConnection = function(_, v59) --[[ Line: 301 ]] --[[ Name: SetServerStatsConnection ]]
    -- upvalues: v27 (copy)
    local v60 = v27();
    if v60 then
        v60:RequestServerStats(v59);
    end;
end;
v41.SetVisibility = function(v61, v62) --[[ Line: 308 ]] --[[ Name: SetVisibility ]]
    -- upvalues: v51 (copy), v31 (copy)
    if type(v62) == "boolean" then
        if not v61.init and v62 then
            v51:Start();
        end;
        v61:SetServerStatsConnection(v62);
        v61.store:dispatch(v31(v62));
    end;
end;
l_StarterGui_0:RegisterGetCore("DevConsoleVisible", function() --[[ Line: 320 ]]
    -- upvalues: v51 (copy)
    return v51:GetVisibility();
end);
l_StarterGui_0:RegisterSetCore("DevConsoleVisible", function(v63) --[[ Line: 324 ]]
    -- upvalues: v51 (copy)
    if type(v63) ~= "boolean" then
        error("DevConsoleVisible must be given a boolean value.");
    end;
    v51:SetVisibility(v63);
end);
return v51;