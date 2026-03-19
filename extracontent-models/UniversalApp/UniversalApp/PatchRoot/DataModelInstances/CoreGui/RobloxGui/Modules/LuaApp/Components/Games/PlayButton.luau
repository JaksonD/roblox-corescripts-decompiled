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
local l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription;
local l_Images_0 = v5.App.ImageSet.Images;
local v15 = l_Images_0["icons/common/play"];
local v16 = l_Images_0["icons/status/private"];
local v17 = l_Images_0["icons/status/unavailable"];
local v18 = l_Images_0["icons/common/robux"];
local v19 = l_Images_0["icons/actions/truncationCollapse"];
local v20 = v1.PureComponent:extend("PlayButton");
v20.validateProps = v3.strictInterface({
    price = v3.number, 
    localizedFiatPrice = v3.string, 
    playButtonState = v3.string, 
    onPlayButtonActivated = v3.callback, 
    onPlaySquadButtonActivated = if l_FFlagLuaAppEnablePlaySquadButton_0 then v3.callback else nil, 
    Size = v3.optional(v3.UDim2), 
    LayoutOrder = v3.optional(v3.number), 
    testId = v3.optional(v3.string)
});
v20.renderWithLocalization = function(v21, v22) --[[ Line: 41 ]] --[[ Name: renderWithLocalization ]]
    -- upvalues: l_FFlagLuaAppEnablePlaySquadButton_0 (copy), l_PlayButtonStates_0 (copy), l_FFlagLuaAppPlayButtonLoadingPrimary_0 (copy), l_ButtonType_0 (copy), v15 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v18 (copy), v16 (copy), v17 (copy), v1 (copy), l_ComboButton_0 (copy), v19 (copy), l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 (copy), l_Button_0 (copy), v2 (copy)
    local l_Size_0 = v21.props.Size;
    local l_LayoutOrder_0 = v21.props.LayoutOrder;
    local l_price_0 = v21.props.price;
    local l_playButtonState_0 = v21.props.playButtonState;
    local l_onPlayButtonActivated_0 = v21.props.onPlayButtonActivated;
    local l_onPlaySquadButtonActivated_0 = v21.props.onPlaySquadButtonActivated;
    local v29 = false;
    local v30 = false;
    local v31 = not l_FFlagLuaAppEnablePlaySquadButton_0 and nil;
    local v32 = not l_FFlagLuaAppEnablePlaySquadButton_0 and nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if l_playButtonState_0 == l_PlayButtonStates_0.Loading then
        v33 = if l_FFlagLuaAppPlayButtonLoadingPrimary_0 then l_ButtonType_0.PrimaryContextual else l_ButtonType_0.Secondary;
        v29 = true;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.Playable then
        v33 = l_ButtonType_0.PrimaryContextual;
        v34 = v15;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == l_PlayButtonStates_0.PlayableWithParty then
        v34 = v15;
        v35 = v22.joinWithParty;
        v31 = true;
    elseif l_GetFFlagIsSquadEnabled_0() and l_playButtonState_0 == l_PlayButtonStates_0.WaitingForParty then
        v34 = v15;
        v35 = v22.waitingForParty;
        v30 = true;
        v32 = true;
        v31 = true;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.PaidAccess then
        v33 = l_ButtonType_0.PrimaryContextual;
        v34 = v18;
        v35 = tostring(l_price_0);
    elseif l_playButtonState_0 == l_PlayButtonStates_0.FiatPaidAccess then
        v33 = l_ButtonType_0.PrimaryContextual;
        v35 = v21.props.localizedFiatPrice;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.ActionNeeded then
        v33 = l_ButtonType_0.PrimarySystem;
        v34 = v16;
        v35 = v22.join;
    elseif l_playButtonState_0 == l_PlayButtonStates_0.UnplayableOther then
        v33 = l_ButtonType_0.Secondary;
        v34 = v17;
        v35 = v22.unavailable;
        v30 = true;
    else
        error("invalid play button state!");
    end;
    if l_FFlagLuaAppEnablePlaySquadButton_0 and v31 then
        return v1.createElement(l_ComboButton_0, {
            layoutOrder = l_LayoutOrder_0, 
            size = l_Size_0, 
            button = {
                icon = v34, 
                text = v35, 
                isDisabled = v30, 
                onActivated = if not v30 then l_onPlayButtonActivated_0 else function() --[[ Line: 99 ]]

                end
            }, 
            overflow = {
                icon = v19, 
                isDisabled = v32, 
                onActivated = if not v32 then l_onPlaySquadButtonActivated_0 else function() --[[ Line: 104 ]]

                end
            }, 
            testId = if l_FFlagUIBloxAddTestIdToComboButtonAndCellTailDescription_0 then v21.props.testId else nil
        });
    else
        return v1.createElement(l_Button_0, {
            size = l_Size_0, 
            layoutOrder = l_LayoutOrder_0, 
            isLoading = v29, 
            icon = v34, 
            text = v35, 
            buttonType = v33, 
            userInteractionEnabled = not v30, 
            isDisabled = v30, 
            onActivated = if not v30 then l_onPlayButtonActivated_0 else function() --[[ Line: 118 ]]

            end, 
            [v2.Tag] = if v21.props.testId then ("data-testid=%*"):format(v21.props.testId) else nil
        });
    end;
end;
v20.render = function(v36) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded", 
        joinWithParty = "Feature.Squads.Action.JoinWithParty", 
        unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable", 
        waitingForParty = "Feature.Squads.Action.WaitingForParty"
    })(function(v37) --[[ Line: 130 ]]
        -- upvalues: v36 (copy)
        return v36:renderWithLocalization(v37);
    end);
end;
return v20;