local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getEditableMeshFromContext);
local v3 = require(l_Parent_0.util.getMeshSize);
local v4 = require(l_Parent_0.util.pcallDeferred);
return function(v5, v6, v7) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    if not v6.bypassFlags or not v6.bypassFlags.skipPhysicsDataReset then
        if v7 then
            return v5.MeshSize;
        else
            return v5.Size;
        end;
    else
        if not v6.partSizes then
            v6.partSizes = {};
        end;
        if v6.partSizes[v5] then
            return v6.partSizes[v5];
        else
            local v8 = {
                fullName = v5:GetFullName(), 
                fieldName = "MeshId", 
                contentId = v5.MeshId, 
                context = v5.Name
            };
            local v9, v10 = v2(v5, "MeshId", v6);
            if not v9 then
                if v7 then
                    return v5.MeshSize;
                else
                    return v5.Size;
                end;
            else
                v8.editableMesh = v10;
                if v6.editableMeshes[v5].MeshId.created then
                    if v7 then
                        return v5.MeshSize;
                    else
                        return v5.Size;
                    end;
                else
                    local v11, v12 = v4(function() --[[ Line: 40 ]]
                        -- upvalues: v3 (ref), v8 (copy)
                        return v3(v8);
                    end, v6);
                    if not v11 then
                        if v7 then
                            return v5.MeshSize;
                        else
                            return v5.Size;
                        end;
                    else
                        v6.partSizes[v5] = v12;
                        return v12;
                    end;
                end;
            end;
        end;
    end;
end;