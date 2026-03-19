local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v3 = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default");
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: validateBodyPartCollisionFidelity ]]
    -- upvalues: v3 (copy), v1 (copy)
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, 1, v4);
    local l_Default_0 = Enum.CollisionFidelity.Default;
    pcall(function() --[[ Line: 18 ]]
        -- upvalues: l_Default_0 (ref), v3 (ref)
        l_Default_0 = Enum.CollisionFidelity[v3];
    end);
    local v8 = {};
    for _, v10 in l_v4_Descendants_0 do
        if v10:IsA("MeshPart") and v10.CollisionFidelity ~= l_Default_0 then
            table.insert(v8, (("Expected %*.CollisionFidelity to be %*"):format(v10:GetFullName(), l_Default_0.Name)));
        end;
    end;
    if #v8 == 0 then
        return true;
    else
        v1.reportFailure(v1.ErrorType.validateBodyPartCollisionFidelity, nil, v5);
        return false, v8;
    end;
end;