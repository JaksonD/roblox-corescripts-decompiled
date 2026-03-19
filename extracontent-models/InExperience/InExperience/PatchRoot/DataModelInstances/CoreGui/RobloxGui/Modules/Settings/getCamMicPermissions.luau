local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicePermissionGrantedSignal);
local v8 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
local v9 = require(l_CorePackages_0.Packages.Promise);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.Tracker.TrackerMenu);
local v12 = require(l_RobloxGui_0.Modules.Tracker.TrackerPromptType);
local l_GetFFlagAvatarChatServiceEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAvatarChatServiceEnabled;
local v14 = require(l_RobloxGui_0.Modules.Flags.getFFlagDoNotPromptCameraPermissionsOnMount);
local v15 = require(l_RobloxGui_0.Modules.Flags.getFFlagEnableAnalyticsForCameraDevicePermissions);
local l_GetFFlagJoinWithoutMicPermissions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagJoinWithoutMicPermissions;
local v17 = game:DefineFastFlag("CheckCameraAvailabilityBeforePermissions", false);
local v18 = game:DefineFastFlag("DebugSkipVoicePermissionCheck", false);
local v19 = if l_GetFFlagAvatarChatServiceEnabled_0() then game:GetService("AvatarChatService") else nil;
local v20 = nil;
local v21 = nil;
local v22 = {};
local v23 = false;
local function v28(v24, v25, v26) --[[ Line: 71 ]] --[[ Name: removePermissionsBasedOnUserSetting ]]
    -- upvalues: v5 (copy), l_default_0 (copy), l_GetFFlagJoinWithoutMicPermissions_0 (copy), v18 (copy), v17 (copy), l_VideoCaptureService_0 (copy)
    if not v24.isCameraEnabled and v5.List.find(v25, l_default_0.Permissions.CAMERA_ACCESS) then
        v25 = v5.List.removeValue(v25, l_default_0.Permissions.CAMERA_ACCESS);
    end;
    if l_GetFFlagJoinWithoutMicPermissions_0() then
        if not v24.isVoiceEnabled and v5.List.find(v25, l_default_0.Permissions.MICROPHONE_ACCESS) or v26 == nil then
            v25 = v5.List.removeValue(v25, l_default_0.Permissions.MICROPHONE_ACCESS);
        end;
    elseif not v24.isVoiceEnabled and v5.List.find(v25, l_default_0.Permissions.MICROPHONE_ACCESS) then
        v25 = v5.List.removeValue(v25, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if v18 and v5.List.find(v25, l_default_0.Permissions.MICROPHONE_ACCESS) then
        v25 = v5.List.removeValue(v25, l_default_0.Permissions.MICROPHONE_ACCESS);
    end;
    if v17 and v5.List.find(v25, l_default_0.Permissions.CAMERA_ACCESS) then
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        if v5.isEmpty(l_l_VideoCaptureService_0_CameraDevices_0) then
            v25 = v5.List.removeValue(v25, l_default_0.Permissions.CAMERA_ACCESS);
        end;
    end;
    return v25;
end;
local function v56(v29, v30, v31, v32, v33, v34) --[[ Line: 125 ]] --[[ Name: requestPermissions ]]
    -- upvalues: v5 (copy), l_default_0 (copy), v28 (copy), v23 (ref), v9 (copy), v8 (copy), v20 (ref), v21 (ref), v7 (copy), v15 (copy), l_RunService_0 (copy), l_RbxAnalyticsService_0 (copy), v14 (copy), v11 (copy), v12 (copy)
    local v35 = v5.List.find(v32, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
    local v36 = v5.List.find(v32, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    local v37 = v28(v29, v32, v33);
    local v38 = v5.List.find(v37, l_default_0.Permissions.CAMERA_ACCESS) ~= nil;
    local v39 = v5.List.find(v37, l_default_0.Permissions.MICROPHONE_ACCESS) ~= nil;
    if not v37 or #v37 <= 0 then
        v30({
            hasCameraPermissions = false, 
            hasMicPermissions = false
        });
        v23 = false;
        v31();
        return;
    elseif v33 == true then
        return v9.new(function(v40, _) --[[ Line: 155 ]]
            -- upvalues: v37 (copy), l_default_0 (ref), v30 (copy), v23 (ref), v31 (copy)
            local v42 = {};
            for _, v44 in ipairs(v37) do
                local v45, v46 = l_default_0:hasPermissions({
                    v44
                }):await();
                if v45 then
                    v42[v44] = v46.status == l_default_0.Status.AUTHORIZED;
                else
                    v42[v44] = false;
                end;
            end;
            local v47 = {
                hasCameraPermissions = v42[l_default_0.Permissions.CAMERA_ACCESS] or false, 
                hasMicPermissions = v42[l_default_0.Permissions.MICROPHONE_ACCESS] or false
            };
            v30(v47);
            v23 = false;
            v31();
            v40(v42);
        end);
    else
        return l_default_0:hasPermissions(v37):andThen(function(v48) --[[ Line: 183 ]]
            -- upvalues: l_default_0 (ref), v38 (copy), v39 (copy), v30 (copy), v23 (ref), v31 (copy), v34 (copy), v8 (ref), v37 (copy), v5 (ref), v20 (ref), v35 (copy), v21 (ref), v36 (copy), v7 (ref), v15 (ref), l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v14 (ref), v11 (ref), v12 (ref)
            if v48.status == l_default_0.Status.AUTHORIZED then
                local v49 = {
                    hasCameraPermissions = v38, 
                    hasMicPermissions = v39
                };
                v30(v49);
                v23 = false;
                v31();
                return v48;
            else
                if v39 and v34 then
                    v8:logPromptImpression({
                        didAuthorize = false, 
                        uiContext = v34
                    });
                end;
                return l_default_0:requestPermissions(v37):andThen(function(v50) --[[ Line: 203 ]]
                    -- upvalues: v38 (ref), l_default_0 (ref), v5 (ref), v39 (ref), v20 (ref), v35 (ref), v21 (ref), v36 (ref), v7 (ref), v15 (ref), l_RunService_0 (ref), l_RbxAnalyticsService_0 (ref), v34 (ref), v8 (ref), v14 (ref), v11 (ref), v12 (ref), v30 (ref), v23 (ref), v31 (ref)
                    if typeof(v50) == "table" then
                        local v51 = v38 and (v50.status == l_default_0.Status.AUTHORIZED or not v5.List.find(v50.missingPermissions, l_default_0.Permissions.CAMERA_ACCESS));
                        local v52 = v39 and (v50.status == l_default_0.Status.AUTHORIZED or not v5.List.find(v50.missingPermissions, l_default_0.Permissions.MICROPHONE_ACCESS));
                        v20 = if v35 then v51 else nil;
                        v21 = if v36 then v52 else nil;
                        if v20 then
                            v7:fire();
                        end;
                    elseif v50 == l_default_0.Status.AUTHORIZED then
                        v7:fire();
                        v20 = v38;
                        v21 = v39;
                    else
                        v20 = false;
                        v21 = false;
                    end;
                    local v53 = {
                        hasCameraPermissions = v20 or false, 
                        hasMicPermissions = v21 or false
                    };
                    if v15() and v38 then
                        local v54 = v20 or false;
                        local v55 = l_RunService_0:IsStudio() and "studio" or "client";
                        l_RbxAnalyticsService_0:SendEventDeferred(v55, "avatarChat", "CameraDevicePermissionPrompted", {
                            didAuthorize = v54
                        });
                    end;
                    if v39 and v34 then
                        v8:logPromptInteraction({
                            didAuthorize = v21, 
                            uiContext = v34
                        });
                    end;
                    if v38 and not v20 and not v14() then
                        v11:showPrompt(v12.VideoNoPermission);
                    end;
                    v30(v53);
                    v23 = false;
                    v31();
                    return v50;
                end);
            end;
        end);
    end;
end;
local function v61(v57) --[[ Line: 289 ]] --[[ Name: tryGetCachedResults ]]
    -- upvalues: v18 (copy), v21 (ref), v20 (ref), l_default_0 (copy)
    if v18 then
        v21 = true;
    end;
    if v20 == nil or v21 == nil then
        return nil;
    else
        local v58 = false;
        for _, v60 in v57 do
            if v60 ~= l_default_0.Permissions.MICROPHONE_ACCESS and v60 ~= l_default_0.Permissions.CAMERA_ACCESS then
                v58 = true;
            end;
        end;
        if v58 then
            return nil;
        else
            return {
                hasCameraPermissions = v20 or false, 
                hasMicPermissions = v21 or false
            };
        end;
    end;
end;
local function v62(v63, v64, v65, v66, v67) --[[ Line: 321 ]] --[[ Name: getCamMicPermissions ]]
    -- upvalues: l_default_0 (copy), v22 (copy), v62 (copy), v61 (copy), v23 (ref), l_GetFFlagAvatarChatServiceEnabled_0 (copy), v9 (copy), v19 (copy), v56 (copy)
    local v68 = {};
    v68 = v64 or {
        l_default_0.Permissions.MICROPHONE_ACCESS, 
        l_default_0.Permissions.CAMERA_ACCESS
    };
    local function v70() --[[ Line: 339 ]] --[[ Name: invokeNextRequest ]]
        -- upvalues: v22 (ref), v62 (ref)
        if v22[1] then
            local v69 = v22[1];
            table.remove(v22, 1);
            v62(v69.callback, v69.permissionsToRequest, v69.shouldNotRequestPerms, v69.context, v69.getRawPermission);
        end;
    end;
    if not v67 then
        local v71 = v61(v68);
        if v71 then
            v63(v71);
            if v22[1] then
                local v72 = v22[1];
                table.remove(v22, 1);
                v62(v72.callback, v72.permissionsToRequest, v72.shouldNotRequestPerms, v72.context, v72.getRawPermission);
            end;
            return;
        end;
    end;
    if v23 then
        table.insert(v22, {
            callback = v63, 
            permissionsToRequest = v64, 
            shouldNotRequestPerms = v65, 
            context = v66, 
            getRawPermission = v67
        });
        return;
    else
        v23 = true;
        if v67 then
            return l_default_0:hasPermissions(v68):andThen(function(v73) --[[ Line: 378 ]]
                -- upvalues: v63 (copy), v23 (ref), v22 (ref), v62 (ref)
                v63(v73);
                v23 = false;
                if v22[1] then
                    local v74 = v22[1];
                    table.remove(v22, 1);
                    v62(v74.callback, v74.permissionsToRequest, v74.shouldNotRequestPerms, v74.context, v74.getRawPermission);
                end;
            end);
        elseif l_GetFFlagAvatarChatServiceEnabled_0() then
            return v9.new(function(v75, _) --[[ Line: 386 ]]
                -- upvalues: v19 (ref)
                if v19.ClientFeaturesInitialized then
                    v75({
                        isVoiceEnabled = v19:IsEnabled(v19.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                        isCameraEnabled = v19:IsEnabled(v19.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                    });
                    return;
                else
                    local v77 = nil;
                    v77 = v19:GetPropertyChangedSignal("ClientFeatures"):Connect(function() --[[ Line: 402 ]]
                        -- upvalues: v77 (ref), v19 (ref), v75 (copy)
                        v77:Disconnect();
                        local v78 = {
                            isVoiceEnabled = v19:IsEnabled(v19.ClientFeatures, Enum.AvatarChatServiceFeature.UserAudio), 
                            isCameraEnabled = v19:IsEnabled(v19.ClientFeatures, Enum.AvatarChatServiceFeature.UserVideo)
                        };
                        v75(v78);
                    end);
                    return;
                end;
            end):andThen(function(v79) --[[ Line: 417 ]]
                -- upvalues: v56 (ref), v63 (copy), v70 (copy), v68 (ref), v65 (copy), v66 (copy)
                v56(v79, v63, v70, v68, v65, v66);
            end);
        else
            return v9.new(function(v80, _) --[[ Line: 429 ]]
                v80({
                    isVoiceEnabled = false, 
                    isCameraEnabled = false
                });
            end);
        end;
    end;
end;
return v62;