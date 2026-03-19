local l_AdService_0 = game:GetService("AdService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.t);
local v5 = require(l_script_FirstAncestor_0.getScreenPositionFromGuiObjectInput);
local v6 = require(l_script_FirstAncestor_0.ImmersiveBrandedAdMenu);
local v7 = require(l_script_FirstAncestor_0.AdsInteractivityTelemetry);
local v8 = v4.interface({
    disclosureButton = v4.instanceIsA("GuiButton"), 
    inputObject = v4.instanceIsA("InputObject"), 
    advertiserName = v4.string, 
    campaignId = v4.string, 
    immersiveBrandedAdId = v4.string
});
return function() --[[ Line: 35 ]]
    -- upvalues: v3 (copy), l_AdService_0 (copy), v8 (copy), v7 (copy), v5 (copy), v6 (copy)
    local v9, v10 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: l_AdService_0 (ref), v8 (ref), v7 (ref), v10 (copy), v5 (ref)
        l_AdService_0.OnImmersiveBrandedAdDisclosureButtonActivated = function(v11) --[[ Line: 40 ]]
            -- upvalues: v8 (ref), v7 (ref), v10 (ref), v5 (ref)
            local v12, _ = v8(v11);
            if not v12 then
                return;
            else
                v7.logImmersiveBrandedAdButtonClickCounter("disclosure");
                v10({
                    menuScreenPosition = v5(v11.disclosureButton, v11.inputObject), 
                    advertiserName = v11.advertiserName, 
                    campaignId = v11.campaignId, 
                    immersiveBrandedAdId = v11.immersiveBrandedAdId
                });
                return;
            end;
        end;
        return function() --[[ Line: 55 ]]
            -- upvalues: l_AdService_0 (ref)
            l_AdService_0.OnImmersiveBrandedAdDisclosureButtonActivated = function() --[[ Line: 56 ]]

            end;
        end;
    end, {});
    local v14 = v3.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v10 (copy)
        v10(nil);
    end, {});
    if not v9 then
        return nil;
    else
        return v3.createElement(v6, {
            screenPosition = v9.menuScreenPosition, 
            advertiserName = v9.advertiserName, 
            campaignId = v9.campaignId, 
            immersiveBrandedAdId = v9.immersiveBrandedAdId, 
            onDismiss = v14
        });
    end;
end;