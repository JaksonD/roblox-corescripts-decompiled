return (setmetatable({
    __NULL_IDENTIFIER__ = "__GRAPHQL_NULL_OBJECT__"
}, {
    __newindex = function(_, v1, _) --[[ Line: 7 ]] --[[ Name: __newindex ]]
        local v3 = ("%q (%s) is not a valid member of %s"):format(tostring(v1), typeof(v1), "null");
        error(v3, 2);
    end, 
    __metatable = false, 
    __tostring = function() --[[ Line: 17 ]] --[[ Name: __tostring ]]
        return "null";
    end
}));