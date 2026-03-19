local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Models.Authentication.LoginResult);
local l_LoginErrorCodes_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.LoginErrorCodes;
local v7 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreConstants_0 = v7.Common.KeystoreConstants;
local l_KeystoreAnalyticsEvents_0 = v7.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v7.Analytics.KeystoreEventConstants;
return function(v11, v12, v13) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_HttpService_0 (copy), l_KeystoreConstants_0 (copy), v5 (copy), l_LoginErrorCodes_0 (copy)
    return function(v14) --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v12 (copy), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_KeystoreConstants_0 (ref), v11 (copy), v13 (copy), v5 (ref), l_LoginErrorCodes_0 (ref)
        local v15 = false;
        local function _(v16) --[[ Line: 16 ]] --[[ Name: keystoreStateImpl ]]
            -- upvalues: v3 (ref), v15 (ref)
            return function(v17, v18, v19) --[[ Line: 17 ]]
                -- upvalues: v16 (copy), v3 (ref), v15 (ref)
                local v20, v21 = v16(v17, v18, v19);
                return v20:andThen(function(v22) --[[ Line: 20 ]]
                    -- upvalues: v3 (ref)
                    return v3.resolve(v22);
                end):catch(function(v23) --[[ Line: 24 ]]
                    -- upvalues: v15 (ref), v3 (ref)
                    v15 = true;
                    return v3.reject(v23);
                end), v21;
            end;
        end;
        return v3.new(function(v25, v26) --[[ Line: 33 ]]
            -- upvalues: v12 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_HttpService_0 (ref), l_KeystoreConstants_0 (ref), v11 (ref), v3 (ref), v15 (ref), v13 (ref), v14 (copy), v5 (ref), l_LoginErrorCodes_0 (ref)
            local v27 = {
                username = nil, 
                userId = nil, 
                password = nil
            };
            v12():andThen(function(v28) --[[ Line: 41 ]]
                -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v26 (copy), v27 (copy), l_HttpService_0 (ref), l_KeystoreConstants_0 (ref), v11 (ref), v3 (ref), v15 (ref), v13 (ref), v14 (ref), v25 (copy), v5 (ref), l_LoginErrorCodes_0 (ref)
                if v28 == nil then
                    l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.getCredentialsNilResult);
                    v26({
                        credentials = v27, 
                        credentialsValidForLogin = false, 
                        redirectToLoginPage = false
                    });
                    return;
                else
                    local v29 = l_HttpService_0:JSONDecode(v28).response[1];
                    v27.username = v29.username;
                    v27.userId = v29.userId;
                    v27.password = v29.password;
                    v27.experimentGroup = v29.experimentGroup;
                    local v30 = ({
                        [l_KeystoreConstants_0.Experiment] = l_KeystoreEventConstants_0.origin.getCredentialsExperimentGroup, 
                        [l_KeystoreConstants_0.Control] = l_KeystoreEventConstants_0.origin.getCredentialsControlGroup
                    })[v27.experimentGroup] or l_KeystoreEventConstants_0.origin.getCredentialsNoIxpGroup;
                    l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(v30, v27.userId);
                    if v27.experimentGroup ~= l_KeystoreConstants_0.Experiment then
                        v26({
                            credentials = v27, 
                            credentialsValidForLogin = false, 
                            redirectToLoginPage = false
                        });
                    end;
                    if v29.username == "" then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.getCredentialsEmptyResult);
                        v26({
                            credentials = v27, 
                            credentialsValidForLogin = false, 
                            redirectToLoginPage = false
                        });
                        return;
                    elseif not v29.errorCode or v29.errorCode ~= "" then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.getCredentialsPopulateUsername, v27.userId);
                        v26({
                            credentials = v27, 
                            credentialsValidForLogin = false, 
                            redirectToLoginPage = true
                        });
                        return;
                    else
                        local l_v11_0 = v11;
                        v13(function(v32, v33, v34) --[[ Line: 17 ]]
                            -- upvalues: l_v11_0 (copy), v3 (ref), v15 (ref)
                            local v35, v36 = l_v11_0(v32, v33, v34);
                            return v35:andThen(function(v37) --[[ Line: 20 ]]
                                -- upvalues: v3 (ref)
                                return v3.resolve(v37);
                            end):catch(function(v38) --[[ Line: 24 ]]
                                -- upvalues: v15 (ref), v3 (ref)
                                v15 = true;
                                return v3.reject(v38);
                            end), v36;
                        end, v27)(v14):andThen(function(v39) --[[ Line: 107 ]]
                            -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v27 (ref), v15 (ref), v25 (ref), v5 (ref)
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.successfulLogin, v27.userId);
                            if v15 then
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.gcsCase, v27.userId);
                                v25({
                                    credentials = v27, 
                                    credentialsValidForLogin = false, 
                                    redirectToLoginPage = false
                                });
                                return;
                            elseif v5.hasTwoStepData(v39) then
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.hasTwoStepData, v27.userId);
                                v25({
                                    credentials = v27, 
                                    credentialsValidForLogin = true, 
                                    redirectToLoginPage = true
                                });
                                return;
                            else
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.regularAccountSuccess, v27.userId);
                                v25({
                                    loginResult = v39, 
                                    credentials = v27, 
                                    credentialsValidForLogin = true, 
                                    redirectToLoginPage = false
                                });
                                return;
                            end;
                        end):catch(function(v40) --[[ Line: 152 ]]
                            -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v27 (ref), v15 (ref), l_LoginErrorCodes_0 (ref), v26 (ref)
                            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.failedLogin, v27.userId);
                            local v41 = not v15;
                            if v40 and v40.errorCode == l_LoginErrorCodes_0.IncorrectCValueOrPassword then
                                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.failedLoginIncorrectPassword, v27.userId);
                                v41 = true;
                            end;
                            v26({
                                credentials = v27, 
                                credentialsValidForLogin = false, 
                                redirectToLoginPage = v41
                            });
                        end);
                        return;
                    end;
                end;
            end):catch(function(_) --[[ Line: 177 ]]
                -- upvalues: v26 (copy), v27 (copy), v15 (ref)
                v26({
                    credentials = v27, 
                    credentialsValidForLogin = false, 
                    redirectToLoginPage = not v15
                });
            end);
        end);
    end;
end;