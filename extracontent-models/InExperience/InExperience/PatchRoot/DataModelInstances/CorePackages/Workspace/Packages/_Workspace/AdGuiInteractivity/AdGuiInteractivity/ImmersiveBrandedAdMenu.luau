local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AdGuiInteractivity");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_script_FirstAncestor_0.ImmersiveBrandedAdWhyThisAdDialog);
local v7 = require(l_script_FirstAncestor_0.ImmersiveBrandedAdReportAdDialog);
local v8 = require(l_script_FirstAncestor_0.AdsInteractivityTelemetry);
local l_Menu_0 = v4.Menu;
local l_InputSize_0 = v4.Enums.InputSize;
local l_PopoverSide_0 = v4.Enums.PopoverSide;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local v13 = {
    WhyThisAd = "whyThisAd", 
    ReportAd = "reportAd"
};
return function(v14) --[[ Line: 33 ]]
    -- upvalues: l_useLocalization_0 (copy), v3 (copy), l_GuiService_0 (copy), v13 (copy), v8 (copy), v6 (copy), v7 (copy), l_Menu_0 (copy), l_InputSize_0 (copy), l_PopoverSide_0 (copy)
    local l_screenPosition_0 = v14.screenPosition;
    local v16 = l_useLocalization_0({
        WhyThisAdText = "CoreScripts.Ads.Label.WhyThisAd", 
        ReportAdText = "CoreScripts.Ads.Label.ReportAd"
    });
    local v17, v18 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: l_GuiService_0 (ref), v14 (copy)
        local v19 = l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 43 ]]
            -- upvalues: v14 (ref)
            v14.onDismiss();
        end);
        return function() --[[ Line: 47 ]]
            -- upvalues: v19 (copy)
            v19:Disconnect();
        end;
    end, {
        v14.onDismiss
    });
    local v20 = v3.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v13 (ref), v16 (copy)
        return {
            {
                id = v13.WhyThisAd, 
                icon = "icons/actions/info_small", 
                text = v16.WhyThisAdText
            }, 
            {
                id = v13.ReportAd, 
                icon = "icons/actions/feedback", 
                text = v16.ReportAdText
            }
        };
    end, {
        v16.WhyThisAdText, 
        v16.ReportAdText
    });
    local v22 = v3.useCallback(function(v21) --[[ Line: 67 ]]
        -- upvalues: v13 (ref), v8 (ref), v18 (copy)
        if v21 == v13.WhyThisAd then
            v8.logImmersiveBrandedAdButtonClickCounter("whyThisAd");
            v18(v13.WhyThisAd);
            return;
        else
            if v21 == v13.ReportAd then
                v8.logImmersiveBrandedAdButtonClickCounter("reportAd");
                v18(v13.ReportAd);
            end;
            return;
        end;
    end, {});
    if v17 == v13.WhyThisAd then
        return v3.createElement(v6, {
            advertiserName = v14.advertiserName, 
            onDismiss = v14.onDismiss
        });
    elseif v17 == v13.ReportAd then
        return v3.createElement(v7, {
            immersiveBrandedAdId = v14.immersiveBrandedAdId, 
            onDismiss = v14.onDismiss
        });
    else
        return v3.createElement(v3.Fragment, nil, {
            menu = v3.createElement(l_Menu_0, {
                isOpen = true, 
                items = v20, 
                size = l_InputSize_0.Small, 
                side = l_PopoverSide_0.Right, 
                onActivated = v22, 
                onPressedOutside = v14.onDismiss, 
                Position = UDim2.fromOffset(l_screenPosition_0.X, l_screenPosition_0.Y)
            }), 
            modal = v3.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 0, 0, 0), 
                Modal = true
            })
        });
    end;
end;