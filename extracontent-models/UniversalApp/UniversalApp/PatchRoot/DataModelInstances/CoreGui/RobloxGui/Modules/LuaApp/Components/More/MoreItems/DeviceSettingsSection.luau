local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useCrossPlaySettings_0 = require(l_CorePackages_0.Workspace.Packages.CrossPlay).Hooks.useCrossPlaySettings;
local l_CrossPlayCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useEffectOnMount_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount;
local v9 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v10 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local l_BodyText_0 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText;
local _ = require(script.Parent.Types);
local function _(v13, v14) --[[ Line: 30 ]] --[[ Name: getCrossPlayStatusText ]]
    local v15 = if v13.isEnabled then "(" .. v14.recommended .. ") " else "";
    if v13.isLoading then
        return v15 .. v14.loading;
    elseif v13.hasError then
        return v15 .. v14.error;
    elseif v13.isEnabled then
        return v15 .. v14.enabled;
    else
        return v15 .. v14.disabled;
    end;
end;
local function _(v17) --[[ Line: 45 ]] --[[ Name: isCapabilityEnabled ]]
    return v17 and v17.Success and v17.CanJoinGame and v17.PrivilegeCheckResult == "NoIssue";
end;
local function v28(v19, v20, v21, v22) --[[ Line: 49 ]] --[[ Name: getPrivilegeStatuses ]]
    -- upvalues: l_CrossPlayCapabilities_0 (copy), v2 (copy)
    local v23 = {
        [l_CrossPlayCapabilities_0.CrossPlatform] = v21.crossPlatform, 
        [l_CrossPlayCapabilities_0.Multiplayer] = v21.multiplayer, 
        [l_CrossPlayCapabilities_0.SharedContent] = v21.sharedContent
    };
    return v2.map(v19, function(v24) --[[ Line: 61 ]]
        -- upvalues: v20 (copy), v22 (copy), v21 (copy), v23 (copy)
        local v25 = v20[v24];
        local v26 = v25 and v25.Success and v25.CanJoinGame and v25.PrivilegeCheckResult == "NoIssue";
        v25 = v20[v24] and v20[v24].PrivilegeCheckResult == "Error";
        local v27 = nil;
        v27 = if v22 then v21.loading else if v25 then v21.error else if v26 then v21.allowed else v21.disallowed;
        return {
            label = v23[v24], 
            status = v27
        };
    end);
end;
local function v34(v29) --[[ Line: 83 ]] --[[ Name: useCrossPlayStatus ]]
    -- upvalues: l_useCrossPlaySettings_0 (copy), l_useLocalization_0 (copy), v3 (copy), v28 (copy), l_useEffectOnMount_0 (copy)
    local v30 = l_useCrossPlaySettings_0();
    local v31 = l_useLocalization_0({
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
    local v32 = if v30.isEnabled then "(" .. v31.recommended .. ") " else "";
    local v33 = if v30.isLoading then v32 .. v31.loading else if v30.hasError then v32 .. v31.error else if v30.isEnabled then v32 .. v31.enabled else v32 .. v31.disabled;
    v32 = v3.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: v28 (ref), v29 (copy), v30 (copy), v31 (copy)
        return v28(v29, v30.systemPrivileges, v31, v30.isLoading);
    end, {
        v30, 
        v29, 
        v31
    });
    l_useEffectOnMount_0(function() --[[ Line: 108 ]]
        -- upvalues: v30 (copy)
        v30.reload();
    end);
    return (v3.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v30 (copy), v33 (copy), v32 (copy)
        return {
            crossPlaySettings = v30, 
            crossPlayStatusText = v33, 
            privilegeStatuses = v32
        };
    end, {
        v30, 
        v33, 
        v32
    }));
end;
local function _(v35, v36, v37) --[[ Line: 130 ]] --[[ Name: getAccountSettingsSuccess ]]
    -- upvalues: v2 (copy)
    return v2.reduce(v36, function(v38, v39) --[[ Line: 131 ]]
        -- upvalues: v37 (copy)
        local l_v38_0 = v38;
        if l_v38_0 then
            local v41 = v37[v39];
            l_v38_0 = v41 and v41.Success and v41.CanJoinGame and v41.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v38_0;
    end, v35.isEnabled);
end;
return function(v43) --[[ Line: 136 ]] --[[ Name: DeviceSettingsSection ]]
    -- upvalues: v7 (copy), l_useLocalization_0 (copy), v34 (copy), v2 (copy), v3 (copy), v10 (copy), l_BodyText_0 (copy), v9 (copy)
    local v45 = v7(function(v44) --[[ Line: 137 ]]
        return v44.getPlatformAccountName();
    end);
    local v46 = l_useLocalization_0({
        platformAccountSettingsSuccess = {
            "Feature.Settings.Description.PlatformAccountSettingsSuccess"; 
            platform = v45
        }, 
        platformAccountSettings = {
            "Feature.Settings.Heading.PlatformAccountSettings"; 
            platform = v45
        }, 
        crossPlatform = "Feature.Settings.Label.CrossPlatform", 
        crossPlatformDescription = "Feature.Settings.Description.CrossPlatform"
    });
    local v48 = v7(function(v47) --[[ Line: 151 ]]
        return (v47.getCrossPlayCapabilities());
    end);
    local v49 = v34(v48);
    local l_crossPlaySettings_0 = v49.crossPlaySettings;
    local l_crossPlayStatusText_0 = v49.crossPlayStatusText;
    local l_privilegeStatuses_0 = v49.privilegeStatuses;
    local v55 = v2.map(l_privilegeStatuses_0, function(v53, v54) --[[ Line: 160 ]]
        -- upvalues: v3 (ref), v10 (ref), l_crossPlaySettings_0 (copy)
        return v3.createElement(v10, {
            layoutOrder = v54 + 2, 
            title = v53.label, 
            status = v53.status, 
            onActivated = l_crossPlaySettings_0.invokeSystemUi
        });
    end);
    local l_systemPrivileges_0 = l_crossPlaySettings_0.systemPrivileges;
    l_systemPrivileges_0 = if v2.reduce(v48, function(v57, v58) --[[ Line: 131 ]]
        -- upvalues: l_systemPrivileges_0 (copy)
        local l_v57_0 = v57;
        if l_v57_0 then
            local v60 = l_systemPrivileges_0[v58];
            l_v57_0 = v60 and v60.Success and v60.CanJoinGame and v60.PrivilegeCheckResult == "NoIssue";
        end;
        return l_v57_0;
    end, l_crossPlaySettings_0.isEnabled) then v3.createElement(l_BodyText_0, {
        layoutOrder = 10, 
        text = v46.platformAccountSettingsSuccess
    }) else nil;
    return v3.createElement(v9, {
        layoutOrder = v43.layoutOrder, 
        withDivider = v43.withDivider, 
        title = v46.platformAccountSettings
    }, v2.append({
        v3.createElement(v10, {
            layoutOrder = 1, 
            title = v46.crossPlatform, 
            status = l_crossPlayStatusText_0, 
            isDisabled = l_crossPlaySettings_0.isLoading, 
            onActivated = l_crossPlaySettings_0.toggle
        }), 
        v3.createElement(l_BodyText_0, {
            layoutOrder = 2, 
            text = v46.crossPlatformDescription
        })
    }, v55, {
        l_systemPrivileges_0
    }));
end;