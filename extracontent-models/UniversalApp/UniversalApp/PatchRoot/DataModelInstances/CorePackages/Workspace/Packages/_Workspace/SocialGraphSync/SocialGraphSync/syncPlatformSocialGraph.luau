local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SocialGraphSync").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Promise);
local l_FetchFriendsCarousel_0 = require(l_Parent_0.FriendsCarousel).FetchFriendsCarousel;
local v7 = game:DefineFastInt("SocialGraphSyncRequestRetryCount", 1);
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "platform-social-graph-sync-gateway/v1/start-sync"
});
local _ = function() --[[ Line: 20 ]] --[[ Name: getHeaders ]]
    -- upvalues: v5 (copy), v8 (copy), l_MessageBusService_0 (copy)
    return v5.new(function(v9, _) --[[ Line: 21 ]]
        -- upvalues: v8 (ref), l_MessageBusService_0 (ref)
        local v11 = {
            url = v8(), 
            method = "POST"
        };
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", v11, function(v12) --[[ Line: 27 ]]
            -- upvalues: v9 (copy)
            v9(v12);
        end, {});
    end);
end;
return function(v14, v15, v16) --[[ Line: 38 ]] --[[ Name: syncPlatformSocialGraph ]]
    -- upvalues: v5 (copy), v8 (copy), l_MessageBusService_0 (copy), l_HttpService_0 (copy), v7 (copy), l_FetchFriendsCarousel_0 (copy)
    return v5.new(function(v17, _) --[[ Line: 21 ]]
        -- upvalues: v8 (ref), l_MessageBusService_0 (ref)
        local v19 = {
            url = v8(), 
            method = "POST"
        };
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", v19, function(v20) --[[ Line: 27 ]]
            -- upvalues: v17 (copy)
            v17(v20);
        end, {});
    end):andThen(function(v21) --[[ Line: 39 ]]
        -- upvalues: l_HttpService_0 (ref), v7 (ref), v8 (ref), v15 (copy), v14 (copy), l_FetchFriendsCarousel_0 (ref), v5 (ref), v16 (copy)
        if v21 == nil or not v21.success then
            warn("credential headers error");
            return;
        else
            local v22 = {
                headers = v21.headers or {}, 
                postBody = l_HttpService_0:JSONEncode({}), 
                maxRetryCount = v7
            };
            local v23 = v8();
            return v15(v23, "POST", v22):andThen(function(_) --[[ Line: 52 ]]
                -- upvalues: v14 (ref), l_FetchFriendsCarousel_0 (ref), v5 (ref)
                v14(l_FetchFriendsCarousel_0()):andThen(function(_) --[[ Line: 54 ]]
                    -- upvalues: v5 (ref)
                    return v5.resolve();
                end, function(_) --[[ Line: 56 ]]
                    -- upvalues: v5 (ref)
                    warn("Refresh friends carousel failed after syncing platform friends");
                    return v5.resolve();
                end);
            end, function(_) --[[ Line: 61 ]]
                -- upvalues: v16 (ref), v5 (ref)
                warn("platform social graph sync request failed");
                v16.Diag:reportCounter("TriggerPlatformSocialGraphSyncFailed", 1);
                return v5.resolve();
            end);
        end;
    end);
end;