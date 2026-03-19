local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.validateWithSchema);
local _ = require(l_Parent_0.util.Types);
return function(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: validateInstanceTree ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v8 = v3(v5, v6, v7);
    if v8.success == false then
        v1.reportFailure(v1.ErrorType.validateInstanceTree, nil, v7);
        return false, {
            "Detected the following error(s): " .. v8.message
        };
    else
        local v9 = {};
        if v2.BANNED_NAMES[v6.Name] then
            table.insert(v9, string.format("%s has an invalid name", v6:GetFullName()));
        end;
        for _, v11 in pairs(v6:GetDescendants()) do
            for _, v13 in pairs(v2.BANNED_CLASS_NAMES) do
                if v11:IsA(v13) then
                    table.insert(v9, string.format("%s is of type %s which is not allowed", v11:GetFullName(), v13));
                end;
            end;
            if v2.BANNED_NAMES[v11.Name] then
                table.insert(v9, string.format("%s has an invalid name", v11:GetFullName()));
            end;
        end;
        if #v9 > 0 then
            v1.reportFailure(v1.ErrorType.validateInstanceTree_InvalidDescendants, nil, v7);
            return false, v9;
        else
            return true;
        end;
    end;
end;