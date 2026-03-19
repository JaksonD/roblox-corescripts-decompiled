local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.t);
local l_PlayButtonStates_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonStates;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_ComboButton_0 = v5.App.Button.ComboButton;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagLuaAppPlayButtonLoadingPrimary_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary;
local l_FFlagLuaAppEnablePlaySquadButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton;
local l_Images_0 = v5.App.ImageSet.Images;
local v14 = l_Images_0["icons/common/play"];
local v15 = l_Images_0["icons/status/private"];
local v16 = l_Images_0["icons/status/unavailable"];
local v17 = l_Images_0["icons/common/robux"];
local v18 = l_Images_0["icons/actions/truncationCollapse"];
local v19 = v1.PureComponent:extend("PlayButton");
v19.validateProps = v3.strictInterface({
    price = v3.number, 
    localizedFiatPrice = v3.string, 
    playButtonState = v3.string, 
    onPlayButtonActivated = v3.callback, 
    onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v3.callback else nil, 
    Size = v3.optional(v3.UDim2), 
    LayoutOrder = v3.optional(v3.number), 
    testId = v3.optional(v3.string)
});
v19.renderWithLocalization = function(v20, v21) --[[ Line: 39 ]] --[[ Name: renderWithLocalization ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy), l_FFlagLuaAppPlayButtonLoadingPrimary_0 (copy), l_ButtonType_0 (copy), v14 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v17 (copy), v15 (copy), v16 (copy), v1 (copy), l_ComboButton_0 (copy), v18 (copy), l_Button_0 (copy), v2 (copy)
    local l_Size_0 = v20.props.Size;
    local l_LayoutOrder_0 = v20.props.LayoutOrder;
    local l_price_0 = v20.props.price;
    local l_playButtonState_0 = v20.props.playButtonState;
    local l_onPlayButtonActivated_0 = v20.props.onPlayButtonActivated;
    local l_onPlaySquadButtonActivated_0 = v20.props.onPlaySquadButtonActivated;
    local v28 = false;
    local v29 = false;
    local v30 = not l_FFlagLuaAppEnablePlaySquadButton_0 and nil;
    local v31 = not l_FFlagLuaAppEnablePlaySquadButton_0 and nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    if l_playButtonState_0 == l_PlayButtonStates_0.Loading then
        v32 = if l_FFlagLuaAppPlayButtonLoadingPrimary_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary;
        v28 = true;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.Playable then
        v32 = l_ButtonType_0.PrimaryContextual;
        v33 = v14;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == l_PlayButtonStates_0.PlayableWithParty then
        v33 = v14;
        v34 = v21.joinWithParty;
        v30 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == l_PlayButtonStates_0.WaitingForParty then
        v33 = v14;
        v34 = v21.waitingForParty;
        v29 = true;
        v31 = true;
        v30 = true;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.PaidAccess then
        v32 = l_ButtonType_0.PrimaryContextual;
        v33 = v17;
        v34 = tostring(l_price_0);
    elseif l_playButtonState_0 == l_PlayButtonStates_0.FiatPaidAccess then
        v32 = l_ButtonType_0.PrimaryContextual;
        v34 = v20.props.localizedFiatPrice;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.ActionNeeded then
        v32 = l_ButtonType_0.PrimarySystem;
        v33 = v15;
        v34 = v21.join;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.UnplayableOther then
        v32 = l_ButtonType_0.Secondary;
        v33 = v16;
        v34 = v21.unavailable;
        v29 = true;
    else
        error("invalid play button state!");
    end;
    if l_FFlagLuaAppEnablePlaySquadButton_0 and v30 then
        return v1.createElement(l_ComboButton_0, {
            layoutOrder = l_LayoutOrder_0, 
            size = l_Size_0, 
            button = {
                icon = v33, 
                text = v34, 
                isDisabled = v29, 
                onActivated = if not v29 then l_onPlayButtonActivated_0 else function() --[[ Line: 97 ]]

                end
            }, 
            overflow = {
                icon = v18, 
                isDisabled = v31, 
                onActivated = if not v31 then l_onPlaySquadButtonActivated_0 else function() --[[ Line: 102 ]]

                end
            }, 
            testId = v20.props.testId
        });
    else
        return v1.createElement(l_Button_0, {
            size = l_Size_0, 
            layoutOrder = l_LayoutOrder_0, 
            isLoading = v28, 
            icon = v33, 
            text = v34, 
            buttonType = v32, 
            userInteractionEnabled = not v29, 
            isDisabled = v29, 
            onActivated = if not v29 then l_onPlayButtonActivated_0 else function() --[[ Line: 116 ]]

            end, 
            [v2.Tag] = if v20.props.testId then ("data-testid=%*"):format(v20.props.testId) else nil
        });
    end;
end;
v19.render = function(v35) --[[ Line: 122 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    })(function(v36) --[[ Line: 128 ]]
        -- upvalues: v35 (copy)
        return v35:renderWithLocalization(v36);
    end);
end;
return v19;