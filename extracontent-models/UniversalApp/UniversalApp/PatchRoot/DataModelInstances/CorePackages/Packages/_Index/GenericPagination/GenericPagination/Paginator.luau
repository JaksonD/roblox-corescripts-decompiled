local v0 = require(script.Parent.dependencies);
local l_t_0 = v0.t;
local l_LinkedList_0 = v0.LinkedList;
local l_Promise_0 = v0.Promise;
local v4 = {
    llRoot = nil, 
    llIndex = nil, 
    _isFetching = false
};
v4.__index = v4;
local v5 = l_t_0.strictInterface({
    pageSize = l_t_0.number, 
    fetchWithCursor = l_t_0.callback, 
    fetchInit = l_t_0.callback
});
v4.new = function(v6) --[[ Line: 23 ]]
    -- upvalues: v5 (copy), v4 (copy)
    assert(v5(v6));
    local v7 = {};
    for v8, v9 in pairs(v6) do
        v7[v8] = v9;
    end;
    setmetatable(v7, v4);
    v7:_init();
    return v7;
end;
v4._init = function(v10) --[[ Line: 35 ]] --[[ Name: _init ]]
    -- upvalues: l_LinkedList_0 (copy)
    v10._isFetching = true;
    return v10.fetchInit():andThen(function(v11, v12) --[[ Line: 38 ]]
        -- upvalues: v10 (copy), l_LinkedList_0 (ref)
        v10.llRoot = l_LinkedList_0.createNode();
        v10.llIndex = v10.llRoot;
        v10.llIndex:CreatePrevious(v11);
        v10.llIndex:CreateNext(v12);
        v10._isFetching = false;
    end);
end;
v4.getCurrent = function(v13) --[[ Line: 47 ]] --[[ Name: getCurrent ]]
    return v13.llIndex.value or {};
end;
v4.getNext = function(v14) --[[ Line: 51 ]] --[[ Name: getNext ]]
    -- upvalues: l_Promise_0 (copy)
    if v14._isFetching then
        return l_Promise_0.reject("Paginator is currently busy. Please wait.");
    else
        local v15 = v14.llIndex.next.value or "";
        if v15 == "" then
            return l_Promise_0.reject("Next cursor is invalid");
        else
            v14.llIndex = v14.llIndex.next;
            v14._isFetching = true;
            return v14.fetchWithCursor(v15):andThen(function(v16, v17) --[[ Line: 65 ]]
                -- upvalues: v14 (copy)
                v14.llIndex.previous.value = v16;
                if v14.llIndex.next then
                    v14.llIndex.next.value = v17;
                else
                    v14.llIndex:CreateNext(v17);
                end;
                v14._isFetching = false;
            end);
        end;
    end;
end;
v4.getPrevious = function(v18) --[[ Line: 76 ]] --[[ Name: getPrevious ]]
    -- upvalues: l_Promise_0 (copy)
    if v18._isFetching then
        return l_Promise_0.reject("Paginator is currently busy. Please wait.");
    else
        local v19 = v18.llIndex.previous.value or "";
        if v19 == "" then
            return l_Promise_0.reject("Previous cursor is invalid");
        else
            v18.llIndex = v18.llIndex.previous;
            v18._isFetching = true;
            return v18.fetchWithCursor(v19, true):andThen(function(v20, v21) --[[ Line: 90 ]]
                -- upvalues: v18 (copy)
                v18.llIndex.next.value = v21;
                if v18.llIndex.previous then
                    v18.llIndex.previous.value = v20;
                else
                    v18.llIndex:CreatePrevious(v20);
                end;
                v18._isFetching = false;
            end);
        end;
    end;
end;
v4.isFetching = function(v22) --[[ Line: 101 ]] --[[ Name: isFetching ]]
    return v22._isFetching;
end;
return v4;