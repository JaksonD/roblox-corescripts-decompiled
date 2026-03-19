local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Service);
local v7 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils);
local l_MappedSignal_0 = v7.MappedSignal;
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v11 = require(l_script_FirstAncestor_0.Integrations.AvatarSwitcher.AvatarSwitcherChromeWrapper);
local v12 = require(l_script_FirstAncestor_0.Integrations.AvatarSwitcher.AvatarSwitcherIcon);
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v14 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagChromeWindowSignalConstraintsToggle_0 = v14.FFlagChromeWindowSignalConstraintsToggle;
local l_FFlagRemoveAvatarSwitcherIfUnsupported_0 = v14.FFlagRemoveAvatarSwitcherIfUnsupported;
local l_game_EngineFeature_0 = game:GetEngineFeature("AddAvatarsSwitcherToCoreGUI");
local v18 = l_MappedSignal_0.new(v6:onIntegrationStatusChanged(), function() --[[ Line: 23 ]]
    -- upvalues: v6 (copy), v10 (copy)
    return v6:isWindowOpen(v10.AVATAR_SWITCHER_ID);
end);
local v19 = if l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then l_Url_0.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support" else nil;
local v20 = if l_FFlagChromeWindowSignalConstraintsToggle_0 then v9.new(844, 754, false, true) else v9.new(844, 754, false);
local v21 = not l_game_EngineFeature_0 or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.All) or l_StarterGui_0:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher);
local function _() --[[ Line: 45 ]] --[[ Name: getInitialAvailability ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v21 (ref), l_FFlagRemoveAvatarSwitcherIfUnsupported_0 (copy), v6 (copy)
    if l_game_EngineFeature_0 then
        if v21 and not l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then
            return v6.AvailabilitySignal.Available;
        else
            return v6.AvailabilitySignal.Unavailable;
        end;
    elseif l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then
        return v6.AvailabilitySignal.Unavailable;
    else
        return v6.AvailabilitySignal.Available;
    end;
end;
local v24 = v6:register({
    initialAvailability = if l_game_EngineFeature_0 then if l_game_EngineFeature_0 then if not v21 or l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then v6.AvailabilitySignal.Unavailable else v6.AvailabilitySignal.Available else if l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then v6.AvailabilitySignal.Unavailable else v6.AvailabilitySignal.Available else if l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then v6.AvailabilitySignal.Unavailable else v6.AvailabilitySignal.Available, 
    id = v10.AVATAR_SWITCHER_ID, 
    label = "Feature.AvatarSwitcher.Heading.SwitchAvatar", 
    activated = function(_) --[[ Line: 67 ]] --[[ Name: activated ]]
        -- upvalues: v6 (copy), v10 (copy)
        v6:toggleWindow(v10.AVATAR_SWITCHER_ID);
    end, 
    isActivated = function() --[[ Line: 70 ]] --[[ Name: isActivated ]]
        -- upvalues: v18 (copy)
        return v18:get();
    end, 
    cachePosition = true, 
    draggable = true, 
    windowSize = v20, 
    components = {
        Icon = function() --[[ Line: 77 ]] --[[ Name: Icon ]]
            -- upvalues: v5 (copy), v12 (copy), v18 (copy)
            return v5.createElement(v12, {
                isActive = v18
            });
        end, 
        Window = function() --[[ Line: 83 ]] --[[ Name: Window ]]
            -- upvalues: v5 (copy), v11 (copy), v20 (copy)
            return v5.createElement(v11, {
                windowSize = v20, 
                maxWindowWidth = 844, 
                maxWindowHeight = 754
            });
        end
    }
});
if l_game_EngineFeature_0 then
    local v25 = not l_FFlagRemoveAvatarSwitcherIfUnsupported_0;
    do
        local l_v25_0 = v25;
        local function _() --[[ Line: 98 ]] --[[ Name: updateAvatarSwitcherAvailability ]]
            -- upvalues: v21 (ref), l_v25_0 (ref), v24 (copy), v6 (copy), v10 (copy)
            if v21 and l_v25_0 then
                v24.availability:available();
                return;
            else
                if v6:isWindowOpen(v10.AVATAR_SWITCHER_ID) then
                    v6:toggleWindow(v10.AVATAR_SWITCHER_ID);
                end;
                v24.availability:unavailable();
                return;
            end;
        end;
        v7.setCoreGuiAvailability(v24, Enum.CoreGuiType.AvatarSwitcher, function(v28) --[[ Line: 110 ]]
            -- upvalues: v21 (ref), l_v25_0 (ref), v24 (copy), v6 (copy), v10 (copy)
            v21 = v28;
            if v21 and l_v25_0 then
                v24.availability:available();
                return;
            else
                if v6:isWindowOpen(v10.AVATAR_SWITCHER_ID) then
                    v6:toggleWindow(v10.AVATAR_SWITCHER_ID);
                end;
                v24.availability:unavailable();
                return;
            end;
        end);
        if l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then
            task.spawn(function() --[[ Line: 117 ]]
                -- upvalues: l_HttpRbxApiService_0 (copy), v19 (copy), l_HttpService_0 (copy), l_v25_0 (ref), v21 (ref), v24 (copy), v6 (copy), v10 (copy)
                if not game:IsLoaded() then
                    game.Loaded:Wait();
                end;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 123 ]]
                    -- upvalues: l_HttpRbxApiService_0 (ref), v19 (ref), l_HttpService_0 (ref)
                    local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v19);
                    return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
                end);
                if l_status_0 and l_result_0 and l_result_0.experienceAvatarSupportType ~= 0 then
                    l_v25_0 = true;
                    if v21 and l_v25_0 then
                        v24.availability:available();
                        return;
                    else
                        if v6:isWindowOpen(v10.AVATAR_SWITCHER_ID) then
                            v6:toggleWindow(v10.AVATAR_SWITCHER_ID);
                        end;
                        v24.availability:unavailable();
                    end;
                end;
            end);
        end;
    end;
elseif l_FFlagRemoveAvatarSwitcherIfUnsupported_0 then
    task.spawn(function() --[[ Line: 140 ]]
        -- upvalues: l_HttpRbxApiService_0 (copy), v19 (copy), l_HttpService_0 (copy), v24 (copy)
        if not game:IsLoaded() then
            game.Loaded:Wait();
        end;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 146 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v19 (ref), l_HttpService_0 (ref)
            local l_l_HttpRbxApiService_0_AsyncFullUrl_1 = l_HttpRbxApiService_0:GetAsyncFullUrl(v19);
            return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_1);
        end);
        if l_status_1 and l_result_1 and l_result_1.experienceAvatarSupportType ~= 0 then
            v24.availability:available();
        end;
    end);
end;
return v24;