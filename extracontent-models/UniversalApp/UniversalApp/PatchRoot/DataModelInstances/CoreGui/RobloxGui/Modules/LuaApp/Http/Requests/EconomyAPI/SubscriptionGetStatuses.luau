local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = game:DefineFastFlag("DoNotFetchOnEmptySubscriptionKeys", false);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy), l_Url_0 (copy)
    if v3 and #v5 == 0 then
        return v2.resolve({});
    else
        local v6 = l_Url_0:makeQueryString({
            subscriptionProductTargetKeys = table.concat(v5, "&subscriptionProductTargetKeys=")
        });
        return v4(string.format("%sv1/subscriptions/statuses?%s", l_Url_0.APIS_URL, v6), "GET"):andThen(function(v7) --[[ Line: 15 ]]
            if v7 and v7.responseBody and v7.responseBody.subscriptionStatuses then
                return v7.responseBody.subscriptionStatuses;
            else
                return {};
            end;
        end);
    end;
end;