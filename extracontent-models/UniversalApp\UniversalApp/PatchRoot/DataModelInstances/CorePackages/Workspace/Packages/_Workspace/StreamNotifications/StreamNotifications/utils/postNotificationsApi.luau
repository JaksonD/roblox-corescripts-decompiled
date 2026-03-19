local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.NOTIFICATION_URL, 
    path = "v2/stream-notifications/action/{notificationId}/{actionPath}"
});
return function(v4, v5, v6) --[[ Line: 13 ]]
    -- upvalues: v1 (copy), v3 (copy)
    if v5 == nil or v5 == "" or v6 == nil or v6 == "" then
        return v1.reject();
    else
        return v4(v3({
            notificationId = v5, 
            actionPath = v6
        }), "POST", {
            postBody = "{}"
        }):andThen(function(v7) --[[ Line: 23 ]]
            -- upvalues: v1 (ref)
            if v7.responseCode == 200 then
                return v1.resolve();
            else
                return v1.reject();
            end;
        end, function(_) --[[ Line: 29 ]]
            -- upvalues: v1 (ref)
            return v1.reject();
        end);
    end;
end;