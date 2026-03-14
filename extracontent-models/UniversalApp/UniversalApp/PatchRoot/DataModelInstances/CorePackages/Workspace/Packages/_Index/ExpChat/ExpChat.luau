local l_Parent_0 = script.Parent;
local l_ActionBindableEvent_0 = require(l_Parent_0.ExpChatShared).ActionBindableEvent;
local v2 = require(script.useExpChatMessagesReducerSlice);
return {
    Events = require(script.Events), 
    mountClientApp = require(script.mountClientApp), 
    listenToDispatch = require(script.listenToDispatch)(l_ActionBindableEvent_0), 
    GlobalFlags = require(script.GlobalFlags), 
    getExperienceChatVisualConfig = require(script.getExperienceChatVisualConfig), 
    Stores = require(script.Stores), 
    Hooks = {
        useExpChatMessagesReducerSlice = v2
    }, 
    ExpChatPerfTracker = require(script.Telemetry.ExpChatPerfTracker), 
    ["jest.config"] = script["jest.config"], 
    ["mockDataModel-jest.config"] = script["mockDataModel-jest.config"]
};