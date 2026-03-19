local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.CurrencyTransfers);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_TransferRobuxFlow_0 = v2.TransferRobuxFlow;
local l_TransferDirection_0 = v2.Enums.TransferDirection;
return function(_) --[[ Line: 17 ]] --[[ Name: CurrencyTransferUniversalAppWrapper ]]
    -- upvalues: l_useNavigation_0 (copy), l_useNavigationProps_0 (copy), l_TransferDirection_0 (copy), v1 (copy), l_TransferRobuxFlow_0 (copy)
    local v8 = l_useNavigation_0();
    local v11 = l_useNavigationProps_0(function(_, v10) --[[ Line: 19 ]]
        return {
            direction = v10.direction, 
            recipientUserId = v10.recipientUserId, 
            transferId = v10.transferId, 
            transferOrigination = v10.transferOrigination
        };
    end);
    local l_direction_0 = v11.direction;
    local v13 = if l_direction_0 and string.lower(l_direction_0) == "receive" then l_TransferDirection_0.Receive else l_TransferDirection_0.Send;
    local l_recipientUserId_0 = v11.recipientUserId;
    local v15 = if type(l_recipientUserId_0) == "string" then tonumber(l_recipientUserId_0) else l_recipientUserId_0;
    return v1.createElement(l_TransferRobuxFlow_0, {
        direction = v13, 
        recipientUserId = v15, 
        transferId = v11.transferId, 
        transferOrigination = v11.transferOrigination, 
        onClose = function() --[[ Line: 43 ]] --[[ Name: onClose ]]
            -- upvalues: v8 (copy)
            v8.pop();
        end
    });
end;