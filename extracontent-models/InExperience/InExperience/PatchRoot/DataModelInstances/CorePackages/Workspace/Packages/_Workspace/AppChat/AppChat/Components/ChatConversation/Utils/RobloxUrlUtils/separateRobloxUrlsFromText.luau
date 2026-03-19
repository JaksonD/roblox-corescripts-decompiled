local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.Parent.Parent.Utils.addMessage);
local v3 = require(script.Parent.RobloxUrlMap);
local v4 = require(script.Parent.Constants);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatFullPlaintextBeforeGameCards);
local v6 = require(l_Parent_0.UrlMatching);
local v7 = require(l_Parent_0.Cryo);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_UrlProcessor_0 = v6.UrlProcessor;
local l_Constants_0 = v6.Constants;
local l_Regex_0 = v6.Regex;
local v12 = l_Regex_0.DASH .. v4.LOCALE_COUNTRY_PATTERN;
local v13 = l_Regex_0.zeroOrOneOf(l_Regex_0.SLASH .. v4.LOCALE_LANGUAGE_PATTERN .. l_Regex_0.zeroOrOneOf(v12));
local v15 = v7.List.map(v4.ROBLOX_DOMAIN_PATTERNS, function(v14) --[[ Line: 21 ]]
    -- upvalues: v13 (copy)
    return v14 .. v13;
end);
local v16 = l_UrlProcessor_0.new({
    domainsPatterns = v15, 
    protocolStrict = false, 
    subdomainPatterns = {
        l_Constants_0.ANY_DOMAIN_NAME
    }, 
    subdomainStrict = false, 
    trimPunctuation = true
}, v3);
return function(v17) --[[ Line: 32 ]]
    -- upvalues: v16 (copy), v5 (copy), v2 (copy), l_Text_0 (copy)
    local v18 = {};
    local v19 = v16:process(v17);
    if v5 then
        v18 = v2(v18, v17);
        for _, v21 in v19 do
            table.insert(v18, v21.result);
        end;
        return v18;
    elseif v19 == nil or #v19 == 0 then
        return v2(v18, v17);
    else
        local v22 = 1;
        for _, v24 in v19 do
            v18 = v2(v18, l_Text_0.Trim(v17:sub(v22, v24.startIndex - 1)));
            table.insert(v18, v24.result);
            v22 = v24.endIndex + 1;
        end;
        return v2(v18, l_Text_0.Trim(v17:sub(v22)));
    end;
end;