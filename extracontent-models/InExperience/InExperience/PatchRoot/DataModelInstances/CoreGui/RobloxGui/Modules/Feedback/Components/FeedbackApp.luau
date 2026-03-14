local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_AppStyleProvider_0 = v3.App.Style.AppStyleProvider;
local l_Dark_0 = v3.App.Style.Constants.ThemeName.Dark;
local v9 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v10 = require(l_Parent_0.Actions.SetScreenSize);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_Parent_0.Resources.Assets);
local v13 = require(l_Parent_0.Components.FeedbackReportDialog);
local v14 = require(l_Parent_0.Components.RefinedFeedbackBar);
local v15 = require(l_Parent_0.Components.FeedbackSubmissionToast);
local v16 = require(l_Parent_0.Components.HelpModal);
local v17 = require(l_Parent_0.Components.OnboardingModal);
local l_FFlagInExperienceUseAppStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInExperienceUseAppStyleProvider;
local v19 = v1.PureComponent:extend("FeedbackApp");
v19.validateProps = v4.strictInterface({
    setScreenGuiSize = v4.callback
});
v19.render = function(v20) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_FFlagInExperienceUseAppStyleProvider_0 (copy), l_AppStyleProvider_0 (copy), v3 (copy), l_Dark_0 (copy), v15 (copy), v16 (copy), v17 (copy), v13 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v14 (copy), v12 (copy)
    return v1.createElement(if l_FFlagInExperienceUseAppStyleProvider_0 then l_AppStyleProvider_0 else v3.Core.Style.Provider, if l_FFlagInExperienceUseAppStyleProvider_0 then {
        style = {
            themeName = l_Dark_0
        }
    } else {}, {
        Gui = v1.createElement("ScreenGui", {
            AutoLocalize = false, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            [v1.Change.AbsoluteSize] = v20.props.setScreenGuiSize
        }, {
            ScreenFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 10
            }, {
                FeedbackSubmissionToast = v1.createElement(v15), 
                HelpModal = v1.createElement(v16), 
                OnboardingModal = v1.createElement(v17), 
                FeedbackReportDialog = v1.createElement(v13)
            }), 
            RefinedFeedbackBar = l_withLocalization_0({
                feedbackBarText = "CoreScripts.Feedback.FeedbackBar.MainLabel"
            })(function(v21) --[[ Line: 78 ]]
                -- upvalues: l_withStyle_0 (ref), v1 (ref), v14 (ref), v12 (ref)
                return l_withStyle_0(function(v22) --[[ Line: 79 ]]
                    -- upvalues: v1 (ref), v14 (ref), v21 (copy), v12 (ref)
                    local l_Font_0 = v22.Font;
                    return v1.createElement(v14, {
                        leftHint = {
                            text = v21.feedbackBarText, 
                            hintTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            maxWidth = 200, 
                            icon = v12.Images.FeedbackBarHintIcon
                        }
                    }, {});
                end);
            end)
        })
    });
end;
return v2.connect(function() --[[ Line: 96 ]]

end, function(v24) --[[ Line: 96 ]]
    -- upvalues: v10 (copy), v9 (copy)
    return {
        setScreenGuiSize = function(v25) --[[ Line: 98 ]] --[[ Name: setScreenGuiSize ]]
            -- upvalues: v24 (copy), v10 (ref)
            v24(v10(v25.AbsoluteSize));
        end, 
        setFeedbackFlowState = function(v26) --[[ Line: 101 ]] --[[ Name: setFeedbackFlowState ]]
            -- upvalues: v24 (copy), v9 (ref)
            v24(function(v27) --[[ Line: 102 ]]
                -- upvalues: v9 (ref), v26 (copy)
                v27:dispatch(v9(v26));
            end);
        end
    };
end)(v19);