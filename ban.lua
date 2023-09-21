function sampev.onSendCommand(msg)
    if msg:find("%/banip (.+) (.+)") or msg:find("%/ban (.+) %d+ (.+)")  then
        if msg:find("/banip ") then
            if msg:find("//") or msg:find("|") then
                id, pric = msg:match("/banip (.+) (.+ %/%/ .+)") 
            else
                id, pric = msg:match("/banip (.+) (.+)") 
            end
            if id:find("(%w)_(%w)") then
                addbanoff(id, pric, 1)
            elseif sampIsPlayerConnected(id) then
                nickn = sampGetPlayerNickname(id)
                addbanoff(nickn, pric, 1)
            end
        else
            if msg:find("//") or msg:find("|") then
                id, pric = msg:match("/ban (.+) %d+ (.+ %/%/ .+)") 
            else
                id, pric = msg:match("/ban (.+) %d+ (.+)") 
            end
            if id:find("(%w)_(%w)") then
                addbanoff(id, pric, 2)
            elseif sampIsPlayerConnected(id) then
                nickn = sampGetPlayerNickname(id)
                addbanoff(nickn, pric, 2)
            end
        end
    end
end