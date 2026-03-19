local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_ShareLinksRodux_0 = v1.ShareLinksRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withLocalization_0 = v1.withLocalization;
local l_ExperienceInviteStatus_0 = l_ShareLinksRodux_0.Enums.ExperienceInviteStatus;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v12 = l_Roact_0.Component:extend("InviteLinkExpiredModal");
local _ = require(script.Parent.inviteLinkExpiredMapStateToProps);
v12.defaultProps = {
    closeModal = function() --[[ Line: 29 ]] --[[ Name: closeModal ]]

    end, 
    launchGame = function() --[[ Line: 30 ]] --[[ Name: launchGame ]]

    end
};
v12.validateProps = l_t_0.interface({
    closeModal = l_t_0.callback, 
    launchGame = l_t_0.callback, 
    linkStatus = l_t_0.string, 
    experienceName = l_t_0.string, 
    isLoading = l_t_0.boolean, 
    screenSize = l_t_0.Vector2
});
v12.render = function(v14) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: l_ExperienceInviteStatus_0 (copy), l_withLocalization_0 (copy), l_Roact_0 (copy), l_LoadingSpinner_0 (copy), l_IconSize_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v14.props;
    local v16 = nil;
    local v17 = nil;
    if l_ExperienceInviteStatus_0.fromRawValue(l_props_0.linkStatus) == l_ExperienceInviteStatus_0.InviterNotInExperience then
        v16 = "Feature.SocialShare.Label.InviterNotHereError";
        v17 = "Feature.SocialShare.Description.InviterNotHereError";
    else
        v16 = "Feature.SocialShare.Label.InviteExpiredError";
        v17 = "Feature.SocialShare.Description.InviteExpiredError";
    end;
    return l_withLocalization_0({
        titleText = v16, 
        bodyText = {
            v17; 
            experienceName = l_props_0.experienceName
        }, 
        confirmButtonText = "Feature.Chat.Drawer.Join", 
        cancelButtonText = "Feature.Friends.Label.Cancel"
    })(function(v18) --[[ Line: 65 ]]
        -- upvalues: l_Roact_0 (ref), l_LoadingSpinner_0 (ref), l_IconSize_0 (ref), l_InteractiveAlert_0 (ref), l_props_0 (copy), l_ButtonType_0 (ref)
        local function v19() --[[ Line: 66 ]]
            -- upvalues: l_Roact_0 (ref), l_LoadingSpinner_0 (ref), l_IconSize_0 (ref)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 48), 
                BackgroundTransparency = 1
            }, {
                Spinner = l_Roact_0.createElement(l_LoadingSpinner_0, {
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5), 
                    size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
                })
            });
        end;
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            title = v18.titleText, 
            bodyText = if not l_props_0.isLoading then v18.bodyText else nil, 
            middleContent = l_props_0.isLoading and v19 or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = nil, 
                        props = {
                            text = v18.cancelButtonText, 
                            onActivated = function() --[[ Line: 90 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_props_0 (ref)
                                l_props_0.closeModal(false);
                            end
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v18.confirmButtonText, 
                            onActivated = function() --[[ Line: 99 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_props_0 (ref)
                                l_props_0.launchGame();
                                l_props_0.closeModal(true);
                            end
                        }
                    }
                }
            }
        });
    end);
end;
return v12;