local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Networking.useGetProfileShareUrl);
local v4 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v5 = require(l_script_FirstAncestor_0.Rodux.useShortUrl);
local v6 = require(script.Parent.useHasLoadedSuccessfully);
local v7 = require(l_script_FirstAncestor_0.Networking.useLoadingState);
local v8 = require(l_script_FirstAncestor_0.Networking.useRefreshQrSession);
local l_NetworkStatus_0 = require(l_script_FirstAncestor_0.Networking.configuredRoduxNetworking).Enum.NetworkStatus;
local v10 = require(script.Parent.QRCodeFailedView);
local v11 = require(script.Parent.QRCodeSucceededView);
local v12 = require(script.Parent.QRCodeLoadingView);
local l_useEffectOnce_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnce;
local v14 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v15 = require(script.Parent.useHasFailedToLoad);
return function(v16) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy), v8 (copy), v5 (copy), l_NetworkStatus_0 (copy), v2 (copy), v14 (copy), l_useEffectOnce_0 (copy), v6 (copy), v15 (copy), v11 (copy), v10 (copy), v12 (copy)
    local v17 = v4();
    local v18 = v7();
    local v19 = v3();
    local v20 = v8();
    local v21 = v5();
    local v22 = v21 ~= nil;
    local v23 = v18 == l_NetworkStatus_0.Failed;
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v20 (copy), v17 (copy), v14 (ref)
        v20():andThen(function(v24) --[[ Line: 41 ]]
            -- upvalues: v17 (ref), v14 (ref)
            local v25 = v24 and v24.responseBody or {};
            local v26 = v24 and v24.responseCode;
            v17.fireEvent(v14.RefreshQrSession, {
                success = v25.Success, 
                responseCode = v26
            });
        end);
    end, {});
    l_useEffectOnce_0(v19, not v22);
    v6(v17, v22);
    v15(v17, v23);
    local v27 = nil;
    v27 = if v22 then v2.createElement(v11, {
        url = v21, 
        qrCodeLength = 200, 
        padding = 24, 
        isSmallScreen = v16.isSmallScreen
    }) else if v23 then v2.createElement(v10, {
        onActivated = v19, 
        padding = 24
    }) else v2.createElement(v12);
    local v28 = 304;
    v28 = v16.isSmallScreen and 280 or 304;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 304, 0, v28), 
        LayoutOrder = v16.layoutOrder, 
        BackgroundTransparency = 1
    }, {
        View = v27
    });
end;