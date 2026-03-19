local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v3 = require(l_Parent_0.Promise);
local v4 = {};
local v5 = require(l_Parent_0.Fetch);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v10 = require(script.Parent.buildOmniRecommendationsRequest);
local _ = require(script.Parent.Parent.Parent.generatedTypes);
local function v20(v12, v13) --[[ Line: 52 ]] --[[ Name: findOmniFeedBySessionId ]]
    -- upvalues: l_fetch_0 (copy), v10 (copy), v3 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy), l_Object_0 (copy)
    local v14 = v13 or l_fetch_0;
    local v15 = v10(v14);
    return v3.new(function(v16, v17) --[[ Line: 59 ]]
        -- upvalues: v15 (copy), v12 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref), l_Object_0 (ref)
        local v18 = v15(v12.pageType, v12.sessionId, v12.nextPageToken, v12.supportedTreatmentTypes):catch(function() --[[ Line: 65 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v18.ok then
            v17(l_GraphQLError_0.new(string.format("Failed to fetch omni recommendations. Error code: %d", v18.status)));
            return nil;
        else
            local v19 = v18:json():catch(function() --[[ Line: 80 ]]
                return nil;
            end):expect();
            if not v19 then
                v17(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for omni-recommendation fetch"));
            end;
            v16(l_Object_0.assign({
                omniSessionId = v12.sessionId, 
                pageType = v12.pageType
            }, v19));
            return nil;
        end;
    end);
end;
local v21 = l_UrlBuilder_0.fromString("apis:discovery-api/omni-recommendation-metadata");
local function v30(v22, v23) --[[ Line: 100 ]] --[[ Name: fetchMoreOmniRecommendationMetadata ]]
    -- upvalues: l_fetch_0 (copy), v3 (copy), v21 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy), l_Object_0 (copy)
    local v24 = v23 or l_fetch_0;
    return v3.new(function(v25, v26) --[[ Line: 103 ]]
        -- upvalues: v21 (ref), v24 (copy), l_HttpService_0 (ref), v22 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref), l_Object_0 (ref)
        local v27 = v21();
        local v28 = v24(v27, {
            body = l_HttpService_0:JSONEncode({
                sessionId = v22.sessionId, 
                contents = v22.recommendations
            }), 
            method = "POST", 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function() --[[ Line: 117 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v28.ok then
            v26(l_GraphQLError_0.new(string.format("Failed to fetch additional metadata for topicId: %s", v22.topicId)));
            return;
        else
            local v29 = v28:json():catch(function() --[[ Line: 129 ]]
                return nil;
            end):expect();
            if not v29 then
                v26(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for topicId: %s", v22.topicId)));
                return;
            else
                v25(l_Object_0.assign(v29, {
                    topicId = v22.topicId, 
                    recommendations = v22.recommendations
                }));
                return;
            end;
        end;
    end);
end;
v4.findOmniFeedBySessionId = v20;
v4.fetchMoreOmniRecommendationMetadata = v30;
return v4;