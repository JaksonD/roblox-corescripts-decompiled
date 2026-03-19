local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v1 = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v2 = require(l_RobloxGui_0.Modules.SelfView.publicApi);
return {
    selfViewVisibilityUpdatedSignal = v1, 
    getSelfViewVisibility = v2.getSelfViewIsOpenAndVisible
};