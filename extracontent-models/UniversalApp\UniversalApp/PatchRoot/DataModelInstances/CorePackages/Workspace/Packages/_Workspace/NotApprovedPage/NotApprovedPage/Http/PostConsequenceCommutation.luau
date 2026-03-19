local l_Parent_0 = script:FindFirstAncestor("NotApprovedPage").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Constants_0 = require(l_Parent_0.NotApprovedPageState).Constants;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_COMMUTATION_CATEGORIES_0 = l_Constants_0.COMMUTATION_CATEGORIES;
return function(v5) --[[ Line: 15 ]] --[[ Name: PostConsequenceCommutation ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_COMMUTATION_CATEGORIES_0 (copy)
    return v5(l_Url_0.APIS_URL .. "moderation-appeal-service/v2/consequence-commutation", "POST", {
        postBody = l_HttpService_0:JSONEncode({
            type = l_COMMUTATION_CATEGORIES_0.Educational
        })
    });
end;