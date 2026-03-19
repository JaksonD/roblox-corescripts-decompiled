local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_t_0 = v3.t;
local l_RoactRodux_0 = v3.RoactRodux;
local l_Cryo_0 = v3.Cryo;
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Constants);
local v10 = require(l_Parent_0.Utility.Promise);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Components.Page);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local v14 = require(l_Parent_0.Components.PageNavigationWatcher);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.Connection.RootedConnection);
local v17 = require(script.InviteFriendsList);
local v18 = require(script.AddFriendsNow);
local v19 = require(script.LoadingFriendsError);
local v20 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v21 = l_Roact_0.PureComponent:extend("InviteFriendsPage");
v21.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    PlayersService = l_t_0.union(l_t_0.Instance, l_t_0.table), 
    menuPage = v20() and l_t_0.string or nil
});
v21.defaultProps = {
    PlayersService = l_Players_0
};
v21.init = function(v22) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v22.backButtonRef = l_Roact_0.createRef();
    v22.searchBoxRef = l_Roact_0.createRef();
    v22.state = {
        loadingFriends = true, 
        loadingFriendsError = false, 
        friends = {}
    };
end;
v21.renderLoadingPage = function(_) --[[ Line: 54 ]] --[[ Name: renderLoadingPage ]]
    -- upvalues: v11 (copy), l_Roact_0 (copy), v13 (copy)
    return v11({
        loading = "CoreScripts.InGameMenu.InviteFriends.Loading"
    })(function(v24) --[[ Line: 57 ]]
        -- upvalues: l_Roact_0 (ref), v13 (ref)
        return l_Roact_0.createElement(v13, {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v24.loading, 
            fontKey = "Header1", 
            themeKey = "TextEmphasis"
        });
    end);
end;
v21.renderError = function(v25) --[[ Line: 68 ]] --[[ Name: renderError ]]
    -- upvalues: l_Roact_0 (copy), v19 (copy)
    return l_Roact_0.createElement(v19, {
        onRetry = function() --[[ Line: 70 ]] --[[ Name: onRetry ]]
            -- upvalues: v25 (copy)
            v25:setState({
                loadingFriends = true, 
                loadingFriendsError = false
            });
            v25:loadFriends();
        end, 
        canCaptureFocus = v25.props.canCaptureFocus
    });
end;
v21.renderNoFriends = function(v26) --[[ Line: 81 ]] --[[ Name: renderNoFriends ]]
    -- upvalues: l_Roact_0 (copy), v18 (copy)
    return l_Roact_0.createElement(v18, {
        canCaptureFocus = v26.props.canCaptureFocus
    });
end;
local function v29(v27, v28) --[[ Line: 87 ]] --[[ Name: sortFriends ]]
    if v27.IsOnline == v28.IsOnline then
        return v27.Username:lower() < v28.Username:lower();
    else
        return v27.IsOnline and not v28.IsOnline;
    end;
end;
v21.renderFriends = function(v30) --[[ Line: 95 ]] --[[ Name: renderFriends ]]
    -- upvalues: l_Roact_0 (copy), v17 (copy)
    return l_Roact_0.createElement(v17, {
        friends = v30.state.friends, 
        canCaptureFocus = v30.props.canCaptureFocus, 
        searchBoxRef = v30.searchBoxRef
    });
