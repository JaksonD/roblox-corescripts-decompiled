local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.PhoneVerificationUpsellOverlay);
local v4 = require(l_script_FirstAncestor_0.Components.UpsellContainer);
local v5 = require(l_script_FirstAncestor_0.Components.PhoneVerificationStatusOverlay);
local v6 = require(l_Parent_0.Cryo);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local v9 = require(l_Parent_0.UIBlox);
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagFixUpsellVerificationToNavigateToOverlays);
local v13 = {
    onSuccess = function() --[[ Line: 24 ]] --[[ Name: onSuccess ]]

    end, 
    closeUpsell = function() --[[ Line: 25 ]] --[[ Name: closeUpsell ]]

    end
};
return function(v14) --[[ Line: 30 ]] --[[ Name: PhoneVerificationUpsellOverlayWrapper ]]
    -- upvalues: v8 (copy), v13 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v12 (copy), l_useLocalization_0 (copy), v4 (copy), v6 (copy), v5 (copy)
    local v15 = v8(v13, v14);
    local v16, v17 = v2.useState(false);
    local v18 = v2.createElement(l_ImageSetLabel_0, {
        Size = UDim2.fromOffset(40, 40), 
        Image = l_Images_0["icons/status/success_large"], 
        BackgroundTransparency = 1
    });
    local function v19() --[[ Line: 41 ]]
        -- upvalues: v17 (copy), v12 (ref), v15 (copy)
        v17(true);
        task.delay(3, function() --[[ Line: 43 ]]
            -- upvalues: v12 (ref), v15 (ref)
            if v12 then
                v15.closeUpsell();
                v15.onSuccess();
                return;
            else
                v15.onSuccess();
                v15.closeUpsell();
                return;
            end;
        end);
    end;
    local v20 = l_useLocalization_0({
        verifySuccessKey = "Feature.VerificationUpsell.Heading.VerifiedSuccessfully.V2"
    });
    return v2.createElement(v2.Fragment, nil, {
        PhoneVerificationUpsellOverlay = v2.createElement(v4, v6.Dictionary.join(v15, {
            onSuccess = v19
        })), 
        SuccessOverlay = v16 and v2.createElement(v5, {
            image = v18, 
            text = v20.verifySuccessKey
        })
    });
end;