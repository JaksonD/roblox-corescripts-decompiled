local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v4.Style.withStyle;
local v9 = require(l_CorePackages_0.Packages.t);
local v10 = v2.PureComponent:extend("PurchaseDeveloperProductSuccessPrompt");
v10.validateProps = v9.strictInterface({
    productName = v9.string, 
    containerWidth = v9.number, 
    defaultChildRef = v9.optional(v9.any), 
    focusController = v9.optional(v9.any), 
    closeCentralOverlayThunk = v9.optional(v9.callback), 
    closePrompt = v9.callback
});
v10.render = function(v11) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), v2 (copy), v5 (copy)
    local l_containerWidth_0 = v11.props.containerWidth;
    local l_closePrompt_0 = v11.props.closePrompt;
    local l_productName_0 = v11.props.productName;
    return l_withStyle_0(function(v15) --[[ Line: 33 ]]
        -- upvalues: v7 (ref), l_productName_0 (copy), v2 (ref), v5 (ref), l_containerWidth_0 (copy), l_closePrompt_0 (copy)
        return v7({
            titleText = "Feature.DeveloperProducts.Heading.Success", 
            messageText = {
                "Feature.DeveloperProducts.Message.PurchaseSucceed"; 
                productName = l_productName_0
            }, 
            buttonText = "Feature.DeveloperProducts.Message.BackToStore"
        })(function(v16) --[[ Line: 38 ]]
            -- upvalues: v2 (ref), v5 (ref), l_containerWidth_0 (ref), v15 (copy), l_closePrompt_0 (ref)
            return v2.createElement(v5, {
                containerWidth = l_containerWidth_0, 
                titleText = v16.titleText, 
                titleFont = v15.Font.Header1.Font, 
                messageText = v16.messageText, 
                messageFont = v15.Font.Body.Font, 
                buttonFont = v15.Font.Header2.Font, 
                confirmButtonText = v16.buttonText, 
                onConfirm = l_closePrompt_0, 
                isConfirming = false, 
                hasCancelButton = false
            });
        end);
    end);
end;
return (v3.connect(nil, function(v17) --[[ Line: 55 ]]
    -- upvalues: v6 (copy)
    return {
        closePrompt = function() --[[ Line: 57 ]] --[[ Name: closePrompt ]]
            -- upvalues: v17 (copy), v6 (ref)
            v17(v6());
        end
    };
end)(v10));