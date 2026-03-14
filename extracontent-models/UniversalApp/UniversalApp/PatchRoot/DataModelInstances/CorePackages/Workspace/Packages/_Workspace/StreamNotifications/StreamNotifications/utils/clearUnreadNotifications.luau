local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.NOTIFICATION_URL, 
    path = "v2/stream-notifications/clear-unread"
});
return function(v4) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return v4(v3(), "POST", {
        postBody = "{}"
    }):andThen(function(v5) --[[ Line: 16 ]]
        -- upvalues: v1 (ref)
        if v5.responseCode == 200 then
            return v1.resolve();
        else
            return v1.reject();
        end;
    end, function(v6) --[[ Line: 22 ]]
        -- upvalues: v1 (ref)
        return v1.reject(v6);
    end);
end;