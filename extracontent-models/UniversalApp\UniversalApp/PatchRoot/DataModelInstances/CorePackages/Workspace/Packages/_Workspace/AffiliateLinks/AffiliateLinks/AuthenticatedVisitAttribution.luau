local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AffiliateLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v7 = require(l_script_FirstAncestor_0.AffiliateJoinLinkResolver);
local v8 = require(l_script_FirstAncestor_0.TelemetryConfigs);
local v17 = {
    attribute = function(v9, v10, v11, v12, v13) --[[ Line: 20 ]]
        -- upvalues: v3 (copy), l_HttpService_0 (copy), l_Url_0 (copy)
        return v3.new(function(v14) --[[ Line: 27 ]]
            -- upvalues: l_HttpService_0 (ref), v10 (copy), v11 (copy), v12 (copy), v13 (copy), l_Url_0 (ref), v9 (copy)
            local v15 = l_HttpService_0:JSONEncode({
                linkId = v10, 
                referralUrl = v11, 
                linkType = v12, 
                userDidLogIn = v13
            });
            local v16 = string.format("%saffiliate-links/v1/events/authenticated-visit", l_Url_0.APIS_URL);
            v9(v16, "POST", {
                postBody = v15
            }):await();
            v14();
        end);
    end
};
v17.attributeJoinLink = function(v18, v19, v20, v21) --[[ Line: 40 ]]
    -- upvalues: v3 (copy), v7 (copy), v17 (copy), l_default_0 (copy), v8 (copy)
    return v3.new(function(v22) --[[ Line: 46 ]]
        -- upvalues: v7 (ref), v18 (copy), v20 (copy), v17 (ref), v19 (copy), v21 (copy), l_default_0 (ref), v8 (ref)
        local v23, v24 = v7.resolveReferralCode(v18, v20):await();
        if v23 then
            v17.attribute(v18, v24.responseBody.linkId, v19, v24.responseBody.linkType, v21):await();
        else
            l_default_0:logRobloxTelemetryCounter(v8.AttributeJoinLinkFailureCounter);
        end;
        v22();
    end);
end;
return v17;