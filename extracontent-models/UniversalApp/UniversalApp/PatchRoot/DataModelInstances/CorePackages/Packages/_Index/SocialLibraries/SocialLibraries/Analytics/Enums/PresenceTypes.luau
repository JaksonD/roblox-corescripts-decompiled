local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    InGame = "inGame", 
    InStudio = "inStudio", 
    Offline = "offline", 
    Online = "online"
});