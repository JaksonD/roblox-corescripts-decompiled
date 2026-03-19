local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.dependencies);
local l_Promise_0 = v2.Promise;
local l_UrlBuilder_0 = v2.UrlBuilder;
local l_UrlBase_0 = v2.UrlBase;
local l_Fetch_0 = v2.Fetch;
local l_fetch_0 = l_Fetch_0.fetch;
local l_Response_0 = l_Fetch_0.Response;
local v9 = require(l_Parent_0.Enums.ConsentName);
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "user-consents-api/v1/user-consents/one-time"
});
return {
    grantOneTimeUserConsent = function(v11, v12, v13) --[[ Line: 18 ]] --[[ Name: grantOneTimeUserConsent ]]
        -- upvalues: v9 (copy), l_Promise_0 (copy), v10 (copy), l_fetch_0 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local v14 = v9[v11];
        if not v14 then
            return l_Promise_0.reject((("Invalid consent name type: %*"):format(v11)));
        else
            local v15 = v10();
            return l_Promise_0.new(function(v16, v17) --[[ Line: 25 ]]
                -- upvalues: l_fetch_0 (ref), v15 (copy), l_HttpService_0 (ref), v14 (copy), v12 (copy), v13 (copy), l_Response_0 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                    -- upvalues: l_fetch_0 (ref), v15 (ref), l_HttpService_0 (ref), v14 (ref), v12 (ref), v13 (ref), l_Response_0 (ref)
                    return l_fetch_0(v15, {
                        method = "POST", 
                        body = l_HttpService_0:JSONEncode({
                            consentType = v14, 
                            ttlSeconds = v12
                        }), 
                        headers = {
                            ["Content-Type"] = "application/json", 
                            Accept = "application/json", 
                            ["rbx-audit-data"] = v13
                        }
                    }):catch(function(_) --[[ Line: 39 ]]
                        -- upvalues: l_Response_0 (ref)
                        return l_Response_0.error();
                    end):expect();
                end);
                if not l_status_0 then
                    v17("Failed to make request: " .. tostring(l_result_0));
                    return;
                elseif not l_result_0.ok then
                    v17((string.format("Got grant one time user consent HTTP Response: %d - %s", l_result_0.status, l_result_0.statusText)));
                    return;
                else
                    v16();
                    return;
                end;
            end);
        end;
    end
};