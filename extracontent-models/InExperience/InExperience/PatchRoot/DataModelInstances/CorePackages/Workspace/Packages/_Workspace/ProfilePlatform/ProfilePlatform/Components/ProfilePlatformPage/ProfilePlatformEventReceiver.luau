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
return function() --[[ Line: 35 ]]
    -- upvalues: v8 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v12 (copy), l_RobloxEventReceiver_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v21 (copy), v22 (copy), l_useSelector_0 (copy), v6 (copy), l_PresenceType_0 (copy), v5 (copy), v20 (copy), v10 (copy), l_dependencyArray_0 (copy), v9 (copy), v3 (copy)
    local v23 = v8();
    local v24 = l_useRoactService_0(l_AppNotificationService_0);
    local v25 = v12.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), v24 (copy)
        return l_RobloxEventReceiver_0.new(v24);
    end, {
        v24
    });
    local v26 = l_useDispatch_0();
    local v27 = l_useLocalUserId_0();
    local l_profileId_0 = v23.profileId;
    local v29 = if v21 then v23.profileType else nil;
    if v22 then
        local v31 = l_useSelector_0(function(v30) --[[ Line: 49 ]]
            -- upvalues: v6 (ref), l_profileId_0 (copy), l_PresenceType_0 (ref)
            return v6.Selectors.getUserPresenceByUserId(v30, l_profileId_0) or {
                userPresenceType = l_PresenceType_0.Offline, 
                lastLocation = ""
            };
        end);
        local v32 = v5(v31.userPresenceType, v31.universeId);
        local v33 = v12.useRef(v32);
        v12.useEffect(function() --[[ Line: 59 ]]
            -- upvalues: v21 (ref), v29 (copy), v20 (ref), v33 (copy), v32 (copy), v26 (copy), v10 (ref), l_profileId_0 (copy)
            if v21 and v29 ~= v20.ProfileTypes.User then
                return;
            else
                if v33.current ~= v32 then
                    if v33.current == v20.PresenceTypes.InGame or v32 == v20.PresenceTypes.InGame then
                        v26(v10(l_profileId_0));
                    end;
                    v33.current = v32;
                end;
                return;
            end;
        end, l_dependencyArray_0(v32, v26, l_profileId_0, if v21 then v29 else nil));
    end;
    v12.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v21 (ref), v29 (copy), v20 (ref), v25 (copy), l_profileId_0 (copy), v26 (copy), v9 (ref)
        if v21 and v29 ~= v20.ProfileTypes.User then
            return;
        else
            local v37 = v25:observeEvent("UserProfileNotifications", function(v34) --[[ Line: 97 ]]
                -- upvalues: l_profileId_0 (ref), v20 (ref), v26 (ref), v9 (ref)
                local v35 = tostring(v34.VieweeUserId);
                local l_Type_0 = v34.Type;
                if l_profileId_0 == v35 and (l_Type_0 == v20.NameTypes.DisplayName or l_Type_0 == v20.NameTypes.Alias or l_Type_0 == v20.NameTypes.Username) then
                    v26(v9(v35));
                end;
            end);
            return function() --[[ Line: 112 ]]
                -- upvalues: v37 (copy)
                v37:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v25, v26, l_profileId_0, if v21 then v29 else nil));
    if not v22 then
        v12.useEffect(function() --[[ Line: 126 ]]
            -- upvalues: v21 (ref), v29 (copy), v20 (ref), v25 (copy), v3 (ref), l_profileId_0 (copy), v26 (copy), v10 (ref)
            if v21 and v29 ~= v20.ProfileTypes.User then
                return;
            else
                local v40 = v25:observeEvent("PresenceBulkNotifications", function(v38) --[[ Line: 134 ]]
                    -- upvalues: v3 (ref), l_profileId_0 (ref), v26 (ref), v10 (ref)
                    if v3.List.filter(v38, function(v39) --[[ Line: 135 ]]
                        -- upvalues: l_profileId_0 (ref)
                        return tostring(v39.UserId) == l_profileId_0;
                    end) then
                        v26(v10(l_profileId_0));
                    end;
                end);
                return function() --[[ Line: 144 ]]
                    -- upvalues: v40 (copy)
                    v40:disconnect();
                end;
            end;
        end, l_dependencyArray_0(v25, v26, l_profileId_0, if v21 then v29 else nil));
    end;
    v12.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: v21 (ref), v29 (copy), v20 (ref), v25 (copy), v27 (copy), l_profileId_0 (copy), v26 (copy), v10 (ref)
        if v21 and v29 ~= v20.ProfileTypes.User then
            return;
        else
            local v42 = v25:observeEvent("FriendshipNotifications", function(v41) --[[ Line: 166 ]]
                -- upvalues: v27 (ref), l_profileId_0 (ref), v26 (ref), v10 (ref)
                if (if tostring(v27) == tostring(v41.EventArgs.UserId1) then tostring(v41.EventArgs.UserId2) else tostring(v41.EventArgs.UserId1)) == l_profileId_0 then
                    v26(v10(l_profileId_0));
                end;
            end);
            return function() --[[ Line: 176 ]]
                -- upvalues: v42 (copy)
                v42:disconnect();
            end;
        end;
    end, l_dependencyArray_0(v25, v26, l_profileId_0, v27, if v21 then v29 else nil));
end;