local v0 = require(script.Components.ChatBoxContextMenu);
local v1 = require(script.Components.ChatLineReportSelectionModal);
local v2 = require(script.Enums.ChatLineSelectionMode);
local v3 = require(script.Common.Constants);
return {
    ["jest.config"] = script["jest.config"], 
    ChatBoxContextMenu = v0, 
    ChatLineReportSelectionModal = v1, 
    Constants = v3, 
    Enums = {
        ChatLineSelectionMode = v2
    }, 
    Helpers = {
        getMessageText = require(script.Common.getMessageText), 
        isSystemMessage = require(script.Common.isSystemMessage)
    }
};