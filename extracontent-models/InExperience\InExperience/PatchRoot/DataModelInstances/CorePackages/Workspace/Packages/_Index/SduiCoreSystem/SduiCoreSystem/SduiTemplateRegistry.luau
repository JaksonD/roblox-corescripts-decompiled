local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local v5 = require(l_script_FirstAncestor_0.SduiConfigTypes);
local v6 = require(l_script_FirstAncestor_0.SduiErrors);
local v7 = require(l_script_FirstAncestor_0.validateInterface);
local l_SduiTemplateInterface_0 = v5.SduiTemplateInterface;
local v9 = {};
local _ = function(v10, v11) --[[ Line: 22 ]] --[[ Name: deepJoinArrays ]]
    -- upvalues: v3 (copy)
    v11 = v11 or {};
    for _, v13 in (v3.deepCopy(v10)) do
        table.insert(v11, v13);
    end;
    return v11;
end;
local function v15(v16, v17) --[[ Line: 32 ]] --[[ Name: deepJoin ]]
    -- upvalues: v9 (copy), v3 (copy), v15 (copy)
    if not v16 then
        return v17;
    else
        v17 = v17 or v9;
        local v18 = v3.deepCopy(v16);
        for v19, v20 in v17 do
            if typeof(v20) == "table" then
                v18[v19] = v15(v18[v19], v20);
            else
                v18[v19] = v20;
            end;
        end;
        return v18;
    end;
end;
local v21 = {};
v21.__index = v21;
v21.new = function(v22) --[[ Line: 56 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy)
    local v23 = {
        _registeredTemplates = v22 or {}
    };
    setmetatable(v23, v21);
    return v23;
end;
v21.getTemplate = function(v24, v25) --[[ Line: 65 ]] --[[ Name: getTemplate ]]
    return v24._registeredTemplates[v25];
end;
v21.shouldResolveTemplate = function(_, v27) --[[ Line: 69 ]] --[[ Name: shouldResolveTemplate ]]
    local v28 = false;
    if v27.templateKey ~= nil then
        v28 = v27.templateKey ~= "NONE";
    end;
    return v28;
end;
v21.resolveTemplateForConfig = function(v29, v30, v31, v32) --[[ Line: 76 ]] --[[ Name: resolveTemplateForConfig ]]
    -- upvalues: v6 (copy), v7 (copy), l_SduiTemplateInterface_0 (copy), v21 (copy), v2 (copy), v9 (copy), v15 (copy), v3 (copy)
    local l_templateKey_0 = v30.templateKey;
    if not l_templateKey_0 or l_templateKey_0 == "NONE" then
        return true;
    else
        assert(l_templateKey_0, "templateKey must exist");
        v32 = v32 or {};
        assert(v32, "seen exists");
        if v32[v30] then
            v31.dependencies.logger.reportError(v6.SduiErrorType.DetectedCycleInTemplates, {
                componentType = v30.componentType, 
                value = l_templateKey_0, 
                message = ("Found cycle in template with key %*"):format(l_templateKey_0)
            }, v31.appPage);
            v30.templateKey = "NONE";
            return false;
        else
            v32[v30] = true;
            local v34 = v29._registeredTemplates[l_templateKey_0];
            if v34 == nil then
                v31.dependencies.logger.reportError(v6.SduiErrorType.FailedToFindTemplate, {
                    componentType = v30.componentType, 
                    value = l_templateKey_0, 
                    message = ("Failed to find template for key %*"):format(l_templateKey_0)
                }, v31.appPage);
                v30.templateKey = "NONE";
                return false;
            else
                assert(v34, "template exists");
                local v35, v36 = v7(v34, l_SduiTemplateInterface_0, false);
                if not v35 then
                    v31.dependencies.logger.reportError(v6.SduiErrorType.InvalidComponentConfig, {
                        message = ("Invalid Template for templateKey %*. err: %*"):format(l_templateKey_0, v36), 
                        componentType = v30.componentType or v34.componentType, 
                        name = l_templateKey_0
                    }, v31.appPage);
                end;
                v21.resolveTemplateForConfig(v29, v34, v31, v32);
                v30.templateKey = "NONE";
                if not v30.componentType then
                    v30.componentType = v34.componentType;
                elseif v30.componentType and v34.componentType and v30.componentType ~= v34.componentType then
                    v31.dependencies.logger.reportError(v6.SduiErrorType.ComponentTypeMismatchWithTemplate, {
                        componentType = v30.componentType, 
                        value = l_templateKey_0, 
                        message = ("Mismatch in componentType for template %*. Component %* and template %*"):format(l_templateKey_0, v30.componentType, v34.componentType)
                    }, v31.appPage);
                    return false;
                end;
                if v34.analyticsData then
                    v30.analyticsData = v2.Dictionary.join(v34.analyticsData, v30.analyticsData or v9);
                end;
                if v34.props then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 154 ]]
                        -- upvalues: v15 (ref), v34 (copy), v30 (copy)
                        return (v15(v34.props, v30.props));
                    end);
                    if not l_status_0 then
                        v31.dependencies.logger.reportError(v6.SduiErrorType.FailedToJoinTemplateProps, {
                            componentType = v30.componentType, 
                            value = l_templateKey_0, 
                            message = l_result_0
                        }, v31.appPage);
                    else
                        v30.props = l_result_0;
                    end;
                end;
                if v34.children then
                    local l_children_0 = v34.children;
                    local v40 = v30.children or {};
                    for _, v42 in (v3.deepCopy(l_children_0)) do
                        table.insert(v40, v42);
                    end;
                    v30.children = v40;
                end;
                if v34.conditionalProps then
                    local l_conditionalProps_0 = v34.conditionalProps;
                    local v44 = v30.conditionalProps or {};
                    for _, v46 in (v3.deepCopy(l_conditionalProps_0)) do
                        table.insert(v44, v46);
                    end;
                    v30.conditionalProps = v44;
                end;
                return true;
            end;
        end;
    end;
end;
return v21;