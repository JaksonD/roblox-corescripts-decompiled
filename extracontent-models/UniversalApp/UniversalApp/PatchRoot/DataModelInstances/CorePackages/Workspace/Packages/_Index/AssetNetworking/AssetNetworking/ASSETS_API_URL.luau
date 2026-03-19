local l_Parent_0 = script.Parent.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
return l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "assets/user-auth"
})();