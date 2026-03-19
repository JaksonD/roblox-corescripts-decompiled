return {
    sanitizeRichText = function(v0) --[[ Line: 3 ]] --[[ Name: sanitizeRichText ]]
        return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(v0, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), "\"", "&quot;"), "'", "&apos;");
    end, 
    convertTabsToSpaces = function(v1) --[[ Line: 11 ]] --[[ Name: convertTabsToSpaces ]]
        return string.gsub(v1, "\t", "    ");
    end, 
    removeControlChars = function(v2) --[[ Line: 15 ]] --[[ Name: removeControlChars ]]
        return string.gsub(v2, "[\000\001\002\003\004\005\006\a\b\v\f\r\014\015\016\017\018\019\020\021\022\023\024\025\026\027\028\029\030\031]+", "");
    end
};