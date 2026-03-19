local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local v1 = require(l_script_FirstAncestor_0.graphql.connectors.AmpUpsellConnector);
return {
    default = {
        UpsellFeatureAccessResponse = {
            featureAccess = function(v2) --[[ Line: 7 ]] --[[ Name: featureAccess ]]
                return {
                    featureName = v2.featureName, 
                    access = v2.access, 
                    recourse = v2.recourse, 
                    recourses = v2.recourses
                };
            end
        }, 
        Query = {
            getFeatureAccess = function(_, v4, v5) --[[ Line: 18 ]] --[[ Name: getFeatureAccess ]]
                -- upvalues: v1 (copy)
                return v1.getFeatureAccessFromFeatureNamesList(v4.featureNames, v5.fetchImpl);
            end, 
            getUpsellFeatureAccess = function(_, v7, v8) --[[ Line: 21 ]] --[[ Name: getUpsellFeatureAccess ]]
                -- upvalues: v1 (copy)
                return v1.getUpsellFeatureAccessFromFeatureName(v7.featureName, v7.successfulActions, v8.fetchImpl, v7.nameSpace, v7.extraParameters);
            end
        }
    }
};