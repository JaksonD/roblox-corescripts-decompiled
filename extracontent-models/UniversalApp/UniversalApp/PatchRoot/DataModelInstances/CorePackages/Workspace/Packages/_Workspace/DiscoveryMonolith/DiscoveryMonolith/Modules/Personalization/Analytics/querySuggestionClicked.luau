local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.t);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v4 = v1.strictInterface({
    sortPos = v1.number, 
    sortId = v1.string, 
    pos = v1.number, 
    queryText = v1.string, 
    componentType = v1.string
});
local v5 = {
    [l_AppPage_0.SearchLandingPage] = v4
};
return function(v6, v7, v8) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), l_mutedError_0 (copy)
    local v9 = v5[v7];
    if v9 then
        local v10, v11 = v9(v8);
        if not v10 then
            l_mutedError_0(v11);
        end;
    else
        l_mutedError_0(string.format("Missing interface for eventContext %s to type check querySuggestionClicked event parameters", v7));
    end;
    v6:sendEventDeferred(v7, "querySuggestionClicked", v8);
end;