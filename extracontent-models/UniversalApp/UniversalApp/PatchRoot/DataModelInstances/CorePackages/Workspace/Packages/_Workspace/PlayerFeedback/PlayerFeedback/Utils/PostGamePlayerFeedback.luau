local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerFeedback");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFStringEdpPlayerFeedbackServiceRoute_0 = require(l_Parent_0.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v5, v6, v7, v8, v9, v10) --[[ Line: 16 ]]
    -- upvalues: l_Url_0 (copy), l_GetFStringEdpPlayerFeedbackServiceRoute_0 (copy), l_HttpService_0 (copy)
    assert(type(v6) == "string", "PostGamePlayerFeedback request expects channelId to be a string");
    assert(type(v7) == "string", "PostGamePlayerFeedback request expects assetId to be a string");
    assert(type(v8) == "string", "PostGamePlayerFeedback request expects a valid category type");
    return v5(string.format("%s%s/v1/channels/%s/assets/%s/reviews", l_Url_0.APIS_URL, l_GetFStringEdpPlayerFeedbackServiceRoute_0(), v6, v7), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            category_type = v8, 
            category_option_ids = v9, 
            comment = v10
        })
    });
end;