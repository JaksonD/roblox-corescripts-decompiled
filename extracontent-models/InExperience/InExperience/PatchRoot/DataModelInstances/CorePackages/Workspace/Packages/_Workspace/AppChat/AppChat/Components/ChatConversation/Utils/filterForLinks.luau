local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v5 = require(script.Parent.formatMessages);
local v6 = require(script.Parent.RobloxUrlUtils.separateRobloxUrlsFromText);
return function(v7, v8) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), v5 (copy), v6 (copy)
    v3.isType(v7, "table", "filterForLinks.text");
    v3.isType(v8, "table", "filterForLinks.whitelistedDomains");
    if v7.messageType == v4.System then
        return {
            v7
        };
    elseif v7.messageType == v4.Link and (not v7.gameLink or not v7.gameLink.universeId) then
        return {
            v2.Dictionary.join(v7, {
                messageType = v2.None
            })
        };
    elseif not v7.content or v7.moderated or not v7.content:lower():match("%/games[^%d]*(%d+)/?") and not v7.content:match("%/share%?.*code=([%w%-]+)") then
        return {
            v7
        };
    else
        return v5(v6(v7.content), v7);
    end;
end;