local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local v1 = require(l_Parent_0.HttpRequest);
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.BadgesUrlBuilder);
return function(v4) --[[ Line: 10 ]] --[[ Name: requestRemoveBadge ]]
    -- upvalues: v3 (copy), v1 (copy), l_HttpService_0 (copy)
    local v5 = v3.buildBadgeRemoveUrl(v4);
    return v1.config({
        requestFunction = function(v6, v7, v8) --[[ Line: 14 ]] --[[ Name: requestFunction ]]
            -- upvalues: v1 (ref)
            return v1.requestFunctions.RequestInternal(v6, v7, v8);
        end
    })(v5, "DELETE", {
        postBody = l_HttpService_0:JSONEncode({})
    });
end;