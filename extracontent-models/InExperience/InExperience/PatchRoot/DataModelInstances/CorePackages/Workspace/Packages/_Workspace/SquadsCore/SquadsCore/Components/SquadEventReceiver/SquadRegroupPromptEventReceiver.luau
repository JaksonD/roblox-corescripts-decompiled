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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v32 = game:DefineFastInt("SquadRegroupPromptDebounceTimeMs", 20000);
return function(v33) --[[ Line: 47 ]]
    -- upvalues: v3 (copy), v24 (copy), l_useLocalization_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v16 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v13 (copy), l_PresenceType_0 (copy), v26 (copy), v27 (copy), l_useSelector_0 (copy), v32 (copy), v4 (copy), l_SquadRegroupExperimentation_0 (copy), l_GuiService_0 (copy), v21 (copy), l_RbxAnalyticsService_0 (copy), v20 (copy), v23 (copy), v25 (copy), v19 (copy), v28 (copy), v11 (copy), v15 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    local v34 = v3.useContext(v24);
    local v35 = l_useLocalization_0({
        RegroupPromptTitle = "Notifications.SquadRegroupPrompt.ToastLabel.ContinuePlayingTogether", 
        RegroupPromptBody = "Notifications.SquadRegroupPrompt.ToastLabel.JoinANewServer", 
        Dismiss = "Notifications.SquadRegroupPrompt.ToastAction.Dismiss", 
        Join = "Notifications.SquadRegroupPrompt.ToastAction.Join"
    });
    local v36 = l_useDispatch_0();
    local v37 = tonumber(l_useLocalUserId_0()) or 0;
    local v38 = v3.useRef(false);
    local v40 = v3.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v16 (ref), v33 (copy)
        return v16.List.map(v33.currentSquadMembers, function(v39) --[[ Line: 63 ]]
            return v39.userId;
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.currentSquadMembers
    } else l_dependencyArray_0(v33.currentSquadMembers));
    local v41, v42 = v3.useState({});
    local v46 = v3.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v33 (copy)
        local v43 = {};
        for _, v45 in ipairs(v33.currentSquadMembers) do
            v43[tostring(v45.userId)] = true;
        end;
        return v43;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v33.currentSquadMembers
    } else l_dependencyArray_0(v33.currentSquadMembers));
    local v54 = v3.useCallback(function() --[[ Line: 88 ]]
        -- upvalues: v36 (copy), v13 (ref), v40 (copy), v16 (ref), l_PresenceType_0 (ref), v42 (copy), v26 (ref), v27 (ref)
        v36(v13.GetPresencesFromUserIds.API(v40)):andThen(function(v47) --[[ Line: 90 ]]
            -- upvalues: v16 (ref), l_PresenceType_0 (ref), v42 (ref)
            local v48 = v47 and v47.responseBody and v47.responseBody.userPresences or {};
            local v49 = {};
            for _, v51 in pairs(v48) do
                if v51.userId and v51.userPresenceType then
                    v49[tostring(v51.userId)] = v16.Dictionary.join(v51, {
                        userPresenceType = l_PresenceType_0.fromRawValue(v51.userPresenceType)
                    });
                end;
            end;
            v42(function(v52) --[[ Line: 100 ]]
                -- upvalues: v16 (ref), v49 (copy)
                return v16.Dictionary.join(v52 or {}, v49);
            end);
        end):catch(function(v53) --[[ Line: 104 ]]
            -- upvalues: v26 (ref), v27 (ref)
            v26:warning("SquadRegroupPromptEventReceiver: initial presence fetch failed. err={}", v27(v53));
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36, 
        v40, 
        v37
    } else l_dependencyArray_0(v36, v40, v37));
    local v55 = v3.useRef(true);
    v3.useEffect(function() --[[ Line: 117 ]]
        -- upvalues: v55 (copy), v54 (copy)
        v55.current = true;
        v54();
        return function() --[[ Line: 121 ]]
            -- upvalues: v55 (ref)
            v55.current = false;
        end;
    end, {});
    local v57 = v3.useCallback(function(v56) --[[ Line: 126 ]]
        if v56.Squad and v56.Squad.Squad then
            return v56.Squad.Squad.currentExperienceInvite;
        else
            return nil;
        end;
    end, {});
    local v58 = l_useSelector_0(v57);
    local v59 = v3.useRef(nil);
    v59.current = v58;
    local v60 = v32 / 1000;
    local v61 = v3.useRef(nil);
    if v61.current == nil then
        v61.current = v4.debounce(function(v62, v63, v64, v65) --[[ Line: 139 ]]
            -- upvalues: v55 (copy), v38 (copy), v59 (copy), l_PresenceType_0 (ref), l_SquadRegroupExperimentation_0 (ref), l_GuiService_0 (ref), v35 (copy), v34 (copy), v21 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v26 (ref), v27 (ref), v36 (copy), v19 (ref), v28 (ref)
            if not v55.current or v38.current or v59.current ~= nil then
                return;
            else
                local v66 = v62[tostring(v63)];
                if v66 == nil then
                    return;
                else
                    for _, v68 in pairs(v62) do
                        if v68 and (v68.userPresenceType == l_PresenceType_0.Online or v68.userPresenceType == l_PresenceType_0.InGame and v66.gameId ~= nil and v68.gameId ~= nil and v66.gameId ~= v68.gameId) then
                            l_SquadRegroupExperimentation_0.logExposure();
                            if not l_SquadRegroupExperimentation_0.getSquadRegroupEnabled() then
                                return;
                            else
                                local v69 = nil;
                                v69 = l_GuiService_0:SendNotification({
                                    Title = v35.RegroupPromptTitle, 
                                    Text = v35.RegroupPromptBody, 
                                    Icon = v65, 
                                    Buttons = {
                                        {
                                            Text = v35.Dismiss, 
                                            ButtonType = Enum.NotificationButtonType.Secondary, 
                                            OnActivated = function() --[[ Line: 185 ]] --[[ Name: OnActivated ]]
                                                -- upvalues: v34 (ref), v21 (ref), v64 (copy), v63 (copy), v66 (copy), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v69 (ref), v38 (ref)
                                                v34.fireSquadAnalytics(v21.SquadRegroupPromptClicked, {
                                                    clientTimestamp = os.time(), 
                                                    squadId = v64, 
                                                    initiatorId = v63, 
                                                    gameInstanceId = v66.gameId, 
                                                    rootPlaceId = v66.rootPlaceId, 
                                                    placeId = v66.placeId, 
                                                    universeId = v66.universeId, 
                                                    playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                                    button = v20.RegroupDismiss, 
                                                    entryPoint = v23.ToastPrompt
                                                });
                                                v25.dismissNotification(v69);
                                                v38.current = false;
                                            end
                                        }, 
                                        {
                                            Text = v35.Join, 
                                            ButtonType = Enum.NotificationButtonType.Primary, 
                                            OnActivated = function() --[[ Line: 205 ]] --[[ Name: OnActivated ]]
                                                -- upvalues: v66 (copy), v34 (ref), v26 (ref), v27 (ref), v36 (ref), v19 (ref), v21 (ref), v64 (copy), v63 (copy), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref), v25 (ref), v69 (ref), v38 (ref)
                                                local l_rootPlaceId_0 = v66.rootPlaceId;
                                                if v34.createExperienceInvite == nil then
                                                    v26:warning("SquadRegroupEventReceiver: Join clicked but createExperienceInvite was not supplied in the external contract");
                                                elseif l_rootPlaceId_0 == nil then
                                                    v26:warning("SquadRegroupEventReceiver: Join clicked but rootPlaceId is missing from local presence. localPresence={}", v27(v66));
                                                else
                                                    v36(v34.createExperienceInvite(tostring(l_rootPlaceId_0), v19.Regroup)):andThen(function(v71) --[[ Line: 223 ]]
                                                        -- upvalues: v34 (ref), v21 (ref), v64 (ref), v63 (ref), v66 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v23 (ref)
                                                        v34.fireSquadAnalytics(v21.SquadRegroupPromptClicked, {
                                                            clientTimestamp = os.time(), 
                                                            squadId = v64, 
                                                            initiatorId = v63, 
                                                            gameInstanceId = v66.gameId, 
                                                            rootPlaceId = v66.rootPlaceId, 
                                                            placeId = v66.placeId, 
                                                            universeId = v66.universeId, 
                                                            playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                                            experienceInviteId = v71, 
                                                            button = v20.RegroupJoin, 
                                                            entryPoint = v23.ToastPrompt
                                                        });
                                                    end):catch(function(v72) --[[ Line: 241 ]]
                                                        -- upvalues: v26 (ref), v27 (ref)
                                                        v26:warning("SquadRegroupEventReceiver: createExperienceInvite failed. err={}", v27(v72));
                                                    end);
                                                end;
                                                v25.dismissNotification(v69);
                                                v38.current = false;
                                            end
                                        }
                                    }
                                });
                                v38.current = true;
                                v25.setActive(v69, v64);
                                v34.fireSquadAnalytics(v21.SquadRegroupPromptShown, {
                                    clientTimestamp = os.time(), 
                                    squadId = v64, 
                                    initiatorId = v63, 
                                    gameInstanceId = v66.gameId, 
                                    rootPlaceId = v66.rootPlaceId, 
                                    placeId = v66.placeId, 
                                    universeId = v66.universeId, 
                                    playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId(), 
                                    entryPoint = v23.ToastPrompt
                                });
                                if v64 then
                                    v36(v28(v64));
                                end;
                                return;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end, v60, {
            leading = false, 
            trailing = true
        });
    end;
    v11.useRealtimeNamespace(v15.PRESENCE_BULK_RTN_NAMESPACE, function(v73) --[[ Line: 287 ]]
        -- upvalues: v46 (copy), l_PresenceType_0 (ref), v42 (copy)
        if type(v73) ~= "table" then
            return;
        else
            local v74 = nil;
            for _, v76 in ipairs(v73) do
                local v77 = v76 and v76.UserId;
                if v77 ~= nil then
                    local v78 = tostring(v77);
                    if v46[v78] then
                        local v79 = v76 and v76.PresenceReport;
                        if v79 ~= nil then
                            v79.userPresenceType = l_PresenceType_0.fromRawValue(v79.userPresenceType);
                            v74 = v74 or {};
                            v74[v78] = v79;
                        end;
                    end;
                end;
            end;
            if v74 ~= nil then
                v42(function(v80) --[[ Line: 312 ]]
                    -- upvalues: v74 (ref)
                    local v81 = table.clone(v80 or {});
                    for v82, v83 in pairs(v74) do
                        v81[v82] = v83;
                    end;
                    return v81;
                end);
            end;
            return;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v36, 
        v33.currentSquadId, 
        v46
    } else l_dependencyArray_0(v36, v33.currentSquadId, v46));
    v11.useRealtimeConnectionStateChanged(v15.PRESENCE_BULK_RTN_NAMESPACE, function(v84, v85) --[[ Line: 329 ]]
        -- upvalues: v26 (ref), v54 (copy)
        if v84 == Enum.ConnectionState.Connected and v85 then
            v26:info("Connection re-established, fetching squad presences.");
            v54();
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v54
    } else l_dependencyArray_0(v54));
    v3.useEffect(function() --[[ Line: 339 ]]
        -- upvalues: v38 (copy), v41 (copy), v37 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), l_Constants_0 (ref), v61 (copy), v33 (copy)
        if not v38.current then
            local v86 = v41[tostring(v37)];
            local v87 = v86 and (v86.universeId or v86.gameId) or nil;
            local v88 = if v87 ~= nil then l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v87), l_Constants_0.RbxthumbTypes.GameIcon, 128, false) else nil;
            v61.current(v41, v37, v33.currentSquadId, v88);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v41, 
        v37, 
        v33.currentSquadId
    } else l_dependencyArray_0(v41, v37, v33.currentSquadId));
    return nil;
end;