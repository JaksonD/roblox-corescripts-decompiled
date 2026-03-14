local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
return require(l_Parent_0.Dash).memoize(function(v1) --[[ Line: 6 ]] --[[ Name: isBuilderIcon ]]
    local v2 = false;
    if v1 ~= nil then
        v2 = false;
        if v1 ~= "" then
            v2 = v1:find("[^%l%d%-]") == nil;
        end;
    end;
    return v2;
end);