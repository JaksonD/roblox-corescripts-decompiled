local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppLifecycleObserverService_0 = game:GetService("AppLifecycleObserverService");
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useCrossPlaySettings_0 = require(l_CorePackages_0.Workspace.Packages.CrossPlay).Hooks.useCrossPlaySettings;
local l_CrossPlayCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v8 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local v10 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v11 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local l_FFlagDontUseCrossPlayGlobalEffect_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDontUseCrossPlayGlobalEffect;
local _ = require(script.Parent.Types);
local function _(v15, v16) --[[ Line: 34 ]] --[[ Name: getCrossPlayStatusText ]]
    local v17 = if v15.isEnabled then "(" .. v16.recommended .. ") " else "";
    if v15.isLoading then
        return v17 .. v16.loading;
    elseif v15.hasError then
        return v17 .. v16.error;
    elseif v15.isEnabled then
        return v17 .. v16.enabled;
    else
        return v17 .. v16.disabled;
    end;
end;
local function _(v19) --[[ Line: 49 ]] --[[ Name: isCapabilityEnabled ]]
    return v19 and v19.Success and v19.CanJoinGame and v19.PrivilegeCheckResult == "NoIssue";
end;
local function v30(v21, v22, v23, v24) --[[ Line: 53 ]] --[[ Name: getPrivilegeStatuses ]]
    -- upvalues: l_CrossPlayCapabilities_0 (copy), v3 (copy)
    local v25 = {
        [l_CrossPlayCapabilities_0.CrossPlatform] = v23.crossPlatform, 
        [l_CrossPlayCapabilities_0.Multiplayer] = v23.multiplayer, 
        [l_CrossPlayCapabilities_0.SharedContent] = v23.sharedContent
    };
    return v3.map(v21, function(v26) --[[ Line: 65 ]]
        -- upvalues: v22 (copy), v24 (copy), v23 (copy), v25 (copy)
        local v27 = v22[v26];
        local v28 = v27 and v27.Success and v27.CanJoinGame and v27.PrivilegeCheckResult == "NoIssue";
        v27 = v22[v26] and v22[v26].PrivilegeCheckResult == "Error";
        local v29 = nil;
        v29 = if v24 then v23.loading else if v27 then v23.error else if v28 then v23.allowed else v23.disallowed;
        return {
            label = v25[v26], 
            status = v29
        };
    end);
end;
local function v36(v31) --[[ Line: 87 ]] --[[ Name: useCrossPlayStatus ]]
    -- upvalues: l_useCrossPlaySettings_0 (copy), l_useLocalization_0 (copy), v4 (copy), v30 (copy), l_useEffectOnMount_0 (copy)
    local v32 = l_useCrossPlaySettings_0();
    local v33 = l_useLocalization_0({
        multiplayer = "Feature.Settings.Label.Multiplayer", 
        sharedContent = "Feature.Settings.Label.SharedContent", 
        recommended = "Feature.Settings.Label.Recommended", 
        enabled = "Feature.Settings.Label.Enabled", 
        disabled = "Feature.Settings.Label.Disabled", 
        loading = "Feature.Settings.Label.Loading", 
        error = "Feature.Settings.Label.Error", 
        allowed = "Feature.Settings.Label.Allowed", 
        disallowed = "Feature.Settings.Label.Disallowed"
    });
    local v34 = if v32.isEnabled then "(" .. v33.recommended .. ") " else "";
    local v35 = if v32.isLoading then v34 .. v33.loading else if v32.hasError then v34 .. v33.error else if v32.isEnabled then v34 .. v33.enabled else v34 .. v33.disabled;
    v34 = v4.useMemo(function() --[[ Line: 103 ]]
        -- upvalues: v30 (ref), v31 (copy), v32 (copy), v33 (copy)
        return v30(v31, v32.systemPrivileges, v33, v32.isLoading);
    end, {
        v32, 
        v31, 
        v33
    });
    l_useEffectOnMount_0(function() --[[ Line: 112 ]]
        -- upvalues: v32 (copy)
        v32.reload();
    end);
    return (v4.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v32 (copy), v35 (copy), v34 (copy)
        return {
            crossPlaySettings = v32, 
            crossPlayStatusText = v35, 
            privilegeStatuses = v34
        };
    end, {
        v32, 
        v35, 
        v34
    }));
