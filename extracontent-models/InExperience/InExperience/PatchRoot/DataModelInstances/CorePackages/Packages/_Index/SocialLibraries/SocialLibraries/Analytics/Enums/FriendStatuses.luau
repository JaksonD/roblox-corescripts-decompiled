local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.dependencies).enumerate(script.Name, {
    NotFriends = "nonfriend", 
    Friends = "friend", 
    RequestSent = "requestSent", 
    RequestReceived = "requestReceived", 
    Ineligible = "ineligible", 
    Recommendation = "recommendation"
});