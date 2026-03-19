local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = v1.makeActionCreator("FIND_CONTACT_FRIENDS_SUCCEEDED_ACTION", function() --[[ Line: 5 ]]
    return {
        responseBody = {
            userContactIds = {
                "abc-123-456-1235", 
                "bglk-124f-323fd-2443f", 
                "fgk49rf-45f0-fsdf45-fd341", 
                "gfg4-f1sd-fdfet5-34sddhu"
            }
        }
    };
end);
local v3 = v1.makeActionCreator("GET_CONTACT_ENTITIES", function() --[[ Line: 19 ]]
    return {
        responseBody = {
            userContactsEntities = {
                {
                    id = "abc-123-456-1235", 
                    name = "Boberson Bob", 
                    mutualContacts = false
                }, 
                {
                    id = "bglk-124f-323fd-2443f", 
                    name = "Smith John", 
                    mutualContacts = false
                }, 
                {
                    id = "fgk49rf-45f0-fsdf45-fd341", 
                    name = "Robertson Robert", 
                    mutualContacts = false
                }, 
                {
                    id = "gfg4-f1sd-fdfet5-34sddhu", 
                    name = "Folds Ben", 
                    mutualContacts = false
                }
            }
        }
    };
end);
local v5 = v1.makeActionCreator("UPLOAD_CONTACTS", function(v4) --[[ Line: 49 ]]
    return {
        responseBody = if v4 then {
            matchedContactFields = v4
        } else {
            matchedContactFields = {
                {
                    userContactId = "abc-123-456-1235", 
                    idAssignedByFE = "Boberson Bob1"
                }, 
                {
                    userContactId = "abc-456-1235", 
                    idAssignedByFE = "Danderson Dan1"
                }, 
                {
                    userContactId = "abc-123-456", 
                    idAssignedByFE = "Goferson Goff2"
                }, 
                {
                    userContactId = "abc-1235", 
                    idAssignedByFE = "Toferson Toff1"
                }
            }
        }
    };
end);
return {
    mockFindContactFriends = "FIND_CONTACT_FRIENDS_SUCCEEDED_ACTION", 
    mockFindContactFriendsAction = v2, 
    mockGetContactEntitiesByContactId = "GET_CONTACT_ENTITIES", 
    mockGetContactEntitiesByContactIdAction = v3, 
    mockUploadContacts = "UPLOAD_CONTACTS", 
    mockUploadContactsAction = v5
};