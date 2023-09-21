local sampev = require "lib.samp.events"

function upper_count(s)
    local count = 0
    for c in string.gmatch(s, '[A-ZА-Я]') do
        count = count + 1
    end
    return count
end

function caps_coefficient(s, length)
    return upper_count(s) / length
end

function sampev.onServerMessage(color, text)
  local nick, id, msg = text:match("(.+)%[(%d+)%]:(.+)")
  local length = string.len(msg)
  if caps_coefficient(msg, length) > 0.5 then
    sampAddChatMessage("<Warning> "..nick.." ["..id.."] Капсит!", -1)
  end
end