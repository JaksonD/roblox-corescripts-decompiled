local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v11.Roact;
local l_t_0 = v11.t;
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local v15 = require(l_CoreGui_0.RobloxGui.Modules.PlayerPermissionsModule);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Resources.Constants);
local v18 = require(l_Parent_0.Components.Divider);
local v19 = require(l_Parent_0.Components.ThemedTextLabel);
local v20 = require(l_Parent_0.Utility.ExternalEventConnection);
local v21 = require(l_Parent_0.Localization.withLocalization);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreScriptVersionEnabled");
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint);
local v25 = l_Roact_0.PureComponent:extend("VersionReporter");
v25.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer
});
local function v32(v26) --[[ Line: 46 ]] --[[ Name: inferPlayerScriptStatus ]]
    -- upvalues: v17 (copy), l_RbxAnalyticsService_0 (copy), v23 (copy)
    local l_PlayerScriptsLoader_0 = v26:FindFirstChild("PlayerScriptsLoader");
    local l_PlayerModule_0 = v26:FindFirstChild("PlayerModule");
    local v29 = nil;
    if l_PlayerScriptsLoader_0 ~= nil and l_PlayerModule_0 ~= nil then
        v29 = if not not l_PlayerModule_0.Archivable or l_PlayerScriptsLoader_0.Archivable then v17.PlayerScriptStatusStrings.PossiblyCustom else v17.PlayerScriptStatusStrings.Default;
    else
        local l_CameraScript_0 = v26:FindFirstChild("CameraScript");
        local l_ControlScript_0 = v26:FindFirstChild("ControlScript");
        v29 = if not (l_CameraScript_0 == nil) or l_ControlScript_0 ~= nil then v17.PlayerScriptStatusStrings.CustomOld else v17.PlayerScriptStatusStrings.Custom;
    end;
    l_RbxAnalyticsService_0:SetRBXEventStream(v17.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
        defaultPlayerScripts = v29 == v17.PlayerScriptStatusStrings.Default, 
        placeID = tostring(game.PlaceId), 
        rawValue = if v23() then v29 else nil, 
        context = v23() and "IGMv2" or nil
    });
    return v29;
end;
v25.init = function(v33) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: l_StarterPlayer_0 (copy), v32 (copy), l_ContentProvider_0 (copy), l_RunService_0 (copy), l_game_EngineFeature_0 (copy)
    local v34 = "PlayerScript Status: Unknown";
    local l_StarterPlayerScripts_0 = l_StarterPlayer_0:FindFirstChild("StarterPlayerScripts");
    if l_StarterPlayerScripts_0 then
        v34 = v32(l_StarterPlayerScripts_0);
    else
        v33.playerScriptsAddedConnection = l_StarterPlayer_0.ChildAdded:Connect(function(v36) --[[ Line: 88 ]]
            -- upvalues: v33 (copy), v32 (ref)
            if v36.Name == "StarterPlayerScripts" then
                v33.playerScriptsAddedConnection:Disconnect();
                v33.playerScriptsAddedConnection = nil;
                v33:setState({
                    playerScriptStatus = v32(v36)
                });
            end;
        end);
    end;
    v33:setState({
        baseUrl = l_ContentProvider_0.BaseUrl, 
        clientVersion = l_RunService_0:GetRobloxVersion(), 
        isAdmin = false, 
        latestPlaceVersion = nil, 
        placeVersion = game.PlaceVersion, 
        serverVersion = nil, 
        playerScriptStatus = v34, 
        coreScriptVersion = l_game_EngineFeature_0 and l_RunService_0:GetCoreScriptVersion() or nil
    });
