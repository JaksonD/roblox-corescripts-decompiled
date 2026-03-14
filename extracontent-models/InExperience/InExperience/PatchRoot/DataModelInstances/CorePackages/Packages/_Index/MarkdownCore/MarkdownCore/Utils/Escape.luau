return {
    escapeRichFormatting = function(v0) --[[ Line: 2 ]] --[[ Name: escapeRichFormatting ]]
        return (v0:gsub("[&<>\"']", {
            ["&"] = "&amp;", 
            ["<"] = "&lt;", 
            [">"] = "&gt;", 
            ["\""] = "&quot;", 
            ["'"] = "&apos;"
        }):gsub("&amp;%l+;", {
            ["&amp;lt;"] = "&lt;", 
            ["&amp;gt;"] = "&gt;", 
            ["&amp;quot;"] = "&quot;", 
            ["&amp;apos;"] = "&apos;", 
            ["&amp;amp;"] = "&amp;"
        }));
    end, 
    unescapeRichFormatting = function(v1) --[[ Line: 22 ]] --[[ Name: unescapeRichFormatting ]]
        return v1:gsub("&%l+;", {
            ["&lt;"] = "<", 
            ["&gt;"] = ">", 
            ["&quot;"] = "\"", 
            ["&apos;"] = "'", 
            ["&amp;"] = "&"
        });
    end
};