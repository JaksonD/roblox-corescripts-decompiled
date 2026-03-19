local l_Parent_0 = script:FindFirstAncestor("AppStoreAgeSignalsManager").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Fetch);
local v6 = require(l_Parent_0.Promise);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "app-age-signals-service/v1/app-signals/eligibility", 
    query = {
        signalSource = "{signalSource}"
    }
});
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "app-age-signals-service/v1/app-signals/result"
});
return {
    checkEligibility = function() --[[ Line: 27 ]] --[[ Name: checkEligibility ]]
        -- upvalues: l_fetch_0 (copy), l_UserInputService_0 (copy), v6 (copy), v9 (copy), l_Response_0 (copy)
        local l_l_fetch_0_0 = l_fetch_0;
        local l_Name_0 = l_UserInputService_0:GetPlatform().Name;
        return v6.new(function(v13, v14) --[[ Line: 30 ]]
            -- upvalues: v9 (ref), l_Name_0 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
            local v15 = v9({
                signalSource = l_Name_0
            });
            local v16 = l_l_fetch_0_0(v15, {
                method = "GET"
            }):catch(function() --[[ Line: 33 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v16.ok then
                v14(string.format("Eligibility check failed with HTTP status: %d", v16.status));
                return;
            else
                local v17 = v16:json():catch(function() --[[ Line: 45 ]]
                    return nil;
                end):expect();
                if not v17 then
                    v14("Failed to decode eligibility response as JSON");
                    return;
                else
                    v13({
                        eligible = v17.eligible
                    });
                    return;
                end;
            end;
        end);
    end, 
    publishResult = function(v18, v19, v20) --[[ Line: 61 ]] --[[ Name: publishResult ]]
        -- upvalues: l_fetch_0 (copy), v6 (copy), v10 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_1 = l_fetch_0;
        return v6.new(function(v22, v23) --[[ Line: 63 ]]
            -- upvalues: v10 (ref), l_l_fetch_0_1 (copy), l_HttpService_0 (ref), v18 (copy), v19 (copy), v20 (copy), l_Response_0 (ref)
            local v24 = v10();
            local v25 = l_l_fetch_0_1(v24, {
                method = "POST", 
                body = l_HttpService_0:JSONEncode({
                    signalSource = v18, 
                    encodedSignals = v19, 
                    resultType = v20
                }), 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 77 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v25.ok then
                v23(string.format("Publish result failed with HTTP status: %d", v25.status));
                return;
            else
                v22();
                return;
            end;
        end);
    end
};