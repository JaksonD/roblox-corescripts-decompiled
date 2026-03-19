local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Url_0 = require(l_Parent_0.Http).Url;
local v3 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = l_Url_0.NOTIFICATION_URL, 
    path = "v2/stream-notifications/get-recent", 
    query = {
        maxRows = "{maxRows}", 
        startIndex = "{startIndex}"
    }
});
return function(v4, v5, v6) --[[ Line: 17 ]]
    -- upvalues: v3 (copy), v1 (copy)
    v5 = v5 or 10;
    v6 = v6 or 0;
    return v4(v3({
        maxRows = v5, 
        startIndex = v6
    }), "GET"):andThen(function(v7) --[[ Line: 26 ]]
        -- upvalues: v1 (ref)
        local v8 = v7.responseBody or nil;
        if v7.responseCode == 200 and v8 ~= nil then
            return v1.resolve(v8);
        else
            return v1.reject();
        end;
    end, function(v9) --[[ Line: 33 ]]
        -- upvalues: v1 (ref)
        return v1.reject(v9);
    end);
end;