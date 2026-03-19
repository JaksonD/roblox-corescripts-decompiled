local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Result);
local v2 = {
    new = function() --[[ Line: 22 ]] --[[ Name: new ]]
        return {};
    end
};
v2.fromOmniJsonData = function(v3) --[[ Line: 27 ]] --[[ Name: fromOmniJsonData ]]
    -- upvalues: v1 (copy), v2 (copy)
    if type(v3) ~= "table" then
        return v1.error("UserSearchEntry.fromOmniJsonData expects userSearchEntryJson to be a table");
    elseif v3.previousUsernames and type(v3.previousUsernames) ~= "table" then
        return v1.error("UserSearchEntry.entries expects entry.previousUsernames to be a table or null");
    elseif type(v3.contentId) ~= "number" then
        return v1.error("UserSearchEntry.entries expects entry.contentId to be a number");
    elseif type(v3.username) ~= "string" then
        return v1.error("UserSearchEntry.entries expects entry.username to be a string");
    elseif type(v3.displayName) ~= "string" then
        return v1.error("UserSearchEntry.entries expects entry.displayName to be a string");
    elseif v3.contentType ~= "User" then
        return v1.error("UserSearchEntry.entries expects entry.contentType to be 'User'");
    else
        local v4 = v2.new();
        v4.previousUsernames = v3.previousUsernames or {};
        v4.id = tostring(v3.contentId);
        v4.name = v3.username;
        v4.displayName = v3.displayName;
        return v1.success(v4);
    end;
end;
v2.mock = function(v5) --[[ Line: 62 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v6 = v2.new();
    v6.previousUsernames = {
        "tester001", 
        "tester002"
    };
    v6.id = v5 or "123456";
    v6.name = "tester003";
    v6.displayName = "tester003";
    return v6;
end;
return v2;