local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Fetch);
local v6 = require(l_Parent_0.Promise);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local l_AccessResponseEnum_0 = require(l_script_FirstAncestor_0.Common.Enums).AccessResponseEnum;
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_FFlagAmpWizardParseExtraParameters_0 = require(l_Parent_0.SharedFlags).FFlagAmpWizardParseExtraParameters;
local v13 = l_UrlBuilder_0.new({
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
local v14 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
local function _(v15, v16, v17, v18) --[[ Line: 54 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v6 (copy), v13 (copy), l_Response_0 (copy)
    local l_l_fetch_0_0 = l_fetch_0;
    return v6.new(function(v20, v21) --[[ Line: 61 ]]
        -- upvalues: v16 (copy), v13 (ref), v15 (copy), v17 (copy), v18 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
        local v22 = table.concat(v16, ",");
        local v23 = v13({
            featureName = v15, 
            successfulActions = v22, 
            nameSpace = v17, 
            extraParameters = v18
        });
        local v24 = l_l_fetch_0_0(v23, {
            method = "GET"
        }):catch(function() --[[ Line: 70 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v24.status == 304 then
            v21("Got Response: 304");
            return;
        elseif not v24.ok then
            v21("Failed to find upsell feature access values");
            return;
        else
            local v25 = v24:json():catch(function() --[[ Line: 88 ]]
                return nil;
            end):expect();
            if not v25 then
                v21("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                return;
            else
                v20({
                    access = v25.access, 
                    recourse = v25.recourse, 
                    recourses = v25.recourses, 
                    shouldPrompt = v25.shouldPrompt
                });
                return;
            end;
        end;
    end);
end;
return {
    upsellFeatureAccess = function(v27, v28, v29, v30) --[[ Line: 107 ]] --[[ Name: upsellFeatureAccess ]]
        -- upvalues: l_Base64_0 (copy), l_HttpService_0 (copy), l_fetch_0 (copy), v6 (copy), v13 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local v31 = if v30 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v30)) else nil;
        local l_l_fetch_0_1 = l_fetch_0;
        return (v6.new(function(v33, v34) --[[ Line: 61 ]]
            -- upvalues: v28 (copy), v13 (ref), v27 (copy), v29 (copy), v31 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v35 = table.concat(v28, ",");
            local v36 = v13({
                featureName = v27, 
                successfulActions = v35, 
                nameSpace = v29, 
                extraParameters = v31
            });
            local v37 = l_l_fetch_0_1(v36, {
                method = "GET"
            }):catch(function() --[[ Line: 70 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v37.status == 304 then
                v34("Got Response: 304");
                return;
            elseif not v37.ok then
                v34("Failed to find upsell feature access values");
                return;
            else
                local v38 = v37:json():catch(function() --[[ Line: 88 ]]
                    return nil;
                end):expect();
                if not v38 then
                    v34("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    v33({
                        access = v38.access, 
                        recourse = v38.recourse, 
                        recourses = v38.recourses, 
                        shouldPrompt = v38.shouldPrompt
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 117 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end, 
    upsellFeatureAccessGql = function(v40, v41, _, v43, v44) --[[ Line: 181 ]] --[[ Name: upsellFeatureAccessGql ]]
        -- upvalues: l_gql_0 (copy), l_FFlagAmpWizardParseExtraParameters_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy), l_AccessResponseEnum_0 (copy)
        local v45 = l_gql_0(require(script.Parent.GetUpsellFeatureAccess));
        local v46 = nil;
        if l_FFlagAmpWizardParseExtraParameters_0 then
            v46 = if v44 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v44)) else nil;
        end;
        local v48 = v40:query({
            query = v45, 
            variables = {
                featureName = v41, 
                successfulActions = {}, 
                nameSpace = v43, 
                extraParameters = if l_FFlagAmpWizardParseExtraParameters_0 then v46 else nil
            }, 
            fetchPolicy = "network-only"
        }):catch(function(_) --[[ Line: 204 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect();
        if v48.data and v48.data.getUpsellFeatureAccess.featureAccess then
            return v48.data.getUpsellFeatureAccess.featureAccess;
        else
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end;
    end, 
    getFeatureAccess = function(v49) --[[ Line: 126 ]] --[[ Name: getFeatureAccess ]]
        -- upvalues: l_fetch_0 (copy), v6 (copy), v14 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return (v6.new(function(v51, v52) --[[ Line: 128 ]]
            -- upvalues: v49 (copy), v14 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v53 = table.concat(v49, ",");
            local v54 = v14({
                featureNames = v53
            });
            local v55 = l_l_fetch_0_2(v54, {
                method = "GET"
            }):catch(function() --[[ Line: 132 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v55.status == 304 then
                v52("Got Response: 304");
                return;
            elseif not v55.ok then
                v52("Failed to find get feature access values");
                return;
            else
                local v56 = v55:json():catch(function() --[[ Line: 150 ]]
                    return nil;
                end):expect();
                if not v56 then
                    v52("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    local v57 = {};
                    for _, v59 in v56.features do
                        table.insert(v57, {
                            feature = v59.featureName, 
                            access = v59.access
                        });
                    end;
                    v51({
                        featureAccessList = v57
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 173 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end
};