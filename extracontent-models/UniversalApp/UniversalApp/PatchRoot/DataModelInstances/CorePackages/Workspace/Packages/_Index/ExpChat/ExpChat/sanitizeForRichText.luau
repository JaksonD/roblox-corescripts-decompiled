return function(v0) --[[ Line: 1 ]]
    return (string.gsub(v0, "%p", {
        ["<"] = "&lt;", 
        [">"] = "&gt;", 
        ["&"] = "&amp;"
    }));
end;