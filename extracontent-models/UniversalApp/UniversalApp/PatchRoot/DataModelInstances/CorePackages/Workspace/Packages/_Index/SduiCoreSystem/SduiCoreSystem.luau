local v0 = require(script.SduiActionType);
local v1 = require(script.SduiBuilderTypes);
local v2 = require(script.SduiComponentType);
local v3 = require(script.SduiConfigTypes);
local v4 = require(script.SduiContentTypes);
local _ = require(script.SduiDataStoreTypes);
local _ = require(script.SduiFocusNavigationTypes);
local v7 = require(script.SduiErrors);
local l_FFlagSduiClientBinding_0 = require(script.Parent.SharedFlags).FFlagSduiClientBinding;
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
    getSduiClientBindingBuilder = l_FFlagSduiClientBinding_0 and function() --[[ Line: 86 ]]
        return require(script.ClientBinding.SduiClientBindingBuilder);
    end or nil, 
    getSduiDataBinder = l_FFlagSduiClientBinding_0 and function() --[[ Line: 91 ]]
        return require(script.ClientBinding.SduiDataBinder);
    end or nil, 
    getProtoVariableMapper = l_FFlagSduiClientBinding_0 and function() --[[ Line: 96 ]]
        return require(script.ClientBinding.ProtoVariableMapper);
    end or nil, 
    createBuilderConfig = l_FFlagSduiClientBinding_0 and function(v9) --[[ Line: 101 ]]
        return require(script.ClientBinding.createBuilderConfig)(v9);
    end or nil, 
    getSduiActionHandlerRegistry = l_FFlagSduiClientBinding_0 and function() --[[ Line: 107 ]]
        return require(script.getSduiActionHandlerRegistry)();
    end or require(script.getSduiActionHandlerRegistry), 
    getSduiServiceDependenciesStore = l_FFlagSduiClientBinding_0 and function() --[[ Line: 112 ]]
        return require(script.ClientBinding.getSduiServiceDependenciesStore)();
    end or require(script.ClientBinding.getSduiServiceDependenciesStore), 
    getSduiTokensStore = l_FFlagSduiClientBinding_0 and function() --[[ Line: 117 ]]
        return require(script.ClientBinding.getSduiTokensStore)();
    end or require(script.ClientBinding.getSduiTokensStore), 
    getSduiComponentRegistry = if l_FFlagSduiClientBinding_0 then require(script.getSduiComponentRegistry) else nil
};