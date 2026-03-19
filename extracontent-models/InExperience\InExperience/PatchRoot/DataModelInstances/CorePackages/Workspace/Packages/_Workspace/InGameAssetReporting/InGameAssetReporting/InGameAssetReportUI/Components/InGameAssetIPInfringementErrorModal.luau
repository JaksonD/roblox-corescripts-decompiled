local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.UIBlox);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local v6 = require(l_script_FirstAncestor_0.InGameAssetReportUI.Resources.Constants);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_IpErrorCodes_0 = v6.IpErrorCodes;
local v10 = {
    titleKey = "Feature.ReportAbuse.Heading.IpNoReportableContent", 
    descriptionKey = "Feature.ReportAbuse.Description.IpNoReportableContent", 
    showReportExperience = true
};
local v11 = {
    titleKey = "InGame.CommonUI.Title.Error", 
    descriptionKey = "Feature.ReportAbuse.Description.IpGenericError", 
    showReportExperience = false
};
local v12 = {
    [l_IpErrorCodes_0.ClientNoAssetsExtracted] = v10, 
    [l_IpErrorCodes_0.NoEligibleContents] = v10, 
    [l_IpErrorCodes_0.Unknown] = v11
};
local v13 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return v2.memo(function(v14) --[[ Line: 49 ]] --[[ Name: InGameAssetIPInfringementErrorModal ]]
    -- upvalues: v2 (copy), v3 (copy), v13 (copy), v12 (copy), v11 (copy), l_withLocalization_0 (copy), l_ButtonType_0 (copy), l_InteractiveAlert_0 (copy)
    local v15, v16 = v2.useState(true);
    local v17, v18 = v3.useAnimatedBinding(1, function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy), v14 (copy)
        if not v15 then
            v14.onBack();
        end;
    end);
    local v19 = v2.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v15 (copy)
        if v15 then
            return 0;
        else
            return 1;
        end;
    end, {
        v15
    });
    v2.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy), v3 (ref), v19 (copy), v13 (ref)
        v18(v3.spring(v19, v13));
    end, {
        v19
    });
    local v20 = v2.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v16 (copy)
        v16(false);
    end, {
        v16
    });
    local v21 = if v14.errorCode and v12[v14.errorCode] then v12[v14.errorCode] else v11;
    return l_withLocalization_0({
        errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack", 
        reportExperience = "Feature.ReportAbuse.Action.IpReportExperience", 
        title = v21.titleKey, 
        description = v21.descriptionKey
    })(function(v22) --[[ Line: 80 ]]
        -- upvalues: v21 (copy), v14 (copy), l_ButtonType_0 (ref), v20 (copy), v2 (ref), v17 (copy), l_InteractiveAlert_0 (ref)
        local v23 = {};
        if v21.showReportExperience and v14.onReportExperience then
            table.insert(v23, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v14.onReportExperience, 
                    text = v22.reportExperience, 
                    isLoading = v14.isReportExperienceLoading, 
                    isDisabled = v14.isReportExperienceLoading
                }
            });
            table.insert(v23, {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = v20, 
                    text = v22.errorBack
                }
            });
        else
            table.insert(v23, {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v20, 
                    text = v22.errorBack
                }
            });
        end;
        return v2.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundTransparency = v17:map(function(v24) --[[ Line: 113 ]]
                return v24 + 0.3;
            end), 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = "", 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v2.Event.Activated] = v20, 
            ZIndex = 10
        }, {
            Alert = v2.createElement(l_InteractiveAlert_0, {
                screenSize = v14.screenSize, 
                title = v22.title, 
                bodyText = v22.description, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = v17:map(function(v25) --[[ Line: 129 ]]
                    return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), v25);
                end), 
                buttonStackInfo = {
                    buttons = v23
                }
            })
        });
    end);
end);