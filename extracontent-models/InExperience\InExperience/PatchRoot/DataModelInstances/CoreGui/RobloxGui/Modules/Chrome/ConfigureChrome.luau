local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
if not require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled() then
    return nil;
else
    local v3 = require(l_script_FirstAncestor_0.Service);
    local v4 = require(l_script_FirstAncestor_0.Integrations.Party.Constants);
    local v5 = require(l_script_FirstAncestor_0.Integrations.Connect.isConnectUnibarEnabled);
    local v6 = require(l_script_FirstAncestor_0.Integrations.Connect.isConnectDropdownEnabled);
    local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
    local v8 = require(l_script_FirstAncestor_0.ChromeShared.Shortcuts.ConfigureShortcuts);
    local v9 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
    local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
    local l_GetFFlagDebugEnableUnibarDummyIntegrations_0 = v10.GetFFlagDebugEnableUnibarDummyIntegrations;
    local l_FFlagEnableConsoleExpControls_0 = v10.FFlagEnableConsoleExpControls;
    local l_FFlagEnableInExperienceAvatarSwitcher_0 = v10.FFlagEnableInExperienceAvatarSwitcher;
    local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
    local function _() --[[ Line: 27 ]] --[[ Name: initializeIntegrations ]]
        -- upvalues: l_script_FirstAncestor_0 (copy)
        require(l_script_FirstAncestor_0.Integrations);
    end;
    local function _() --[[ Line: 31 ]]
        -- upvalues: v8 (copy)
        v8();
    end;
    local function v20() --[[ Line: 35 ]] --[[ Name: configureUnibar ]]
        -- upvalues: v6 (copy), l_GetFFlagDebugEnableUnibarDummyIntegrations_0 (copy), v5 (copy), v4 (copy), l_isInExperienceUIVREnabled_0 (copy), l_isSpatial_0 (copy), v3 (copy), l_FFlagEnableInExperienceAvatarSwitcher_0 (copy), v9 (copy), l_GuiService_0 (copy)
        local v17 = {
            "leaderboard", 
            "emotes", 
            "backpack"
        };
        table.insert(v17, "respawn");
        table.insert(v17, 1, "trust_and_safety");
        if v6() then
            table.insert(v17, 1, "connect_dropdown");
        end;
        local v18 = {
            "toggle_mic_mute", 
            "chat", 
            "nine_dot"
        };
        table.insert(v18, 2, "join_voice");
        if l_GetFFlagDebugEnableUnibarDummyIntegrations_0() then
            table.insert(v18, 1, "dummy_window");
            table.insert(v18, 1, "dummy_window_2");
        end;
        if v5() then
            table.insert(v18, 1, "connect_unibar");
        end;
        local v19 = table.find(v18, "toggle_mic_mute");
        if v19 then
            table.insert(v18, v19 + 1, v4.TOGGLE_MIC_INTEGRATION_ID);
        end;
        if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then
            v3:configureMenu({
                {
                    "vr_toggle_button", 
                    "vr_safety_bubble"
                }, 
                v18
            });
        else
            v3:configureMenu({
                v18
            });
        end;
        if l_isInExperienceUIVREnabled_0 then
            if not l_isSpatial_0() then
                table.insert(v17, 2, "camera_entrypoint");
                table.insert(v17, 2, "selfie_view");
            end;
        else
            table.insert(v17, 2, "camera_entrypoint");
            table.insert(v17, 2, "selfie_view");
        end;
        if l_FFlagEnableInExperienceAvatarSwitcher_0 then
            table.insert(v17, 3, v9.AVATAR_SWITCHER_ID);
        end;
        if not l_isSpatial_0() and not l_GuiService_0:IsTenFootInterface() then
            table.insert(v17, 4, "music_entrypoint");
        end;
        v3:configureSubMenu("nine_dot", v17);
    end;
    require(l_script_FirstAncestor_0.Integrations);
    if l_FFlagEnableConsoleExpControls_0 then
        v8();
    end;
    v20();
    return nil;
end;