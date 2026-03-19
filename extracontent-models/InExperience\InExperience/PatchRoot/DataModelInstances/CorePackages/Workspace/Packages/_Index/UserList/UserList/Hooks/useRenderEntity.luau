local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_View_0 = require(l_Parent_0.Foundation).View;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_EntityRow_0 = require(l_script_FirstAncestor_0.Components.UserRow).EntityRow;
return function(v6) --[[ Line: 37 ]] --[[ Name: useRenderEntity ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_EntityRow_0 (copy)
    local l_onActivated_0 = v6.onActivated;
    local l_renderRow_0 = v6.renderRow;
    local l_entitiesMap_0 = v6.entitiesMap;
    local l_configs_0 = v6.configs;
    local l_layoutMode_0 = v6.layoutMode;
    return (v2.useCallback(function(v12, v13, v14) --[[ Line: 45 ]]
        -- upvalues: l_entitiesMap_0 (copy), l_renderRow_0 (copy), l_onActivated_0 (copy), v2 (ref), l_View_0 (ref), l_EntityRow_0 (ref), l_configs_0 (copy), l_layoutMode_0 (copy)
        local v15 = l_entitiesMap_0[v12];
        if not v15 then
            return nil;
        elseif l_renderRow_0 then
            return (l_renderRow_0(function(v16) --[[ Line: 53 ]]
                -- upvalues: v15 (copy), v13 (copy), l_onActivated_0 (ref), v2 (ref), l_View_0 (ref), v14 (copy), l_EntityRow_0 (ref), l_configs_0 (ref), l_layoutMode_0 (ref)
                local v17 = v16.onRowActivated and function() --[[ Line: 56 ]]
                    -- upvalues: v16 (copy), v15 (ref), v13 (ref)
                    v16.onRowActivated(v15.id, v15.type, v13);
                end or l_onActivated_0;
                return v2.createElement(l_View_0, {
                    tag = "size-full-full", 
                    Size = v14, 
                    LayoutOrder = v13
                }, {
                    v2.createElement(l_EntityRow_0, {
                        entity = v15, 
                        onActivated = v17, 
                        primaryCta = v16.primaryCta, 
                        secondaryCta = v16.secondaryCta, 
                        contextualInfo = v16.contextualInfo, 
                        loadingState = v16.loadingState, 
                        presence = v16.presence, 
                        trailingContent = v16.trailingContent, 
                        configs = l_configs_0, 
                        layoutMode = l_layoutMode_0
                    })
                });
            end, v15, v13));
        else
            return (v2.createElement(l_View_0, {
                tag = "size-full-full", 
                Size = v14, 
                LayoutOrder = v13
            }, {
                v2.createElement(l_EntityRow_0, {
                    entity = v15, 
                    onActivated = l_onActivated_0, 
                    configs = l_configs_0, 
                    layoutMode = l_layoutMode_0
                })
            }));
        end;
    end, {
        l_onActivated_0, 
        l_renderRow_0, 
        l_entitiesMap_0, 
        l_configs_0, 
        l_layoutMode_0
    }));
end;