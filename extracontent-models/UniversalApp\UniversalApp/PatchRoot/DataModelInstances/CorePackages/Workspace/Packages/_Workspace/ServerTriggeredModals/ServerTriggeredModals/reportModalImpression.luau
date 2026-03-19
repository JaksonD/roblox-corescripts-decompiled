local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.logResponseStatus);
local v7 = require(l_script_FirstAncestor_0.logResponseLatency);
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "modals-api/v1/impression"
});
return function(v9, v10, v11) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v8 (copy), l_HttpService_0 (copy), v7 (copy), v6 (copy)
    if not v9 then
        v5:error("Missing networking implementation");
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
            -- upvalues: v8 (ref), l_HttpService_0 (ref), v10 (copy), v11 (copy), v9 (copy)
            local v12 = v8();
            local v13 = l_HttpService_0:JSONEncode({
                modalId = v10, 
                modalType = v11
            });
            return v9(v12, "POST", {
                postBody = v13
            });
        end);
        if not l_status_0 then
            v5:error((("Report impression request failed to start: %*"):format(l_result_0)));
            return;
        else
            l_result_0:andThen(function(v16) --[[ Line: 38 ]]
                -- upvalues: v7 (ref), v5 (ref)
                local v17 = v16 and v16.responseCode or nil;
                v7("modals-api/v1/impression", v16.responseTimeMs, v17);
                if v17 ~= nil and v17 ~= 200 then
                    v5:error((("Unexpected responseCode when reporting impression: %*"):format(v17)));
                end;
            end):catch(function(v18) --[[ Line: 45 ]]
                -- upvalues: v6 (ref), v5 (ref)
                v6("modals-api/v1/impression", v18.StatusCode);
                v5:error((("Report Impression request error: %*"):format(v18)));
            end);
            return;
        end;
    end;
end;