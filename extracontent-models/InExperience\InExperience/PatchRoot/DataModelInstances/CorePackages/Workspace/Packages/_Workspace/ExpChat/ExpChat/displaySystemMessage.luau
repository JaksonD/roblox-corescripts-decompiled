local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v2 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/" .. script.Name);
local v3 = require(script.Parent.sanitizeForRichText);
return function(v4, v5, v6, v7, v8, v9) --[[ Line: 9 ]] --[[ Name: displaySystemMessage ]]
    -- upvalues: v2 (copy), l_List_0 (copy), v3 (copy)
    v2:debug("Display system message: {}", v6);
    local v10 = nil;
    if type(v4) == "string" then
        if v4 ~= "" then
            local v11 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 23 ]]
                -- upvalues: v7 (copy), v4 (copy), v5 (copy)
                return v7:FormatByKey(v4, v5);
            end);
            v11 = l_status_0;
            v10 = l_result_0;
            if not v11 then
                v10 = v9;
            end;
        end;
    else
        v10 = table.concat(l_List_0.map(v4, function(v14) --[[ Line: 34 ]]
            -- upvalues: v7 (copy), v5 (copy)
            return v7:FormatByKey(v14, v5);
        end), "\n");
    end;
    if v8 and v10 then
        v8:DisplaySystemMessage(v3(v10), v6);
    end;
end;