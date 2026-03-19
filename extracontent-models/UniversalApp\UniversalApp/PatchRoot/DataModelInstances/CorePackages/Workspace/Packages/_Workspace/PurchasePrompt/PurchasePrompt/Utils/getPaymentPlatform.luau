local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getPaymentFromPlatform);
local _ = require(l_Parent_0.Utils.getPaymentFromPlatformLegacy);
local v3 = require(l_Parent_0.Utils.getHasAmazonUserAgent);
local v4 = require(l_Parent_0.Utils.getHasQuestUserAgent);
local v5 = require(l_Parent_0.Flags.GetFFlagEnableLuobuInGameUpsell);
return function(v6) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v5 (copy), v4 (copy), v1 (copy)
    local v7 = v3();
    local v8 = v5();
    local v9 = v4();
    return v1(v6, v8, v7, v9);
end;