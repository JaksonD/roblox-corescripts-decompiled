local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = {
    new = function() --[[ Line: 17 ]] --[[ Name: new ]]
        return {};
    end
};
v2.fromTextSearchEntryJson = function(v3) --[[ Line: 22 ]] --[[ Name: fromTextSearchEntryJson ]]
    -- upvalues: v1 (copy), v2 (copy)
    if type(v3) ~= "table" then
        return v1.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson to be a table");
    elseif type(v3.name) ~= "string" then
        return v1.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson.name to be a string");
    elseif v3.contentType ~= "Text" then
        return v1.error("TextSearchEntry.fromTextSearchEntryJson expects textSearchEntryJson.contentType to be 'Text'");
    else
        local v4 = v2.new();
        v4.text = v3.name;
        return v1.success(v4);
    end;
end;
return v2;