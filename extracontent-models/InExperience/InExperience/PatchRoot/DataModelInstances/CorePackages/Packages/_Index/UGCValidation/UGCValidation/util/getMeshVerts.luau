local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
return function(v4, v5) --[[ Line: 12 ]] --[[ Name: getVerts ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy)
    local l_isServer_0 = v5.isServer;
    local v7, v8 = v3(function() --[[ Line: 18 ]]
        -- upvalues: l_UGCValidationService_0 (ref), v4 (copy)
        return l_UGCValidationService_0:GetEditableMeshVerts(v4.editableMesh);
    end, v5);
    if not v7 then
        local v9 = "Failed to read mesh: " .. v4.fullName;
        if l_isServer_0 then
            error(v9);
        end;
        return false, {
            v9
        };
    else
        return true, nil, v8;
    end;
end;