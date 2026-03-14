local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v5 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagShareGameSearchBoxFocusAnalytics);
local v6 = require(l_ShareGame_0.Components.SearchBox);
local v7 = require(l_ShareGame_0.Components.IconButton);
local v8 = require(l_ShareGame_0.Constants);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v11 = require(l_ShareGame_0.Actions.SetSearchAreaActive);
local v12 = require(l_ShareGame_0.Actions.SetSearchText);
local v13 = require(l_RobloxGui_0.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons);
local v14 = require(l_ShareGame_0.getTranslator)();
local l_v13_ImagePath_0 = v13:GetImagePath();
local l_v13_Frame_0 = v13:GetFrame("search_large");
local v17 = v10.font(Enum.Font.SourceSans);
local l_GRAY3_0 = v8.Color.GRAY3;
local v19 = v10.textSize(20);
local v20 = v2.PureComponent:extend("SearchArea");
v20.init = function(v21) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy)
    v21.state = {
        cancelText = v14:FormatByKey("Feature.SettingsHub.Action.CancelSearch")
    };
    v21.searchField = nil;
end;
v20.render = function(v22) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: l_Text_0 (copy), v17 (copy), v19 (copy), v2 (copy), v7 (copy), l_v13_ImagePath_0 (copy), l_v13_Frame_0 (copy), v6 (copy), v5 (copy), l_GRAY3_0 (copy)
    local l_fullWidthSearchBar_0 = v22.props.fullWidthSearchBar;
    local l_searchBoxMargin_0 = v22.props.searchBoxMargin;
    local l_anchorPoint_0 = v22.props.anchorPoint;
    local l_position_0 = v22.props.position;
    local l_zIndex_0 = v22.props.zIndex;
    local l_searchAreaActive_0 = v22.props.searchAreaActive;
    local l_size_0 = v22.props.size;
    local l_cancelText_0 = v22.state.cancelText;
    local v31 = l_Text_0.GetTextWidth(l_cancelText_0, v17, v19);
    local v32 = l_searchBoxMargin_0 + v31;
    local l_setSearchText_0 = v22.props.setSearchText;
    if l_fullWidthSearchBar_0 then
        return v2.createElement("Frame", {
            AnchorPoint = l_anchorPoint_0, 
            Position = l_position_0, 
            Size = l_size_0, 
            BackgroundTransparency = 1, 
            ZIndex = l_zIndex_0
        }, {
            SearchButton = v2.createElement(v7, {
                visible = not l_searchAreaActive_0, 
                anchorPoint = l_anchorPoint_0, 
                position = l_position_0, 
                size = UDim2.new(0, 44, 0, 44), 
                zIndex = l_zIndex_0, 
                iconHorizontalAlignment = Enum.HorizontalAlignment.Right, 
                iconSpritePath = l_v13_ImagePath_0, 
                iconSpriteFrame = l_v13_Frame_0, 
                onClick = function(_) --[[ Line: 82 ]] --[[ Name: onClick ]]
                    -- upvalues: v22 (copy)
                    v22.props.setSearchAreaActive(true);
                end
            }), 
            SearchBox = v2.createElement(v6, {
                anchorPoint = Vector2.new(0, 0.5), 
                position = UDim2.new(0, 0, 0.5, 0), 
                size = UDim2.new(1, -v32, 0, 28), 
                zIndex = l_zIndex_0, 
                visible = l_searchAreaActive_0, 
                modalFocused = l_searchAreaActive_0, 
                onTextChanged = l_setSearchText_0, 
                onTextBoxFocused = function() --[[ Line: 96 ]] --[[ Name: onTextBoxFocused ]]
                    -- upvalues: v5 (ref), v22 (copy)
                    if v5() and v22.props.analytics then
                        v22.props.analytics:onSearchFocused();
                    end;
                end, 
                onTextBoxFocusLost = function(v35) --[[ Line: 101 ]] --[[ Name: onTextBoxFocusLost ]]
                    -- upvalues: v22 (copy)
                    if v35 == "" then
                        v22.props.setSearchAreaActive(false);
                    end;
                end, 
                searchFieldRef = function(v36) --[[ Line: 106 ]] --[[ Name: searchFieldRef ]]
                    -- upvalues: v22 (copy)
                    v22.searchField = v36;
                end
            }), 
            Cancel = v2.createElement("TextButton", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, v31, 1, 0), 
                TextSize = v19, 
                TextColor3 = l_GRAY3_0, 
                Font = v17, 
                ZIndex = l_zIndex_0, 
                Visible = l_searchAreaActive_0, 
                [v2.Ref] = function(v37) --[[ Line: 121 ]]
                    -- upvalues: l_cancelText_0 (copy), v22 (copy)
                    if v37 then
                        v37.Text = l_cancelText_0;
                        if not v22.textConnection then
                            v22.textConnection = v37:GetPropertyChangedSignal("Text"):connect(function() --[[ Line: 131 ]]
                                -- upvalues: v22 (ref), v37 (copy)
                                v22:setState({
                                    cancelText = v37.Text
                                });
                            end);
                        end;
                    end;
                end, 
                [v2.Event.Activated] = function(_) --[[ Line: 139 ]]
                    -- upvalues: v22 (copy)
                    v22.props.setSearchAreaActive(false);
                end
            })
        });
    else
        return v2.createElement(v6, {
            anchorPoint = Vector2.new(1, 0.5), 
            position = UDim2.new(1, 0, 0.5, 0), 
            size = UDim2.new(0, 177, 0, 28), 
            zIndex = l_zIndex_0, 
            onTextChanged = l_setSearchText_0, 
            searchFieldRef = function(v39) --[[ Line: 155 ]] --[[ Name: searchFieldRef ]]
                -- upvalues: v22 (copy)
                v22.searchField = v39;
            end
        });
    end;
end;
v20.didUpdate = function(v40, v41) --[[ Line: 162 ]] --[[ Name: didUpdate ]]
    local l_fullWidthSearchBar_1 = v40.props.fullWidthSearchBar;
    if v40.searchField then
        if not v40.props.isPageOpen and v41.isPageOpen then
            spawn(function() --[[ Line: 170 ]]
                -- upvalues: l_fullWidthSearchBar_1 (copy), v40 (copy)
                if l_fullWidthSearchBar_1 then
                    v40.props.setSearchAreaActive(false);
                    return;
                else
                    v40.searchField.Text = "";
                    return;
                end;
            end);
        end;
        if l_fullWidthSearchBar_1 then
            local l_searchAreaActive_1 = v40.props.searchAreaActive;
            local l_searchAreaActive_2 = v41.searchAreaActive;
            if l_searchAreaActive_1 and not l_searchAreaActive_2 then
                v40.searchField:CaptureFocus();
                return;
            elseif not l_searchAreaActive_1 and l_searchAreaActive_2 then
                v40.searchField.Text = "";
            end;
        end;
    end;
end;
return (v3.UNSTABLE_connect2(function(v45, _) --[[ Line: 194 ]]
    return {
        isPageOpen = v45.Page.IsOpen, 
        searchAreaActive = v45.ConversationsSearch.SearchAreaActive
    };
end, function(v47) --[[ Line: 199 ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        setSearchAreaActive = function(v48) --[[ Line: 201 ]] --[[ Name: setSearchAreaActive ]]
            -- upvalues: v47 (copy), v11 (ref)
            v47(v11(v48));
        end, 
        setSearchText = function(v49) --[[ Line: 204 ]] --[[ Name: setSearchText ]]
            -- upvalues: v47 (copy), v12 (ref)
            v47(v12(v49));
        end
    };
end)(v20));