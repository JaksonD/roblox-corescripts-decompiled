local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostEnterLoginCode);
local v5 = require(l_script_FirstAncestor_0.Http.Requests.PostConfirmLoginCode);
local v6 = require(l_script_FirstAncestor_0.Http.Requests.PostCreateLoginCode);
local v7 = require(l_script_FirstAncestor_0.Http.Requests.PostLoginCodeStatus);
local v8 = require(l_script_FirstAncestor_0.Http.Requests.PostCancelLoginCode);
local l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossDeviceLoginUsingQRCodes;
return {
    EnterCode = function(v10, v11) --[[ Line: 17 ]] --[[ Name: EnterCode ]]
        -- upvalues: v4 (copy)
        return function(_) --[[ Line: 18 ]]
            -- upvalues: v4 (ref), v10 (copy), v11 (copy)
            return v4(v10, v11):andThen(function(v13) --[[ Line: 19 ]]
                if v13 and v13.responseBody then
                    return {
                        DeviceInfo = string.format("%s\n%s", v13.responseBody.deviceInfo or "", v13.responseBody.location or "")
                    };
                else
                    return nil;
                end;
            end);
        end;
    end, 
    FetchDeviceCode = function(v14) --[[ Line: 36 ]] --[[ Name: FetchDeviceCode ]]
        -- upvalues: v6 (copy), l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0 (copy)
        return function(_) --[[ Line: 37 ]]
            -- upvalues: v6 (ref), v14 (copy), l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0 (ref)
            return v6(v14):andThen(function(v16) --[[ Line: 38 ]]
                -- upvalues: l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0 (ref)
                local v17 = v16 and v16.responseBody;
                if v17 then
                    return {
                        DeviceCode = v17.code, 
                        PrivateKey = v17.privateKey, 
                        QrCodePath = if l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0() then v17.imagePath else nil
                    };
                else
                    return nil;
                end;
            end);
        end;
    end, 
    GetLoginStatus = function(v18, v19, v20) --[[ Line: 53 ]] --[[ Name: GetLoginStatus ]]
        -- upvalues: v7 (copy)
        return function(_) --[[ Line: 54 ]]
            -- upvalues: v7 (ref), v18 (copy), v19 (copy), v20 (copy)
            return v7(v18, v19, v20):andThen(function(v22) --[[ Line: 55 ]]
                local v23 = v22 and v22.responseBody;
                if v23 then
                    return {
                        Status = v23.status, 
                        AccountName = v23.accountName, 
                        AccountPictureUrl = v23.accountPictureUrl, 
                        ExpirationTime = v23.expirationTime
                    };
                else
                    return nil;
                end;
            end);
        end;
    end, 
    OpenLoginCodePrompt = function(v24) --[[ Line: 71 ]] --[[ Name: OpenLoginCodePrompt ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
        return function(v25) --[[ Line: 72 ]]
            -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v24 (copy)
            v25:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.CrossDeviceCodePrompt, v24));
        end;
    end, 
    ConfirmDeviceAccess = function(v26, v27) --[[ Line: 77 ]] --[[ Name: ConfirmDeviceAccess ]]
        -- upvalues: v5 (copy)
        return function(_) --[[ Line: 78 ]]
            -- upvalues: v5 (ref), v26 (copy), v27 (copy)
            return v5(v26, v27);
        end;
    end, 
    CancelLoginCode = function(v29, v30) --[[ Line: 83 ]] --[[ Name: CancelLoginCode ]]
        -- upvalues: v8 (copy)
        return function(_) --[[ Line: 84 ]]
            -- upvalues: v8 (ref), v29 (copy), v30 (copy)
            return v8(v29, v30);
        end;
    end, 
    OpenConfirmationOverlay = function(v32, v33, v34, v35) --[[ Line: 89 ]] --[[ Name: OpenConfirmationOverlay ]]
        -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
        return function(v36) --[[ Line: 90 ]]
            -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v32 (copy), v33 (copy), v34 (copy), v35 (copy)
            v36:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.CrossDeviceLoginConfirmation, {
                loginSuccess = v32, 
                closeCallback = v33, 
                retryCallback = v34, 
                deviceString = v35
            }));
        end;
    end
};