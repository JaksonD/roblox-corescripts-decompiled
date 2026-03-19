local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PaymentPlatform);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v2 == Enum.Platform.XBoxOne then
        return v1.Xbox;
    elseif v2 == Enum.Platform.IOS then
        if v3 then
            return v1.Midas;
        else
            return v1.Apple;
        end;
    elseif v2 == Enum.Platform.Windows or v2 == Enum.Platform.OSX or v2 == Enum.Platform.Linux then
        return v1.Web;
    elseif v2 == Enum.Platform.Android then
        if v3 then
            return v1.Midas;
        elseif v4 then
            return v1.Amazon;
        else
            return v1.Google;
        end;
    elseif v2 == Enum.Platform.UWP then
        return v1.UWP;
    else
        return v1.None;
    end;
end;