local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1, v2 = require(l_Parent_0.Signals).createSignal(false);
return {
    setStreamPresented = v2, 
    getStreamPresented = v1
};