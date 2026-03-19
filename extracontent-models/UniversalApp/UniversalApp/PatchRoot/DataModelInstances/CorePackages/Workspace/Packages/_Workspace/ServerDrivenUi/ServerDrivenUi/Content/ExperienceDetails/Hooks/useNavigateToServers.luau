local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RobloxAppEnums);
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_Parent_0.UniversalAppPolicy);
local v5 = require(l_Parent_0.Navigation);
local v6 = require(l_Parent_0.LinkingProtocol);
local l_AppPage_0 = v2.AppPage;
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_useAppPolicy_0 = v4.useAppPolicy;
local l_useNavigation_0 = v5.useNavigation;
local l_default_0 = v6.LinkingProtocol.default;
return function(v12) --[[ Line: 20 ]] --[[ Name: useNavigateToServers ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_useNavigation_0 (copy), v1 (copy), l_UrlBuilder_0 (copy), l_default_0 (copy), l_AppPage_0 (copy)
    local v14 = l_useAppPolicy_0(function(v13) --[[ Line: 21 ]]
        return v13.getWebViewSupport();
    end);
    local v15 = l_useNavigation_0();
    return v1.useCallback(function() --[[ Line: 26 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v12 (copy), l_default_0 (ref), v14 (copy), v15 (copy), l_AppPage_0 (ref)
        local v16 = l_UrlBuilder_0.game.info.servers({
            universeId = v12
        });
        pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_default_0 (ref), v16 (copy), v14 (ref), v15 (ref), l_AppPage_0 (ref)
            l_default_0:isURLRegistered(v16):andThen(function(v17) --[[ Line: 32 ]]
                -- upvalues: l_default_0 (ref), v16 (ref), v14 (ref), v15 (ref), l_AppPage_0 (ref)
                if v17 then
                    l_default_0:detectURL(v16);
                    return;
                else
                    if v14 then
                        v15.navigate(l_AppPage_0.GenericWebPage, {
                            detail = v16
                        });
                    end;
                    return;
                end;
            end);
        end);
    end, {
        v12, 
        v14, 
        v15, 
        l_default_0
    });
end;