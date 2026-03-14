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
local l_FFlagAmpProviderParseExtraParameters_0 = require(l_Parent_0.SharedFlags).FFlagAmpProviderParseExtraParameters;
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
        if l_FFlagAmpProviderParseExtraParameters_0 then {
            name = "extraParameters", 
            value = "{extraParameters}", 
            optional = true
        } else nil
    }
});
local v15 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "access-management/v1/feature-access", 
    query = {
        featureNames = "{featureNames}"
    }
});
local function _(v16, v17, v18, v19) --[[ Line: 57 ]] --[[ Name: getUpsellFeatureAccessFromFeatureName ]]
    -- upvalues: l_fetch_0 (copy), v6 (copy), v14 (copy), l_FFlagAmpProviderParseExtraParameters_0 (copy), l_Response_0 (copy)
    local l_l_fetch_0_0 = l_fetch_0;
    return v6.new(function(v21, v22) --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v14 (ref), v16 (copy), v18 (copy), l_FFlagAmpProviderParseExtraParameters_0 (ref), v19 (copy), l_l_fetch_0_0 (copy), l_Response_0 (ref)
        local v23 = table.concat(v17, ",");
        local v24 = v14({
            featureName = v16, 
            successfulActions = v23, 
            nameSpace = v18, 
            extraParameters = if l_FFlagAmpProviderParseExtraParameters_0 then v19 else nil
        });
        local v25 = l_l_fetch_0_0(v24, {
            method = "GET"
        }):catch(function() --[[ Line: 73 ]]
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
            local v26 = v25:json():catch(function() --[[ Line: 91 ]]
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
    upsellFeatureAccess = function(v28, v29, v30, v31) --[[ Line: 110 ]] --[[ Name: upsellFeatureAccess ]]
        -- upvalues: l_FFlagAmpProviderParseExtraParameters_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy), l_fetch_0 (copy), v6 (copy), v14 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local v32 = nil;
        if l_FFlagAmpProviderParseExtraParameters_0 then
            v32 = if v31 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v31)) else nil;
        end;
        local v33 = if l_FFlagAmpProviderParseExtraParameters_0 then v32 else nil;
        local l_l_fetch_0_1 = l_fetch_0;
        return (v6.new(function(v35, v36) --[[ Line: 64 ]]
            -- upvalues: v29 (copy), v14 (ref), v28 (copy), v30 (copy), l_FFlagAmpProviderParseExtraParameters_0 (ref), v33 (copy), l_l_fetch_0_1 (copy), l_Response_0 (ref)
            local v37 = table.concat(v29, ",");
            local v38 = v14({
                featureName = v28, 
                successfulActions = v37, 
                nameSpace = v30, 
                extraParameters = if l_FFlagAmpProviderParseExtraParameters_0 then v33 else nil
            });
            local v39 = l_l_fetch_0_1(v38, {
                method = "GET"
            }):catch(function() --[[ Line: 73 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v39.status == 304 then
                v36("Got Response: 304");
                return;
            elseif not v39.ok then
                v36("Failed to find upsell feature access values");
                return;
            else
                local v40 = v39:json():catch(function() --[[ Line: 91 ]]
                    return nil;
                end):expect();
                if not v40 then
                    v36("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    v35({
                        access = v40.access, 
                        recourse = v40.recourse, 
                        recourses = v40.recourses, 
                        shouldPrompt = v40.shouldPrompt
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 126 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end, 
    upsellFeatureAccessGql = function(v42, v43, _, v45, v46) --[[ Line: 190 ]] --[[ Name: upsellFeatureAccessGql ]]
        -- upvalues: l_gql_0 (copy), l_FFlagAmpWizardParseExtraParameters_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy), l_AccessResponseEnum_0 (copy)
        local v47 = l_gql_0(require(script.Parent.GetUpsellFeatureAccess));
        local v48 = nil;
        if l_FFlagAmpWizardParseExtraParameters_0 then
            v48 = if v46 then l_Base64_0.Encode(l_HttpService_0:JSONEncode(v46)) else nil;
        end;
        local v50 = v42:query({
            query = v47, 
            variables = {
                featureName = v43, 
                successfulActions = {}, 
                nameSpace = v45, 
                extraParameters = if l_FFlagAmpWizardParseExtraParameters_0 then v48 else nil
            }, 
            fetchPolicy = "network-only"
        }):catch(function(_) --[[ Line: 213 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect();
        if v50.data and v50.data.getUpsellFeatureAccess.featureAccess then
            return v50.data.getUpsellFeatureAccess.featureAccess;
        else
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end;
    end, 
    getFeatureAccess = function(v51) --[[ Line: 135 ]] --[[ Name: getFeatureAccess ]]
        -- upvalues: l_fetch_0 (copy), v6 (copy), v15 (copy), l_Response_0 (copy), l_AccessResponseEnum_0 (copy)
        local l_l_fetch_0_2 = l_fetch_0;
        return (v6.new(function(v53, v54) --[[ Line: 137 ]]
            -- upvalues: v51 (copy), v15 (ref), l_l_fetch_0_2 (copy), l_Response_0 (ref)
            local v55 = table.concat(v51, ",");
            local v56 = v15({
                featureNames = v55
            });
            local v57 = l_l_fetch_0_2(v56, {
                method = "GET"
            }):catch(function() --[[ Line: 141 ]]
                -- upvalues: l_Response_0 (ref)
                return l_Response_0.error();
            end):expect();
            if v57.status == 304 then
                v54("Got Response: 304");
                return;
            elseif not v57.ok then
                v54("Failed to find get feature access values");
                return;
            else
                local v58 = v57:json():catch(function() --[[ Line: 159 ]]
                    return nil;
                end):expect();
                if not v58 then
                    v54("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API");
                    return;
                else
                    local v59 = {};
                    for _, v61 in v58.features do
                        table.insert(v59, {
                            feature = v61.featureName, 
                            access = v61.access
                        });
                    end;
                    v53({
                        featureAccessList = v59
                    });
                    return;
                end;
            end;
        end):catch(function(_) --[[ Line: 182 ]]
            -- upvalues: l_AccessResponseEnum_0 (ref)
            return {
                access = l_AccessResponseEnum_0.Error
            };
        end):expect());
    end
};