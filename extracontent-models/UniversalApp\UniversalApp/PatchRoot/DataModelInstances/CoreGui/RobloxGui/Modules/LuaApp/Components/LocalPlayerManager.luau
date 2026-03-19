local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v8 = require(l_CorePackages_0.Workspace.Packages.Loggers);
local l_Logger_0 = v8.Logger;
local l_mutedError_0 = v8.mutedError;
local v11 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v12 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
local l_SetUserHasRobloxSubscription_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Actions.SetUserHasRobloxSubscription;
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdCheckDev;
local v18 = game:DefineFastFlag("FixWrongLoggedOutSessionSwitch", false);
local v19 = game:DefineFastFlag("TestAndroidWrongLoggedInIssue", false);
local v20 = require(l_Modules_0.LuaApp.Flags.FFlagEnableL1SessionStateEngineOwned);
local v21 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local function v23() --[[ Line: 33 ]] --[[ Name: getLocalPlayerUserId ]]
    -- upvalues: l_Players_0 (copy)
    local v22 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    if v22 == nil or v22 <= 0 then
        return nil;
    else
        return (tostring(v22));
    end;
end;
local function v25() --[[ Line: 43 ]]
    -- upvalues: v16 (copy)
    local l_userId_0 = v16.fromLocalStorage().userId;
    if l_userId_0 > 0 then
        return (tostring(l_userId_0));
    else
        return nil;
    end;
end;
local v26 = v3.Component:extend("LocalPlayerManager");
v26.defaultProps = {
    backtraceReporter = nil, 
    getLocalPlayerUserId = v23, 
    getCachedUserId = v25
};
v26.init = function(v27) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: l_Players_0 (copy), v21 (copy), v19 (copy), v3 (copy), l_Logger_0 (copy), v20 (copy), l_SessionType_0 (copy)
    v27:setState({
        hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
        localPlayerUserId = v27.props.getLocalPlayerUserId()
    });
    v27.backtraceReporter = v27.props.backtraceReporter or v21;
    v27.fetchAndUpdateLocalPlayer = function() --[[ Line: 72 ]]
        -- upvalues: v27 (copy)
        v27.props.fetchLocalUserData();
        v27.updateUserInfoToBacktrace();
        v27.updateLocalPlayerState();
    end;
    v27.updateLocalPlayerState = function() --[[ Line: 78 ]]
        -- upvalues: v27 (copy), v19 (ref), v3 (ref), l_Players_0 (ref)
        local v28 = v27.props.getLocalPlayerUserId();
        if v19 then
            print("[FLog::SessionService] currentLocalPlayerId " .. tostring(v28));
        end;
        if v28 ~= v27.state.localPlayerUserId then
            v27:setState({
                localPlayerUserId = v28 or v3.None, 
                hasLocalPlayer = l_Players_0.LocalPlayer ~= nil
            });
        end;
    end;
    v27.updateUserInfoToBacktrace = function() --[[ Line: 91 ]]
        -- upvalues: l_Players_0 (ref), v27 (copy)
        local v29 = nil;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        v29 = if not (l_LocalPlayer_0 ~= nil) or l_LocalPlayer_0.UserId <= 0 then {
            UserLoggedIn = false, 
            UserMembershipType = "Unknown", 
            UserIsUnder13 = "Unknown", 
            CountryCode = "Unknown"
        } else {
            UserLoggedIn = true, 
            UserMembershipType = tostring(l_LocalPlayer_0.MembershipType), 
            UserIsUnder13 = l_LocalPlayer_0:GetUnder13(), 
            CountryCode = v27.props.countryCode
        };
        v27.backtraceReporter:updateSharedAttributes(v29);
    end;
    v27.syncUserSession = function(v31) --[[ Line: 114 ]]
        -- upvalues: v19 (ref), v27 (copy), l_Logger_0 (ref), v20 (ref), l_SessionType_0 (ref)
        if v19 then
            print("[FLog::SessionService] syncUserSession()");
            if v31 then
                print("[FLog::SessionService] syncUserSession checkCachedUser True");
            end;
        end;
        local l_sessionService_0 = v27.props.sessionService;
        local l_localPlayerUserId_0 = v27.state.localPlayerUserId;
        if v31 then
            local v34 = v27.props.getCachedUserId();
            if v34 then
                l_localPlayerUserId_0 = v34;
            end;
            l_Logger_0:info("LocalPlayerManager:syncUserSession(checkCachedUser==true) localPlayerUserId: {}, cachedUserId: {}", l_localPlayerUserId_0, v34);
        end;
        if not v20 then
            local function v37(v35) --[[ Line: 139 ]]
                -- upvalues: v19 (ref), l_sessionService_0 (copy), l_SessionType_0 (ref), l_Logger_0 (ref)
                if v19 then
                    print("[FLog::SessionService] handleL1WithUserId");
                end;
                if l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) then
                    local l_l_sessionService_0_Metadata_0 = l_sessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId);
                    if l_l_sessionService_0_Metadata_0 ~= v35 then
                        if v19 then
                            print("[FLog::SessionService] handleL1WithUserId expectedUserId " .. tostring(v35) .. " currentL1SessionUserId " .. tostring(l_l_sessionService_0_Metadata_0));
                        end;
                        l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.Default);
                        l_sessionService_0:SetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId, v35);
                        return;
                    end;
                else
                    if v19 then
                        print("LocalPlayerManager:syncUserSession, Level1 session is missing!");
                    end;
                    l_Logger_0:warning("LocalPlayerManager:syncUserSession, Level1 session is missing!");
                    l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
                end;
            end;
            local function v38() --[[ Line: 187 ]]
                -- upvalues: v19 (ref), l_sessionService_0 (copy), l_SessionType_0 (ref)
                if v19 then
                    print("[FLog::SessionService] handleL1WithNoUserId");
                end;
                if not l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) or l_sessionService_0:GetSessionTag(l_SessionType_0.StructuralIdentifier.Level1) == l_SessionType_0.Tag.Level1.Default then
                    l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
                end;
            end;
            if l_localPlayerUserId_0 ~= nil then
                v37(l_localPlayerUserId_0);
                return;
            else
                v38();
            end;
        end;
    end;
    local l_sessionService_1 = v27.props.sessionService;
    if v27.props.runService:IsStudio() then
        l_sessionService_1:RemoveSession(l_SessionType_0.StructuralIdentifier.Level1);
    end;
    v27.syncUserSession(true);
