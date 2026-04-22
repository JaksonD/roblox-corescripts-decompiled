local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_GuiService_0 = game:GetService("GuiService");
local v5 = require(l_script_FirstAncestor_0.LoadingScreenTelemetry);
local v6 = require(l_script_FirstAncestor_0.Enums.PlaceLauncherState);
local v7 = require(l_script_FirstAncestor_0.Store.getLoadingScreenStore);
local v8 = require(l_Parent_0.Foundation);
local v9 = require(l_Parent_0.Localization);
local l_QueueExperimentation_0 = require(l_Parent_0.SocialExperiments).QueueExperimentation;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local v12 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Signals);
local v14 = require(l_Parent_0.SignalsReact);
local l_useTokens_0 = v8.Hooks.useTokens;
local l_game_EngineFeature_0 = game:GetEngineFeature("QueuePositionEnabled");
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEnableLuaAppsFollowUserId);
local v18 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and v17;
local function v21(v19) --[[ Line: 30 ]] --[[ Name: getStoreJoinState ]]
    -- upvalues: v7 (copy)
    local v20 = v7(v19);
    if v19 and v20 and v20.getJoinState then
        return v20.getJoinState(v19);
    else
        return "";
    end;
end;
local function v24(v22) --[[ Line: 38 ]] --[[ Name: getStoreServerStatusText ]]
    -- upvalues: v7 (copy)
    local v23 = v7(v22);
    if v22 and v23 and v23.getServerStatusText then
        return v23.getServerStatusText(v22);
    else
        return "";
    end;
end;
return v12.memo(function(v25) --[[ Line: 55 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v12 (copy), l_GuiService_0 (copy), v14 (copy), v21 (copy), v24 (copy), v6 (copy), l_QueueExperimentation_0 (copy), v5 (copy), v18 (copy), l_ExperienceService_0 (copy), l_game_EngineFeature_0 (copy), v8 (copy), l_CoreGui_0 (copy)
    local v26 = l_useTokens_0();
    local v27 = l_useLocalization_0({
        queuedDescription = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin", 
        dontWantToWait = "InGame.ConnectionError.Description.DontWantToWait", 
        joinNewServer = "InGame.ConnectionError.Action.JoinNewServer"
    });
    local v28 = v12.useRef(0);
    local v29 = v12.useRef(1e999);
    local v30 = v12.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v28 (copy), v29 (copy), l_GuiService_0 (ref)
        if v28.current == 0 then
            v28.current = 1;
            v29.current = tick();
            return;
        else
            if tick() - v29.current <= 0.5 then
                l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
            end;
            v28.current = 0;
            v29.current = 1e999;
            return;
        end;
    end, {});
    local v31 = v12.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v25 (copy), v30 (copy)
        if not v25.isSubjectToChinaPolicies then
            v30();
        end;
    end, {
        v25.isSubjectToChinaPolicies, 
        v30
    });
    local v32 = v14.useSignalState(v21);
    local v33 = v14.useSignalBinding(v24);
    local v34 = v12.useRef(nil);
    v12.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v32 (copy), v6 (ref), v34 (copy), l_QueueExperimentation_0 (ref)
        if v32 == v6.Queued then
            v34.current = os.clock();
            l_QueueExperimentation_0.logExposure();
        end;
    end, {
        v32, 
        l_QueueExperimentation_0.logExposure
    });
    local v36 = v12.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v34 (copy), v5 (ref), v18 (ref), l_ExperienceService_0 (ref), v25 (copy), l_game_EngineFeature_0 (ref)
        local v35 = if v34.current then math.floor((os.clock() - v34.current) * 1000) else nil;
        v5.logQueuedStateButtonClick({
            buttonName = "JoinNewServer", 
            joinTargetUserId = if v18 then l_ExperienceService_0:GetFollowUserId() else nil, 
            placeId = v25.placeId, 
            positionInQueue = if l_game_EngineFeature_0 then l_ExperienceService_0:GetQueuePosition() else nil, 
            timeElapsedMs = v35, 
            universeId = v25.universeId
        });
        l_ExperienceService_0:LaunchExperience({
            placeId = v25.placeId
        });
    end, {
        v25.placeId, 
        v25.universeId
    });
    return v12.createElement(v8.View, {
        AnchorPoint = v25.anchorPoint, 
        AutoLocalize = true, 
        Position = v25.position, 
        Size = v25.size, 
        tag = "col align-x-center align-y-bottom gap-xxlarge"
    }, {
        ServerStatusContainer = v12.createElement(v8.View, {
            AutoLocalize = true, 
            LayoutOrder = 1, 
            tag = "col align-x-center align-y-bottom gap-xsmall auto-xy", 
            onActivated = v31, 
            stateLayer = {
                affordance = v8.Enums.StateLayerAffordance.None
            }
        }, {
            QueuedDescriptionText = if v32 == v6.Queued and v18 and l_ExperienceService_0:GetFollowUserId() > 0 then v12.createElement(v8.Text, {
                LayoutOrder = 1, 
                Text = v27.queuedDescription, 
                tag = "auto-xy text-title-medium content-system-contrast"
            }) else nil, 
            ServerStatusText = v12.createElement("TextLabel", {
                AutoLocalize = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Font = v26.Typography.TitleMedium.Font, 
                TextSize = v26.Typography.TitleMedium.FontSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v26.Color.System.Contrast.Color3, 
                TextStrokeTransparency = 1, 
                Text = v33, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                RootLocalizationTable = l_CoreGui_0:FindFirstChild("CoreScriptLocalization")
            })
        }), 
        ActionContainer = if v32 == v6.Queued then v12.createElement(v8.View, {
            LayoutOrder = 2, 
            tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
        }, {
            ActionButtonDescriptionText = v12.createElement(v8.Text, {
                LayoutOrder = 1, 
                Text = v27.dontWantToWait, 
                tag = "auto-xy text-body-medium content-system-contrast"
            }), 
            ActionButton = v12.createElement(v8.Button, {
                LayoutOrder = 2, 
                onActivated = v36, 
                text = v27.joinNewServer
            })
        }) else nil
    });
end);