local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Service);
local v4 = require(script.Parent.ConnectIcon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local v6 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_InExperienceAppChatModal_0 = v5.App.InExperienceAppChatModal;
local v8 = require(l_script_FirstAncestor_0.Integrations.ChromeIntegrationUtils);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.LocalStore);
local v10 = require(l_script_FirstAncestor_0.Flags.GetFStringConnectTooltipLocalStorageKey);
local l_FFlagEnableUnibarFtuxTooltips_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnibarFtuxTooltips;
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_Symbol_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Symbol;
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v15 = game:DefineFastFlag("AppChatInExpUseUnibarNotification", false);
local v16 = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
return function(v20, v21) --[[ Line: 32 ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), v3 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_InExperienceAppChatModal_0 (copy), v8 (copy), v16 (copy), v6 (copy), l_FocusUtils_0 (copy), l_FFlagEnableUnibarFtuxTooltips_0 (copy), v9 (copy), v10 (copy), v2 (copy), v4 (copy), v15 (copy), l_Symbol_0 (copy), l_MouseIconOverrideService_0 (copy)
    local v22 = false;
    if v20 == "connect_unibar" then
        v22 = l_GetFFlagIsSquadEnabled_0();
    end;
    local v24 = v3:register({
        id = v20, 
        label = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Squads.Label.Party" or "Feature.Chat.Label.RobloxChat", 
        activated = function() --[[ Line: 40 ]] --[[ Name: activated ]]
            -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), l_InExperienceAppChatModal_0 (ref), v8 (ref), v16 (ref), v6 (ref), l_FocusUtils_0 (ref), l_FFlagEnableUnibarFtuxTooltips_0 (ref), v9 (ref), v10 (ref)
            if l_FFlagEnableAppChatFocusableFixes_0 then
                if l_InExperienceAppChatModal_0:getVisible() then
                    l_InExperienceAppChatModal_0.default:setVisible(false);
                else
                    v8.dismissRobloxMenuAndRun(function() --[[ Line: 45 ]]
                        -- upvalues: v16 (ref), v6 (ref), l_FocusUtils_0 (ref), l_InExperienceAppChatModal_0 (ref)
                        if v16 then
                            if v6.GetInputModeStore(false).getLastInputType(false) == v6.Input.Directional then
                                l_FocusUtils_0.FocusOffChrome();
                            end;
                            l_InExperienceAppChatModal_0.default:setVisible(true);
                            return;
                        else
                            l_FocusUtils_0.FocusOffChrome(function() --[[ Line: 53 ]]
                                -- upvalues: l_InExperienceAppChatModal_0 (ref)
                                l_InExperienceAppChatModal_0.default:setVisible(true);
                            end);
                            return;
                        end;
                    end);
                end;
            else
                l_InExperienceAppChatModal_0:toggleVisibility();
            end;
            if l_FFlagEnableUnibarFtuxTooltips_0 then
                v9.storeForLocalPlayer(v10(), true);
            end;
        end, 
        isActivated = function() --[[ Line: 67 ]] --[[ Name: isActivated ]]
            -- upvalues: l_InExperienceAppChatModal_0 (ref)
            return l_InExperienceAppChatModal_0:getVisible();
        end, 
        components = {
            Icon = function(v23) --[[ Line: 71 ]] --[[ Name: Icon ]]
                -- upvalues: v2 (ref), v4 (ref), v20 (copy), v15 (ref), v22 (copy)
                return v2.createElement(v4, {
                    integrationId = v20, 
                    isIconVisible = v23.visible, 
                    shouldShowCustomBadge = not v15, 
                    isSquadIndicatorEnabled = v22
                });
            end
        }, 
        initialAvailability = v21
    });
    if v15 then
        if v22 then
            local function _(v25, v26) --[[ Line: 86 ]] --[[ Name: updateNotificationBadge ]]
                -- upvalues: v24 (copy)
                if v25 == 0 or v26 then
                    v24.notification:clear();
                    return;
                else
                    v24.notification:fireCount(v25);
                    return;
                end;
            end;
            l_InExperienceAppChatModal_0.default.currentSquadIdSignal.Event:Connect(function(v28) --[[ Line: 95 ]]
                -- upvalues: l_InExperienceAppChatModal_0 (ref), v24 (copy)
                local l_unreadCount_0 = l_InExperienceAppChatModal_0.default.unreadCount;
                local v30 = v28 ~= "";
                if l_unreadCount_0 == 0 or v30 then
                    v24.notification:clear();
                    return;
                else
                    v24.notification:fireCount(l_unreadCount_0);
                    return;
                end;
            end);
            l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v31) --[[ Line: 99 ]]
                -- upvalues: l_InExperienceAppChatModal_0 (ref), v24 (copy)
                local v32 = l_InExperienceAppChatModal_0.default.currentSquadId ~= "";
                if v31 == 0 or v32 then
                    v24.notification:clear();
                    return;
                else
                    v24.notification:fireCount(v31);
                    return;
                end;
            end);
            local l_unreadCount_1 = l_InExperienceAppChatModal_0.default.unreadCount;
            local v34 = l_InExperienceAppChatModal_0.default.currentSquadId ~= "";
            if l_unreadCount_1 == 0 or v34 then
                v24.notification:clear();
            else
                v24.notification:fireCount(l_unreadCount_1);
            end;
        else
            local function _(v35) --[[ Line: 108 ]] --[[ Name: updateUnreadMessageCount ]]
                -- upvalues: v24 (copy)
                if v35 == 0 then
                    v24.notification:clear();
                    return;
                else
                    v24.notification:fireCount(v35);
                    return;
                end;
            end;
            l_InExperienceAppChatModal_0.default.unreadCountSignal.Event:Connect(function(v37) --[[ Line: 116 ]]
                -- upvalues: v24 (copy)
                if v37 == 0 then
                    v24.notification:clear();
                    return;
                else
                    v24.notification:fireCount(v37);
                    return;
                end;
            end);
            local l_unreadCount_2 = l_InExperienceAppChatModal_0.default.unreadCount;
            if l_unreadCount_2 == 0 then
                v24.notification:clear();
            else
                v24.notification:fireCount(l_unreadCount_2);
            end;
        end;
    end;
    local v39 = l_Symbol_0.named("InExperienceRobloxConnect");
    l_InExperienceAppChatModal_0.default.visibilitySignal.Event:Connect(function(v40) --[[ Line: 126 ]]
        -- upvalues: l_MouseIconOverrideService_0 (ref), v39 (copy)
        if v40 then
            l_MouseIconOverrideService_0.push(v39, Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        else
            l_MouseIconOverrideService_0.pop(v39);
            return;
        end;
    end);
    return v24;
end;