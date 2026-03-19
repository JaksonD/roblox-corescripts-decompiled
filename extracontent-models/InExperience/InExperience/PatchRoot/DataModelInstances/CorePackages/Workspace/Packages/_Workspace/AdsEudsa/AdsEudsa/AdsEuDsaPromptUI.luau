local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.Cryo);
local l_CoreScriptsRootProvider_0 = require(l_Parent_0.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v5 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusRoot_0 = v5.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v5.FocusNavigableSurfaceIdentifierEnum;
local v8 = require(l_Parent_0.RobloxTranslator);
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v12 = v8:FormatByKey("CoreScripts.Ads.Label.WhyThisAd");
local v13 = v8:FormatByKey("CoreScripts.Ads.Action.Close");
local v14 = v1.Component:extend("InteractiveAlert");
v14.init = function(v15) --[[ Line: 28 ]] --[[ Name: init ]]
    v15.state = {
        screenSize = Vector2.new(0, 0), 
        animating = false
    };
end;
v14.renderWithStyle = function(v16, _) --[[ Line: 35 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_ButtonType_0 (copy), v13 (copy), v1 (copy), l_InteractiveAlert_0 (copy), v12 (copy)
    local v18 = {
        buttonType = l_ButtonType_0.PrimarySystem, 
        props = {
            onActivated = function() --[[ Line: 39 ]] --[[ Name: onActivated ]]
                -- upvalues: v16 (copy)
                v16.props.handler:hidePrompt();
            end, 
            text = v13
        }, 
        isDefaultChild = true
    };
    return v1.createFragment({
        Frame = v1.createElement("Frame", {
            Selectable = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v1.Change.AbsoluteSize] = function(v19) --[[ Line: 55 ]]
                -- upvalues: v16 (copy)
                v16:setState({
                    screenSize = v19.AbsoluteSize
                });
            end
        }, {
            InteractiveAlert = v1.createElement(l_InteractiveAlert_0, {
                screenSize = v16.state.screenSize, 
                title = v12, 
                bodyText = v16.props.bodyText, 
                buttonStackInfo = {
                    buttons = {
                        v18
                    }
                }
            })
        })
    });
end;
v14.render = function(v20) --[[ Line: 76 ]] --[[ Name: render ]]
    return v20:renderWithStyle(v20.props.style);
end;
local l_v14_0 = v14;
return function(v22) --[[ Line: 81 ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v1 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_v14_0 (copy)
    local v23 = l_useStyle_0();
    local v24 = v3.Dictionary.join(v22, {
        style = v23
    });
    return v1.createElement(l_CoreScriptsRootProvider_0, {}, {
        FocusNavigationCoreScriptsWrapper = v1.createElement(l_FocusRoot_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
            isIsolated = true, 
            isAutoFocusRoot = true
        }, {
            WrappedEuDsaPrompt = v1.createElement(l_v14_0, v24)
        })
    });
end;