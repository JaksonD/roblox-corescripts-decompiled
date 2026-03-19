local l_Parent_0 = script:FindFirstAncestor("RoduxPresence").Parent;
return require(l_Parent_0.enumerate)(script.Name, {
    Offline = 0, 
    Online = 1, 
    InGame = 2, 
    InStudio = 3, 
    Invisible = 4
});