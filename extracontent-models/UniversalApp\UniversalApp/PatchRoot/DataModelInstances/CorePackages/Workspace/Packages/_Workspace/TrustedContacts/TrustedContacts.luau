local _ = require(script.Enums);
return {
    ["jest.config"] = script["jest.config"], 
    TrustedContactsUpsellModal = require(script.Components.TrustedContactsUpsellModal), 
    TrustedContactsModal = require(script.Components.TrustedContactsModal), 
    TrustedContactsEducationModal = require(script.Components.TrustedContactsEducationModal), 
    FriendsRenameInfoModal = require(script.Components.FriendsRenameInfoModal), 
    TrustedFriendsVPCPrologue = require(script.Components.TrustedFriendsVPCPrologue), 
    Utils = require(script.Utils), 
    Enums = require(script.Enums), 
    EventHandlers = require(script.EventHandlers), 
    Analytics = require(script.Analytics)
};