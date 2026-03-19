local l_Parent_0 = script:FindFirstAncestor("CallProtocol").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    Idle = "Idle", 
    Ringing = "Ringing", 
    Accepting = "Accepting", 
    Initializing = "Initializing", 
    Connecting = "Connecting", 
    Active = "Active"
});