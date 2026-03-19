local l_script_FirstAncestor_0 = script:FindFirstAncestor("PreHomePage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.PasskeyUpsell);
local l_PasskeyCheck_0 = v2.Utils.PasskeyCheck;
local l_CooldownCheck_0 = v2.Utils.CooldownCheck;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.CredentialsProtocol);
local l_default_0 = v9.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v9.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v12 = require(l_Parent_0.AuthAnalytics);
local l_authPageload_0 = v12.Events.authPageload;
local l_EventStreamConstants_0 = v12.EventStreamConstants;
local l_IXPServiceWrapper_0 = require(l_Parent_0.IXPServiceWrapper).IXPServiceWrapper;
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local l_userJustLoggedIn_0 = require(l_script_FirstAncestor_0.Common).Checks.userJustLoggedIn;
local function _() --[[ Line: 24 ]] --[[ Name: getShouldShowPasskeyUpsell ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy)
    return l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldShowPasskeyUpsell;
end;
local function v22() --[[ Line: 29 ]] --[[ Name: canRegisterPasskey ]]
    -- upvalues: l_default_0 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_EventStreamConstants_0 (copy), l_authPageload_0 (copy), l_Logger_0 (copy)
    return l_default_0:isAvailable(l_default_0.CredentialsTypes.FIDO2, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v19) --[[ Line: 32 ]]
        -- upvalues: l_EventStreamConstants_0 (ref), l_authPageload_0 (ref)
        local l_CredentialsProtocolAvailable_0 = l_EventStreamConstants_0.State.CredentialsProtocolAvailable;
        if not v19.isAvailable then
            l_CredentialsProtocolAvailable_0 = l_EventStreamConstants_0.State.CredentialsProtocolNotAvailable;
        end;
        l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_CredentialsProtocolAvailable_0);
        return v19.isAvailable;
    end):catch(function(v21) --[[ Line: 40 ]]
        -- upvalues: l_Logger_0 (ref)
        l_Logger_0:warning("Error checking for available credential types. Error: {}", v21);
        return false;
    end);
end;
return function(v23, v24, v25) --[[ Line: 55 ]] --[[ Name: handlePasskeyUpsell ]]
    -- upvalues: l_LinkingProtocol_0 (copy), l_Logger_0 (copy), l_authPageload_0 (copy), l_EventStreamConstants_0 (copy), v8 (copy), l_userJustLoggedIn_0 (copy), v22 (copy), l_IXPServiceWrapper_0 (copy), l_AppBtidLayers_0 (copy), l_CooldownCheck_0 (copy), l_PasskeyCheck_0 (copy), l_AppPage_0 (copy)
    local v26 = false;
    if l_LinkingProtocol_0:getLastLuaURL() ~= nil then
        v26 = l_LinkingProtocol_0:getLastLuaURL() ~= "";
    end;
    if v26 then
        l_Logger_0:info("Skipping passkey upsell due to deep link");
        l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.FilteredByDeepLink);
        return v8.resolve(false);
    elseif not l_userJustLoggedIn_0(v24) then
        l_Logger_0:info("Skipping passkey upsell due to not just logged in");
        l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.FilteredByCachedLogin);
        return v8.resolve(false);
    else
        return v22():andThen(function(v27) --[[ Line: 78 ]]
            -- upvalues: l_Logger_0 (ref), l_IXPServiceWrapper_0 (ref), l_AppBtidLayers_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_CooldownCheck_0 (ref), v23 (copy), v24 (copy), l_PasskeyCheck_0 (ref), v8 (ref), v25 (copy), l_AppPage_0 (ref)
            if not v27 then
                l_Logger_0:info("Skipping passkey upsell due to passkey registration not available");
                return false;
            else
                local l_shouldShowPasskeyUpsell_0 = l_IXPServiceWrapper_0:GetBTIDLayerData(l_AppBtidLayers_0.LoginLayer).shouldShowPasskeyUpsell;
                if not l_shouldShowPasskeyUpsell_0 then
                    l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.FilteredByIXP);
                    return false;
                else
                    local v29 = l_CooldownCheck_0(v23, v24);
                    local v30 = l_PasskeyCheck_0(v23);
                    return v8.all({
                        v29, 
                        v30
                    }):andThen(function(v31) --[[ Line: 97 ]]
                        -- upvalues: l_Logger_0 (ref), l_authPageload_0 (ref), l_EventStreamConstants_0 (ref), l_shouldShowPasskeyUpsell_0 (copy), v24 (ref), v25 (ref), l_AppPage_0 (ref)
                        local v32 = v31[1];
                        local v33 = v31[2];
                        l_Logger_0:info("Parallel passkey upsell calls completed. HasCooldown: {}, HasPasskey: {}", v32, v33);
                        if v32 then
                            l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.FilteredByCooldown);
                        end;
                        if v33 then
                            l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.FilteredByExistingPasskey);
                        end;
                        if not v32 and not v33 then
                            l_authPageload_0(l_EventStreamConstants_0.Context.HandlePreHomePageRouting, l_EventStreamConstants_0.State.ShouldSeePasskeyUpsell);
                            if l_shouldShowPasskeyUpsell_0 then
                                l_Logger_0:info("User has no cooldown and no passkey, routing to upsell screen.");
                                v24:dispatch(v25({
                                    {
                                        name = l_AppPage_0.PasskeyUpsellScreen, 
                                        extraProps = {
                                            resetNavigationHistory = v25
                                        }
                                    }
                                }));
                                return true;
                            end;
                        end;
                        return false;
                    end, function(v34) --[[ Line: 135 ]]
                        -- upvalues: l_Logger_0 (ref)
                        l_Logger_0:debug("Error checking for passkey: {}", v34);
                        return false;
                    end);
                end;
            end;
        end);
    end;
end;