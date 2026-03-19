local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatRemoveUserProfileTitles);
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Conversation.getConversationDisplayTitle;
return function(v5, v6, v7) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), l_getConversationDisplayTitle_0 (copy)
    if v3 then
        if v5 then
            local v8 = v5.title or v5.titleForViewer;
            if v8 then
                return (string.gsub(tostring(v8), "\n", ""));
            end;
        end;
        return "";
    elseif v5 and v5.isDefaultTitle then
        if not v6 then
            return "";
        elseif v2.isEmpty(v6) then
            return v7;
        else
            local v11 = v2.List.sort(v6, function(v9, v10) --[[ Line: 38 ]]
                return string.lower(v9.names.combinedName) < string.lower(v10.names.combinedName);
            end);
            local v13 = v2.List.map(v11, function(v12) --[[ Line: 42 ]]
                return v12.names.combinedName;
            end);
            return table.concat(v13, ", ");
        end;
    else
        return l_getConversationDisplayTitle_0(v5);
    end;
end;