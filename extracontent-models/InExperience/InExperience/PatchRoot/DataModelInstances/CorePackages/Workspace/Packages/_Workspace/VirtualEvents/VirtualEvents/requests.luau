local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_gql_0 = require(l_script_FirstAncestor_0.Parent.ApolloClient).gql;
return {
    GET_VIRTUAL_EVENT = l_gql_0(require(script.Parent.GetVirtualEvent)), 
    UPDATE_RSVP_STATUS = l_gql_0(require(script.Parent.UpdateRsvpStatus)), 
    NEVER_SHOW_NOTIFICATIONS_MODAL_AGAIN = l_gql_0(require(script.Parent.NeverShowNotificationModalAgain)), 
    ENABLE_PUSH_NOTIFICATIONS = l_gql_0(require(script.Parent.EnablePushNotifications)), 
    GET_EVENTS_FOR_EXPERIENCE = l_gql_0(require(script.Parent.VirtualEventsForExperience))
};