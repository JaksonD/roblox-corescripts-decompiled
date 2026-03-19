local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
if l_ThirdPartyUserService_0 and l_ThirdPartyUserService_0.IsSingleSignOnSupported and l_ThirdPartyUserService_0:IsSingleSignOnSupported() then
    return function(_) --[[ Line: 17 ]]
        -- upvalues: l_useNavigation_0 (copy), l_useProperty_0 (copy), l_ThirdPartyUserService_0 (copy), v1 (copy), l_default_0 (copy), l_AppPage_0 (copy)
        local v8 = l_useNavigation_0();
        local v9 = l_useProperty_0(l_ThirdPartyUserService_0, "HasActiveUser");
        v1.useEffect(function() --[[ Line: 21 ]]
            -- upvalues: l_default_0 (ref)
            l_default_0:logEventOnce("platform_account_router_page_did_mount");
        end, {});
        v1.useEffect(function() --[[ Line: 25 ]]
            -- upvalues: v9 (copy), l_default_0 (ref), v8 (copy), l_AppPage_0 (ref)
            if v9 then
                l_default_0:logEventOnce("platform_account_router_page_did_continue");
                v8.replace(l_AppPage_0.SingleSignOnContainer);
            end;
        end, {
            v9, 
            v8
        });
        return nil;
    end;
else
    return function(_) --[[ Line: 34 ]]
        -- upvalues: l_useNavigation_0 (copy), v1 (copy), l_default_0 (copy), l_AppPage_0 (copy)
        local v11 = l_useNavigation_0();
        v1.useEffect(function() --[[ Line: 36 ]]
            -- upvalues: l_default_0 (ref), v11 (copy), l_AppPage_0 (ref)
            l_default_0:logEventOnce("platform_account_router_page_did_mount");
            l_default_0:logEventOnce("platform_account_router_page_did_continue");
            v11.replace(l_AppPage_0.Startup);
        end, {
            v11
        });
        return nil;
    end;
end;