local v0 = require(script.Parent.VirtualEventsState);
local v1 = require(script.Components.EventNotificationsModal);
return {
    AnalyticsEvent = v0.enums.AnalyticsEvent, 
    requests = require(script.requests), 
    EventDetailsPageLoader = require(script.Components.EventDetailsPageLoader), 
    ShareEventModal = require(script.Components.ShareEventModal), 
    EventNotificationsModal = v1, 
    EventsListCarousel = require(script.Components.EventsListCarousel.EventsListCarousel), 
    EventsInExperienceApp = require(script.EventsInExperienceApp), 
    fireEventDetailsPageVisit = require(script.Analytics.fireEventDetailsPageVisit), 
    fireShareVirtualEventIconClicked = require(script.Analytics.fireShareVirtualEventIconClicked), 
    fireVirtualEventJoined = require(script.Analytics.fireVirtualEventJoined), 
    fireVirtualEventLinkCopied = require(script.Analytics.fireVirtualEventLinkCopied), 
    fireVirtualEventRSVP = require(script.Analytics.fireVirtualEventRSVP), 
    fireEventNotificationEnabled = require(script.Analytics.fireEventNotificationEnabled), 
    fireVirtualEventImpression = require(script.Analytics.fireVirtualEventImpression), 
    ["jest.config"] = script["jest.config"]
};