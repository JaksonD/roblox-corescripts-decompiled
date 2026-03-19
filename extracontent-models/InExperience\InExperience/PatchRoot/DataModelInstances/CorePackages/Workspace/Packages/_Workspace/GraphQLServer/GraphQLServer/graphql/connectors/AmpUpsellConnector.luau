local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v4 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v7 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v7.fetch;
local l_Response_0 = v7.Response;
local v10 = {};
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
v10.getFeatureAccessFromFeatureNamesList = function(v12, v13) --[[ Line: 27 ]] --[[ Name: getFeatureAccessFromFeatureNamesList ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v11 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v14 = v13 or l_fetch_0;
    return v4.new(function(v15, v16) --[[ Line: 33 ]]
        -- upvalues: v12 (copy), v11 (ref), v14 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v17 = table.concat(v12, ",");
        local v18 = v11({
            featureNames = v17
        });
        local v19 = v14(v18, {
            method = "GET"
        }):catch(function() --[[ Line: 37 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v19.status == 304 then
            v16(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return;
        elseif not v19.ok then
            v16(l_GraphQLError_0.new("Failed to find feature access values"));
            return;
        else
            local v20 = v19:json():catch(function() --[[ Line: 55 ]]
                return nil;
            end):expect();
            if not v20 then
                v16(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Feature Access API"));
                return;
            else
                local v21 = {};
                for _, v23 in v20.features do
                    table.insert(v21, {
                        featureName = v23.featureName, 
                        access = v23.access
                    });
                end;
                v15({
                    features = v21
                });
                return;
            end;
        end;
    end);
end;
local v24 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/upsell-feature-access", 
    query = {
        {
            name = "featureName", 
            value = "{featureName}", 
            optional = false
        }, 
        {
            name = "successfulActions", 
            value = "{successfulActions}", 
            optional = false
        }, 
        {
            name = "nameSpace", 
            value = "{nameSpace}", 
            optional = true
        }, 
        {
            name = "extraParameters", 
            value = "{extraParameters}", 
            optional = true
        }
    }
});
v10.getUpsellFeatureAccessFromFeatureName = function(v25, v26, v27, v28, v29) --[[ Line: 93 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v24 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v30 = v27 or l_fetch_0;
    return v4.new(function(v31, v32) --[[ Line: 102 ]]
        -- upvalues: v26 (copy), v24 (ref), v25 (copy), v28 (copy), v29 (copy), v30 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v33 = table.concat(v26, ",");
        local v34 = v24({
            featureName = v25, 
            successfulActions = v33, 
            nameSpace = v28, 
            extraParameters = v29
        });
        local v35 = v30(v34, {
            method = "GET"
        }):catch(function() --[[ Line: 111 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v35.status == 304 then
            v32(l_GraphQLError_0.new("Got Response: 304, using cached data instead"));
            return;
        elseif not v35.ok then
            v32(l_GraphQLError_0.new("Failed to find upsell feature access values"));
            return;
        else
            local v36 = v35:json():catch(function() --[[ Line: 129 ]]
                return nil;
            end):expect();
            if not v36 then
                v32(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API"));
                return;
            else
                v31({
                    featureName = v36.featureName, 
                    access = v36.access, 
                    recourse = v36.recourse, 
                    recourses = v36.recourses, 
                    shouldPrompt = v36.shouldPrompt
                });
                return;
            end;
        end;
    end);
end;
return v10;