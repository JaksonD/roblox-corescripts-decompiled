local l_Parent_0 = script:FindFirstAncestor("IdentityVerification").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Fetch);
local v5 = require(l_Parent_0.Promise);
local l_fetch_0 = v4.fetch;
local l_Response_0 = v4.Response;
local v8 = require(l_Parent_0.Cryo);
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/verified-status", 
    query = {
        token = "{token}"
    }
});
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/start-verification"
});
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/start-liveness-verification"
});
local function v19(v12) --[[ Line: 34 ]] --[[ Name: getVerifiedStatus ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v9 (copy), l_Response_0 (copy)
    local l_l_fetch_0_0 = l_fetch_0;
    return v5.new(function(v14, v15) --[[ Line: 36 ]]
        -- upvalues: v9 (ref), v12 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
        local v16 = v9({
            token = v12
        });
        local v17 = l_l_fetch_0_0(v16, {
            method = "GET"
        }):catch(function() --[[ Line: 39 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v17.ok then
            v15(string.format("Got verified-status verification HTTP Response: %d", v17.status));
            return;
        else
            local v18 = v17:json():catch(function() --[[ Line: 53 ]]
                return nil;
            end):expect();
            if not v18 then
                v15("Failed to decode HTTP response as JSON for get IDV Verification status");
                return;
            else
                v14({
                    isPending = v18.isPending, 
                    sessionStatus = v18.sessionStatus, 
                    sessionErrorCode = v18.sessionErrorCode, 
                    isVerified = v18.isVerified, 
                    ageEstimationNextStep = v18.ageEstimationNextStep
                });
                return;
            end;
        end;
    end);
end;
local function v29(v20, v21) --[[ Line: 77 ]] --[[ Name: startVerificationWithWrappedNetworking ]]
    -- upvalues: v5 (copy), v10 (copy), v8 (copy), l_HttpService_0 (copy)
    return v5.new(function(v22, v23) --[[ Line: 78 ]]
        -- upvalues: v10 (ref), v8 (ref), v21 (copy), v20 (copy), l_HttpService_0 (ref)
        local v24 = v10();
        local v25 = v8.Dictionary.join({
            generatedLink = true
        }, v21 or {});
        v20(v24, "POST", {
            postBody = l_HttpService_0:JSONEncode(v25)
        }):catch(function(_) --[[ Line: 86 ]]
            -- upvalues: v23 (copy)
            v23("Got error on start-verificatin");
        end):andThen(function(v27) --[[ Line: 90 ]]
            -- upvalues: v23 (copy), v22 (copy)
            if not v27 or not v27[1] then
                v23("Got start-verification HTTP with no valid response");
                return;
            else
                local v28 = v27[1];
                if not v28 then
                    v23("Failed to decode HTTP response as JSON for IDV Verification");
                    return;
                else
                    v22({
                        emailSent = v28.emailSent, 
                        sessionIdentifier = v28.sessionIdentifier, 
                        daysUntilNextVerification = v28.daysUntilNextVerification, 
                        verificationLink = v28.verificationLink, 
                        sessionToken = v28.sessionToken
                    });
                    return;
                end;
            end;
        end);
    end);
end;
local function v38(v30, v31) --[[ Line: 113 ]] --[[ Name: startVerification ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v10 (copy), l_HttpService_0 (copy), v8 (copy), l_Response_0 (copy)
    local l_l_fetch_0_1 = l_fetch_0;
    return v5.new(function(v33, v34) --[[ Line: 115 ]]
        -- upvalues: v31 (copy), v10 (ref), l_l_fetch_0_1 (copy), l_HttpService_0 (ref), v8 (ref), v30 (copy), l_Response_0 (ref)
        local v35 = v31 or v10();
        local v36 = l_l_fetch_0_1(v35, {
            method = "POST", 
            body = l_HttpService_0:JSONEncode(v8.Dictionary.join({
                generatedLink = true
            }, v30 or {})), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function() --[[ Line: 125 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v36.ok then
            v34(string.format("Got start-verification HTTP Response: %d", v36.status));
            return;
        else
            local v37 = v36:json():catch(function() --[[ Line: 137 ]]
                return nil;
            end):expect();
            if not v37 then
                v34("Failed to decode HTTP response as JSON for IDV Verification");
                return;
            else
                v33({
                    emailSent = v37.emailSent, 
                    sessionIdentifier = v37.sessionIdentifier, 
                    daysUntilNextVerification = v37.daysUntilNextVerification, 
                    verificationLink = v37.verificationLink, 
                    sessionToken = v37.sessionToken
                });
                return;
            end;
        end;
    end);
end;
return {
    startVerification = v38, 
    startVerificationWithWrappedNetworking = v29, 
    startLivenessVerification = function(v39) --[[ Line: 158 ]] --[[ Name: startLivenessVerification ]]
        -- upvalues: v38 (copy), v11 (copy)
        return v38(v39, v11());
    end, 
    getVerifiedStatus = v19
};