local l_Parent_0 = script:FindFirstAncestor("CrossPlay").Parent;
local l_CrossPlayCapabilities_0 = require(l_Parent_0.UniversalAppPolicy).Enum.CrossPlayCapabilities;
local v2 = {
    [l_CrossPlayCapabilities_0.CrossPlatform] = 185, 
    [l_CrossPlayCapabilities_0.Multiplayer] = 254, 
    [l_CrossPlayCapabilities_0.SharedContent] = 247
};
local v3 = {
    NO_ISSUE = "NoIssue", 
    BANNED = "Banned", 
    PURCHASE_REQUIRED = "PurchaseRequired", 
    ERROR = "Error"
};
return {
    PrivilegeCodes = v2, 
    PrivilegeCheckResults = v3
};