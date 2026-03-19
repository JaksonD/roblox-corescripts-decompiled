local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagExpChatUseGuacForFOMOUpsell_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseGuacForFOMOUpsell;
local v3 = nil;
if l_FFlagExpChatUseGuacForFOMOUpsell_0 then
    v3 = require(l_Parent_0.UniversalAppPolicy);
end;
local v4 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v5 = game:DefineFastString("ExpChatFOMOUpsellIXPLayerName", "User.Communication.NonAgeCheckedUser");
local v6 = game:DefineFastString("ExpChatFOMOUpsellIXPLayerValue", "FOMOUpsellEnabled");
local v7 = nil;
local v8 = nil;
local function v11() --[[ Line: 21 ]] --[[ Name: fetchIXPData ]]
    -- upvalues: v7 (ref), v8 (ref), v4 (copy), v5 (copy), v6 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
        -- upvalues: v4 (ref), v5 (ref)
        return v4:GetLayerData(v5);
    end);
    v7 = l_status_0;
    v8 = l_result_0;
    if not v7 or not v8 or v8[v6] == nil then
        return false;
    else
        v4:LogUserLayerExposure(v5);
        return v8[v6];
    end;
end;
return function() --[[ Line: 35 ]]
    -- upvalues: l_FFlagExpChatUseGuacForFOMOUpsell_0 (copy), v3 (ref), v7 (ref), v8 (ref), v6 (copy), v11 (copy)
    if not l_FFlagExpChatUseGuacForFOMOUpsell_0 then
        return false;
    elseif not v3.getAppFeaturePolicies().getShowFOMOUpsell() then
        return false;
    elseif v7 and v8 then
        return v8[v6];
    else
        return (v11());
    end;
end;