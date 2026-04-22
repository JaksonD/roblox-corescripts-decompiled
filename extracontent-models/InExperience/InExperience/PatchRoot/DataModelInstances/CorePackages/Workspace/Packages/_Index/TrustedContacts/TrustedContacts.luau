local _ = require(script.Enums);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustedContacts");
local l_FFlagTCUnifyNavigationEntry_0 = require(l_script_FirstAncestor_0.SharedFlags).FFlagTCUnifyNavigationEntry;
return {
    ["jest.config"] = script["jest.config"], 
    TrustedFriendsModalEntry = require(script.Components.TrustedFriendsModalEntry), 
    TrustedFriendsShareLinkErrorModal = require(script.Components.TrustedFriendsShareLinkErrorModal), 
    Enums = require(script.Enums), 
    EventHandlers = require(script.EventHandlers), 
    Analytics = require(script.Analytics), 
    FriendsRenameInfoModal = require(script.Components.FriendsRenameInfoModal), 
    TrustedContactsEducationModal = require(script.Components.TrustedContactsEducationModal), 
    Utils = if l_FFlagTCUnifyNavigationEntry_0 then nil else require(script.Utils), 
    TrustedContactsModal = if l_FFlagTCUnifyNavigationEntry_0 then nil else require(script.Components.TrustedContactsModal), 
    TrustedFriendsVPCPrologue = if l_FFlagTCUnifyNavigationEntry_0 then nil else require(script.Components.TrustedFriendsVPCPrologue)
};