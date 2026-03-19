local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
return function(v3) --[[ Line: 26 ]] --[[ Name: getSingleSignOnUrls ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), l_UrlBuilder_0 (copy)
    local v4 = v3 or l_getAppFeaturePolicies_0();
    local v5 = v4.getUrlAuthRoutes();
    local v6 = {};
    local v7 = v4.getLinkedAuthEndpointsEnabled();
    if v5.account then
        v6.account = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.account);
    end;
    if v7 and v5.linkedLogin then
        v6.connect = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.linkedLogin);
    elseif v5.connect then
        v6.connect = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.connect);
    end;
    if v5.disconnect then
        v6.disconnect = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.disconnect);
    end;
    if v7 and v5.externalLogin then
        v6.login = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.externalLogin);
    elseif v5.login then
        v6.login = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.login);
    end;
    if v7 and v5.linkedSignup then
        v6.signup = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.linkedSignup);
    elseif v5.signup then
        v6.signup = l_UrlBuilder_0.fromString("auth" .. ":" .. v5.signup);
    end;
    if v7 then
        v6.linkingPlatform = v4.getLinkingPlatform();
    end;
    return v6;
end;