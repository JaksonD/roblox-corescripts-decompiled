local v0 = require(script.SduiActionType);
local v1 = require(script.SduiBuilderTypes);
local v2 = require(script.SduiComponentType);
local v3 = require(script.SduiConfigTypes);
local v4 = require(script.SduiContentTypes);
local _ = require(script.SduiDataStoreTypes);
local _ = require(script.SduiFocusNavigationTypes);
local v7 = require(script.SduiErrors);
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
    SduiBuilder = require(script.SduiBuilder), 
    SduiBuilderTypes = v1, 
    SduiCollectionAnalyticsBuilder = require(script.Analytics.SduiCollectionAnalyticsBuilder), 
    SduiComponent = require(script.SduiComponent), 
    SduiComponentType = v2, 
    SduiConfigTypes = v3, 
    SduiContentTypes = v4, 
    SduiErrors = v7, 
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
    getSduiClientBindingBuilder = function() --[[ Line: 81 ]] --[[ Name: getSduiClientBindingBuilder ]]
        return require(script.ClientBinding.SduiClientBindingBuilder);
    end, 
    getSduiDataBinder = function() --[[ Line: 84 ]] --[[ Name: getSduiDataBinder ]]
        return require(script.ClientBinding.SduiDataBinder);
    end, 
    getProtoVariableMapper = function() --[[ Line: 87 ]] --[[ Name: getProtoVariableMapper ]]
        return require(script.ClientBinding.ProtoVariableMapper);
    end, 
    createBuilderConfig = function(v8) --[[ Line: 90 ]] --[[ Name: createBuilderConfig ]]
        return require(script.ClientBinding.createBuilderConfig)(v8);
    end, 
    getSduiActionHandlerRegistry = function() --[[ Line: 94 ]] --[[ Name: getSduiActionHandlerRegistry ]]
        return require(script.getSduiActionHandlerRegistry)();
    end, 
    getSduiServiceDependenciesStore = function() --[[ Line: 97 ]] --[[ Name: getSduiServiceDependenciesStore ]]
        return require(script.ClientBinding.getSduiServiceDependenciesStore)();
    end, 
    getSduiTokensStore = function() --[[ Line: 100 ]] --[[ Name: getSduiTokensStore ]]
        return require(script.ClientBinding.getSduiTokensStore)();
    end, 
    getSduiComponentRegistry = require(script.getSduiComponentRegistry)
};