end;
v26.render = function(v40) --[[ Line: 225 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagEnableBlackbirdCheckDev_0 (copy), v18 (copy), v3 (copy), v11 (copy), l_Players_0 (copy), v19 (copy), l_mutedError_0 (copy)
    local l_setUserMembershipType_0 = v40.props.setUserMembershipType;
    local v42 = if l_FFlagEnableBlackbirdCheckDev_0 then v40.props.setUserHasRobloxSubscription else nil;
    local v43 = if v18 then {} else {
        PlayerRemovingConnection = v3.createElement(v11, {
            event = l_Players_0.PlayerRemoving, 
            callback = function() --[[ Line: 236 ]] --[[ Name: callback ]]
                -- upvalues: v40 (copy), l_Players_0 (ref), v3 (ref)
                v40:setState({
                    hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
                    localPlayerUserId = v3.None
                });
            end
        }), 
        PlayerAddedConnection = v3.createElement(v11, {
            event = l_Players_0.PlayerAdded, 
            callback = function() --[[ Line: 245 ]] --[[ Name: callback ]]
                -- upvalues: v40 (copy), l_Players_0 (ref), v3 (ref)
                v40:setState({
                    hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
                    localPlayerUserId = v40.props.getLocalPlayerUserId() or v3.None
                });
            end
        })
    };
    if v19 then
        v43 = {
            PlayerRemovingConnection = v3.createElement(v11, {
                event = l_Players_0.PlayerRemoving, 
                callback = function() --[[ Line: 258 ]] --[[ Name: callback ]]
                    -- upvalues: v40 (copy)
                    print("[FLog::SessionService] Players.PlayerRemoving updateLocalPlayerState()");
                    v40.updateLocalPlayerState();
                end
            })
        };
    end;
    if v40.state.hasLocalPlayer then
        table.insert(v43, v3.createElement(v11, {
            event = l_Players_0.LocalPlayer:GetPropertyChangedSignal("MembershipType"), 
            callback = function() --[[ Line: 271 ]] --[[ Name: callback ]]
                -- upvalues: l_Players_0 (ref), l_setUserMembershipType_0 (copy), v40 (copy)
                local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                local v45 = tostring(l_LocalPlayer_1.UserId);
                l_setUserMembershipType_0(v45, l_LocalPlayer_1.MembershipType);
                v40.updateUserInfoToBacktrace();
            end
        }));
        if l_FFlagEnableBlackbirdCheckDev_0 and game:GetEngineFeature("ReadHasRobloxSubscriptionLua") then
            table.insert(v43, v3.createElement(v11, {
                event = l_Players_0.LocalPlayer:GetPropertyChangedSignal("HasRobloxSubscription"), 
                callback = function() --[[ Line: 286 ]] --[[ Name: callback ]]
                    -- upvalues: l_Players_0 (ref), l_mutedError_0 (ref), v42 (copy)
                    local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
                    local v47 = tostring(l_LocalPlayer_2.UserId);
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 289 ]]
                        -- upvalues: l_LocalPlayer_2 (copy)
                        return l_LocalPlayer_2.HasRobloxSubscription;
                    end);
                    if not l_status_0 then
                        l_mutedError_0("[LocalPlayerManager] Failed to read HasRobloxSubscription: " .. tostring(l_result_0));
                    end;
                    v42(v47, l_status_0 and l_result_0 == true);
                end
            }));
        end;
    end;
    return v3.createElement("Folder", {}, v43);
