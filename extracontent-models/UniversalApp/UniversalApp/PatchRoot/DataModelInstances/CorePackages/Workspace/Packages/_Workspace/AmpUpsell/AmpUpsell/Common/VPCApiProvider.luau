local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Fetch);
local v5 = require(l_Parent_0.Promise);
local l_fetch_0 = v4.fetch;
local l_Response_0 = v4.Response;
local l_HttpService_0 = game:GetService("HttpService");
local l_VPCRequestTypeEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).VPCRequestTypeEnum;
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "child-requests-api/v1/send-request-to-new-parent"
});
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "child-requests-api/v1/send-request-to-all-parents"
});
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "user-settings-api/v1/account-insights/parent-emails"
});
return {
    sendRequestToNewParent = function(v13, v14, v15, v16) --[[ Line: 190 ]] --[[ Name: sendRequestToNewParent ]]
        -- upvalues: v10 (copy), l_VPCRequestTypeEnum_0 (copy), l_HttpService_0 (copy)
        local v17 = v10();
        local v18 = v15 == nil and l_VPCRequestTypeEnum_0.LinkToChild or v15[1];
        return v13(v17, "POST", {
            postBody = l_HttpService_0:JSONEncode({
                email = v14, 
                requestType = v18, 
                requestDetails = v16
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):andThen(function(v19) --[[ Line: 211 ]]
            return {
                sessionId = v19.responseBody.sessionId, 
                lockedUntil = v19.responseBody.lockedUntil
            };
        end):catch(function(v20) --[[ Line: 217 ]]
            -- upvalues: l_HttpService_0 (ref)
            local _, l_result_0 = pcall(function() --[[ Line: 218 ]]
                -- upvalues: l_HttpService_0 (ref), v20 (copy)
                return l_HttpService_0:JSONDecode(v20.Body);
            end);
            error({
                code = l_result_0.code, 
                message = l_result_0.message
            });
        end);
    end, 
    sendRequestToAllParents = function(v23, v24, v25) --[[ Line: 233 ]] --[[ Name: sendRequestToAllParents ]]
        -- upvalues: v11 (copy), l_HttpService_0 (copy)
        local v26 = v11();
        local v27 = v24[1];
        return v23(v26, "POST", {
            postBody = l_HttpService_0:JSONEncode({
                requestType = v27, 
                requestDetails = v25
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):andThen(function(v28) --[[ Line: 251 ]]
            return {
                sessionId = v28.responseBody.sessionId, 
                lockedUntil = v28.responseBody.lockedUntil
            };
        end):catch(function(v29) --[[ Line: 257 ]]
            -- upvalues: l_HttpService_0 (ref)
            local _, l_result_1 = pcall(function() --[[ Line: 258 ]]
                -- upvalues: l_HttpService_0 (ref), v29 (copy)
                return l_HttpService_0:JSONDecode(v29.Body);
            end);
            error({
                code = l_result_1.code, 
                message = l_result_1.message
            });
        end);
    end, 
    getLinkedParentEmails = function(v32) --[[ Line: 271 ]] --[[ Name: getLinkedParentEmails ]]
        -- upvalues: v12 (copy)
        return v32(v12(), "GET", {
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):andThen(function(v33) --[[ Line: 279 ]]
            return {
                parentEmails = v33.responseBody.parentEmails
            };
        end):catch(function(_) --[[ Line: 284 ]]
            error({});
        end);
    end, 
    sendRequestToNewParentLegacy = function(v35, v36, v37) --[[ Line: 32 ]] --[[ Name: sendRequestToNewParentLegacy ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v10 (copy), l_VPCRequestTypeEnum_0 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_0 = l_fetch_0;
        return v5.new(function(v39, v40) --[[ Line: 38 ]]
            -- upvalues: v10 (ref), v36 (copy), l_VPCRequestTypeEnum_0 (ref), l_HttpService_0 (ref), v35 (copy), v37 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
            local v41 = v10();
            local v42 = v36 == nil and l_VPCRequestTypeEnum_0.LinkToChild or v36[1];
            local v43 = l_HttpService_0:JSONEncode({
                email = v35, 
                requestType = v42, 
                requestDetails = v37
            });
            local v44 = l_l_fetch_0_0(v41, {
                method = "POST", 
                body = v43, 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 54 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            local v45 = v44:json():catch(function() --[[ Line: 61 ]]
                return nil;
            end):expect();
            if not v45 then
                v40({
                    message = string.format("Got send-request-to-new-parent HTTP response: %d", v44.status)
                });
                return;
            elseif not v44.ok then
                v40({
                    code = v45.code, 
                    message = v45.message
                });
                return;
            else
                v39({
                    sessionId = v45.sessionId, 
                    lockedUntil = v45.lockedUntil
                });
                return;
            end;
        end);
    end, 
    sendRequestToAllParentsLegacy = function(v46, v47) --[[ Line: 95 ]] --[[ Name: sendRequestToAllParentsLegacy ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v11 (copy), l_HttpService_0 (copy), l_Response_0 (copy)
        local l_l_fetch_0_1 = l_fetch_0;
        return v5.new(function(v49, v50) --[[ Line: 97 ]]
            -- upvalues: v11 (ref), v46 (copy), l_HttpService_0 (ref), v47 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v51 = v11();
            local v52 = v46[1];
            local v53 = l_HttpService_0:JSONEncode({
                requestType = v52, 
                requestDetails = v47
            });
            local v54 = l_l_fetch_0_1(v51, {
                method = "POST", 
                body = v53, 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 114 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            local v55 = v54:json():catch(function() --[[ Line: 121 ]]
                return nil;
            end):expect();
            if not v55 then
                v50({
                    message = string.format("Got send-request-to-all-parents HTTP response: %d", v54.status)
                });
                return;
            elseif not v54.ok then
                v50({
                    code = v55.code, 
                    message = v55.message
                });
                return;
            else
                v49({
                    sessionId = v55.sessionId, 
                    lockedUntil = v55.lockedUntil
                });
                return;
            end;
        end);
    end, 
    getLinkedParentEmailsLegacy = function() --[[ Line: 151 ]] --[[ Name: getLinkedParentEmailsLegacy ]]
        -- upvalues: l_fetch_0 (copy), v5 (copy), v12 (copy), l_Response_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return v5.new(function(v57, v58) --[[ Line: 153 ]]
            -- upvalues: v12 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v59 = v12();
            local v60 = l_l_fetch_0_2(v59, {
                method = "GET"
            }):catch(function() --[[ Line: 156 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v60.ok then
                v58(string.format("Got parent-emails HTTP Response: %d", v60.status));
                return;
            else
                local v61 = v60:json():catch(function() --[[ Line: 168 ]]
                    return nil;
                end):expect();
                if not v61 then
                    v58("Failed to decode HTTP response as JSON for get linked parent emails");
                    return;
                else
                    v57({
                        parentEmails = v61.parentEmails
                    });
                    return;
                end;
            end;
        end);
    end
};