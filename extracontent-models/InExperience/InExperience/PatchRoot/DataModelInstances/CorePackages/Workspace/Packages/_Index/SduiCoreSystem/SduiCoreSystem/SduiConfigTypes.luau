local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local l_ConditionalPropsInterface_0 = require(l_script_FirstAncestor_0.ConditionalProps.SduiConditionalPropTypes).ConditionalPropsInterface;
local l_FFlagSduiActionTelemetryHandler_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionTelemetryHandler;
local v7 = {
    actionType = v2.string, 
    actionParams = v2.optional(v2.table), 
    telemetryHandler = if l_FFlagSduiActionTelemetryHandler_0 then v2.optional(v2.string) else nil
};
local v8 = {
    componentType = v2.string, 
    props = v2.optional(v2.table), 
    templateKey = v2.optional(v2.string), 
    analyticsData = v2.optional(v2.table), 
    children = v2.optional(v2.table), 
    conditionalProps = v2.optional(v2.array(v2.interface(l_ConditionalPropsInterface_0))), 
    feedItemKey = v2.optional(v2.string), 
    __processed = v2.optional(v2.boolean), 
    __isClientBinding = v2.optional(v2.boolean)
};
local v9 = v3.Dictionary.join(v8, {
    componentType = v2.optional(v2.string)
});
return {
    ActionInterface = v7, 
    UiComponentInterface = v8, 
    SduiTemplateInterface = v9
};