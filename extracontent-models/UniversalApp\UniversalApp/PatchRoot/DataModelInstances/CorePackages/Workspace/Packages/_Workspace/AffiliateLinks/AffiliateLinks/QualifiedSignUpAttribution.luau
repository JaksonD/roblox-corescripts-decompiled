local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AffiliateLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v7 = require(l_script_FirstAncestor_0.AffiliateJoinLinkResolver);
local v8 = require(l_script_FirstAncestor_0.TelemetryConfigs);
local l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking;
local v17 = {
    attribute = function(v10, v11, v12, v13) --[[ Line: 23 ]]
        -- upvalues: l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0 (copy), v3 (copy), l_HttpService_0 (copy), l_Url_0 (copy)
        if not l_GetFFlagEnableAffiliateLinksQualifiedSignUpTracking_0() then
            return v3.resolve();
        else
            return v3.new(function(v14) --[[ Line: 33 ]]
                -- upvalues: l_HttpService_0 (ref), v11 (copy), v12 (copy), v13 (copy), l_Url_0 (ref), v10 (copy)
                local v15 = l_HttpService_0:JSONEncode({
                    linkId = v11, 
                    referralUrl = v12, 
                    linkType = v13
                });
                local v16 = string.format("%saffiliate-links/v1/events/qualified-signup", l_Url_0.APIS_URL);
                v10(v16, "POST", {
                    postBody = v15
                }):await();
                v14();
            end);
        end;
    end
};
v17.attributeJoinLink = function(v18, v19, v20) --[[ Line: 45 ]]
    -- upvalues: v3 (copy), v7 (copy), v17 (copy), l_default_0 (copy), v8 (copy)
    return v3.new(function(v21) --[[ Line: 50 ]]
        -- upvalues: v7 (ref), v18 (copy), v20 (copy), v17 (ref), v19 (copy), l_default_0 (ref), v8 (ref)
        local v22, v23 = v7.resolveReferralCode(v18, v20):await();
        if v22 then
            v17.attribute(v18, v23.responseBody.linkId, v19, v23.responseBody.linkType):await();
        else
            l_default_0:logRobloxTelemetryCounter(v8.AttributeJoinLinkFailureCounter);
        end;
        v21();
    end);
end;
return v17;