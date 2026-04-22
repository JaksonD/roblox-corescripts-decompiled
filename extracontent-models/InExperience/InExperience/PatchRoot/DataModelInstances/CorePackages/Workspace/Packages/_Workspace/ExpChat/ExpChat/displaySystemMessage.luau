local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v2 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/" .. script.Name);
local v3 = require(script.Parent.sanitizeForRichText);
local l_FFlagEnableSummarySystemMessageOnLua_0 = require(l_Parent_0.SharedFlags).FFlagEnableSummarySystemMessageOnLua;
return function(v5, v6, v7, v8, v9, v10, v11) --[[ Line: 11 ]] --[[ Name: displaySystemMessage ]]
    -- upvalues: v2 (copy), l_List_0 (copy), l_FFlagEnableSummarySystemMessageOnLua_0 (copy), v3 (copy)
    v2:debug("Display system message: {}", v7);
    local v12 = nil;
    if type(v5) == "string" then
        if v5 ~= "" then
            local v13 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                -- upvalues: v8 (copy), v5 (copy), v6 (copy)
                return v8:FormatByKey(v5, v6);
            end);
            v13 = l_status_0;
            v12 = l_result_0;
            if not v13 then
                v12 = v10;
            end;
        end;
    else
        v12 = table.concat(l_List_0.map(v5, function(v16) --[[ Line: 37 ]]
            -- upvalues: v8 (copy), v6 (copy)
            return v8:FormatByKey(v16, v6);
        end), "\n");
    end;
    if v9 and v12 then
        if l_FFlagEnableSummarySystemMessageOnLua_0 then
            v12 = v3(v12);
            if v11 then
                v12 = v11(v12);
            end;
            v9:DisplaySystemMessage(v12, v7);
            return;
        else
            v9:DisplaySystemMessage(v3(v12), v7);
        end;
    end;
end;