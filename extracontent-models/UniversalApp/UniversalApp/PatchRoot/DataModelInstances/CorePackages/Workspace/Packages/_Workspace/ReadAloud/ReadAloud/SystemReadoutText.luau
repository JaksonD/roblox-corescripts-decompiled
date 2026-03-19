local v0 = {
    FailedToRead = "Failed to read selected text.", 
    SystemEnabled = "Read aloud is enabled."
};
setmetatable(v0, {
    __index = function(_, v2) --[[ Line: 9 ]] --[[ Name: __index ]]
        error(string.format("%q is not a valid system text key", (tostring(v2))), 2);
    end
});
return v0;