end;
v21.render = function(v31) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy), v16 (copy), v15 (copy), v20 (copy), l_GuiService_0 (copy), v12 (copy)
    local l_state_0 = v31.state;
    local v33 = {
        Watcher = l_Roact_0.createElement(v14, {
            desiredPage = "InviteFriends", 
            onNavigateTo = function() --[[ Line: 108 ]] --[[ Name: onNavigateTo ]]
                -- upvalues: v31 (copy)
                v31:loadFriends();
            end
        })
    };
    if l_state_0.loadingFriends then
        v33.Loading = v31:renderLoadingPage();
    elseif l_state_0.loadingFriendsError then
        v33.ErrorLoading = v31:renderError();
    elseif #l_state_0.friends == 0 then
        v33.NoFriends = v31:renderNoFriends();
    else
        v33.FriendsList = v31:renderFriends();
    end;
    return l_Roact_0.createElement(v16, {
        render = function(v34) --[[ Line: 125 ]] --[[ Name: render ]]
            -- upvalues: l_Roact_0 (ref), v15 (ref), v20 (ref), v31 (copy), l_state_0 (copy), l_GuiService_0 (ref), v12 (ref), v33 (copy)
            return l_Roact_0.createElement(v15, {
                shouldForgetPreviousSelection = v20() and v31.props.menuPage ~= "InviteFriends" or nil, 
                isFocused = v31.props.canCaptureFocus and l_state_0.loadingFriends and v34, 
                didFocus = function() --[[ Line: 132 ]] --[[ Name: didFocus ]]
                    -- upvalues: l_GuiService_0 (ref), v31 (ref)
                    l_GuiService_0.SelectedCoreObject = v31.backButtonRef:getValue();
                end
            }, {
                Page = l_Roact_0.createElement(v12, {
                    pageTitle = v31.props.pageTitle, 
                    buttonRef = v31.backButtonRef, 
                    NextSelectionDown = v31.searchBoxRef
                }, v33)
            });
        end
    });
end;
v21.didMount = function(v35) --[[ Line: 146 ]] --[[ Name: didMount ]]
    v35.mounted = true;
    v35:loadFriends();
end;
v21.loadFriends = function(v36) --[[ Line: 151 ]] --[[ Name: loadFriends ]]
    -- upvalues: v10 (copy), l_Cryo_0 (copy), v29 (copy)
    v10.new(function(v37, v38) --[[ Line: 152 ]]
        -- upvalues: v36 (copy), l_Cryo_0 (ref), v29 (ref)
        coroutine.wrap(function() --[[ Line: 153 ]]
            -- upvalues: v36 (ref), v38 (copy), l_Cryo_0 (ref), v29 (ref), v37 (copy)
            local l_LocalPlayer_0 = v36.props.PlayersService.LocalPlayer;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 155 ]]
                -- upvalues: v36 (ref), l_LocalPlayer_0 (copy)
                return v36.props.PlayersService:GetFriendsAsync(l_LocalPlayer_0.UserId);
            end);
            if not l_status_0 then
                v38("Error loading friends");
                return;
            else
                local v42 = {};
                while true do
                    for _, v44 in ipairs(l_result_0:GetCurrentPage()) do
                        v42[#v42 + 1] = {
                            IsOnline = v44.IsOnline, 
                            Id = v44.Id, 
                            Username = v44.Username, 
                            DisplayName = v44.DisplayName, 
                            itemRef = nil
                        };
                    end;
                    if not l_result_0.IsFinished then
                        if not pcall(function() --[[ Line: 178 ]]
                            -- upvalues: l_result_0 (copy)
                            l_result_0:AdvanceToNextPageAsync();
                        end) then
                            v38("Error loading friends");
                            return;
                        end;
                    else
                        v42 = l_Cryo_0.List.sort(v42, v29);
                        v37(v42);
                        return;
                    end;
                end;
            end;
        end)();
    end):andThen(function(v45) --[[ Line: 194 ]]
        -- upvalues: v36 (copy)
        if v36.mounted then
            v36:setState({
                loadingFriends = false, 
                friends = v45
            });
        end;
    end):catch(function() --[[ Line: 202 ]]
        -- upvalues: v36 (copy)
        if v36.mounted then
            v36:setState({
                loadingFriends = false, 
                loadingFriendsError = true
            });
        end;
    end);
end;
v21.willUnmount = function(v46) --[[ Line: 212 ]] --[[ Name: willUnmount ]]
    v46.mounted = false;
end;
return l_RoactRodux_0.connect(function(v47, _) --[[ Line: 216 ]]
    -- upvalues: v9 (copy), v20 (copy)
    local v49 = false;
    if v47.menuPage == "InviteFriends" then
        v49 = v47.isMenuOpen and v47.displayOptions.inputType == v9.InputType.Gamepad and not v47.respawn.dialogOpen and v47.currentZone == 1;
    end;
    return {
        canCaptureFocus = v49, 
        menuPage = v20() and v47.menuPage or nil
    };
end)(v21);