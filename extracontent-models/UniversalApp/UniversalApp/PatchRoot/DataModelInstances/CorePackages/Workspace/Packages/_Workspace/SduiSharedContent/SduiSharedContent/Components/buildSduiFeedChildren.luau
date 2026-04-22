local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedContent");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SduiCoreSystem);
local l_findAnalyticsField_0 = v3.findAnalyticsField;
local l_getSduiComponentWrapper_0 = v3.getSduiComponentWrapper;
local l_SduiBuilder_0 = v3.SduiBuilder;
local l_SduiErrors_0 = v3.SduiErrors;
local v8 = require(l_script_FirstAncestor_0.Components.SduiFeedItem);
local v9 = {};
return function(v10) --[[ Line: 31 ]] --[[ Name: buildSduiFeedChildren ]]
    -- upvalues: l_findAnalyticsField_0 (copy), v9 (copy), l_SduiBuilder_0 (copy), l_SduiErrors_0 (copy), l_getSduiComponentWrapper_0 (copy), v2 (copy), v8 (copy)
    local v11 = {};
    local l_sduiContext_0 = v10.sduiContext;
    for v13, v14 in v10.configs do
        local v15 = l_findAnalyticsField_0("componentType", v14.analyticsData or v9) or l_SduiBuilder_0.getComponentType(v14, l_sduiContext_0);
        if not v15 then
            l_sduiContext_0.dependencies.logger.reportError(l_SduiErrors_0.SduiErrorType.NilComponentType, {
                componentType = v10.componentType, 
                name = v10.debugName, 
                message = ("Nil componentType in %* at index %*"):format(v10.componentType, v13)
            }, l_sduiContext_0.appPage);
        else
            local v16 = ("%*%*"):format(v10.componentType, v13);
            local v17 = l_getSduiComponentWrapper_0(v14);
            local v18 = {
                feedItemPosition = v13, 
                itemComponentType = v15, 
                componentType = v15, 
                collectionPosition = v13
            };
            local v19 = v2.createElement(v17, {
                debugName = v16, 
                componentConfig = v14, 
                sduiContext = l_sduiContext_0, 
                localAnalyticsData = v18, 
                extraLocalProps = v10.extraLocalProps
            });
            local v20 = if v14.props and v14.props.layoutOrder ~= nil then v14.props.layoutOrder else v13;
            local v21 = if v14.props and v14.props.zIndex ~= nil then v14.props.zIndex else -v13;
            local v22 = if v10.negateImpressionIndex then -v13 else v13;
            v11[v16] = v2.createElement(v8, {
                layoutOrder = v20, 
                zIndex = v21, 
                index = v22, 
                impressionsTag = v10.impressionsTag, 
                selectionBehaviorLeft = v10.selectionBehaviorLeft, 
                selectionBehaviorRight = v10.selectionBehaviorRight
            }, {
                Item = v19
            });
        end;
    end;
    return v11;
end;