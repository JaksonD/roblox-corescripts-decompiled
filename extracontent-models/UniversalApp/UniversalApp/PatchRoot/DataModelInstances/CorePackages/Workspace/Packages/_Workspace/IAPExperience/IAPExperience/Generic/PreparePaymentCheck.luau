local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_1.Enums.PaymentPlatform);
local l_Url_0 = require(l_Parent_2.Http).Url;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_IsVRAppBuild_0 = require(l_Parent_2.AppCommonLib).IsVRAppBuild;
local v10 = require(l_Parent_1.Flags.getBlockingConsolePreparePaymentCheck);
local v11 = require(l_Parent_1.Utility.getIsQuestPlatform);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v13 = require(l_Parent_0.Events.PreparePaymentCheckCounter);
local v14 = game:DefineFastFlag("UsePlaystationPaymentsProtocolCommonFunctions", false);
local v15 = game:DefineFastFlag("EnableVRPreparePaymentCheck", false);
GetPaymentMethod = function(v16) --[[ Line: 20 ]] --[[ Name: GetPaymentMethod ]]
    -- upvalues: v5 (copy), v15 (copy), v11 (copy)
    if v16 == Enum.Platform.PS4 then
        return "PlaystationStore";
    elseif v16 == v5.Maquettes or v15 and v11() then
        return "QuestStore";
    elseif v16 == Enum.Platform.XBoxOne then
        return "XboxStore";
    else
        return "";
    end;
end;
IsPreparePaymentSuccessful = function(v17, v18) --[[ Line: 31 ]] --[[ Name: IsPreparePaymentSuccessful ]]
    -- upvalues: l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), l_Url_0 (copy), l_default_0 (copy), v13 (copy)
    local v19 = l_HttpService_0:JSONEncode({
        paymentMethod = v17, 
        providerProductId = v18
    });
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), l_Url_0 (ref), v19 (copy)
        return l_HttpRbxApiService_0:PostAsyncFullUrl(l_Url_0.APIS_URL .. "payments-gateway/v1/prepare-payment", v19);
    end);
    if not l_status_0 then
        l_default_0:logRobloxTelemetryCounter(v13, 1, {
            paymentMethod = v17, 
            result = "Error"
        });
        return true;
    elseif l_HttpService_0:JSONDecode(l_result_0).isSuccess then
        l_default_0:logRobloxTelemetryCounter(v13, 1, {
            paymentMethod = v17, 
            result = "Success"
        });
        return true;
    else
        l_default_0:logRobloxTelemetryCounter(v13, 1, {
            paymentMethod = v17, 
            result = "Failed"
        });
        return false;
    end;
end;
ConsolePreparePaymentCheck = function(v22) --[[ Line: 66 ]] --[[ Name: ConsolePreparePaymentCheck ]]
    -- upvalues: l_UserInputService_0 (copy), v14 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v24 = GetPaymentMethod(l_l_UserInputService_0_Platform_0);
    if v14 and (l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5) then
        return true;
    elseif v24 == "" or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        return true;
    else
        return IsPreparePaymentSuccessful(v24, v22);
    end;
end;
return function(v25) --[[ Line: 85 ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), v10 (copy)
    if l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface() then
        local v26 = ConsolePreparePaymentCheck(v25);
        if not v10() then
            v26 = true;
        end;
        return v26;
    else
        return true;
    end;
end;