end;
local function _(v37, v38, v39) --[[ Line: 134 ]] --[[ Name: getAccountSettingsSuccess ]]
    -- upvalues: v3 (copy)
    return v3.reduce(v38, function(v40, v41) --[[ Line: 135 ]]
        -- upvalues: v39 (copy)
        local l_v40_0 = v40;
        if l_v40_0 then
            local v43 = v39[v41];
            l_v40_0 = v43 and v43.Success and v43.CanJoinGame and v43.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v40_0;
    end, v37.isEnabled);
end;
return function(v45) --[[ Line: 140 ]] --[[ Name: DeviceSettingsSection ]]
    -- upvalues: v8 (copy), l_useLocalization_0 (copy), v36 (copy), l_FFlagDontUseCrossPlayGlobalEffect_0 (copy), v4 (copy), l_AppLifecycleObserverService_0 (copy), v3 (copy), v11 (copy), l_BodyText_0 (copy), v10 (copy)
    local v47 = v8(function(v46) --[[ Line: 141 ]]
        return v46.getPlatformAccountName();
    end);
    local v48 = l_useLocalization_0({
        platformAccountSettingsSuccess = {
            "Feature.Settings.Description.PlatformAccountSettingsSuccess"; 
            platform = v47
        }, 
        platformAccountSettings = {
            "Feature.Settings.Heading.PlatformAccountSettings"; 
            platform = v47
        }, 
        crossPlatform = "Feature.Settings.Label.CrossPlatform", 
        crossPlatformDescription = "Feature.Settings.Description.CrossPlatform"
    });
    local v50 = v8(function(v49) --[[ Line: 155 ]]
        return (v49.getCrossPlayCapabilities());
    end);
    local v51 = v36(v50);
    local l_crossPlaySettings_0 = v51.crossPlaySettings;
    local l_crossPlayStatusText_0 = v51.crossPlayStatusText;
    local l_privilegeStatuses_0 = v51.privilegeStatuses;
    if l_FFlagDontUseCrossPlayGlobalEffect_0 then
        v4.useEffect(function() --[[ Line: 165 ]]
            -- upvalues: l_AppLifecycleObserverService_0 (ref), l_crossPlaySettings_0 (copy)
            local v55 = l_AppLifecycleObserverService_0.OnBecomeActive:Connect(function() --[[ Line: 166 ]]
                -- upvalues: l_crossPlaySettings_0 (ref)
                l_crossPlaySettings_0.reload();
            end);
            return function() --[[ Line: 170 ]]
                -- upvalues: v55 (copy)
                v55:Disconnect();
            end;
        end, {
            l_crossPlaySettings_0
        });
    end;
    local v58 = v3.map(l_privilegeStatuses_0, function(v56, v57) --[[ Line: 176 ]]
        -- upvalues: v4 (ref), v11 (ref), l_crossPlaySettings_0 (copy)
        return v4.createElement(v11, {
            layoutOrder = v57 + 2, 
            title = v56.label, 
            status = v56.status, 
            onActivated = l_crossPlaySettings_0.invokeSystemUi
        });
    end);
    local l_systemPrivileges_0 = l_crossPlaySettings_0.systemPrivileges;
    l_systemPrivileges_0 = if v3.reduce(v50, function(v60, v61) --[[ Line: 135 ]]
        -- upvalues: l_systemPrivileges_0 (copy)
        local l_v60_0 = v60;
        if l_v60_0 then
            local v63 = l_systemPrivileges_0[v61];
            l_v60_0 = v63 and v63.Success and v63.CanJoinGame and v63.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v60_0;
    end, l_crossPlaySettings_0.isEnabled) then v4.createElement(l_BodyText_0, {
        layoutOrder = 10, 
        text = v48.platformAccountSettingsSuccess
    }) else nil;
    return v4.createElement(v10, {
        layoutOrder = v45.layoutOrder, 
        withDivider = v45.withDivider, 
        title = v48.platformAccountSettings
    }, v3.append({
        v4.createElement(v11, {
            layoutOrder = 1, 
            title = v48.crossPlatform, 
            status = l_crossPlayStatusText_0, 
            isDisabled = l_crossPlaySettings_0.isLoading, 
            onActivated = l_crossPlaySettings_0.toggle
        }), 
        v4.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v48.crossPlatformDescription
        })
    }, v58, {
        l_systemPrivileges_0
    }));
end;