local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.PeopleService);
local v5 = require(l_Parent_0.SignalsReact);
local l_View_0 = v2.View;
local l_useSignalState_0 = v5.useSignalState;
local v8 = require(l_script_FirstAncestor_0.Components.List.PersonRow);
local v9 = require(l_script_FirstAncestor_0.Components.List.LazyPersonRow);
local _ = require(l_script_FirstAncestor_0.Stores.GetScrollingFrameStore);
local v11 = v4.getService("Flags");
local l_GetFFlagAddPeoplePageCardLayout_0 = v11.GetFFlagAddPeoplePageCardLayout;
local l_FFlagEnablePeopleListLazyRender_0 = v11.FFlagEnablePeopleListLazyRender;
local l_FFlagPeoplePageRemoveUseMemoElements_0 = v11.FFlagPeoplePageRemoveUseMemoElements;
local l_FFlagPeopleListFixMemoryLeak_0 = v11.FFlagPeopleListFixMemoryLeak;
local function v17(v16) --[[ Line: 33 ]] --[[ Name: MemoizedPersonRow ]]
    -- upvalues: v3 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), v9 (copy), v8 (copy)
    return v3.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: l_FFlagEnablePeopleListLazyRender_0 (ref), v3 (ref), v9 (ref), v16 (copy), v8 (ref)
        if l_FFlagEnablePeopleListLazyRender_0 then
            return (v3.createElement(v9, {
                key = tostring(v16.person.UserId), 
                person = v16.person, 
                layoutOrder = v16.index, 
                scrollingFrameStore = v16.scrollingFrameStore
            }));
        else
            return (v3.createElement(v8, {
                key = tostring(v16.person.UserId), 
                person = v16.person, 
                layoutOrder = v16.index
            }));
        end;
    end, {
        v16.person.UserId, 
        v16.index, 
        v16.scrollingFrameStore
    });
end;
local function v33(v18, v19, v20, v21) --[[ Line: 58 ]] --[[ Name: buildPersonRows ]]
    -- upvalues: v3 (copy), v17 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy)
    local v22 = {};
    local v23 = {};
    local v24 = 0;
    if not next(v20) then
        for v25, v26 in v18 do
            v20[v26.UserId] = (v25 - 1) * math.floor(100000 / #v18);
        end;
    end;
    for v27, v28 in v18 do
        if v19[v28.UserId] then
            v22[v28.UserId] = v19[v28.UserId];
            v23[v28.UserId] = v20[v28.UserId];
            v24 = v20[v28.UserId];
        else
            local v29 = 0;
            if v27 ~= 1 then
                local v30 = v27 + 1;
                local v31 = 100000;
                while v30 <= #v18 do
                    local l_UserId_0 = v18[v30].UserId;
                    if v20[l_UserId_0] then
                        v31 = v20[l_UserId_0];
                        break;
                    else
                        v30 = v30 + 1;
                    end;
                end;
                v29 = math.floor((v24 + v31) / 2);
            end;
            v22[v28.UserId] = v3.createElement(v17, {
                person = v28, 
                index = v29, 
                scrollingFrameStore = if l_FFlagEnablePeopleListLazyRender_0 then v21 else nil
            });
            v23[v28.UserId] = v29;
            v24 = v29;
        end;
    end;
    return v22, v23;
end;
local v34 = {};
local v35 = {};
local function v49(v36) --[[ Line: 126 ]] --[[ Name: PeopleList ]]
    -- upvalues: v3 (copy), v4 (copy), l_useSignalState_0 (copy), l_FFlagPeopleListFixMemoryLeak_0 (copy), v33 (copy), l_FFlagEnablePeopleListLazyRender_0 (copy), v34 (ref), v35 (ref), l_View_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy)
    local v37 = v3.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: v4 (ref)
        return v4.getService("PeopleListStore");
    end, {});
    local v38 = l_useSignalState_0(v37.people);
    local v39 = v3.useRef(nil);
    local v40 = nil;
    if l_FFlagPeopleListFixMemoryLeak_0 then
        local v41 = v3.useRef({});
        local v42 = v3.useRef({});
        local v43, v44 = v33(v38, v41.current, v42.current, if l_FFlagEnablePeopleListLazyRender_0 then v36.scrollingFrameStore else nil);
        v41.current = v43;
        v42.current = v44;
        v40 = v41.current;
    else
        local v45, v46 = v33(v38, v34, v35, if l_FFlagEnablePeopleListLazyRender_0 then v36.scrollingFrameStore else nil);
        v34 = v45;
        v35 = v46;
        v3.useEffect(function() --[[ Line: 153 ]]
            -- upvalues: v34 (ref), v35 (ref), v33 (ref), v38 (copy), l_FFlagEnablePeopleListLazyRender_0 (ref), v36 (copy)
            local v47, v48 = v33(v38, v34, v35, if l_FFlagEnablePeopleListLazyRender_0 then v36.scrollingFrameStore else nil);
            v34 = v47;
            v35 = v48;
        end, {
            v38, 
            v36.scrollingFrameStore
        });
        v40 = v34;
    end;
    return v3.createElement(l_View_0, {
        tag = "size-full-0 auto-y col gap-small", 
        LayoutOrder = if l_GetFFlagAddPeoplePageCardLayout_0() then v36.LayoutOrder else 2
    }, {
        PeopleList = v3.createElement(l_View_0, {
            tag = "size-full-0 col gap-small auto-y", 
            ref = v39
        }, {
            v40
        })
    });
end;
if l_FFlagPeoplePageRemoveUseMemoElements_0 then
    return v3.memo(v49);
else
    return v49;
end;