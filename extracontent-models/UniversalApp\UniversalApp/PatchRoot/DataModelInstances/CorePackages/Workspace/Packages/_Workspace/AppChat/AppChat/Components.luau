local v0 = require(script.Parent.Flags.getFFlagEnableModularExternalNavigationHandler);
return {
    ChatConversation = require(script.ChatConversation), 
    EventReceivers = require(script.EventReceivers), 
    ExternalNavigationHandlerContainer = if v0() then require(script.ExternalNavigationHandler.Container) else nil, 
    Cells = require(script.Cells)
};