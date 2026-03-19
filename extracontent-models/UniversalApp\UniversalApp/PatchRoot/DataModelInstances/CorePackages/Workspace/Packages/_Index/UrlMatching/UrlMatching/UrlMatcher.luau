local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.matchAllRegex);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.RegExp);
local l_StringTrim_0 = require(l_Parent_0.StringUtilities).StringTrim;
local v5 = require(script.Parent.Regex);
local _ = require(script.Parent.Types);
local v7 = require(script.Parent.Constants);
local v8 = {
    protocolPatterns = {
        "https?"
    }, 
    protocolStrict = false, 
    subdomainPatterns = {
        "www"
    }, 
    subdomainStrict = true, 
    domainsPatterns = {
        v7.ANY_DOMAIN_PATTERN
    }, 
    pathPatterns = nil, 
    trimPunctuation = false
};
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v8 (copy), v5 (copy), v7 (copy), v3 (copy), v9 (copy)
    local v11 = v2.Dictionary.union(v8, v10 or {});
    local v12 = v5.oneOf(v11.protocolPatterns) .. v5.COLON .. v5.SLASH .. v5.SLASH;
    local v13 = v5.oneOf({
        v5.negativeLookbehind(v5.ALPHANUMERIC), 
        v12
    });
    local v14 = v5.negativeLookahead(v12);
    local v15 = v5.oneOf(v11.subdomainPatterns) .. v5.DOT;
    local v16 = v5.oneOf(v11.domainsPatterns);
    local v17 = if v11.pathPatterns ~= nil then v5.oneOf(v11.pathPatterns) else "";
    local v18 = v5.zeroOrMore({
        v5.SLASH .. v5.oneOrMore(v14 .. v7.PATH_CHAR)
    }) .. v5.zeroOrOneOf(v5.SLASH);
    local v19 = v5.zeroOrOneOf(v5.QUESTION .. v5.zeroOrMore(v14 .. v7.QUERY_CHAR));
    local v20 = v5.zeroOrOneOf(v5.HASH .. v5.zeroOrMore(v14 .. v7.FRAGMENT_CHAR));
    local v21 = v5.oneOf({
        v5.lookahead(v12), 
        v5.negativeLookahead(v5.ALPHANUMERIC), 
        v5.STRING_END
    });
    local v22 = v5.capture(if v11.protocolStrict then v12 else v13) .. v5.capture(if v11.subdomainStrict then v5.oneOf(v15) else v5.zeroOrOneOf(v15)) .. v5.capture(v16) .. v5.capture(v5.capture(v17) .. v18) .. v5.capture(v19) .. v5.capture(v20) .. v21;
    local v23 = {
        _urlPattern = v3(v22, "m"), 
        _trimPunctuation = v11.trimPunctuation, 
        match = v9.match
    };
    setmetatable(v23, v9);
    return v23;
end;
v9.default = function() --[[ Line: 108 ]] --[[ Name: default ]]
    -- upvalues: v9 (copy), v8 (copy)
    return v9.new(v8);
end;
v9.match = function(v24, v25) --[[ Line: 119 ]] --[[ Name: match ]]
    -- upvalues: v1 (copy), l_StringTrim_0 (copy)
    local v26 = {};
    local v27 = 0;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 122 ]]
        -- upvalues: v1 (ref), v25 (copy), v24 (copy), v27 (ref), l_StringTrim_0 (ref), v26 (copy)
        for _, v29 in (v1(v25:lower(), v24._urlPattern)) do
            local v30 = v27 + v29.index;
            local v31 = v30 + #v29.matchedText - 1;
            v27 = v31;
            if v24._trimPunctuation and not v29.matchedText:match("%b()$") then
                local v32 = l_StringTrim_0(v29.matchedText, "%?%.%!%,%;%:%(%)", {
                    right = true
                });
                if v32 ~= v29.matchedText then
                    v29 = v1(v32, v24._urlPattern)[1];
                end;
                v31 = v30 + #v32 - 1;
            end;
            local v33, v34, v35, v36, v37, v38, v39 = unpack(v29.capturedGroups);
            local v40 = v25:sub(v30, v31);
            local v41 = #v33 + 1 + #v34 + #v35;
            local v42 = v41 + #v36;
            local v43 = v42 + #v38;
            local v44 = v40:sub(v41, v42 - 1);
            local v45 = v40:sub(v42, v43 - 1);
            local v46 = v40:sub(v43, v43 + #v39 - 1);
            table.insert(v26, {
                startIndex = v30, 
                endIndex = v31, 
                matchedPath = v37, 
                url = {
                    fullText = v40, 
                    protocol = l_StringTrim_0(v33, ":/", {
                        right = true
                    }), 
                    subdomain = l_StringTrim_0(v34, ".", {
                        right = true
                    }), 
                    domain = v35, 
                    path = v44, 
                    query = if v45 ~= "" then l_StringTrim_0(v45, "?", {
                        left = true
                    }) else nil, 
                    fragment = if v46 ~= "" then l_StringTrim_0(v46, "#", {
                        left = true
                    }) else nil
                }
            });
        end;
        return v26;
    end);
    if not l_status_0 then
        warn("UrlMatcher:match failed: " .. tostring(l_result_0));
        return {};
    else
        return l_result_0 or {};
    end;
end;
return v9;