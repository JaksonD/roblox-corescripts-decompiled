local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ExperienceService_0 = game:GetService("ExperienceService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v6 = require(l_script_FirstAncestor_0.LoadingScreenTelemetry);
local v7 = require(l_script_FirstAncestor_0.Enums.PlaceLauncherState);
local v8 = require(l_script_FirstAncestor_0.Store.getLoadingScreenStore);
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.Localization);
local l_QueueExperimentation_0 = require(l_Parent_0.SocialExperiments).QueueExperimentation;
local l_useLocalization_0 = v10.Hooks.useLocalization;
local v13 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Signals);
local v15 = require(l_Parent_0.SignalsReact);
local v16 = game:DefineFastInt("AutoJoinNewServerTimeMs", 5000);
local l_game_EngineFeature_0 = game:GetEngineFeature("QueuePositionEnabled");
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEnableLuaAppsFollowUserId);
local v19 = game:GetEngineFeature("ExperienceServiceFollowUserIdEnabled") and v18;
local l_useTokens_0 = v9.Hooks.useTokens;
local function v23(v21) --[[ Line: 34 ]] --[[ Name: getStoreJoinState ]]
    -- upvalues: v8 (copy)
    local v22 = v8(v21);
    if v21 and v22 and v22.getJoinState then
        return v22.getJoinState(v21);
    else
        return "";
    end;
end;
local function v26(v24) --[[ Line: 42 ]] --[[ Name: getStoreServerStatusText ]]
    -- upvalues: v8 (copy)
    local v25 = v8(v24);
    if v24 and v25 and v25.getServerStatusText then
        return v25.getServerStatusText(v24);
    else
        return "";
    end;
