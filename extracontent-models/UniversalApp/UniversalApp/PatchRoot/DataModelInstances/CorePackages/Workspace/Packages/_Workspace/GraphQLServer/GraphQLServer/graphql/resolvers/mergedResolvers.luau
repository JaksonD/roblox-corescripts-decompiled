local v0 = {};
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
v0.default = require(script.Parent.Parent.utils).mergeResolvers({
    require(script.Parent.UserResolver).default, 
    require(script.Parent.PlayerResolver).default, 
    require(script.Parent.OmniFeed).default, 
    require(script.Parent.ScalarResolver).default, 
    require(script.Parent.VirtualEventResolver), 
    require(script.Parent.ExperienceResolver), 
    require(script.Parent.ProfileInsightsResolver), 
    require(script.Parent.AmpUpsellResolver).default, 
    require(script.Parent.UserProfileResolver), 
    require(script.Parent.FriendsResolver), 
    (require(script.Parent.ShareLinkResolver))
});
return v0;