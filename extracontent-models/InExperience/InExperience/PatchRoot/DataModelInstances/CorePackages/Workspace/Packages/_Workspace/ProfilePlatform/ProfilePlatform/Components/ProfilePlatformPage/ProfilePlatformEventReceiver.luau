local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.RoactServiceTags);
local v3 = require(l_Parent_0.Cryo);
local l_AppNotificationService_0 = v2.AppNotificationService;
local v5 = require(l_script_FirstAncestor_0.Utils.convertPresenceEnum);
local v6 = require(l_script_FirstAncestor_0.Rodux.Presence);
local l_PresenceType_0 = v6.Enums.PresenceType;
local v8 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v9 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformUserInfo);
local v10 = require(l_script_FirstAncestor_0.Networking.refreshProfilePlatformActionInfo);
local l_RobloxEventReceiver_0 = require(l_Parent_0.RealtimeDelivery).RobloxEventReceiver;
local v12 = require(l_Parent_0.React);
local v13 = require(l_Parent_0.RobloxAppHooks);
local v14 = require(l_Parent_0.RoactUtils);
local l_dependencyArray_0 = v14.Hooks.dependencyArray;
local l_useLocalUserId_0 = v13.useLocalUserId;
local l_useDispatch_0 = v14.Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = v13.useRoactService;
local l_useSelector_0 = v14.Hooks.RoactRodux.useSelector;
local v20 = require(l_script_FirstAncestor_0.Common.Enums);
local v21 = game:DefineFastFlag("ProfilePlatformDisableEventReceiverForNonUserProfiles", false);
local v22 = game:DefineFastFlag("ProfilePlatformRefactorPresenceEventListener", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
return function() --[[ Line: 37 ]]
    -- upvalues: v8 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v12 (copy), l_RobloxEventReceiver_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v21 (copy), v22 (copy), l_useSelector_0 (copy), v6 (copy), l_PresenceType_0 (copy), v5 (copy), v20 (copy), v10 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v9 (copy), v3 (copy)
    local v24 = v8();
    local v25 = l_useRoactService_0(l_AppNotificationService_0);
    local v26 = v12.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), v25 (copy)
        return l_RobloxEventReceiver_0.new(v25);
    end, {
        v25
    });
    local v27 = l_useDispatch_0();
    local v28 = l_useLocalUserId_0();
    local l_profileId_0 = v24.profileId;
    local v30 = if v21 then v24.profileType else nil;
    if v22 then
        local v32 = l_useSelector_0(function(v31) --[[ Line: 51 ]]
            -- upvalues: v6 (ref), l_profileId_0 (copy), l_PresenceType_0 (ref)
            return v6.Selectors.getUserPresenceByUserId(v31, l_profileId_0) or {
                userPresenceType = l_PresenceType_0.Offline, 
                lastLocation = ""
            };
        end);
        local v33 = v5(v32.userPresenceType, v32.universeId);
        local v34 = v12.useRef(v33);
        v12.useEffect(function() --[[ Line: 61 ]]
            -- upvalues: v21 (ref), v30 (copy), v20 (ref), v34 (copy), v33 (copy), v27 (copy), v10 (ref), l_profileId_0 (copy)
            if v21 and v30 ~= v20.ProfileTypes.User then
                return;
            else
                if v34.current ~= v33 then
                    if v34.current == v20.PresenceTypes.InGame or v33 == v20.PresenceTypes.InGame then
                        v27(v10(l_profileId_0));
                    end;
                    v34.current = v33;
                end;
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v33, 
            v27, 
            l_profileId_0, 
            if v21 then v30 else nil
        } else l_dependencyArray_0(v33, v27, l_profileId_0, if v21 then v30 else nil));
    end;
    v12.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v21 (ref), v30 (copy), v20 (ref), v26 (copy), l_profileId_0 (copy), v27 (copy), v9 (ref)
        if v21 and v30 ~= v20.ProfileTypes.User then
            return;
        else
            local v38 = v26:observeEvent("UserProfileNotifications", function(v35) --[[ Line: 106 ]]
                -- upvalues: l_profileId_0 (ref), v20 (ref), v27 (ref), v9 (ref)
                local v36 = tostring(v35.VieweeUserId);
                local l_Type_0 = v35.Type;
                if l_profileId_0 == v36 and (l_Type_0 == v20.NameTypes.DisplayName or l_Type_0 == v20.NameTypes.Alias or l_Type_0 == v20.NameTypes.Username) then
                    v27(v9(v36));
                end;
            end);
            return function() --[[ Line: 121 ]]
                -- upvalues: v38 (copy)
                v38:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v26, 
        v27, 
        l_profileId_0, 
        if v21 then v30 else nil
    } else l_dependencyArray_0(v26, v27, l_profileId_0, if v21 then v30 else nil));
    if not v22 then
        v12.useEffect(function() --[[ Line: 142 ]]
            -- upvalues: v21 (ref), v30 (copy), v20 (ref), v26 (copy), v3 (ref), l_profileId_0 (copy), v27 (copy), v10 (ref)
            if v21 and v30 ~= v20.ProfileTypes.User then
                return;
            else
                local v41 = v26:observeEvent("PresenceBulkNotifications", function(v39) --[[ Line: 150 ]]
                    -- upvalues: v3 (ref), l_profileId_0 (ref), v27 (ref), v10 (ref)
                    if v3.List.filter(v39, function(v40) --[[ Line: 151 ]]
                        -- upvalues: l_profileId_0 (ref)
                        return tostring(v40.UserId) == l_profileId_0;
                    end) then
                        v27(v10(l_profileId_0));
                    end;
                end);
                return function() --[[ Line: 160 ]]
                    -- upvalues: v41 (copy)
                    v41:disconnect();
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v26, 
            v27, 
            l_profileId_0, 
            if v21 then v30 else nil
        } else l_dependencyArray_0(v26, v27, l_profileId_0, if v21 then v30 else nil));
    end;
    v12.useEffect(function() --[[ Line: 181 ]]
        -- upvalues: v21 (ref), v30 (copy), v20 (ref), v26 (copy), v28 (copy), l_profileId_0 (copy), v27 (copy), v10 (ref)
        if v21 and v30 ~= v20.ProfileTypes.User then
            return;
        else
            local v43 = v26:observeEvent("FriendshipNotifications", function(v42) --[[ Line: 189 ]]
                -- upvalues: v28 (ref), l_profileId_0 (ref), v27 (ref), v10 (ref)
                if (if tostring(v28) == tostring(v42.EventArgs.UserId1) then tostring(v42.EventArgs.UserId2) else tostring(v42.EventArgs.UserId1)) == l_profileId_0 then
                    v27(v10(l_profileId_0));
                end;
            end);
            return function() --[[ Line: 199 ]]
                -- upvalues: v43 (copy)
                v43:disconnect();
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v26, 
        v27, 
        l_profileId_0, 
        v28, 
        if v21 then v30 else nil
    } else l_dependencyArray_0(v26, v27, l_profileId_0, v28, if v21 then v30 else nil));
end;