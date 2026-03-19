return function(v0) --[[ Line: 1 ]]
    return {
        appsflyer = function(v1) --[[ Line: 4 ]]
            -- upvalues: v0 (copy)
            local v2 = v0.fromString("mobilenav:event_details?eventid={eventId}")(v1);
            local v3 = v0.fromString("www:events/{eventId}")(v1);
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v2, 
                webUrl = v3
            });
        end
    };
end;