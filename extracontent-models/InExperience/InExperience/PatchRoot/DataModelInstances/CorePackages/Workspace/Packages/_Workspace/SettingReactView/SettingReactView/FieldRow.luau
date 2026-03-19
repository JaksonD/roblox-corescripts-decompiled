local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.SettingsService);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_0.Field);
local v6 = require(l_Parent_1.ReactUtils);
local v7 = require(l_Parent_1.SignalsReact);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_createNextOrder_0 = v6.createNextOrder;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_Enums_0 = v3.Enums;
local l_ControlState_0 = l_Enums_0.ControlState;
local l_StateLayerAffordance_0 = l_Enums_0.StateLayerAffordance;
return function(v15) --[[ Line: 26 ]]
    -- upvalues: l_useTokens_0 (copy), l_createNextOrder_0 (copy), v4 (copy), l_ControlState_0 (copy), v7 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_Text_0 (copy), v5 (copy)
    local v16 = l_useTokens_0();
    local v17 = l_createNextOrder_0();
    local v18 = UDim2.fromScale(0.5, 1);
    local v19 = UDim2.fromScale(0.5, 1);
    local v20 = {
        Color3 = v16.Color.Extended.Gray.Gray_700.Color3, 
        Transparency = 0.9
    };
    local v21 = {
        Color3 = v20.Color3, 
        Transparency = 1
    };
    local v22, v23 = v4.useBinding(v21);
    local v25 = v4.useCallback(function(v24) --[[ Line: 36 ]]
        -- upvalues: v23 (copy), l_ControlState_0 (ref), v21 (copy), v20 (copy)
        v23(if v24 == l_ControlState_0.Default then v21 else v20);
    end, {
        v23
    });
    local v26 = v7.useSignalBinding(v15.subscribeVisible);
    return v4.createElement(l_View_0, {
        tag = "auto-y row size-full-1300 radius-medium", 
        backgroundStyle = v22, 
        onStateChanged = v25, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }, 
        Visible = v26, 
        LayoutOrder = v15.layoutOrder
    }, {
        LabelContainer = v4.createElement(l_View_0, {
            tag = "auto-y gui-object-defaults col padding-left-small padding-y-large", 
            Size = v19, 
            LayoutOrder = v17()
        }, {
            Label = v4.createElement(l_Text_0, {
                LayoutOrder = v17(), 
                tag = "auto-y grow size-full-0 text-align-x-left text-wrap text-label-large", 
                textStyle = v16.Color.Extended.White.White_100, 
                Text = v15.label
            }), 
            Padding = if v15.description then v4.createElement(l_View_0, {
                tag = "size-full-200", 
                LayoutOrder = v17()
            }) else nil, 
            Description = if v15.description then v4.createElement(l_Text_0, {
                LayoutOrder = v17(), 
                tag = "auto-y size-full-0 text-align-x-left text-wrap text-label-small", 
                textStyle = v16.Color.Extended.White.White_80, 
                Text = v15.description
            }) else nil
        }), 
        FieldContainer = v4.createElement(l_View_0, {
            Size = v18, 
            tag = "row align-x-right align-y-center", 
            LayoutOrder = v17()
        }, {
            v4.createElement(l_View_0, {
                tag = "row align-x-center align-y-center auto-xy padding-right-small padding-y-medium"
            }, v4.createElement(v5, v15))
        })
    });
end;