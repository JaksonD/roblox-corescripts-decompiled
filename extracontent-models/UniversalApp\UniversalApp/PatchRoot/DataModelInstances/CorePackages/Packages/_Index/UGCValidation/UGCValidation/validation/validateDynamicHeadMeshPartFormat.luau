local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.validation.validateSingleInstance);
local v2 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v3 = require(l_Parent_0.validation.validateDynamicHeadData);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
return function(v6) --[[ Line: 10 ]] --[[ Name: validateDynamicHeadMeshPartFormat ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v3 (copy)
    assert(v6.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat");
    local l_instances_0 = v6.instances;
    local v8, v9 = v1(l_instances_0, v6);
    if not v8 then
        return v8, v9;
    else
        local v10 = l_instances_0[1];
        local v11, v12 = v2(v10, v5(v6), v6);
        v8 = v11;
        v9 = v12;
        if not v8 then
            return false, v9;
        else
            return v3(v10, v6);
        end;
    end;
end;