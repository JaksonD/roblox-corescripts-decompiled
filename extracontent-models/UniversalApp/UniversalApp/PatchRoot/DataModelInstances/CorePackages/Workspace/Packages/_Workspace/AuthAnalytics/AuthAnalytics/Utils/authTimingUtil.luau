local l_HttpService_0 = game:GetService("HttpService");
local v1 = l_HttpService_0:GenerateGUID();
local v2 = nil;
local v3 = os.clock();
local function _() --[[ Line: 12 ]] --[[ Name: getLandingPageTiming ]]
    -- upvalues: v2 (ref), v3 (ref), v1 (copy)
    local v4 = os.clock();
    if not v2 then
        return nil;
    else
        local v5 = v4 - v3;
        return {
            app_session = v1, 
            landing_page_session = v2, 
            duration = v5
        };
    end;
end;
return {
    landingPageLoadStart = function() --[[ Line: 32 ]] --[[ Name: landingPageLoadStart ]]
        -- upvalues: v2 (ref), l_HttpService_0 (copy), v3 (ref)
        v2 = l_HttpService_0:GenerateGUID();
        v3 = os.clock();
    end, 
    landingPageLoadFinish = function() --[[ Line: 41 ]] --[[ Name: landingPageLoadFinish ]]
        -- upvalues: v2 (ref), v3 (ref), v1 (copy)
        local v7 = os.clock();
        local v8;
        if not v2 then
            v8 = nil;
        else
            local v9 = v7 - v3;
            v8 = {
                app_session = v1, 
                landing_page_session = v2, 
                duration = v9
            };
        end;
        v2 = nil;
        return v8;
    end
};