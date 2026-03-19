local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("TimeToInteractiveTracker").Parent;
local l_FFlagAXTTIEnableMilestones_0 = require(l_Parent_0.SharedFlags).FFlagAXTTIEnableMilestones;
local _ = require(script.Parent.Parent.Stores.types);
local v4 = game:DefineFastFlag("DebugTimeToInteractiveTracker", false);
local function _(v5) --[[ Line: 15 ]] --[[ Name: formatPayload ]]
    -- upvalues: l_HttpService_0 (copy)
    if v5 == nil then
        return "";
    elseif type(v5) ~= "table" then
        return (tostring(v5));
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
            -- upvalues: l_HttpService_0 (ref), v5 (copy)
            return l_HttpService_0:JSONEncode(v5);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return (tostring(v5));
        end;
    end;
end;
local function v17(v9) --[[ Line: 34 ]] --[[ Name: formatMilestones ]]
    if not v9 or #v9 == 0 then
        return "";
    else
        local v10 = {};
        for _, v12 in v9 do
            table.insert(v10, ("  %s %.0fms"):format(v12.name, v12.deltaMs));
            if v12.subphases then
                for _, v14 in v12.subphases do
                    table.insert(v10, ("    -> %s %.0fms"):format(v14.name, v14.deltaMs or 0));
                end;
            end;
            if v12.requests then
                for _, v16 in v12.requests do
                    table.insert(v10, ("    -> [req] %s %.0fms"):format(v16.name, v16.deltaMs or 0));
                end;
            end;
        end;
        return "\n" .. table.concat(v10, "\n");
    end;
end;
return function(v18, v19, v20, v21, v22) --[[ Line: 59 ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_FFlagAXTTIEnableMilestones_0 (copy), v17 (copy)
    if not v4 then
        return;
    else
        local v23 = ("[TimeToInteractiveTracker][%s]"):format(v18);
        local v24;
        if v21 == nil then
            v24 = "";
        elseif type(v21) ~= "table" then
            v24 = tostring(v21);
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 24 ]]
                -- upvalues: l_HttpService_0 (ref), v21 (copy)
                return l_HttpService_0:JSONEncode(v21);
            end);
            v24 = if l_status_1 then l_result_1 else tostring(v21);
        end;
        local v27 = {
            v23, 
            v19
        };
        if v20 ~= nil then
            table.insert(v27, ("%.0fms"):format(v20));
        end;
        if v24 ~= "" then
            table.insert(v27, v24);
        end;
        if l_FFlagAXTTIEnableMilestones_0 then
            local v28 = v17(v22);
            if v28 ~= "" then
                table.insert(v27, v28);
            end;
        end;
        print(table.unpack(v27));
        return;
    end;
end;