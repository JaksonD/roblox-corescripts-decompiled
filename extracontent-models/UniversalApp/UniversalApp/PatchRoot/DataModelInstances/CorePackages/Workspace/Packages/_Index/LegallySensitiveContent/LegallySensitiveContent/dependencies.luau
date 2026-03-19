local l_Parent_0 = script.Parent.Parent;
return {
    Localization = require(l_Parent_0.Localization), 
    Promise = require(l_Parent_0.Promise), 
    UrlBuilder = require(l_Parent_0.UrlBuilder).UrlBuilder, 
    UrlBase = require(l_Parent_0.UrlBuilder).UrlBase, 
    Fetch = require(l_Parent_0.Fetch), 
    Base64 = require(l_Parent_0.AuthCommon).Utils.Base64
};