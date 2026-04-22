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
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_gql_0 = require(l_Parent_0.ApolloClient).gql;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_FFlagAmpWizardParseExtraParameters_0 = require(l_Parent_0.SharedFlags).FFlagAmpWizardParseExtraParameters;
local v14 = l_UrlBuilder_0.new({
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
local v15 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
local function _(v16, v17, v18, v19) --[[ Line: 46 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v6 (copy), v14 (copy), l_Response_0 (copy)
    local l_l_fetch_0_0 = l_fetch_0;
    return v6.new(function(v21, v22) --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v14 (ref), v16 (copy), v18 (copy), v19 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
        local v23 = table.concat(v17, ",");
        local v24 = v14({
            featureName = v16, 
            successfulActions = v23, 
            nameSpace = v18, 
            extraParameters = v19
        });
        local v25 = l_l_fetch_0_0(v24, {
            method = "GET"
        }):catch(function() --[[ Line: 62 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if v25.status == 304 then
            v22("Got Response: 304");
            return;
        elseif not v25.ok then
            v22("Failed to find upsell feature access values");
            return;
        else
            local v26 = v25:json():catch(function() --[[ Line: 80 ]]
                return nil;
            end):expect();
            if not v26 then
                v22("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                return;
            else
                v21({
                    access = v26.access, 
                    recourse = v26.recourse, 
                    recourses = v26.recourses, 
                    shouldPrompt = v26.shouldPrompt
                });
                return;
            end;
        end;
    end);
end;
return {
    upsellFeatureAccess = function(v28, v29, v30, v31) --[[ Line: 99 ]] --[[ Name: upsellFeatureAccess ]]
        -- upvalues: l_Base64_0 (copy), l_HttpService_0 (copy), l_fetch_0 (copy), v6 (copy), v14 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local v32 = if v31 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v31)) else nil;
        local l_l_fetch_0_1 = l_fetch_0;
        return (v6.new(function(v34, v35) --[[ Line: 53 ]]
            -- upvalues: v29 (copy), v14 (ref), v28 (copy), v30 (copy), v32 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v36 = table.concat(v29, ",");
            local v37 = v14({
                featureName = v28, 
                successfulActions = v36, 
                nameSpace = v30, 
                extraParameters = v32
            });
            local v38 = l_l_fetch_0_1(v37, {
                method = "GET"
            }):catch(function() --[[ Line: 62 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v38.status == 304 then
                v35("Got Response: 304");
                return;
            elseif not v38.ok then
                v35("Failed to find upsell feature access values");
                return;
            else
                local v39 = v38:json():catch(function() --[[ Line: 80 ]]
                    return nil;
                end):expect();
                if not v39 then
                    v35("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    v34({
                        access = v39.access, 
                        recourse = v39.recourse, 
                        recourses = v39.recourses, 
                        shouldPrompt = v39.shouldPrompt
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 109 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end, 
    upsellFeatureAccessGql = function(v41, v42, _, v44, v45) --[[ Line: 173 ]] --[[ Name: upsellFeatureAccessGql ]]
        -- upvalues: l_gql_0 (copy), l_FFlagAmpWizardParseExtraParameters_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy), l_AccessResponseEnum_0 (copy)
        local v46 = l_gql_0(require(script.Parent.GetUpsellFeatureAccess));
        local v47 = nil;
        if l_FFlagAmpWizardParseExtraParameters_0 then
            v47 = if v45 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v45)) else nil;
        end;
        local v49 = v41:query({
            query = v46, 
            variables = {
                featureName = v42, 
                successfulActions = {}, 
                nameSpace = v44, 
                extraParameters = if l_FFlagAmpWizardParseExtraParameters_0 then v47 else nil
            }, 
            fetchPolicy = "network-only"
        }):catch(function(_) --[[ Line: 196 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect();
        if v49.data and v49.data.getUpsellFeatureAccess.featureAccess then
            return v49.data.getUpsellFeatureAccess.featureAccess;
        else
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end;
    end, 
    getFeatureAccess = function(v50) --[[ Line: 118 ]] --[[ Name: getFeatureAccess ]]
        -- upvalues: l_fetch_0 (copy), v6 (copy), v15 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return (v6.new(function(v52, v53) --[[ Line: 120 ]]
            -- upvalues: v50 (copy), v15 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v54 = table.concat(v50, ",");
            local v55 = v15({
                featureNames = v54
            });
            local v56 = l_l_fetch_0_2(v55, {
                method = "GET"
            }):catch(function() --[[ Line: 124 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v56.status == 304 then
                v53("Got Response: 304");
                return;
            elseif not v56.ok then
                v53("Failed to find get feature access values");
                return;
            else
                local v57 = v56:json():catch(function() --[[ Line: 142 ]]
                    return nil;
                end):expect();
                if not v57 then
                    v53("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    local v58 = {};
                    for _, v60 in v57.features do
                        table.insert(v58, {
                            feature = v60.featureName, 
                            access = v60.access
                        });
                    end;
                    v52({
                        featureAccessList = v58
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 165 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end
};