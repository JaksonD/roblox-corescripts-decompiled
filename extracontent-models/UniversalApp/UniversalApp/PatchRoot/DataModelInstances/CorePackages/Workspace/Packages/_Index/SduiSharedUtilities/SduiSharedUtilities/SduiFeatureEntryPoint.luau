local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.DataHydration);
local v4 = require(l_Parent_0.SignalsReact);
local l_getSduiComponentWrapper_0 = require(l_Parent_0.SduiCoreSystem).getSduiComponentWrapper;
local v6 = require(l_script_FirstAncestor_0.getSduiApiStore);
local _ = require(l_script_FirstAncestor_0.SduiLoadTimer);
local v8 = require(l_script_FirstAncestor_0.useCreateClientBindingSduiContext);
local l_DataHydrationTypes_0 = v3.DataHydrationTypes;
local v10 = require(l_script_FirstAncestor_0.hooks.useComponentConfig);
local v11 = require(l_script_FirstAncestor_0.hooks.useComponentLifecycleTiming);
local v12 = require(l_script_FirstAncestor_0.hooks.useLocalAnalyticsData);
local v13 = require(l_script_FirstAncestor_0.hooks.useStatefulRef);
local v14 = require(l_script_FirstAncestor_0.ui.SduiFeatureEntryPointUi);
local function _(v15) --[[ Line: 22 ]] --[[ Name: useUiStatus ]]
    -- upvalues: v4 (copy), v6 (copy), l_DataHydrationTypes_0 (copy)
    local v16 = v4.useSignalState(v6().getData(v15).status);
    if v16 == l_DataHydrationTypes_0.DataStatus.NotReady then
        return "Loading";
    elseif v16 == l_DataHydrationTypes_0.DataStatus.Failed then
        return "Error";
    else
        return "Resolved";
    end;
end;
return v2.memo(v2.forwardRef(function(v18, v19) --[[ Line: 65 ]] --[[ Name: SduiFeatureEntryPoint ]]
    -- upvalues: v10 (copy), v11 (copy), v4 (copy), v6 (copy), l_DataHydrationTypes_0 (copy), v13 (copy), v8 (copy), v12 (copy), v2 (copy), v14 (copy), l_getSduiComponentWrapper_0 (copy)
    local l_configKey_0 = v18.configKey;
    local l_appPage_0 = v18.appPage;
    local v22 = v18.shouldDisplayLoading == nil or v18.shouldDisplayLoading;
    local v23 = v18.shouldDisplayError == nil or v18.shouldDisplayError;
    local v24 = v10(l_configKey_0, v18.identifier);
    v11(v18.loadTimer, typeof(v24) == "table");
    local v25 = v4.useSignalState(v6().getData(l_configKey_0).status);
    local v26 = v25 == l_DataHydrationTypes_0.DataStatus.NotReady and "Loading" or v25 == l_DataHydrationTypes_0.DataStatus.Failed and "Error" or "Resolved";
    local v27;
    v25, v27 = v13(v19);
    local v28 = v8(l_appPage_0, v25);
    local v29 = v12(l_configKey_0, l_appPage_0, v18.additionalAnalyticsData);
    return v2.createElement(v14, {
        onRetry = v18.onRetry, 
        contentSlot = if v24 then v2.createElement(l_getSduiComponentWrapper_0(v24), {
            debugName = ("SduiFeatureEntryPoint-%*"):format(l_configKey_0), 
            componentConfig = v24, 
            sduiContext = v28, 
            localAnalyticsData = v29
        }) else nil, 
        uiStatus = v26, 
        errorSlot = v18.errorSlot, 
        loadingSlot = v18.loadingSlot, 
        shouldDisplayLoading = v22, 
        shouldDisplayError = v23, 
        Size = if v18.Size then v18.Size else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if v18.AutomaticSize then v18.AutomaticSize else Enum.AutomaticSize.Y, 
        Position = v18.Position, 
        LayoutOrder = v18.LayoutOrder, 
        ref = v27
    });
end));