return function() --[[ Line: 6 ]] --[[ Name: waitForEvents ]]
    task.defer(coroutine.running());
    coroutine.yield();
end;