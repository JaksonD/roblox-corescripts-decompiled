local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_SocialService_0 = game:GetService("SocialService");
return require(l_Parent_0.React).createContext({
    socialService = l_SocialService_0
});