local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local l_HttpService_0 = game:GetService("HttpService");
local l_BrowserService_0 = game:GetService("BrowserService");
local v5 = if l_GetFFlagEnableUnifiedWebViews_0() then game:GetService("WebViewService") else nil;
local l_NavigateSideways_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateSideways;
local v7 = require(l_script_FirstAncestor_0.Thunks.HandleAuthTicket);
local l_LaunchContext_0 = require(l_Parent_0.AppStartup).Enums.LaunchContext;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v10 = game:DefineFastFlag("EnableJoinV2PreAuthDeepLink", false);
local v11 = game:DefineFastFlag("EnableAccountRecoveryPreAuthDeepLink2", true);
local v12 = game:DefineFastInt("WaitAfterCloseChallengeWebViewSeconds", 500);
local v19 = {
    {
        regexPattern = "roblox.*//testing/preauth.*", 
        handler = function(v13, v14) --[[ Line: 58 ]] --[[ Name: handler ]]
            print("preauth deeplink example called with query params:");
            for v15, v16 in pairs(v13) do
                print(v15, "=", v16);
            end;
            print("context:");
            for v17, v18 in pairs(v14) do
                print(v17, "=", v18);
            end;
            return true;
        end, 
        preauthOnly = false
    }
};
if v10 then
    table.insert(v19, {
        regexPattern = "roblox.*://join_v2/join.*", 
        handler = function(v20, v21) --[[ Line: 78 ]] --[[ Name: handler ]]
            -- upvalues: l_LaunchContext_0 (copy), v7 (copy)
            local function v22() --[[ Line: 79 ]]
                -- upvalues: v21 (copy), l_LaunchContext_0 (ref)
                return v21.dispatch(v21.launchApp(v21.networking, v21.omniRecommendationsRequest, v21.analytics, v21.appPolicy, l_LaunchContext_0.Login));
            end;
            return v7(v21.networking, v20.ticket, v20.placelauncherurl, v22, function() --[[ Line: 91 ]]
                -- upvalues: v21 (copy)
                return v21.dispatch(v21.resetAppState());
            end);
        end, 
        preauthOnly = false
    });
end;
if v11 then
    table.insert(v19, {
        regexPattern = "roblox.*://navigation/account_recovery.*", 
        handler = function(v23, v24) --[[ Line: 110 ]] --[[ Name: handler ]]
            -- upvalues: l_GetFFlagEnableUnifiedWebViews_0 (copy), v5 (copy), l_BrowserService_0 (copy), v12 (copy), l_NavigateSideways_0 (copy), l_AppPage_0 (copy), l_HttpService_0 (copy)
            local l_origin_0 = v23.origin;
            local v26 = {};
            if l_origin_0 == "login2SV" then
                v26 = {
                    continuingRecovery = false, 
                    recover2sv = true, 
                    recoverPassword = false, 
                    identifier = v23.username
                };
            elseif l_origin_0 == "passwordReset2SV" then
                v26 = {
                    continuingRecovery = true, 
                    recover2sv = true, 
                    recoverPassword = true, 
                    recoverySessionID = v23.recoverysessionid, 
                    identifier = v23.username
                };
            end;
            if l_GetFFlagEnableUnifiedWebViews_0() then
                v5:CloseWindow();
            else
                l_BrowserService_0:CloseBrowserWindow();
            end;
            if l_origin_0 == "login2SV" then
                task.wait(v12 / 1000);
            end;
            return v24.dispatch(l_NavigateSideways_0({
                name = l_AppPage_0.AccountRecovery, 
                detail = l_HttpService_0:GenerateGUID(false):lower(), 
                extraProps = v26
            }));
        end, 
        preauthOnly = false
    });
end;
return v19;