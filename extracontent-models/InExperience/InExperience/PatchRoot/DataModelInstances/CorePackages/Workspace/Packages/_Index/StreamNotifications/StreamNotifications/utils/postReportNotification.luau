local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local v4 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.APIS_URL, 
    path = "notifications/v1/report-notification"
});
return function(v5, v6) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v4 (copy), l_HttpService_0 (copy)
    if v6 == nil or v6 == "" then
        return v1.reject();
    else
        local v7 = v4();
        local v8 = {
            notificationId = v6
        };
        return v5(v7, "POST", {
            postBody = l_HttpService_0:JSONEncode(v8)
        }):andThen(function(v9) --[[ Line: 28 ]]
            -- upvalues: v1 (ref)
            if v9.responseCode == 200 then
                return v1.resolve();
            else
                return v1.reject();
            end;
        end, function(_) --[[ Line: 34 ]]
            -- upvalues: v1 (ref)
            return v1.reject();
        end);
    end;
end;