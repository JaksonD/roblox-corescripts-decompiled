local l_script_FirstAncestor_0 = script:FindFirstAncestor("Groups");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ScrollView_0 = v3.ScrollView;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local v9 = require(l_script_FirstAncestor_0.Common.TextKeys);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local v11 = require(script.Parent.GroupsListToolbar);
local v12 = require(script.Parent.GroupsListSection);
local v13 = require(script.Parent.GroupsListHeader);
local v14 = require(script.Parent.GroupListItemSkeleton);
local v15 = table.freeze({});
local function v18() --[[ Line: 33 ]] --[[ Name: renderSkeletons ]]
    -- upvalues: v2 (copy), v14 (copy)
    local v16 = {};
    for v17 = 1, 3 do
        v16[("Skeleton_%*"):format(v17)] = v2.createElement(v14, {
            layoutOrder = v17
        });
    end;
    return v16;
end;
return function(v19) --[[ Line: 43 ]] --[[ Name: GroupsList ]]
    -- upvalues: l_useLocalization_0 (copy), v9 (copy), v15 (copy), v2 (copy), l_View_0 (copy), v18 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), v12 (copy), v13 (copy), v11 (copy), l_Text_0 (copy)
    local v20 = l_useLocalization_0({
        primaryHeading = v9.HeadingPrimary, 
        myGroupsHeading = v9.HeadingMyGroups, 
        loadFailure = v9.MessageLoadGroupListError, 
        notInGroups = v9.MessageNotInAnyGroups, 
        noResults = v9.MessageNoGroupsFound
    });
    local v21 = v19.groupsList or v15;
    local v22, v23 = v2.useState("");
    local v24 = v2.useRef(nil);
    local v27 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v21 (copy)
        for _, v26 in ipairs(v21) do
            if v26.isPrimary then
                return v26;
            end;
        end;
        return nil;
    end, {
        v21
    });
    local v31 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v27 (copy), v21 (copy)
        if not v27 then
            return v21;
        else
            local v28 = {};
            for _, v30 in ipairs(v21) do
                if v30 ~= v27 then
                    table.insert(v28, v30);
                end;
            end;
            return v28;
        end;
    end, {
        v21, 
        v27
    });
    local v32 = v2.useMemo(function() --[[ Line: 79 ]]
        -- upvalues: v27 (copy)
        if v27 then
            return {
                v27
            };
        else
            return {};
        end;
    end, {
        v27
    });
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v22 (copy), v24 (copy)
        if v22 ~= "" and v24.current then
            v24.current.CanvasPosition = Vector2.new(0, 0);
        end;
    end, {
        v22
    });
    local v33 = v22 ~= "";
    local v39 = v2.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v33 (copy), v22 (copy), v21 (copy)
        if not v33 then
            return nil;
        else
            local v34 = string.lower(v22);
            local v35 = {};
            for _, v37 in ipairs(v21) do
                local v38 = string.lower(v37.name or "");
                if string.find(v38, v34, 1, true) then
                    v35[v37.id] = true;
                end;
            end;
            return v35;
        end;
    end, {
        v21, 
        v22
    });
    local v40 = v33 and v39 ~= nil and next(v39) == nil;
    local v41 = v2.useMemo(function() --[[ Line: 111 ]]
        -- upvalues: v19 (copy), v20 (copy), v21 (copy), v40 (copy)
        if v19.isLoading or not v19.groupsList then
            return nil;
        elseif v19.loadFailure then
            return v20.loadFailure;
        elseif #v21 == 0 then
            return v20.notInGroups;
        elseif v40 then
            return v20.noResults;
        else
            return nil;
        end;
    end, {
        v19.isLoading, 
        v19.groupsList, 
        v19.loadFailure, 
        v20, 
        v21, 
        v40
    });
    local v42 = v19.isLoading and #v21 == 0;
    local v43 = true;
    if #v32 <= 0 then
        v43 = #v31 > 0;
    end;
    local v44 = if v42 then v2.createElement(l_View_0, {
        tag = "col padding-small gap-small", 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, (v18())) else if v43 then v2.createElement(l_ScrollView_0, {
        scroll = {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(1, 0, 0, 0), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            scrollBarVisibility = l_ScrollBarVisibility_0.Auto, 
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
        }, 
        scrollingFrameRef = v24, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        ListWrapper = v2.createElement(l_View_0, {
            tag = "col gap-xlarge", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            PrimarySection = v2.createElement(v12, {
                layoutOrder = 1, 
                heading = v20.primaryHeading, 
                groups = v32, 
                showRank = true, 
                showMemberCount = true, 
                visibleIds = if v33 then v39 else nil
            }), 
            OtherGroupsSection = v2.createElement(v12, {
                layoutOrder = 2, 
                heading = if #v32 > 0 then v20.myGroupsHeading else nil, 
                groups = v31, 
                showRank = true, 
                showMemberCount = true, 
                visibleIds = if v33 then v39 else nil
            })
        })
    }) else nil;
    return v2.createElement(l_View_0, {
        LayoutOrder = v19.layoutOrder, 
        tag = "col gap-xlarge", 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        Header = v2.createElement(v13, {
            layoutOrder = 1
        }), 
        Toolbar = v2.createElement(v11, {
            layoutOrder = 2, 
            canCreateGroup = v19.canCreateGroup, 
            onSearchTextChanged = v23
        }), 
        Disclaimer = v41 and v2.createElement(l_Text_0, {
            LayoutOrder = 3, 
            Text = v41, 
            tag = "content-muted text-align-x-left text-body-medium"
        }) or nil, 
        List = v44 and v2.createElement(l_View_0, {
            LayoutOrder = 4, 
            tag = "fill", 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ListContent = v44
        }) or nil
    });
end;