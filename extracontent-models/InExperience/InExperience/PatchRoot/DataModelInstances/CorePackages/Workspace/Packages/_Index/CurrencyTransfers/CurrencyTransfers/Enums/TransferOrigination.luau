local v0 = {
    Unknown = "unknown", 
    Profile = "profile", 
    Chat = "chat", 
    BuyRobux = "buyRobux", 
    InExperience = "inExperience"
};
v0.toEnumInteger = {
    [v0.Unknown] = 0, 
    [v0.Profile] = 1, 
    [v0.Chat] = 2, 
    [v0.BuyRobux] = 3, 
    [v0.InExperience] = 4
};
return v0;