local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Roact_0 = require(l_Parent_0.PurchasePromptDeps).Roact;
local v4 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local v5 = require(l_script_FirstAncestor_0.NativeUpsell.getUpsellFlow);
local v6 = require(script.Parent.MarketplaceServiceEventConnector);
local v7 = require(script.Parent.InputTypeManager);
local v8 = require(script.Parent.BrowserPurchaseFinishedConnector);
local v9 = require(script.Parent.NativePurchaseFinishedConnector);
return function() --[[ Line: 20 ]] --[[ Name: EventConnections ]]
    -- upvalues: v5 (copy), l_UserInputService_0 (copy), v4 (copy), l_Roact_0 (copy), v8 (copy), v9 (copy), v6 (copy), v7 (copy)
    local v10 = nil;
    local v11 = v5(l_UserInputService_0:GetPlatform());
    if v11 == v4.Web then
        v10 = l_Roact_0.createElement(v8);
    elseif v11 == v4.Mobile then
        v10 = l_Roact_0.createElement(v9);
    end;
    local v12 = l_UserInputService_0:GetPlatform() ~= Enum.Platform.XBoxOne;
    return l_Roact_0.createElement("Folder", {}, {
        MarketPlaceServiceEventConnector = l_Roact_0.createElement(v6), 
        InputTypeManager = v12 and l_Roact_0.createElement(v7) or nil, 
        UpsellFinishedConnector = v10
    });
end;