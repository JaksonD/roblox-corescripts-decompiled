local v0 = require(script.Parent.Regex);
local v1 = v0.oneOf({
    v0.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@"), 
    "\\%[A-Fa-f0-9]{2}"
});
local v2 = v0.oneOf({
    v0.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?"), 
    "\\%[A-Fa-f0-9]{2}"
});
local v3 = v0.oneOf({
    v0.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?\\#"), 
    "\\%[A-Fa-f0-9]{2}"
});
local v4 = {
    "https", 
    "http"
};
local v5 = {
    "com", 
    "net", 
    "org", 
    "[a-z]{2}"
};
local v6 = "\\w(?:[\\w\\-]{0,61}\\w)?" .. v0.DOT .. v0.zeroOrMore(v0.oneOf(v5) .. v0.DOT) .. v0.oneOf(v5);
return {
    PATH_CHAR = v1, 
    QUERY_CHAR = v2, 
    FRAGMENT_CHAR = v3, 
    ANY_DOMAIN_NAME = "\\w(?:[\\w\\-]{0,61}\\w)?", 
    ANY_HOSTNAME_PATTERN = v6, 
    HTTP_PROTOCOL_PATTERNS = v4, 
    COMMON_TLD_PATTERNS = v5, 
    ANY_DOMAIN_PATTERN = v6
};