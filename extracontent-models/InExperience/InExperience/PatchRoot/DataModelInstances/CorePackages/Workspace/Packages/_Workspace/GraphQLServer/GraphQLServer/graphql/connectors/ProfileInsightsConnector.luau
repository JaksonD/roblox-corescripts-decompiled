local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v4 = require(l_Parent_0.Promise);
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_Response_0 = require(l_Parent_0.Fetch).Response;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.Parent.generatedTypes);
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "profile-insights-api/v1/multiProfileInsights"
});
return {
    findProfileInsightsByUserIds = function(v12, v13, v14, v15) --[[ Line: 113 ]]
        -- upvalues: l_fetch_0 (copy), v4 (copy), v11 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
        local v16 = v15 or l_fetch_0;
        return v4.new(function(v17, v18) --[[ Line: 121 ]]
            -- upvalues: v16 (copy), v11 (ref), l_HttpService_0 (ref), v12 (copy), v14 (copy), v13 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
            local v19 = v16(v11(), {
                body = l_HttpService_0:JSONEncode({
                    userIds = v12, 
                    count = if v14 then nil else v13 or 2, 
                    rankingStrategy = v14
                }), 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 135 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v19.ok then
                v18(l_GraphQLError_0.new(string.format("Failed to fetch profile insights. Error code: %d", v19.status)));
                return;
            else
                local v20 = v19:json():catch(function() --[[ Line: 151 ]]
                    return nil;
                end):expect();
                if not v20 then
                    v18(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", l_HttpService_0:JSONEncode(v12))));
                    return;
                else
                    v17(v20.userInsights);
                    return;
                end;
            end;
        end);
    end, 
    findProfileInsightsByUserIdsFeed = function(v21, v22, v23, v24, v25) --[[ Line: 173 ]] --[[ Name: findProfileInsightsByUserIdsFeed ]]
        -- upvalues: l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_fetch_0 (copy), v4 (copy), v11 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
        local v26 = if l_FFlagPlayerSearchEnableOnlineFrequents_0 then v24 else nil;
        local v27 = v25 or l_fetch_0;
        return (v4.new(function(v28, v29) --[[ Line: 121 ]]
            -- upvalues: v27 (copy), v11 (ref), l_HttpService_0 (ref), v21 (copy), v26 (copy), v22 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
            local v30 = v27(v11(), {
                body = l_HttpService_0:JSONEncode({
                    userIds = v21, 
                    count = if v26 then nil else v22 or 2, 
                    rankingStrategy = v26
                }), 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function() --[[ Line: 135 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if not v30.ok then
                v29(l_GraphQLError_0.new(string.format("Failed to fetch profile insights. Error code: %d", v30.status)));
                return;
            else
                local v31 = v30:json():catch(function() --[[ Line: 151 ]]
                    return nil;
                end):expect();
                if not v31 then
                    v29(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for profile insights: %s.", l_HttpService_0:JSONEncode(v21))));
                    return;
                else
                    v28(v31.userInsights);
                    return;
                end;
            end;
        end):andThen(function(v32) --[[ Line: 185 ]]
            -- upvalues: v23 (copy)
            return {
                pageId = v23, 
                profileInsights = v32
            };
        end));
    end
};