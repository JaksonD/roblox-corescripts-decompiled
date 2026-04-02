local v0 = require(script.SduiActionType);
local v1 = require(script.SduiImpressionEventType);
local v2 = require(script.SduiBuilderTypes);
local v3 = require(script.SduiComponentType);
local v4 = require(script.SduiConfigTypes);
local v5 = require(script.SduiContentTypes);
local _ = require(script.SduiDataStoreTypes);
local _ = require(script.SduiFocusNavigationTypes);
local v8 = require(script.SduiErrors);
local l_FFlagSduiImpressionHandlerRegistry_0 = require(script.Parent.SharedFlags).FFlagSduiImpressionHandlerRegistry;
return {
    ["jest.config"] = script["jest.config"], 
    executeAction = require(script.executeAction), 
    findAnalyticsField = require(script.findAnalyticsField), 
    findAnalyticsFieldInAncestors = require(script.findAnalyticsFieldInAncestors), 
    getSduiComponentWrapper = require(script.getSduiComponentWrapper), 
    reportUnifiedLoggingAction = require(script.Analytics.reportUnifiedLoggingAction), 
    reportUnifiedLoggingImpressions = require(script.Analytics.reportUnifiedLoggingImpressions), 
    parseProps = require(script.parseProps), 
    SduiActionType = v0, 
    SduiImpressionEventType = v1, 
    SduiBuilder = require(script.SduiBuilder), 
    SduiBuilderTypes = v2, 
    SduiCollectionAnalyticsBuilder = require(script.Analytics.SduiCollectionAnalyticsBuilder), 
    SduiComponent = require(script.SduiComponent), 
    SduiComponentType = v3, 
    SduiConfigTypes = v4, 
    SduiContentTypes = v5, 
    SduiErrors = v8, 
    SduiInstrumentation = require(script.SduiInstrumentation), 
    SduiLogger = require(script.SduiLogger), 
    SduiMockUtils = require(script.ClientBinding.SduiMockUtils), 
    SduiParseHelpers = require(script.SduiParseHelpers), 
    SduiParsers = require(script.SduiParsers), 
    SduiResponsiveHelpers = require(script.SduiResponsiveHelpers), 
    SduiTemplateRegistry = require(script.SduiTemplateRegistry), 
    useUidRefString = require(script.useUidRefString), 
    validateInterface = require(script.validateInterface), 
    validateSduiComponentConfig = require(script.validateSduiComponentConfig), 
    getSduiClientBindingBuilder = function() --[[ Line: 90 ]] --[[ Name: getSduiClientBindingBuilder ]]
        return require(script.ClientBinding.SduiClientBindingBuilder);
    end, 
    getSduiDataBinder = function() --[[ Line: 93 ]] --[[ Name: getSduiDataBinder ]]
        return require(script.ClientBinding.SduiDataBinder);
    end, 
    getProtoVariableMapper = function() --[[ Line: 96 ]] --[[ Name: getProtoVariableMapper ]]
        return require(script.ClientBinding.ProtoVariableMapper);
    end, 
    createBuilderConfig = function(v10) --[[ Line: 99 ]] --[[ Name: createBuilderConfig ]]
        return require(script.ClientBinding.createBuilderConfig)(v10);
    end, 
    getSduiActionHandlerRegistry = function() --[[ Line: 103 ]] --[[ Name: getSduiActionHandlerRegistry ]]
        return require(script.getSduiActionHandlerRegistry)();
    end, 
    getSduiImpressionHandlerRegistry = l_FFlagSduiImpressionHandlerRegistry_0 and function() --[[ Line: 107 ]]
        return require(script.getSduiImpressionHandlerRegistry)();
    end or nil, 
    getSduiServiceDependenciesStore = function() --[[ Line: 111 ]] --[[ Name: getSduiServiceDependenciesStore ]]
        return require(script.ClientBinding.getSduiServiceDependenciesStore)();
    end, 
    getSduiTokensStore = function() --[[ Line: 114 ]] --[[ Name: getSduiTokensStore ]]
        return require(script.ClientBinding.getSduiTokensStore)();
    end, 
    getSduiPolicyStore = function() --[[ Line: 117 ]] --[[ Name: getSduiPolicyStore ]]
        return require(script.ClientBinding.getSduiPolicyStore)();
    end, 
    getSduiComponentRegistry = require(script.getSduiComponentRegistry)
};