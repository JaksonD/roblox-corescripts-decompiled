local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ServerDrivenUi);
local v3 = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.React);
local v5 = require(l_script_FirstAncestor_0.reportModalImpression);
local v6 = require(l_script_FirstAncestor_0.sendModalImpressionEvent);
local v7 = require(l_Parent_0.RoactServiceTags);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppPage_0 = v3.AppPage;
local l_useSduiContext_0 = v2.useSduiContext;
local l_SduiComponent_0 = v2.SduiComponent;
return v4.memo(function(v12) --[[ Line: 22 ]]
    -- upvalues: l_useRoactService_0 (copy), v7 (copy), l_useSduiContext_0 (copy), l_AppPage_0 (copy), v4 (copy), v5 (copy), v6 (copy), l_SduiComponent_0 (copy)
    local v13 = l_useRoactService_0(v7.RoactNetworking);
    local v14 = l_useSduiContext_0({
        appPage = l_AppPage_0.Home, 
        dataUpdatedTimestamp = os.time()
    });
    local l_modalId_0 = v12.modalId;
    local l_modalType_0 = v12.modalType;
    v4.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v5 (ref), v13 (copy), l_modalId_0 (copy), l_modalType_0 (copy), v6 (ref)
        v5(v13, l_modalId_0, l_modalType_0);
        v6(l_modalId_0, l_modalType_0);
    end, {});
    return v4.createElement(l_SduiComponent_0, {
        debugName = "SduiModal", 
        componentConfig = v12.sduiComponentConfig, 
        sduiContext = v14
    });
end);