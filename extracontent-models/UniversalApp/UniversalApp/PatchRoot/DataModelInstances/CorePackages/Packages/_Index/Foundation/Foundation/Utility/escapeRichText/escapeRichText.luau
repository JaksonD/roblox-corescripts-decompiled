return function(v0) --[[ Line: 5 ]] --[[ Name: escapeRichText ]]
    return v0:gsub("[&<>\"']", {
        ["&"] = "&amp;", 
        ["<"] = "&lt;", 
        [">"] = "&gt;", 
        ["\""] = "&quot;", 
        ["'"] = "&apos;"
    });
end;