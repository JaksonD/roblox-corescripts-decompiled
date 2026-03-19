local l_Parent_0 = script:FindFirstAncestor("AffiliateLinks").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.Http);
return {
    resolveReferralCode = function(v3, v4) --[[ Line: 12 ]]
        -- upvalues: l_Url_0 (copy)
        local v5 = l_Url_0:makeQueryString({
            referralCode = v4
        });
        return v3(string.format("%saffiliate-links/v1/links/resolve?%s", l_Url_0.APIS_URL, v5), "GET");
    end
};