end;
v26.didMount = function(v50) --[[ Line: 306 ]] --[[ Name: didMount ]]
    -- upvalues: l_Players_0 (copy)
    if v50.state.hasLocalPlayer then
        v50.props.fetchLocalUserData();
    end;
    v50.updateUserInfoToBacktrace();
    v50.updateLocalPlayerState();
    v50.localPlayerConnection = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(v50.fetchAndUpdateLocalPlayer);
end;
v26.didUpdate = function(v51, v52, v53) --[[ Line: 316 ]] --[[ Name: didUpdate ]]
    if v53.localPlayerUserId ~= v51.state.localPlayerUserId then
        v51.syncUserSession();
    end;
    if v52.countryCode ~= v51.props.countryCode then
        v51.updateUserInfoToBacktrace();
    end;
end;
v26.willUnmount = function(v54) --[[ Line: 326 ]] --[[ Name: willUnmount ]]
    if v54.localPlayerConnection ~= nil then
        v54.localPlayerConnection:Disconnect();
        v54.localPlayerConnection = nil;
    end;
end;
v26 = l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0, 
    runService = l_AppRunService_0
})(v26);
return v4.connect(function(v55, _) --[[ Line: 338 ]]
    return {
        countryCode = string.len(v55.CountryCode) > 0 and v55.CountryCode or "Unknown"
    };
end, function(v57) --[[ Line: 342 ]]
    -- upvalues: v12 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_SetUserHasRobloxSubscription_0 (copy), l_GetLocalUser_0 (copy)
    return {
        setUserMembershipType = function(v58, v59) --[[ Line: 344 ]] --[[ Name: setUserMembershipType ]]
            -- upvalues: v57 (copy), v12 (ref)
            v57(v12(v58, v59));
        end, 
        setUserHasRobloxSubscription = l_FFlagEnableBlackbirdCheckDev_0 and function(v60, v61) --[[ Line: 348 ]]
            -- upvalues: v57 (copy), l_SetUserHasRobloxSubscription_0 (ref)
            v57(l_SetUserHasRobloxSubscription_0(v60, v61));
        end or nil, 
        fetchLocalUserData = function() --[[ Line: 352 ]] --[[ Name: fetchLocalUserData ]]
            -- upvalues: v57 (copy), l_GetLocalUser_0 (ref)
            v57(l_GetLocalUser_0());
        end
    };
end)(v26);