local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: validateSingleInstance ]]
    -- upvalues: v1 (copy)
    local l_assetTypeEnum_0 = v4.assetTypeEnum;
    if #v3 == 0 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_ZeroInstances, nil, v4);
        return false, {
            string.format("Failed to find an instance of the asset type '%s'. Make sure one exists and try again.", l_assetTypeEnum_0.Name)
        };
    elseif #v3 > 1 then
        v1.reportFailure(v1.ErrorType.validateSingleInstance_MultipleInstances, nil, v4);
        return false, {
            string.format("Selected more than one instance of type '%s'. Please, select a single instance of this type and try again.", l_assetTypeEnum_0.Name)
        };
    else
        return true;
    end;
end;