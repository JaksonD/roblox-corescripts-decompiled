local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceSideSheet");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Chrome);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Stores.GetIntegrationsStore);
local l_FFlagAddIGMToSideSheet_0 = v3.FFlagAddIGMToSideSheet;
return function(v6) --[[ Line: 20 ]]
    -- upvalues: v4 (copy), l_FFlagAddIGMToSideSheet_0 (copy)
    local v7 = v4();
    v7.setUnibarIntegrations(v6.unibarIntegrations);
    v7.setVerticalIntegrations(v6.verticalIntegrations);
    if l_FFlagAddIGMToSideSheet_0 then
        v7.setPageIntegrations(v6.pageIntegrations);
    end;
end;