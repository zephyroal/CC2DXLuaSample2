

GAME = {}

--测试
GAME.test = function()
	SCENE.loadScene(SCENE.defScene);
	return true
end

--初始化
GAME.init = function(width,height)
	require "common"
	require "demo1Scene"
	SCENE.init(width,height)
	GAME.touchBeginPoint = nil
	--SCENE.loadScene(SCENE.defScene);	
	--设置游戏帧循环响应回调函数	
	CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(GAME.update, 0, false)
	return true
end

--帧响应-------------------------------------------------------------------------------------------------------
GAME.update = function()
	local delTime = 1.0/60.0;
	SCENE.update(delTime)
end


--[[--消息响应-----------------------------------------------------------------------------------------------------
GAME.onTouchBegan = function(x,y)
	GAME.touchBeginPoint ={x = x, y = y}
	return true
end

GAME.onTouchMoved = function(x,y)
	if GAME.touchBeginPoint then
		GAME.touchBeginPoint ={x = x, y = y}
	end
	return true
end

GAME.onTouchEnded = function(x,y)
	GAME.touchBeginPoint = nil
	return true
end

GAME.onTouch = function(x,y)
	
	return true
end--]]

