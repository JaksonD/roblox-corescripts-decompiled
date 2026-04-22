local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Chrome);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SharedFlags);
local _ = require(l_Parent_0.Signals);
local v7 = require(l_Parent_0.SignalsReact);
local l_View_0 = v3.View;
local v9 = require(l_script_FirstAncestor_0.Stores.GetIntegrationsStore);
local v10 = require(l_script_FirstAncestor_0.Components.VerticalItem);
local l_FFlagAddIGMToSideSheet_0 = v5.FFlagAddIGMToSideSheet;
local function v13(v12) --[[ Line: 25 ]] --[[ Name: getVerticalIntegrations ]]
    -- upvalues: l_FFlagAddIGMToSideSheet_0 (copy), v9 (copy)
    if not l_FFlagAddIGMToSideSheet_0 then
        return v9(v12).getVerticalIntegrations(v12);
    else
        return {};
    end;
end;
return v4.memo(function(v14) --[[ Line: 33 ]] --[[ Name: VerticalList ]]
    -- upvalues: l_FFlagAddIGMToSideSheet_0 (copy), v13 (copy), v7 (copy), v4 (copy), v10 (copy), l_View_0 (copy)
    local v15 = if l_FFlagAddIGMToSideSheet_0 then v14.integrationsGetter else v13;
    local v16 = v7.useSignalState(v15);
    local v17 = {};
    for v18, v19 in v16 do
        v17[v19.id] = v4.createElement(v10, {
            label = v19.integration.label, 
            layoutOrder = v18, 
            onActivated = v19.activated, 
            icon = v19.component
        });
    end;
    return v4.createElement(l_View_0, {
        tag = "col size-full-0 auto-y padding-y-xsmall padding-right-xlarge", 
        LayoutOrder = v14.layoutOrder
    }, v17);
end);