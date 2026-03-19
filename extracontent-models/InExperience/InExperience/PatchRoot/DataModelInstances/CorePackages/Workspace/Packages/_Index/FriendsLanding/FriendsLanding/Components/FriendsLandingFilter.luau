local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_memoize_0 = v1.memoize;
local l_TextService_0 = v1.TextService;
local l_withLocalization_0 = v1.withLocalization;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_SmallRadioButtonGroup_0 = l_UIBlox_0.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v12 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v15 = require(l_script_FirstAncestor_0.Friends.makeFilterButtons);
local v16 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v17 = require(script.navigationParamKeys);
local l_InputHandlers_0 = v1.InputHandlers;
local l_FocusNavigationUtils_0 = v1.FocusNavigationUtils;
local l_FocusNavigableSurfaceWrapper_0 = l_FocusNavigationUtils_0.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = l_FocusNavigationUtils_0.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = l_FocusNavigationUtils_0.FocusNavigationEventNameEnum;
local v23 = l_Roact_0.PureComponent:extend("FriendsLandingFilter");
v23.defaultProps = {
    analytics = nil, 
    navigation = nil
};
v23.init = function(v24) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_FocusNavigationEventNameEnum_0 (copy), l_InputHandlers_0 (copy), l_memoize_0 (copy), v13 (copy), v16 (copy), l_TextService_0 (copy), v17 (copy)
    v24.state = {
        selectedValue = v24.props.filter
    };
    v24.onClose = function() --[[ Line: 52 ]]
        -- upvalues: v24 (copy)
        v24.props.navigation.goBack();
    end;
    v24.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = l_InputHandlers_0.onRelease(function(v25) --[[ Line: 58 ]]
                -- upvalues: v24 (copy)
                v24.onClose();
                v25:cancel();
            end)
        }
    };
    v24.onApply = l_memoize_0(function(v26) --[[ Line: 65 ]]
        -- upvalues: v24 (copy), v13 (ref), v16 (ref)
        return function() --[[ Line: 66 ]]
            -- upvalues: v24 (ref), v13 (ref), v26 (copy), v16 (ref)
            v24.props.analytics:buttonClick(v13.FriendFilterApply, {
                filter = v24.state.selectedValue
            });
            v26(v24.state.selectedValue);
            v24.onClose();
            if v24.state.selectedValue == v16.Inactive then
                v24.onFewestInteractionsSelection()();
            end;
        end;
    end);
    v24.setSelectedValue = function(v27) --[[ Line: 78 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            selectedValue = v27
        });
    end;
    v24.onCurrentSelected = function(v28) --[[ Line: 84 ]]
        -- upvalues: v24 (copy)
        return v28 == v24.state.selectedValue;
    end;
    v24.getAlertPlacement = function(v29, v30, v31, v32) --[[ Line: 88 ]]
        -- upvalues: l_TextService_0 (ref)
        local v33 = 0;
        local v34 = "";
        for v35, v36 in ipairs(v30) do
            if v36.id == v29 then
                v33 = v35;
                v34 = v36.text;
                break;
            end;
        end;
        assert(v33 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons");
        local v37 = v32.Header2.RelativeSize * v32.BaseSize;
        local v38 = 24 + l_TextService_0:GetTextSize(v34, v37, v32.Header2.Font, Vector2.new(10000, 10000)).X + 12;
        local v39 = (v33 - 1) * 57 + math.floor(28 - v31 / 2);
        return UDim2.fromOffset(v38, v39);
    end;
    v24.showInactiveFilterOption = function() --[[ Line: 119 ]]
        -- upvalues: v24 (copy), v17 (ref)
        if v24.props.navigation.getParam then
            return (v24.props.navigation.getParam(v17.ShowInactiveFilterOption));
        else
            return nil;
        end;
    end;
    v24.onFewestInteractionsSelection = function() --[[ Line: 125 ]]
        -- upvalues: v24 (copy), v17 (ref)
        if v24.props.navigation.getParam then
            return (v24.props.navigation.getParam(v17.OnFewestInteractionsSelection));
        else
            return nil;
        end;
    end;
end;
v23.render = function(v40) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v15 (copy), l_Roact_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_SmallRadioButtonGroup_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 133 ]]
        -- upvalues: l_withLocalization_0 (ref), v15 (ref), v40 (copy), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ButtonType_0 (ref), l_SmallRadioButtonGroup_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref)
        return l_withLocalization_0({
            apply = "CommonUI.Messages.Action.Apply", 
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline", 
            filterBy = "Feature.Friends.Heading.FilterBy", 
            upsellNew = "Feature.Catalog.Label.New"
        })(function(v42) --[[ Line: 143 ]]
            -- upvalues: v15 (ref), v40 (ref), l_Roact_0 (ref), l_PartialPageModal_0 (ref), l_ButtonType_0 (ref), l_SmallRadioButtonGroup_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref)
            local v43 = v15(v42, v40.showInactiveFilterOption());
            local v44 = l_Roact_0.createElement(l_PartialPageModal_0, {
                title = v42.filterBy, 
                screenSize = v40.props.screenSize, 
                onCloseClicked = v40.onClose, 
                marginSize = 0, 
                buttonStackProps = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = v40.onCurrentSelected(v40.props.filter), 
                                onActivated = v40.onApply(v40.props.setFilterKeys), 
                                text = v42.apply
                            }
                        }
                    }
                }
            }, {
                ButtonContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, #v43 * 58 + 20), 
                    BackgroundTransparency = 1
                }, {
                    RadioButtons = l_Roact_0.createElement(l_SmallRadioButtonGroup_0, {
                        onActivated = v40.setSelectedValue, 
                        selectedValue = v40.state.selectedValue, 
                        items = v43
                    })
                })
            });
            return (l_Roact_0.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                isIsolated = true, 
                customEventHandlers = v40.focusEventHandlers
            }, {
                Modal = v44
            }));
        end);
    end);
end;
return l_compose_0(v12.connect(function(v45) --[[ Line: 187 ]]
    return {
        analytics = v45
    };
end), v14.connect(function(v46, _) --[[ Line: 192 ]]
    return {
        filter = v46.filter, 
        screenSize = v46.screenSize, 
        setFilterKeys = v46.setFilterKeys
    };
end))(v23);