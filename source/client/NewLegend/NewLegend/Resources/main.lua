
-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    require "demo1"

    local cclog = function(...)
        print(string.format(...))
    end

    --cclog("result is " .. GAME.test(3, 5))
	cclog("result is ------------------------------------")
    ---------------

    local winSize = CCDirector:sharedDirector():getWinSize()
	GAME.init(winSize.width ,winSize.height)
    --GAME.init(640 ,960)
	GAME.test()
	
end

xpcall(main, __G__TRACKBACK__)
