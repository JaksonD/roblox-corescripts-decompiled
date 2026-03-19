local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.Enums.EventNames);
local l_SocialLuaAnalytics_0 = v1.SocialLuaAnalytics;
local l_Dash_0 = v1.Dash;
local l_Enums_0 = l_SocialLuaAnalytics_0.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v8 = require(script.Parent.Enums.BtnValues);
return {
    [v2.DiscoverabilityModalLoad] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalLoad, 
        formatRulesForAdditionalInfo = {
            version = l_Dash_0.identity, 
            wordingVersion = l_Dash_0.identity
        }
    }, 
    [v2.DiscoverabilityModalContinue] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalClick, 
        additionalInfo = {
            btn = v8.ContactImporter
        }, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }, 
    [v2.DiscoverabilityModalClose] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalClick, 
        additionalInfo = {
            btn = v8.Close
        }, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }, 
    [v2.DiscoverabilityModalRadioButtonClick] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalRadioButtonClick, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }
};