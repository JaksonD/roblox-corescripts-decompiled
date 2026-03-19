local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.AppPage);
local v3 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v4 = require(l_Modules_0.LuaApp.Thunks.Authentication.AccountSwitcher.GetAccountsList);
local v5 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v6 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v7 = require(l_Modules_0.LuaApp.Thunks.Authentication.OpenAccountSelector);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableLuaLoginRevamp_0 = v10.FFlagEnableLuaLoginRevamp;
local l_FFlagEnableLoginV1ForcedUsernameOverride_0 = v10.FFlagEnableLoginV1ForcedUsernameOverride;
local l_FFlagEnableLoginV2ForcedUsernameOverride_0 = v10.FFlagEnableLoginV2ForcedUsernameOverride;
local v14 = game:DefineFastFlag("EnableAccountSwitcherDynamicAccountLimit", false);
local l_GetFIntAccountSwitcherAccountLimit_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntAccountSwitcherAccountLimit;
local l_GetAccountsListWithSignedOutAccounts_0 = require(l_CorePackages_0.Workspace.Packages.AccountSwitching).GetAccountsListWithSignedOutAccounts;
local v17 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v18 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v19 = require(l_Modules_0.LuaApp.Constants);
local v20 = require(l_CorePackages_0.Packages.React);
local l_AddAccountRow_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).AddAccountRow;
local l_MaxAccountsReachedText_0 = require(l_CorePackages_0.Workspace.Packages.AccountSelector).MaxAccountsReachedText;
local v23 = require(script.Parent.Parent.CloseCentralOverlay);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local v25 = require(script.Parent.OpenAccountSwitchingErrorOverlay);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v27 = require(script.Parent.AccountSwitcher.SwitchToAccount);
local v28 = require(script.Parent.AppStorageUtilities);
local v29 = require(script.Parent.Logout);
local l_GuiService_0 = game:GetService("GuiService");
local v31 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local function v36(v32, v33, _) --[[ Line: 53 ]]
    -- upvalues: l_FlyoutSidePanelIXP_0 (copy), v18 (copy), v20 (copy), l_MaxAccountsReachedText_0 (copy), l_useNavigation_0 (copy), l_AddAccountRow_0 (copy), v2 (copy)
    if l_FlyoutSidePanelIXP_0.isFlyoutSidePanelEnabled() then
        if v33 ~= v18.Origin.MoreMenu and v33 ~= v18.Origin.FlyoutSidePanel then
            return nil;
        end;
    elseif v33 ~= "moreMenu" then
        return nil;
    end;
    if v32 then
        return v20.createElement(l_MaxAccountsReachedText_0);
    else
        local v35 = l_useNavigation_0();
        return v20.createElement(l_AddAccountRow_0, {
            origin = v33, 
            context = v18.Context.AccountSwitcher, 
            onRowClicked = function() --[[ Line: 72 ]] --[[ Name: onRowClicked ]]
                -- upvalues: v35 (copy), v2 (ref), v33 (copy)
                v35.replace(v2.AccountSwitchingAddAccountPeekView, {
                    extraProps = {
                        origin = v33
                    }
                });
            end
        });
    end;
