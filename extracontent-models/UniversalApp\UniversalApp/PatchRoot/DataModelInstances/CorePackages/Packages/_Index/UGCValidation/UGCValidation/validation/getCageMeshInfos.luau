local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.util.getEditableMeshFromContext);
local v4 = {
    "InnerCage", 
    "OuterCage"
};
local v5 = {
    "ReferenceMeshId", 
    "CageMeshId"
};
local v6 = {
    v2.ErrorType.validateLayeredClothingAccessory_NoInnerCageId, 
    v2.ErrorType.validateLayeredClothingAccessory_NoOuterCageId
};
return function(v7, v8) --[[ Line: 17 ]] --[[ Name: getCageMeshInfos ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v6 (copy), v3 (copy)
    local l_WrapLayer_0 = v7:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer");
    local v10 = {};
    local v11 = {};
    if not l_WrapLayer_0 then
        return false, {
            "Missing wraplayer"
        }, nil;
    else
        local v12 = {
            l_WrapLayer_0.ReferenceMeshId, 
            l_WrapLayer_0.CageMeshId
        };
        for v13, v14 in v5 do
            local v15 = {
                fullName = string.format("%s %s", l_WrapLayer_0:GetFullName(), v4[v13]), 
                fieldName = v14, 
                contentId = v12[v13], 
                context = v7.Name
            };
            if not (v15.contentId ~= "" and v15.contentId ~= nil or v8.allowEditableInstances) then
                v2.reportFailure(v6[v13], nil, v8);
                table.insert(v11, string.format("Missing %s (i.e. invalid %s) on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v4[v13], v14, v7.Name));
            else
                local v16, v17 = v3(l_WrapLayer_0, v14, v8);
                if not v16 then
                    table.insert(v11, string.format("Failed to %s for layered clothing accessory '%s'. Make sure mesh exists and try again.", v4[v13], v7.Name));
                else
                    v15.editableMesh = v17;
                    table.insert(v10, v15);
                end;
            end;
        end;
        if #v11 > 0 then
            return false, v11, nil;
        else
            return true, nil, v10;
        end;
    end;
end;