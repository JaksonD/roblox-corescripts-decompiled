local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_game_EngineFeature_0 = game:GetEngineFeature("PlatformAccountRouterSubflow");
if l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0.IsSingleSignOnSupported and l_ThirdPartyUserService_0:IsSingleSignOnSupported() then
    return function(_) --[[ Line: 18 ]]
        -- upvalues: l_useNavigation_0 (copy), l_useProperty_0 (copy), l_ThirdPartyUserService_0 (copy), v1 (copy), l_default_0 (copy), l_game_EngineFeature_0 (copy), l_AppPage_0 (copy)
        local v9 = l_useNavigation_0();
        local v10 = l_useProperty_0(l_ThirdPartyUserService_0, "HasActiveUser");
        v1.useEffect(function() --[[ Line: 22 ]]
            -- upvalues: l_default_0 (ref)
            l_default_0:logEventOnce("platform_account_router_page_did_mount");
        end, {});
        v1.useEffect(function() --[[ Line: 26 ]]
            -- upvalues: v10 (copy), l_game_EngineFeature_0 (ref), l_default_0 (ref), v9 (copy), l_AppPage_0 (ref)
            if v10 then
                if l_game_EngineFeature_0 then
                    l_default_0:logEventOnce("platform_account_router_page_did_continue");
                end;
                v9.replace(l_AppPage_0.SingleSignOnContainer);
            end;
        end, {
            v10, 
            v9
        });
        return nil;
    end;
else
    return function(_) --[[ Line: 37 ]]
        -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_default_0 (copy), l_game_EngineFeature_0 (copy), l_AppPage_0 (copy)
        local v12 = l_useNavigation_0();
        v1.useEffect(function() --[[ Line: 39 ]]
            -- upvalues: l_default_0 (ref), l_game_EngineFeature_0 (ref), v12 (copy), l_AppPage_0 (ref)
            l_default_0:logEventOnce("platform_account_router_page_did_mount");
            if l_game_EngineFeature_0 then
                l_default_0:logEventOnce("platform_account_router_page_did_continue");
            end;
            v12.replace(l_AppPage_0.Startup);
        end, {
            v12
        });
        return nil;
    end;
end;