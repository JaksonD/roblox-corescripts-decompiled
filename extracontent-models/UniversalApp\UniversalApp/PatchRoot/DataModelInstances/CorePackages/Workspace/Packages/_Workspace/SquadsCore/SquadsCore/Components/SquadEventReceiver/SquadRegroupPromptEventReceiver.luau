local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.RoduxSquads);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dash);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_Parent_0.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
local v11 = require(l_Parent_0.RealtimeDelivery);
local v12 = require(l_Parent_0.RoactUtils);
local v13 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local l_dependencyArray_0 = v12.Hooks.dependencyArray;
local v15 = require(l_script_FirstAncestor_0.Common.Constants);
local v16 = require(l_Parent_0.Cryo);
local l_SquadRegroupExperimentation_0 = require(l_Parent_0.SocialExperiments).SquadRegroupExperimentation;
local v18 = require(l_script_FirstAncestor_0.Http.RoduxPresence);
local v19 = require(l_script_FirstAncestor_0.Enums.SquadExperienceInviteSource);
local v20 = require(l_script_FirstAncestor_0.Enums.SquadToastActionsAndStates);
local v21 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_PresenceType_0 = v18.Enums.PresenceType;
local v23 = require(l_script_FirstAncestor_0.Enums.SquadRegroupEntryPoint);
local v24 = require(l_script_FirstAncestor_0.Components.SquadExternalContractProvider.SquadExternalContractContext);
local v25 = require(l_script_FirstAncestor_0.Utils.RegroupPromptNotificationState);
local v26 = require(l_script_FirstAncestor_0.Logger);
local v27 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local v28 = require(l_script_FirstAncestor_0.Thunks.setRegroupPromptShown);
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v31 = game:DefineFastInt("SquadRegroupPromptDebounceTimeMs", 20000);
return function(v32) --[[ Line: 45 ]]
    -- upvalues: v3 (copy), v24 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v16 (copy), l_dependencyArray_0 (copy), v13 (copy), l_PresenceType_0 (copy), v26 (copy), v27 (copy), l_useSelector_0 (copy), v31 (copy), v4 (copy), l_SquadRegroupExperimentation_0 (copy), l_GuiService_0 (copy), v21 (copy), l_RbxAnalyticsService_0 (copy), v20 (copy), v23 (copy), v25 (copy), v19 (copy), v28 (copy), v11 (copy), v15 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    local v33 = v3.useContext(v24);
    local v34 = l_useLocalization_0({
        RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether", 
        RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer", 
        Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss", 
        Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
    });
    local v35 = l_useDispatch_0();
    local v36 = tonumber(l_useLocalUserId_0()) or 0;
    local v37 = v3.useRef(false);
    local v39 = v3.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v16 (ref), v32 (copy)
        return v16.List.map(v32.currentSquadMembers, function(v38) --[[ Line: 60 ]]
            return v38.userId;
        end);
    end, l_dependencyArray_0(v32.currentSquadMembers));
    local v40, v41 = v3.useState({});
    local v45 = v3.useMemo(function() --[[ Line: 66 ]]
        -- upvalues: v32 (copy)
        local v42 = {};
        for _, v44 in ipairs(v32.currentSquadMembers) do
            v42[tostring(v44.userId)] = true;
        end;
        return v42;
    end, l_dependencyArray_0(v32.currentSquadMembers));
    local v53 = v3.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v35 (copy), v13 (ref), v39 (copy), v16 (ref), l_PresenceType_0 (ref), v41 (copy), v26 (ref), v27 (ref)
        v35(v13.GetPresencesFromUserIds.API(v39)):andThen(function(v46) --[[ Line: 77 ]]
            -- upvalues: v16 (ref), l_PresenceType_0 (ref), v41 (ref)
            local v47 = v46 and v46.responseBody and v46.responseBody.userPresences or {};
            local v48 = {};
            for _, v50 in pairs(v47) do
                if v50.userId and v50.userPresenceType then
                    v48[tostring(v50.userId)] = v16.Dictionary.join(v50, {
                        userPresenceType = l_PresenceType_0.fromRawValue(v50.userPresenceType)
                    });
                end;
            end;
            v41(function(v51) --[[ Line: 87 ]]
                -- upvalues: v16 (ref), v48 (copy)
                return v16.Dictionary.join(v51 or {}, v48);
            end);
        end):catch(function(v52) --[[ Line: 91 ]]
            -- upvalues: v26 (ref), v27 (ref)
            v26:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", v27(v52));
        end);
    end, l_dependencyArray_0(v35, v39, v36));
    local v54 = v3.useRef(true);
    v3.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v54 (copy), v53 (copy)
        v54.current = true;
        v53();
        return function() --[[ Line: 104 ]]
            -- upvalues: v54 (ref)
            v54.current = false;
        end;
    end, {});
    local v56 = v3.useCallback(function(v55) --[[ Line: 109 ]]
        if v55.Squad and v55.Squad.Squad then
            return v55.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v57 = l_useSelector_0(v56);
    local v58 = v3.useRef(nil);
    v58.current = v57;
    local v59 = v31 / 1000;
    local v60 = v3.useRef(nil);
    if v60.current == nil then
        v60.current = v4.debounce(function(v61, v62, v63, v64) --[[ Line: 122 ]]
            -- upvalues: v54 (copy), v37 (copy), v58 (copy), l_PresenceType_0 (ref), l_SquadRegroupExperimentation_0 (ref), l_GuiService_0 (ref), v34 (copy), v33 (copy), v21 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v26 (ref), v27 (ref), v35 (copy), v19 (ref), v28 (ref)
            if not v54.current or v37.current or v58.current ~= nil then
                return;
            else
                local v65 = v61[tostring(v62)];
                if v65 == nil then
                    return;
                else
                    for _, v67 in pairs(v61) do
                        if v67 and (v67.userPresenceType == l_PresenceType_0.Online or v67.userPresenceType == l_PresenceType_0.InGame and v65.gameId ~= nil and v67.gameId ~= nil and v65.gameId ~= v67.gameId) then
                            l_SquadRegroupExperimentation_0.logExposure();
                            if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() then
                                return;
                            else
                                local v68 = nil;
                                v68 = l_GuiService_0:SendNotification({
                                    Title = v34.RegroupPromptTitle, 
                                    Text = v34.RegroupPromptBody, 
                                    Icon = v64, 
                                    Buttons = {
                                        {
                                            Text = v34.Dismiss, 
                                            ButtonType = Enum.NotificationButtonType.Secondary, 
                                            OnActivated = function() --[[ Line: 168 ]] --[[ Name: OnActivated ]]
                                                -- upvalues: v33 (ref), v21 (ref), v63 (copy), v62 (copy), v65 (copy), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v68 (ref), v37 (ref)
                                                v33.fireSquadAnalytics(v21.SquadRegroupPromptClicked, {
                                                    clientTimestamp = os.time(), 
                                                    squadId = v63, 
                                                    initiatorId = v62, 
                                                    gameInstanceId = v65.gameId, 
                                                    rootPlaceId = v65.rootPlaceId, 
                                                    placeId = v65.placeId, 
                                                    universeId = v65.universeId, 
                                                    playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                                    button = v20.RegroupDismiss, 
                                                    entryPoint = v23.ToastPrompt
                                                });
                                                v25.dismissNotification(v68);
                                                v37.current = false;
                                            end
                                        }, 
                                        {
                                            Text = v34.Join, 
                                            ButtonType = Enum.NotificationButtonType.Primary, 
                                            OnActivated = function() --[[ Line: 188 ]] --[[ Name: OnActivated ]]
                                                -- upvalues: v65 (copy), v33 (ref), v26 (ref), v27 (ref), v35 (ref), v19 (ref), v21 (ref), v63 (copy), v62 (copy), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v68 (ref), v37 (ref)
                                                local l_rootPlaceId_0 = v65.rootPlaceId;
                                                if v33.createExperienceInvite == nil then
                                                    v26:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract");
                                                elseif l_rootPlaceId_0 == nil then
                                                    v26:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", v27(v65));
                                                else
                                                    v35(v33.createExperienceInvite(tostring(l_rootPlaceId_0), v19.Regroup)):andThen(function(v70) --[[ Line: 206 ]]
                                                        -- upvalues: v33 (ref), v21 (ref), v63 (ref), v62 (ref), v65 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref)
                                                        v33.fireSquadAnalytics(v21.SquadRegroupPromptClicked, {
                                                            clientTimestamp = os.time(), 
                                                            squadId = v63, 
                                                            initiatorId = v62, 
                                                            gameInstanceId = v65.gameId, 
                                                            rootPlaceId = v65.rootPlaceId, 
                                                            placeId = v65.placeId, 
                                                            universeId = v65.universeId, 
                                                            playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                                            experienceInviteId = v70, 
                                                            button = v20.RegroupJoin, 
                                                            entryPoint = v23.ToastPrompt
                                                        });
                                                    end):catch(function(v71) --[[ Line: 224 ]]
                                                        -- upvalues: v26 (ref), v27 (ref)
                                                        v26:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", v27(v71));
                                                    end);
                                                end;
                                                v25.dismissNotification(v68);
                                                v37.current = false;
                                            end
                                        }
                                    }
                                });
                                v37.current = true;
                                v25.setActive(v68, v63);
                                v33.fireSquadAnalytics(v21.SquadRegroupPromptShown, {
                                    clientTimestamp = os.time(), 
                                    squadId = v63, 
                                    initiatorId = v62, 
                                    gameInstanceId = v65.gameId, 
                                    rootPlaceId = v65.rootPlaceId, 
                                    placeId = v65.placeId, 
                                    universeId = v65.universeId, 
                                    playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                    entryPoint = v23.ToastPrompt
                                });
                                if v63 then
                                    v35(v28(v63));
                                end;
                                return;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end, v59, {
            leading = false, 
            trailing = true
        });
    end;
    v11.useRealtimeNamespace(v15.PRESENCE_BULK_RTN_NAMESPACE, function(v72) --[[ Line: 268 ]]
        -- upvalues: v45 (copy), l_PresenceType_0 (ref), v41 (copy)
        if type(v72) ~= "table" then
            return;
        else
            local v73 = nil;
            for _, v75 in ipairs(v72) do
                local v76 = v75 and v75.UserId;
                if v76 ~= nil then
                    local v77 = tostring(v76);
                    if v45[v77] then
                        local v78 = v75 and v75.PresenceReport;
                        if v78 ~= nil then
                            v78.userPresenceType = l_PresenceType_0.fromRawValue(v78.userPresenceType);
                            v73 = v73 or {};
                            v73[v77] = v78;
                        end;
                    end;
                end;
            end;
            if v73 ~= nil then
                v41(function(v79) --[[ Line: 292 ]]
                    -- upvalues: v73 (ref)
                    local v80 = table.clone(v79 or {});
                    for v81, v82 in pairs(v73) do
                        v80[v81] = v82;
                    end;
                    return v80;
                end);
            end;
            return;
        end;
    end, l_dependencyArray_0(v35, v32.currentSquadId, v45));
    v11.useRealtimeConnectionStateChanged(v15.PRESENCE_BULK_RTN_NAMESPACE, function(v83, v84) --[[ Line: 305 ]]
        -- upvalues: v26 (ref), v53 (copy)
        if v83 == Enum.ConnectionState.Connected and v84 then
            v26:info("Connection re-established, fetching squad presences.");
            v53();
        end;
    end, l_dependencyArray_0(v53));
    v3.useEffect(function() --[[ Line: 314 ]]
        -- upvalues: v37 (copy), v40 (copy), v36 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), v60 (copy), v32 (copy)
        if not v37.current then
            local v85 = v40[tostring(v36)];
            local v86 = v85 and (v85.universeId or v85.gameId) or nil;
            local v87 = if v86 ~= nil then l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v86), l_Constants_0.RbxthumbTypes.GameIcon, 128, false) else nil;
            v60.current(v40, v36, v32.currentSquadId, v87);
        end;
    end, l_dependencyArray_0(v40, v36, v32.currentSquadId));
    return nil;
end;