end;
return v13.memo(function(v27) --[[ Line: 59 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v13 (copy), l_GuiService_0 (copy), v15 (copy), v23 (copy), v26 (copy), v16 (copy), l_RunService_0 (copy), l_ExperienceService_0 (copy), v7 (copy), l_QueueExperimentation_0 (copy), v19 (copy), v6 (copy), l_game_EngineFeature_0 (copy), v9 (copy), l_CoreGui_0 (copy)
    local v28 = l_useTokens_0();
    local v29 = l_useLocalization_0({
        friendsServerIsFullJoiningNewServer = "InGame.ConnectionError.Description.FriendsServerIsFullJoiningNewServer", 
        friendsServerIsFullWaitingToJoin = "InGame.ConnectionError.Description.FriendsServerIsFullWaitingToJoin", 
        joinTheLine = "InGame.ConnectionError.Action.JoinTheLine", 
        wantToJoinYourFriend = "InGame.ConnectionError.Description.WantToJoinYourFriend"
    });
    local v30 = v13.useRef(0);
    local v31 = v13.useRef(1e999);
    local v32 = v13.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v30 (copy), v31 (copy), l_GuiService_0 (ref)
        if v30.current == 0 then
            v30.current = 1;
            v31.current = tick();
            return;
        else
            if tick() - v31.current <= 0.5 then
                l_GuiService_0:ShowStatsBasedOnInputString("ConnectionHealth");
            end;
            v30.current = 0;
            v31.current = 1e999;
            return;
        end;
    end, {});
    local v33 = v13.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v27 (copy), v32 (copy)
        if not v27.isSubjectToChinaPolicies then
            v32();
        end;
    end, {
        v27.isSubjectToChinaPolicies, 
        v32
    });
    local v34 = v15.useSignalState(v23);
    local v35 = v15.useSignalBinding(v26);
    local v36, v37 = v13.useBinding(0);
    local v38 = v13.useRef(nil);
    local v39, v40 = v13.useState(false);
    local v41 = v13.useRef(nil);
    local v42 = v13.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v40 (copy), v41 (copy)
        v40(false);
        if v41.current then
            v41.current:Disconnect();
            v41.current = nil;
        end;
    end, {});
    local v46 = v13.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v41 (copy), v40 (copy), v16 (ref), l_RunService_0 (ref), v37 (copy), l_ExperienceService_0 (ref), v27 (copy)
        if v41.current then
            return;
        else
            v40(true);
            local v43 = os.clock();
            local v44 = v16 / 1000;
            v41.current = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 118 ]]
                -- upvalues: v43 (copy), v44 (copy), v37 (ref), l_ExperienceService_0 (ref), v27 (ref), v41 (ref)
                local v45 = math.clamp((os.clock() - v43) / v44 * 100, 0, 100);
                v37(v45);
                if v45 >= 100 then
                    l_ExperienceService_0:LaunchExperience({
                        placeId = v27.placeId
                    });
                    if v41.current then
                        v41.current:Disconnect();
                        v41.current = nil;
                    end;
                end;
            end);
            return;
        end;
    end, {
        v27.placeId
    });
    v13.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v34 (copy), v7 (ref), v38 (copy), l_QueueExperimentation_0 (ref)
        if v34 == v7.Queued then
            v38.current = os.clock();
            l_QueueExperimentation_0.logExposure();
        end;
    end, {
        v34, 
        l_QueueExperimentation_0.logExposure
    });
    v13.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v34 (copy), v7 (ref), v19 (ref), l_ExperienceService_0 (ref), v46 (copy), v42 (copy)
        if v34 == v7.Queued and v19 and l_ExperienceService_0:GetFollowUserId() > 0 then
            v46();
        else
            v42();
        end;
        return function() --[[ Line: 151 ]]
            -- upvalues: v42 (ref)
            v42();
        end;
    end, {
        v34, 
        v46, 
        v42
    });
    local v48 = v13.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v42 (copy), v38 (copy), v6 (ref), v19 (ref), l_ExperienceService_0 (ref), v27 (copy), l_game_EngineFeature_0 (ref)
        v42();
        local v47 = if v38.current then math.floor((os.clock() - v38.current) * 1000) else nil;
        v6.logQueuedStateButtonClick({
            buttonName = "JoinTheLine", 
            joinTargetUserId = if v19 then l_ExperienceService_0:GetFollowUserId() else nil, 
            placeId = v27.placeId, 
            positionInQueue = if l_game_EngineFeature_0 then l_ExperienceService_0:GetQueuePosition() else nil, 
            timeElapsedMs = v47, 
            universeId = v27.universeId
        });
    end, {
        v27.placeId, 
        v27.universeId, 
        v42
    });
    return v13.createElement(v9.View, {
        AnchorPoint = v27.anchorPoint, 
        AutoLocalize = true, 
        Position = v27.position, 
        Size = v27.size, 
        tag = "col align-x-center align-y-bottom gap-xxlarge"
    }, {
        ServerStatusContainer = v13.createElement(v9.View, {
            AutoLocalize = true, 
            LayoutOrder = 1, 
            tag = "col align-x-center align-y-bottom gap-xsmall auto-xy", 
            onActivated = v33, 
            stateLayer = {
                affordance = v9.Enums.StateLayerAffordance.None
            }
        }, {
            QueuedDescriptionText = if v34 == v7.Queued and v19 and l_ExperienceService_0:GetFollowUserId() > 0 then v13.createElement(v9.Text, {
                LayoutOrder = 1, 
                Text = if v39 then v29.friendsServerIsFullJoiningNewServer else v29.friendsServerIsFullWaitingToJoin, 
                tag = "auto-xy text-title-medium content-system-contrast"
            }) else nil, 
            ServerStatusText = v13.createElement("TextLabel", {
                AutoLocalize = true, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 0), 
                Font = v28.Typography.TitleMedium.Font, 
                TextSize = v28.Typography.TitleMedium.FontSize, 
                TextWrapped = true, 
                TextScaled = false, 
                TextColor3 = v28.Color.System.Contrast.Color3, 
                TextStrokeTransparency = 1, 
                Text = v35, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ZIndex = 2, 
                RootLocalizationTable = l_CoreGui_0:FindFirstChild("CoreScriptLocalization")
            })
        }), 
        ProgressBarContainer = if v39 then v13.createElement(v9.View, {
            LayoutOrder = 2, 
            sizeConstraint = {
                MaxSize = Vector2.new(277, 1e999)
            }, 
            tag = "col align-x-center align-y-bottom gap-xsmall size-full-0 auto-y"
        }, {
            ProgressBar = v13.createElement(v9.Progress, {
                shape = v9.Enums.ProgressShape.Bar, 
                value = v36
            })
        }) else nil, 
        ActionContainer = if v34 == v7.Queued and v39 and v19 and l_ExperienceService_0:GetFollowUserId() > 0 then v13.createElement(v9.View, {
            LayoutOrder = 3, 
            tag = "col align-x-center align-y-bottom gap-xsmall auto-xy"
        }, {
            ActionButtonDescriptionText = v13.createElement(v9.Text, {
                LayoutOrder = 1, 
                Text = v29.wantToJoinYourFriend, 
                tag = "auto-xy text-body-medium content-system-contrast"
            }), 
            ActionButton = v13.createElement(v9.Button, {
                LayoutOrder = 2, 
                onActivated = v48, 
                text = v29.joinTheLine
            })
        }) else nil
    });
end);