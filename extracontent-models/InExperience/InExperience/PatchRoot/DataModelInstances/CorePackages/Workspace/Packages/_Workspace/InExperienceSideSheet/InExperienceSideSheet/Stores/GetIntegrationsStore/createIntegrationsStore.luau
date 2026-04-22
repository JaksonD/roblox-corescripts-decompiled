local l_Parent_0 = script:FindFirstAncestor("InExperienceSideSheet").Parent;
local _ = require(l_Parent_0.Chrome);
local v2 = require(l_Parent_0.SharedFlags);
local v3 = require(l_Parent_0.Signals);
local l_FFlagAddIGMToSideSheet_0 = v2.FFlagAddIGMToSideSheet;
return function() --[[ Line: 22 ]] --[[ Name: createIntegrationsStore ]]
    -- upvalues: v3 (copy), l_FFlagAddIGMToSideSheet_0 (copy)
    local v5, v6 = v3.createSignal({});
    local v7, v8 = v3.createSignal({});
    local v9 = nil;
    local v10 = nil;
    if l_FFlagAddIGMToSideSheet_0 then
        local v11, v12 = v3.createSignal({});
        v9 = v11;
        v10 = v12;
    end;
    return {
        getUnibarIntegrations = v5, 
        setUnibarIntegrations = v6, 
        getVerticalIntegrations = v7, 
        setVerticalIntegrations = v8, 
        getPageIntegrations = if l_FFlagAddIGMToSideSheet_0 then v9 else nil, 
        setPageIntegrations = if l_FFlagAddIGMToSideSheet_0 then v10 else nil
    };
end;