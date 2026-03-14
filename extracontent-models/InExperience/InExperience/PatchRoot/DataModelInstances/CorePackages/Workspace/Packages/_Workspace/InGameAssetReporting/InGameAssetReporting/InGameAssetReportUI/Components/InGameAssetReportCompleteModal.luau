local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactOtter);
local v3 = require(l_Parent_0.UIBlox);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v7 = {
    stiffness = 400, 
    damping = 40, 
    mass = 1
};
return function(v8) --[[ Line: 24 ]] --[[ Name: InGameAssetReportCompleteModal ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy), l_withLocalization_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v9, v10 = v1.useState(true);
    local v11, v12 = v2.useAnimatedBinding(1, function() --[[ Line: 27 ]]
        -- upvalues: v9 (copy), v8 (copy)
        if not v9 then
            v8.onClose();
        end;
    end);
    local v13 = v1.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v9 (copy)
        if v9 then
            return 0;
        else
            return 1;
        end;
    end, {
        v9
    });
    v1.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v12 (copy), v2 (ref), v13 (copy), v7 (ref)
        v12(v2.spring(v13, v7));
    end, {
        v13
    });
    local v14 = v1.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: v10 (copy)
        v10(false);
    end, {
        v10
    });
    return l_withLocalization_0({
        reportCompleteTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou", 
        reportCompleteDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete", 
        reportCompleteClose = "Feature.ReportAbuse.Action.Close"
    })(function(v15) --[[ Line: 50 ]]
        -- upvalues: v1 (ref), v11 (copy), v14 (copy), l_InteractiveAlert_0 (ref), v8 (copy), l_ButtonType_0 (ref)
        return v1.createElement("TextButton", {
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundTransparency = v11:map(function(v16) --[[ Line: 54 ]]
                return v16 + 0.3;
            end), 
            BackgroundColor3 = Color3.fromHex("#000000"), 
            Size = UDim2.new(1, 0, 1, 0), 
            Text = "", 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v1.Event.Activated] = v14, 
            ZIndex = 10
        }, {
            Alert = v1.createElement(l_InteractiveAlert_0, {
                screenSize = v8.screenSize, 
                title = v15.reportCompleteTitle, 
                bodyText = v15.reportCompleteDescription, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = v11:map(function(v17) --[[ Line: 70 ]]
                    return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), v17);
                end), 
                buttonStackInfo = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v14, 
                                text = v15.reportCompleteClose
                            }
                        }
                    }
                }
            })
        });
    end);
end;