end;
v25.render = function(v37) --[[ Line: 111 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), l_game_EngineFeature_0 (copy), l_RunService_0 (copy), l_Roact_0 (copy), v19 (copy), l_Skeleton_0 (copy), v18 (copy), v20 (copy)
    local v38 = v37.state.serverVersion ~= nil;
    local v39 = v37.state.latestPlaceVersion ~= nil;
    local v40 = not v37.state.baseUrl:find("www.roblox.com");
    local v41 = v40 or v37.state.isAdmin;
    return v21({
        clientVersion = {
            "CoreScripts.InGameMenu.GameSettings.ClientVersion"; 
            CLIENT_VERSION = v37.state.clientVersion
        }, 
        serverVersion = {
            "CoreScripts.InGameMenu.GameSettings.ServerVersion"; 
            SERVER_VERSION = v37.state.serverVersion
        }, 
        placeVersion = {
            v39 and "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest" or "CoreScripts.InGameMenu.GameSettings.PlaceVersion"; 
            PLACE_VERSION = v37.state.placeVersion, 
            LATEST_PLACE_VERSION = v37.state.latestPlaceVersion
        }, 
        coreScriptVersion = l_game_EngineFeature_0 and {
            "CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion"; 
            CLIENT_CORESCRIPT_VERSION = v37.state.coreScriptVersion
        } or nil
    })(function(v42) --[[ Line: 136 ]]
        -- upvalues: l_RunService_0 (ref), l_Roact_0 (ref), v37 (copy), v19 (ref), v38 (copy), l_Skeleton_0 (ref), v40 (copy), v41 (copy), v18 (ref), l_game_EngineFeature_0 (ref), v20 (ref)
        local l_clientVersion_0 = v42.clientVersion;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 139 ]]
            -- upvalues: l_RunService_0 (ref)
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_0 then
            l_clientVersion_0 = string.format("%s (%.6s)", l_clientVersion_0, l_result_0);
        end;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 80), 
            LayoutOrder = v37.props.LayoutOrder
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 14), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 14)
            }), 
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            ClientVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = l_clientVersion_0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            ServerVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v38 and v42.serverVersion or "", 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 14)
            }, {
                not v38 and l_Roact_0.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 1, 0)
                })
            }), 
            PlaceVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v42.placeVersion, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Divider = (not not v40 or v41) and l_Roact_0.createElement(v18, {
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 4
            }), 
            PlayerScriptStatus = v41 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v37.state.playerScriptStatus, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Environment = v40 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = ("Base URL: %s"):format(v37.state.baseUrl), 
                LayoutOrder = 6, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Divider2 = l_game_EngineFeature_0 and l_Roact_0.createElement(v18, {
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 7
            }), 
            CoreScriptVersion = l_game_EngineFeature_0 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v42.coreScriptVersion, 
                LayoutOrder = 8, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            VersionWatcher = l_Roact_0.createElement(v20, {
                event = game:GetPropertyChangedSignal("PlaceVersion"), 
                callback = function() --[[ Line: 217 ]] --[[ Name: callback ]]
                    -- upvalues: v37 (ref)
                    v37:setState({
                        placeVersion = game.PlaceVersion
                    });
                end
            })
        });
    end);
end;
v25.didMount = function(v46) --[[ Line: 227 ]] --[[ Name: didMount ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v24 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v15 (copy), l_Players_0 (copy)
    v46.mounted = true;
    coroutine.wrap(function() --[[ Line: 230 ]]
        -- upvalues: l_RobloxReplicatedStorage_0 (ref), v46 (copy)
        local v47 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999):InvokeServer();
        if v46.mounted then
            v46:setState({
                serverVersion = v47
            });
        end;
    end)();
    if not v24() then
        coroutine.wrap(function() --[[ Line: 244 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v46 (copy)
            pcall(function() --[[ Line: 245 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref), v46 (ref)
                local l_l_HttpRbxApiService_0_Async_0 = l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId));
                local l_VersionNumber_0 = l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_Async_0)[1].VersionNumber;
                if v46.mounted then
                    v46:setState({
                        latestPlaceVersion = l_VersionNumber_0
                    });
                end;
            end);
        end)();
    end;
    coroutine.wrap(function() --[[ Line: 259 ]]
        -- upvalues: v15 (ref), l_Players_0 (ref), v46 (copy)
        local v50 = v15.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
        if v46.mounted then
            v46:setState({
                isAdmin = v50
            });
        end;
    end)();
end;
v25.willUnmount = function(v51) --[[ Line: 270 ]] --[[ Name: willUnmount ]]
    v51.mounted = false;
    if v51.playerScriptsAddedConnection then
        v51.playerScriptsAddedConnection:Disconnect();
    end;
end;
return v25;