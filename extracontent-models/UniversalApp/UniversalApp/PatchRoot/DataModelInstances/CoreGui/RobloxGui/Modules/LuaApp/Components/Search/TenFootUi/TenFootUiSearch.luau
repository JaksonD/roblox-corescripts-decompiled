local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local v6 = require(l_Modules_0.LuaApp.SearchUuid);
local v7 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v8 = require(script.Parent.TenFootUiSearchTypeSelector);
local v9 = require(script.Parent.TenFootUiSearchBar);
local v10 = require(script.Parent.TenFootUiSearchExperiencesGrid);
local v11 = require(script.Parent.TenFootUiSearchPlayersGrid);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v14 = require(l_CorePackages_0.Packages.InputHandlers);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
return function(_) --[[ Line: 24 ]] --[[ Name: TenFootUiSearch ]]
    -- upvalues: l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v2 (copy), l_useNavigationProps_0 (copy), l_SearchTypes_0 (copy), v6 (copy), l_FocusNavigationEventNameEnum_0 (copy), v13 (copy), v14 (copy), v7 (copy), v9 (copy), v8 (copy), v10 (copy), v11 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useDesignTokens_0();
    local v19, v20 = v2.useState("");
    local v24 = l_useNavigationProps_0(function(_, _, v23) --[[ Line: 29 ]]
        -- upvalues: l_SearchTypes_0 (ref)
        return v23.getParam("defaultSearchType", l_SearchTypes_0.Games);
    end);
    local v25, v26 = v2.useState(v24);
    local v27, v28 = v2.useState(v6());
    local v29 = v2.useRef(nil);
    local v30 = v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward
        };
    end, {});
    local v31 = v13.useEventMap(v30, v29);
    local v34 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v14 (ref), v25 (copy), l_SearchTypes_0 (ref), v26 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v14.onRelease(function(_) --[[ Line: 50 ]]
                    -- upvalues: v25 (ref), l_SearchTypes_0 (ref), v26 (ref)
                    if v25 ~= l_SearchTypes_0.Games then
                        v26(l_SearchTypes_0.Games);
                    end;
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v14.onRelease(function(_) --[[ Line: 58 ]]
                    -- upvalues: v25 (ref), l_SearchTypes_0 (ref), v26 (ref)
                    if v25 ~= l_SearchTypes_0.Players then
                        v26(l_SearchTypes_0.Players);
                    end;
                end)
            }
        };
    end, {
        v25, 
        v26
    });
    local v35 = v13.useEventHandlerMap(v34, v31);
    v2.useEffect(function() --[[ Line: 70 ]]
        -- upvalues: v19 (copy), v17 (copy), v7 (ref), v27 (copy)
        local v36 = {
            isKeywordSuggestionEnabled = false, 
            searchKeyword = v19
        };
        v17(v7(v27, v36));
    end, {
        v19, 
        v27
    });
    local function v38(v37) --[[ Line: 82 ]]
        -- upvalues: v25 (copy), l_SearchTypes_0 (ref), v26 (copy)
        if v25 ~= l_SearchTypes_0.Games and v25 ~= l_SearchTypes_0.Players then
            warn("Invalid search type: " .. tostring(v37));
        end;
        if v37 == v25 then
            return;
        else
            v26(v37);
            return;
        end;
    end;
    local v39 = v2.createRef();
    v2.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v39 (copy)
        if v39.current then
            v39.current:CaptureFocus();
        end;
    end, {});
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 2, 
        ref = v35, 
        BackgroundTransparency = v18.Semantic.Color.Common.Overlay.Transparency, 
        BackgroundColor3 = v18.Semantic.Color.Common.Overlay.Color3, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v18.LuaApps.Search.SearchPaddingVertical), 
            PaddingRight = UDim.new(0, v18.LuaApps.Search.SearchPaddingVertical), 
            PaddingTop = UDim.new(0, v18.LuaApps.Search.SearchPaddingVertical)
        }), 
        SearchBox = v2.createElement(v9, {
            layoutOrder = 1, 
            textBoxRef = v39, 
            onFocused = function() --[[ Line: 122 ]] --[[ Name: onFocused ]]

            end, 
            onSubmitSearch = function(v40) --[[ Line: 123 ]] --[[ Name: onSubmitSearch ]]
                -- upvalues: v19 (copy), v28 (copy), v6 (ref), v20 (copy)
                if v40.Text ~= v19 then
                    v28(v6());
                    v20(v40.Text);
                end;
            end
        }), 
        SearchTypeSelector = v2.createElement(v8, {
            layoutOrder = 2, 
            onSearchTypeSelected = v38, 
            searchType = v25
        }), 
        ExperiencesGrid = v2.createElement(v10, {
            layoutOrder = 3, 
            searchType = v25, 
            searchUuid = v27, 
            searchKeyword = v19
        }), 
        PlayersGrid = v2.createElement(v11, {
            layoutOrder = 4, 
            searchType = v25, 
            searchKeyword = v19
        })
    });
end;