end;
return function(_, v38, v39, v40, v41, v42, v43, v44) --[[ Line: 79 ]]
    -- upvalues: v6 (copy), v3 (copy), v23 (copy), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (copy), l_GetAccountsListWithSignedOutAccounts_0 (copy), v5 (copy), v4 (copy), v25 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v19 (copy), v18 (copy), v14 (copy), l_GetFIntAccountSwitcherAccountLimit_0 (copy), v29 (copy), l_GuiService_0 (copy), v31 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), v17 (copy), v2 (copy), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (copy), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (copy), v28 (copy), v27 (copy), v36 (copy), v7 (copy)
    return function(v45) --[[ Line: 90 ]]
        -- upvalues: v6 (ref), v3 (ref), v23 (ref), l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0 (ref), v44 (copy), l_GetAccountsListWithSignedOutAccounts_0 (ref), v38 (copy), v5 (ref), v4 (ref), v25 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v19 (ref), v40 (copy), v18 (ref), v14 (ref), l_GetFIntAccountSwitcherAccountLimit_0 (ref), v39 (copy), v29 (ref), l_GuiService_0 (ref), v31 (ref), l_FFlagEnableLuaLoginRevamp_0 (ref), v17 (ref), v2 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref), v28 (ref), v27 (ref), v41 (copy), v42 (copy), v36 (ref), v7 (ref), v43 (copy)
        if not v6 then
            return nil;
        else
            local v46 = v45:getState().AuthenticationStatus.status == v3.LOGGED_IN;
            local function v47() --[[ Line: 97 ]]
                -- upvalues: v45 (copy), v23 (ref)
                v45:dispatch(v23());
            end;
            local v48 = l_GetFFlagEnableAccountSwitcherSignedOutAccounts_0() and v44;
            local _ = nil;
            return (if v48 then l_GetAccountsListWithSignedOutAccounts_0(v38, {
                isAuthenticated = v46, 
                filterUnauthenticatedSessionsForAccountPicker = true
            }):andThen(function(v50) --[[ Line: 108 ]]
                -- upvalues: v5 (ref)
                return {
                    active_user_id = tostring(v5.fromLocalStorage().userId), 
                    logged_in_users_metadata = v50
                };
            end) else v4(v38, v46)):andThen(function(v51) --[[ Line: 120 ]]
                -- upvalues: v46 (copy), v45 (copy), v25 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v47 (copy), v19 (ref), v5 (ref), v40 (ref), v18 (ref), v14 (ref), l_GetFIntAccountSwitcherAccountLimit_0 (ref), v48 (copy), v39 (ref), v44 (ref), v29 (ref), v38 (ref), l_GuiService_0 (ref), v31 (ref), v23 (ref), l_FFlagEnableLuaLoginRevamp_0 (ref), v17 (ref), v2 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref), v28 (ref), v27 (ref), v41 (ref), v42 (ref), v36 (ref), v7 (ref), v43 (ref)
                local l_logged_in_users_metadata_0 = v51.logged_in_users_metadata;
                if #l_logged_in_users_metadata_0 == 0 then
                    if v46 == true then
                        v45:dispatch(v25(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" or "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", v47, nil, v19.Auth.AccountSwitcherUnavailableError));
                    end;
                    return 0;
                else
                    local l_active_user_id_0 = v51.active_user_id;
                    local v54 = tostring(v5.fromLocalStorage().userId);
                    if v40 ~= nil and l_active_user_id_0 ~= nil and l_active_user_id_0 ~= "" and l_active_user_id_0 ~= v54 then
                        local v55 = l_active_user_id_0 .. "," .. v54;
                        v40.reportAuthClientError(v18.Context.AccountSwitcherMismatch, v55);
                    end;
                    local v56 = false;
                    if v14 and #l_logged_in_users_metadata_0 >= l_GetFIntAccountSwitcherAccountLimit_0() then
                        v56 = true;
                    elseif not v14 and #l_logged_in_users_metadata_0 >= 5 then
                        v56 = true;
                    end;
                    local v57 = {};
                    for _, v59 in l_logged_in_users_metadata_0 do
                        local v60 = v59.user_id == l_active_user_id_0;
                        table.insert(v57, {
                            id = v59.user_id, 
                            name = v59.username, 
                            displayName = v59.display_name, 
                            iconKey = v60 and "icons/status/success_large" or nil, 
                            isUnselectable = v60, 
                            hasValidSession = not v48 or v59.has_valid_session
                        });
                    end;
                    table.sort(v57, function(v61, v62) --[[ Line: 179 ]]
                        -- upvalues: v51 (copy)
                        if v61.id == v51.active_user_id then
                            return true;
                        else
                            return v61.hasValidSession and not v62.hasValidSession;
                        end;
                    end);
                    local v67 = {
                        origin = v39, 
                        context = v18.Context.AccountSwitcher, 
                        users = v57, 
                        actionRows = {}, 
                        isMaxAccountsReached = v56, 
                        enableSignedOutAccounts = v44, 
                        logout = function() --[[ Line: 197 ]] --[[ Name: logout ]]
                            -- upvalues: v45 (ref), v29 (ref), v38 (ref), l_GuiService_0 (ref), v31 (ref)
                            v45:dispatch(v29(v38, l_GuiService_0, v31.ManageAccountsRemoveCurrentUser, nil));
                        end, 
                        onAccountSelection = function(v63) --[[ Line: 202 ]] --[[ Name: onAccountSelection ]]
                            -- upvalues: v57 (copy), v48 (ref), v45 (ref), v23 (ref), l_FFlagEnableLuaLoginRevamp_0 (ref), v17 (ref), v2 (ref), l_FFlagEnableLoginV2ForcedUsernameOverride_0 (ref), l_FFlagEnableLoginV1ForcedUsernameOverride_0 (ref), v28 (ref), v27 (ref), v38 (ref), v41 (ref), v42 (ref), v40 (ref)
                            local v64 = nil;
                            for _, v66 in ipairs(v57) do
                                if v66.id == v63 then
                                    v64 = v66;
                                    break;
                                end;
                            end;
                            if v48 and v64 and not v64.hasValidSession then
                                v45:dispatch(v23());
                                if l_FFlagEnableLuaLoginRevamp_0 then
                                    v45:dispatch(v17({
                                        name = v2.LoginV2, 
                                        extraProps = {
                                            forcedUsernameOverride = if l_FFlagEnableLoginV2ForcedUsernameOverride_0 then v64.name else nil
                                        }
                                    }));
                                    return;
                                else
                                    v45:dispatch(v17({
                                        name = v2.Login, 
                                        extraProps = {
                                            forcedUsernameOverride = if l_FFlagEnableLoginV1ForcedUsernameOverride_0 then v64.name else nil
                                        }
                                    }));
                                    return;
                                end;
                            else
                                v28.setAccountSwitchTargetUsername(v64.name);
                                v28.flush();
                                v45:dispatch(v27(v38, v63, v41, v42, v40));
                                return;
                            end;
                        end, 
                        onClose = v47, 
                        onAccountSelectionAbandoned = function() --[[ Line: 248 ]] --[[ Name: onAccountSelectionAbandoned ]]

                        end, 
                        titleTextKey = "Authentication.AccountSwitch.Heading.SwitchAccount", 
                        renderFooterComponent = function() --[[ Line: 252 ]] --[[ Name: renderFooterComponent ]]
                            -- upvalues: v36 (ref), v56 (ref), v39 (ref), v45 (ref)
                            return v36(v56, v39, v45);
                        end
                    };
                    local v68 = 0;
                    if v48 then
                        for _, v70 in ipairs(l_logged_in_users_metadata_0) do
                            if v70.has_valid_session then
                                v68 = v68 + 1;
                            end;
                        end;
                    else
                        v68 = #l_logged_in_users_metadata_0;
                    end;
                    if v68 > 0 then
                        v45:dispatch(v7(v67, true, l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v43));
                    end;
                    return v68;
                end;
            end):catch(function(_) --[[ Line: 279 ]]
                -- upvalues: v45 (copy), v25 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v47 (copy), v19 (ref)
                v45:dispatch(v25(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" or "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.PleaseTryAgainLater", "CommonUI.Messages.Action.OK", "", v47, nil, v19.Auth.AccountSwitcherUnavailableError));
            end);
        end;
    end;
end;