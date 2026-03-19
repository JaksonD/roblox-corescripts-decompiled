local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationCombineEntrypointResults);
local v4 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v6, v7) --[[ Line: 10 ]] --[[ Name: validateTags ]]
    -- upvalues: l_CollectionService_0 (copy), v4 (copy), v2 (copy), v3 (copy)
    local l_v6_Descendants_0 = v6:GetDescendants();
    table.insert(l_v6_Descendants_0, v6);
    local v9 = {};
    for _, v11 in ipairs(l_v6_Descendants_0) do
        if #l_CollectionService_0:GetTags(v11) > 0 then
            table.insert(v9, v11);
        end;
    end;
    if #v9 > 0 then
        local v12 = {
            "Found the following instance tags which are not allowed:"
        };
        for _, v14 in ipairs(v9) do
            table.insert(v12, v14:GetFullName());
        end;
        v4.reportFailure(v4.ErrorType.validateTags, nil, v7);
        if v2() and v3() then
            return false, {};
        else
            return false, v12;
        end;
    else
        return true;
    end;
end;