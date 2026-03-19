local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
return {
    paymentPlatformToUpsellPlatform = function(v2) --[[ Line: 6 ]] --[[ Name: paymentPlatformToUpsellPlatform ]]
        -- upvalues: v1 (copy)
        if v2 == v1.Web then
            return "Web";
        elseif v2 == v1.Apple then
            return "AppleAppStore";
        elseif v2 == v1.Google then
            return "GooglePlayStore";
        elseif v2 == v1.Amazon then
            return "AmazonStore";
        elseif v2 == v1.UWP then
            return "WindowsStore";
        elseif v2 == v1.Xbox then
            return "XboxStore";
        elseif v2 == v1.Maquettes then
            return "MaquettesStore";
        elseif v2 == v1.Palisades then
            return "PalisadesStore";
        elseif v2 == v1.Microsoft then
            return "MicrosoftStore";
        elseif v2 == v1.MilkyWay then
            return "MilkyWayStore";
        else
            return "None";
        end;
    end
};