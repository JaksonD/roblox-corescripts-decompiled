local l_Parent_0 = script.Parent.Parent;
local _ = game:GetService("Players");
local _ = require(l_Parent_0.Actions.ErrorOccurred);
local _ = require(l_Parent_0.Actions.SetPromptState);
local v4 = require(l_Parent_0.Enums.UpsellFlow);
local _ = require(l_Parent_0.Enums.PromptState);
local _ = require(l_Parent_0.Enums.PurchaseError);
local v7 = require(l_Parent_0.Thunks.hideWindow);
local v8 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local v9 = require(l_Parent_0.Services.Analytics);
local v10 = require(l_Parent_0.Services.ExternalSettings);
local v11 = require(l_Parent_0.Services.Network);
local v12 = require(l_Parent_0.Services.PlatformInterface);
local v13 = require(l_Parent_0.Thunk);
local _ = require(l_Parent_0.Promise);
local v15 = {
    v9, 
    v10, 
    v11, 
    v12
};
return function(v16) --[[ Line: 26 ]] --[[ Name: openSecuritySettings ]]
    -- upvalues: v13 (copy), v15 (copy), v9 (copy), v10 (copy), v12 (copy), v8 (copy), v4 (copy), v7 (copy)
    return v13.new(script.Name, v15, function(v17, v18) --[[ Line: 27 ]]
        -- upvalues: v9 (ref), v10 (ref), v12 (ref), v8 (ref), v4 (ref), v16 (copy), v7 (ref)
        local v19 = v18[v9];
        local v20 = v18[v10];
        local v21 = v18[v12];
        local v22 = v17:getState();
        if v8(v20.getPlatform()) == v4.Web then
            local l_productId_0 = v22.productInfo.productId;
            local l_requestType_0 = v22.requestType;
            v19.signalTwoSVSettingsErrorConfirmed(l_productId_0, l_requestType_0);
            if v16 then
                v21.openSecuritySettings(v16);
            else
                v21.openSecuritySettings();
            end;
        end;
        v17:dispatch(v7());
    end);
end;