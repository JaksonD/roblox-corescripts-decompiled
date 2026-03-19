local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CurrentCamera_0 = game:GetService("Workspace").CurrentCamera;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.CallProtocol);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local v9 = require(l_CorePackages_0.Packages.ReactOtter);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Chrome_0 = l_RobloxGui_0.Modules.Chrome;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v13 = if l_Enabled_0() then require(l_Chrome_0.Service) else nil;
local v14 = require(l_Chrome_0.ChromeShared.Unibar.Constants);
local l_TopBar_0 = l_RobloxGui_0.Modules.TopBar;
local v16 = require(l_TopBar_0.Constants);
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v18 = require(l_ContactList_0.dependencies);
local l_RoduxCall_0 = v18.RoduxCall;
local l_useSelector_0 = v18.Hooks.useSelector;
local l_useDispatch_0 = v18.Hooks.useDispatch;
local l_CallAction_0 = l_RoduxCall_0.Enums.CallAction;
local l_Parent_0 = script.Parent;
local v24 = require(l_Parent_0.CallBar);
local v25 = Vector2.new(200, 44);
local v26 = {
    callProtocol = v5.CallProtocol.default
};
local v27 = {
    On = "On", 
    Off = "Off"
};
return function(v28) --[[ Line: 56 ]] --[[ Name: CallBarContainer ]]
    -- upvalues: v4 (copy), v26 (copy), l_useDispatch_0 (copy), v16 (copy), v3 (copy), v9 (copy), l_CurrentCamera_0 (copy), v25 (copy), v27 (copy), l_Enabled_0 (copy), v13 (copy), v14 (copy), l_useSelector_0 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), l_RoduxCall_0 (copy), l_CallAction_0 (copy), v24 (copy)
    local v29 = v4.Dictionary.join(v26, v28);
    local v30 = l_useDispatch_0();
    local v31 = v16.useDisplayScaleState(v16.TopBarButtonPadding);
    local v32 = v16.useDisplayScaleState(v16.TopBarTopMargin);
    local v33, v34 = v3.useState(false);
    local v35 = nil;
    local v36 = nil;
    local v38, v39 = v9.useAnimatedBinding({
        X = l_CurrentCamera_0.ViewportSize.X / 2 - v25.X / 2, 
        Y = -v25.Y
    }, function(v37) --[[ Line: 69 ]]
        -- upvalues: v25 (ref), v33 (copy), v34 (copy)
        if v37.Y == -v25.Y and v33 then
            v34(false);
        end;
    end);
    v35 = v38;
    v36 = v39;
    v38 = v3.useCallback(function(v40) --[[ Line: 84 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v25 (ref), v27 (ref), l_Enabled_0 (ref), v32 (copy), v31 (copy), v13 (ref), v16 (ref), v36 (ref), v9 (ref), v14 (ref)
        local v41 = l_CurrentCamera_0.ViewportSize.X / 2 - v25.X / 2;
        local v42 = nil;
        v42 = if v40 == v27.On then if l_Enabled_0() then v32 + v31 else 4 else -v25.Y;
        if l_Enabled_0() and v13 then
            local l_Max_0 = v13:layout():get().Max;
            if l_Max_0.X + 12 > l_CurrentCamera_0.ViewportSize.X / 2 - v25.X / 2 then
                if l_Max_0.X + 24 + v25.X > l_CurrentCamera_0.ViewportSize.X then
                    if v40 == v27.On then
                        v42 = v16.ApplyDisplayScale(v16.TopBarHeight) + 10;
                    end;
                else
                    v41 = l_Max_0.X + 12;
                end;
            end;
        end;
        v36({
            X = v9.spring(v41, v14.MENU_ANIMATION_SPRING), 
            Y = v9.spring(v42, v14.MENU_ANIMATION_SPRING)
        });
    end, {});
    v39 = v3.useCallback(function(v44) --[[ Line: 124 ]]
        if v44.Call.currentCall ~= nil then
            return v44.Call.currentCall.status;
        else
            return nil;
        end;
    end, {});
    local v45 = l_useSelector_0(v39);
    local v48 = v3.useCallback(function(v46) --[[ Line: 129 ]]
        local v47 = 0;
        if v46.Call.currentCall and v46.Call.currentCall.activeUtc then
            v47 = v46.Call.currentCall.activeUtc;
        end;
        return v47;
    end);
    local v49 = l_useSelector_0(v48);
    local v51 = v3.useCallback(function(v50) --[[ Line: 138 ]]
        if v50.Call.currentCall ~= nil then
            return v50.Call.currentCall.instanceId;
        else
            return nil;
        end;
    end);
    local v52 = l_useSelector_0(v51);
    v3.useEffect(function() --[[ Line: 143 ]]
        -- upvalues: v29 (copy), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v30 (copy), l_RoduxCall_0 (ref)
        local v54 = v29.callProtocol:listenToHandleConnectingCall(function(v53) --[[ Line: 146 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v30 (ref), l_RoduxCall_0 (ref)
            l_SoundManager_0:PlaySound(l_Sounds_0.Ringtone.Name, {
                Volume = 0.5, 
                Looped = true
            }, l_SoundGroups_0.Iris);
            v30(l_RoduxCall_0.Actions.UpdateCall(v53));
        end);
        local v56 = v29.callProtocol:listenToHandleTeleportingCall(function(v55) --[[ Line: 152 ]]
            -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v30 (ref), l_RoduxCall_0 (ref)
            l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
            l_SoundManager_0:PlaySound(l_Sounds_0.CallAccept.Name, {
                Volume = 0.5
            }, l_SoundGroups_0.Iris);
            v30(l_RoduxCall_0.Actions.UpdateCall(v55));
        end);
        local v58 = v29.callProtocol:listenToHandleActiveCall(function(v57) --[[ Line: 158 ]]
            -- upvalues: v30 (ref), l_RoduxCall_0 (ref)
            v30(l_RoduxCall_0.Actions.UpdateCall(v57));
        end);
        local v60 = v29.callProtocol:listenToHandleTransferCallTeleportJoin(function() --[[ Line: 162 ]]
            -- upvalues: v29 (ref), v30 (ref), l_RoduxCall_0 (ref)
            v29.callProtocol:getCallState():andThen(function(v59) --[[ Line: 165 ]]
                -- upvalues: v30 (ref), l_RoduxCall_0 (ref)
                v30(l_RoduxCall_0.Actions.UpdateCall(v59));
            end);
        end);
        v29.callProtocol:getCallState():andThen(function(v61) --[[ Line: 170 ]]
            -- upvalues: v30 (ref), l_RoduxCall_0 (ref)
            v30(l_RoduxCall_0.Actions.UpdateCall(v61));
        end);
        return function() --[[ Line: 174 ]]
            -- upvalues: v54 (copy), v56 (copy), v58 (copy), v60 (copy)
            v54:Disconnect();
            v56:Disconnect();
            v58:Disconnect();
            v60:Disconnect();
        end;
    end, {
        v29.callProtocol
    });
    local v62, v63 = v3.useState(nil);
    if l_Enabled_0() and v13 then
        v3.useEffect(function() --[[ Line: 184 ]]
            -- upvalues: v13 (ref), v63 (copy)
            local v65 = v13:layout():connect(function(v64) --[[ Line: 186 ]]
                -- upvalues: v63 (ref)
                v63(v64);
            end);
            return function() --[[ Line: 190 ]]
                -- upvalues: v65 (copy)
                v65.disconnect();
            end;
        end, {});
    end;
    v3.useEffect(function() --[[ Line: 196 ]]
        -- upvalues: v45 (copy), l_RoduxCall_0 (ref), v52 (copy), v34 (copy), v38 (copy), v27 (ref), l_CurrentCamera_0 (ref)
        local v66 = true;
        if v45 ~= l_RoduxCall_0.Enums.Status.Connecting then
            v66 = true;
            if v45 ~= l_RoduxCall_0.Enums.Status.Teleporting then
                v66 = true;
                if v45 ~= l_RoduxCall_0.Enums.Status.Active then
                    v66 = false;
                    if v45 == l_RoduxCall_0.Enums.Status.Idle then
                        v66 = game.JobId == v52;
                    end;
                end;
            end;
        end;
        if v66 then
            v34(true);
        end;
        v38(if v66 then v27.On else v27.Off);
        local v67 = l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 209 ]]
            -- upvalues: v38 (ref), v66 (copy), v27 (ref)
            v38(if v66 then v27.On else v27.Off);
        end);
        return function() --[[ Line: 213 ]]
            -- upvalues: v67 (copy)
            v67:Disconnect();
        end;
    end, {
        v45, 
        v52, 
        v62
    });
    v3.useEffect(function() --[[ Line: 222 ]]
        -- upvalues: v29 (copy), l_CallAction_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v30 (copy), l_RoduxCall_0 (ref)
        local v69 = v29.callProtocol:listenToHandleEndCall(function(v68) --[[ Line: 223 ]]
            -- upvalues: l_CallAction_0 (ref), l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v30 (ref), l_RoduxCall_0 (ref)
            if v68.callAction == l_CallAction_0.Cancel then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v68.callAction == l_CallAction_0.Decline then
                l_SoundManager_0:StopSound(l_Sounds_0.Ringtone.Name);
                l_SoundManager_0:PlaySound(l_Sounds_0.CallDecline.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            elseif v68.callAction == l_CallAction_0.Finish then
                l_SoundManager_0:PlaySound(l_Sounds_0.HangUp.Name, {
                    Volume = 0.5
                }, l_SoundGroups_0.Iris);
            end;
            v30(l_RoduxCall_0.Actions.UpdateCall(v68));
        end);
        return function() --[[ Line: 237 ]]
            -- upvalues: v69 (copy)
            v69:Disconnect();
        end;
    end, {
        v29.callProtocol
    });
    return if v33 then v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        CallBar = v3.createElement(v24, {
            size = v25, 
            activeUtc = v49, 
            position = v35:map(function(v70) --[[ Line: 251 ]]
                return UDim2.fromOffset(math.round(v70.X), (math.round(v70.Y)));
            end)
        })
    }) else nil;
end;