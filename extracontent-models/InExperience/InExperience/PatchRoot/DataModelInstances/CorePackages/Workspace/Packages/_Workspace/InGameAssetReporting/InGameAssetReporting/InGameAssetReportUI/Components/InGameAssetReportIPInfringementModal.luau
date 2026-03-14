local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.Foundation);
local l_Text_0 = v5.Text;
local l_View_0 = v5.View;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v11 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v12) --[[ Line: 31 ]] --[[ Name: InGameAssetReportIPInfringementModal ]]
    -- upvalues: v1 (copy), l_useLocalization_0 (copy), v2 (copy), v11 (copy), l_View_0 (copy), l_Text_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v13, v14 = v1.useState(true);
    local v15 = l_useLocalization_0({
        yourReportCode = "Feature.ReportAbuse.Label.YourReportCode", 
        ipInfringementModalText = "Feature.ReportAbuse.Description.IpInfringementReportModal", 
        reportCompleteClose = "Feature.ReportAbuse.Action.Close", 
        thankYouIpInfringementReport = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
    });
    local v16, v17 = v2.useAnimatedBinding(1, function() --[[ Line: 40 ]]
        -- upvalues: v13 (copy), v12 (copy)
        if not v13 then
            v12.onClose();
        end;
    end);
    local v18 = v1.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v13 (copy)
        if v13 then
            return 0;
        else
            return 1;
        end;
    end, {
        v13
    });
    v1.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: v17 (copy), v2 (ref), v18 (copy), v11 (ref)
        v17(v2.spring(v18, v11));
    end, {
        v18
    });
    local v19 = v1.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v14 (copy)
        v14(false);
    end, {
        v14
    });
    local v20 = v1.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v1 (ref), l_View_0 (ref), l_Text_0 (ref), v15 (copy), v12 (copy)
        return v1.createElement(l_View_0, {
            tag = "auto-xy col gap-small align-x-center"
        }, {
            text1 = v1.createElement(l_Text_0, {
                Text = v15.yourReportCode, 
                tag = "auto-xy text-title-medium content-default text-align-x-center", 
                LayoutOrder = 1
            }), 
            text2 = v1.createElement(l_Text_0, {
                Text = v12.reportCode, 
                tag = "auto-xy text-heading-medium content-emphasis text-align-x-center", 
                LayoutOrder = 2
            }), 
            text3 = v1.createElement(l_Text_0, {
                Text = v15.ipInfringementModalText, 
                tag = "auto-xy text-body-medium content-default text-align-x-center text-wrap", 
                RichText = true, 
                LayoutOrder = 3
            })
        });
    end, {
        v12.reportCode
    });
    return v1.createElement("TextButton", {
        AutoButtonColor = false, 
        BorderSizePixel = 0, 
        BackgroundTransparency = v16:map(function(v21) --[[ Line: 85 ]]
            return v21 + 0.3;
        end), 
        BackgroundColor3 = Color3.fromHex("#000000"), 
        Size = UDim2.new(1, 0, 1, 0), 
        Text = "", 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v1.Event.Activated] = v19, 
        ZIndex = 10
    }, {
        Alert = v1.createElement(l_InteractiveAlert_0, {
            screenSize = v12.screenSize, 
            title = v15.thankYouIpInfringementReport, 
            richText = true, 
            middleContent = v20, 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = v16:map(function(v22) --[[ Line: 102 ]]
                return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), v22);
            end), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v19, 
                            text = v15.reportCompleteClose
                        }
                    }
                }
            }
        })
    });
end;