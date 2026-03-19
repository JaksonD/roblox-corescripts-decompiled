local function _(v0, v1) --[[ Line: 29 ]] --[[ Name: group ]]
    return "(" .. v1 .. (if type(v0) == "string" then v0 else table.concat(v0, "|")) .. ")";
end;
return {
    oneOf = function(v3) --[[ Line: 33 ]] --[[ Name: oneOf ]]
        return "(" .. "?:" .. (if type(v3) == "string" then v3 else table.concat(v3, "|")) .. ")";
    end, 
    capture = function(v4) --[[ Line: 37 ]] --[[ Name: capture ]]
        return "(" .. "" .. (if type(v4) == "string" then v4 else table.concat(v4, "|")) .. ")";
    end, 
    zeroOrOneOf = function(v5) --[[ Line: 41 ]] --[[ Name: zeroOrOneOf ]]
        return ("(" .. "?:" .. (if type(v5) == "string" then v5 else table.concat(v5, "|")) .. ")") .. "?";
    end, 
    zeroOrMore = function(v6) --[[ Line: 65 ]] --[[ Name: zeroOrMore ]]
        return ("(" .. "?:" .. (if type(v6) == "string" then v6 else table.concat(v6, "|")) .. ")") .. "*";
    end, 
    oneOrMore = function(v7) --[[ Line: 61 ]] --[[ Name: oneOrMore ]]
        return ("(" .. "?:" .. (if type(v7) == "string" then v7 else table.concat(v7, "|")) .. ")") .. "+";
    end, 
    lookahead = function(v8) --[[ Line: 45 ]] --[[ Name: lookahead ]]
        return "(" .. "?=" .. (if type(v8) == "string" then v8 else table.concat(v8, "|")) .. ")";
    end, 
    lookbehind = function(v9) --[[ Line: 53 ]] --[[ Name: lookbehind ]]
        return "(" .. "?<=" .. (if type(v9) == "string" then v9 else table.concat(v9, "|")) .. ")";
    end, 
    negativeLookahead = function(v10) --[[ Line: 49 ]] --[[ Name: negativeLookahead ]]
        return "(" .. "?!" .. (if type(v10) == "string" then v10 else table.concat(v10, "|")) .. ")";
    end, 
    negativeLookbehind = function(v11) --[[ Line: 57 ]] --[[ Name: negativeLookbehind ]]
        return "(" .. "?<!" .. (if type(v11) == "string" then v11 else table.concat(v11, "|")) .. ")";
    end, 
    matchWhole = function(v12) --[[ Line: 69 ]] --[[ Name: matchWhole ]]
        return "^" .. v12 .. "$";
    end, 
    regexOr = function(v13, v14) --[[ Line: 73 ]] --[[ Name: regexOr ]]
        return v13 .. "|" .. v14;
    end, 
    set = function(v15) --[[ Line: 77 ]] --[[ Name: set ]]
        return "[" .. v15 .. "]";
    end, 
    notSet = function(v16) --[[ Line: 81 ]] --[[ Name: notSet ]]
        return "[" .. "^" .. v16 .. "]";
    end, 
    SLASH = "\\/", 
    QUESTION = "\\?", 
    DASH = "\\-", 
    DOT = "\\.", 
    HASH = "\\#", 
    COLON = "\\:", 
    STRING_START = "^", 
    STRING_END = "$", 
    NON_WHITESPACE = "\\S", 
    WHITESPACE = "\\s", 
    ALPHANUMERIC = "\\w"
};