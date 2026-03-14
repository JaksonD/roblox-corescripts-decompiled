local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v6 = require(l_script_FirstAncestor_0.Common.Lock);
local v7 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v8 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v13 = {
    okay = "Authentication.TwoStepVerification.Action.Okay", 
    header = "Authentication.TwoStepVerification.Label.AttemptReviewed", 
    alreadyReviewed = "Authentication.TwoStepVerification.Label.AlreadyReviewed", 
    helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
};
return function(v14) --[[ Line: 25 ]]
    -- upvalues: l_useLocalization_0 (copy), v13 (copy), v2 (copy), v9 (copy), v6 (copy), v7 (copy), v8 (copy), l_ButtonType_0 (copy), v10 (copy), v11 (copy), l_AppPage_0 (copy)
    local v15 = l_useLocalization_0(v13);
    return v2.createElement(v9, {
        title = v15.header, 
        closeModal = v14.closeModal, 
        makeBodyFragment = function(v16) --[[ Line: 30 ]] --[[ Name: makeBodyFragment ]]
            -- upvalues: v2 (ref), v6 (ref), v7 (ref), v15 (copy)
            return v2.createElement(v2.Fragment, nil, {
                Lock = v2.createElement(v6, {
                    layoutOrder = 1
                }), 
                AlreadyCompleted = v2.createElement(v7, {
                    layoutOrder = 2, 
                    contentWidth = v16, 
                    useBold = true, 
                    useEmphasis = true, 
                    text = v15.alreadyReviewed
                })
            });
        end, 
        buttonConfig = v8({
            {
                onActivated = v14.closeModal, 
                text = v15.okay, 
                type = l_ButtonType_0.PrimarySystem
            }
        }), 
        footerContent = v10(function(v17) --[[ Line: 51 ]]
            -- upvalues: v2 (ref), v7 (ref), v15 (copy), v11 (ref), v14 (copy), l_AppPage_0 (ref)
            return v2.createElement(v7, {
                BackgroundTransparency = 0, 
                layoutOrder = 1, 
                text = v15.helpMessage, 
                contentWidth = v17, 
                size = v11.Footer, 
                onActivated = function() --[[ Line: 58 ]] --[[ Name: onActivated ]]
                    -- upvalues: v14 (ref), l_AppPage_0 (ref)
                    v14.navigateToPage({
                        name = l_AppPage_0.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                        extraProps = {
                            title = ""
                        }
                    });
                end
            });
        end)
    });
end;