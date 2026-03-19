return function(v0) --[[ Line: 7 ]]
    return {
        appsflyer = function(v1, v2) --[[ Line: 10 ]]
            -- upvalues: v0 (copy)
            local v3 = {
                linkId = v1, 
                linkType = v2
            };
            local v4 = v0.fromString("mobilenav:share_links?code={linkId}&type={linkType}")(v3);
            local v5 = v0.fromString("www:share-links?code={linkId}&type={linkType}")(v3);
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v4, 
                webUrl = v5
            });
        end, 
        shortUrl = function(v6) --[[ Line: 25 ]]
            -- upvalues: v0 (copy)
            return v0.fromString("www:share?code={linkId}&type={type}&stamp={stamp|}")(v6);
        end
    };
end;