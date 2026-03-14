local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v5 = require(script.Parent.EventConstants);
local v6 = require(script.Parent.EventNames);
return {
    [v6.ContentFeedDeleteCtaPressed] = {
        additionalInfo = {
            action = v5.action.DeleteCtaPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedExitCtaPressed] = {
        additionalInfo = {
            action = v5.action.ExitCtaPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedInspectCtaPressed] = {
        additionalInfo = {
            action = v5.action.InspectCtaPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedInspectItemPressed] = {
        additionalInfo = {
            action = v5.action.InspectItemPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            itemId = v1.identity, 
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedMoreMenuButtonPressed] = {
        additionalInfo = {
            action = v5.action.MoreMenuButtonPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedPlayButtonPressed] = {
        additionalInfo = {
            action = v5.action.PlayButtonPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedPostViewed] = {
        additionalInfo = {
            action = v5.action.PostViewed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedReportCtaPressed] = {
        additionalInfo = {
            action = v5.action.ReportCtaPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedShareCtaPressed] = {
        additionalInfo = {
            action = v5.action.ShareCtaPressed, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }, 
    [v6.ContentFeedZoomOccurred] = {
        additionalInfo = {
            action = v5.action.ZoomOccurred, 
            namespace = v5.namespace.ContentFeed
        }, 
        context = l_Contexts_0.SocialContentFeed, 
        eventType = l_EventTypes_0.ButtonClick, 
        formatRulesForAdditionalInfo = {
            postId = v1.identity
        }
    }
};