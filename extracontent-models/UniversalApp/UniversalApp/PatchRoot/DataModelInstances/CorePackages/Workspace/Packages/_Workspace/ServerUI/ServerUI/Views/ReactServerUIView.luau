local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerUI");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_script_FirstAncestor_0.Components.UIConfiguration);
local _ = require(l_script_FirstAncestor_0.Types);
local l_useState_0 = v2.useState;
local v8 = require(l_script_FirstAncestor_0.Constants);
local v9 = require(l_script_FirstAncestor_0.Navigation.Hooks.useNavigator);
local v10 = {
    maxRetryCount = game:DefineFastInt("ReactServerUIViewHttpRetryCount", 1), 
    enableLogging = false
};
local v31 = v2.forwardRef(function(v11, v12) --[[ Line: 43 ]]
    -- upvalues: v8 (copy), v9 (copy), v2 (copy), v3 (copy)
    local v13 = v11.defaultTemplateName or v8.DEFAULT_TEMPLATE_NAME;
    local l_uiDefinition_0 = v11.uiDefinition;
    local v15 = v9();
    local v16 = v15.currentRoute and v15.currentRoute.templateName or v13;
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: l_uiDefinition_0 (copy), v16 (copy), v15 (copy)
        if l_uiDefinition_0 then
            local v17 = l_uiDefinition_0.templates[v16];
            v15.reset(v17.children, {}, v17.name);
        end;
    end, {
        l_uiDefinition_0
    });
    local function v20(v18) --[[ Line: 57 ]]
        -- upvalues: v11 (copy), v3 (ref), v15 (copy), v2 (ref)
        local l_props_0 = v18.props;
        if v11.mapComponentPropsFromState then
            l_props_0 = v3.Dictionary.join(l_props_0, v11.mapComponentPropsFromState(v18));
        end;
        if v15.currentRoute and v15.currentRoute.params and #v3.Dictionary.keys(v15.currentRoute.params) > 0 then
            l_props_0 = v3.Dictionary.join(l_props_0, {
                params = v15.currentRoute.params
            });
        end;
        return v2.createElement(v18.component, l_props_0, v18.children);
    end;
    local function v28(v21, v22) --[[ Line: 77 ]]
        -- upvalues: v15 (copy), v20 (copy), v3 (ref), v12 (copy), v2 (ref)
        local v23 = {};
        if v15.currentRoute and v15.currentRoute.componentRefs then
            for _, v25 in ipairs(v15.currentRoute.componentRefs) do
                local v26 = v22.components[v25];
                if v26 then
                    local v27 = v20(v26);
                    if v27 then
                        v23[v26.name] = v27;
                    end;
                end;
            end;
        end;
        v21.props = v3.Dictionary.join({
            ref = v12
        }, v21.props or {});
        return v2.createElement(v21.component, v21.props, v23);
    end;
    local v29 = v15.currentRoute and v15.currentRoute.templateName or v13;
    local v30 = l_uiDefinition_0 and l_uiDefinition_0.templates[v29];
    return v30 and v28(v30, l_uiDefinition_0) or nil;
end);
return (v2.forwardRef(function(v32, v33) --[[ Line: 105 ]]
    -- upvalues: v10 (copy), l_useDispatch_0 (copy), l_useState_0 (copy), v2 (copy), v5 (copy), v8 (copy), v31 (copy)
    local v34 = v32.uiConfigurationConfig or v10;
    local v35 = l_useDispatch_0();
    local v36, v37 = l_useState_0(nil);
    v2.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: v5 (ref), v34 (copy), v35 (copy), v32 (copy), v37 (copy), v8 (ref)
        local v38 = v5.new(v34);
        v35(v38:fetch(v32.url, v32.queryArgs)):andThen(function(v39) --[[ Line: 115 ]]
            -- upvalues: v32 (ref), v37 (ref), v8 (ref)
            local l_responseBody_0 = v39.responseBody;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 118 ]]
                -- upvalues: v32 (ref), l_responseBody_0 (copy)
                return v32.transform(l_responseBody_0);
            end);
            if l_status_0 and l_result_0 then
                v37(l_result_0);
                return;
            else
                v32.onError({
                    type = v8.CONFIGURATION_VIEW_ERROR.RENDER_TRANSFORM_ERROR
                });
                return;
            end;
        end):catch(function() --[[ Line: 130 ]]
            -- upvalues: v32 (ref), v8 (ref)
            v32.onError({
                type = v8.CONFIGURATION_VIEW_ERROR.NETWORK_FETCH_ERROR
            });
        end);
    end, {});
    return v2.createElement(v31, {
        uiDefinition = v36, 
        defaultTemplateName = v32.defaultTemplateName, 
        mapComponentPropsFromState = v32.mapComponentPropsFromState, 
        ref = v33
    });
end));