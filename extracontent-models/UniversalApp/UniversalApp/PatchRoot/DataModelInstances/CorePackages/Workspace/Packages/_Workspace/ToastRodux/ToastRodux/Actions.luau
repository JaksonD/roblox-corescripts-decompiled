local v0 = require(script.MarkCurrentToastMessageAsRead);
local v1 = require(script.RemoveAllToastMessages);
local v2 = require(script.RemoveCurrentToastMessage);
local v3 = require(script.SetCurrentToastMessage);
return {
    MarkCurrentToastMessageAsRead = v0, 
    RemoveAllToastMessages = v1, 
    RemoveCurrentToastMessage = v2, 
    SetCurrentToastMessage = v3
};