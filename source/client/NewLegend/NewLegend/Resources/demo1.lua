

GAME = {}

--����
GAME.test = function()
	SCENE.loadScene(SCENE.defScene);
	return true
end

--��ʼ��
GAME.init = function(width,height)
	require "common"
	require "demo1Scene"
	SCENE.init(width,height)
	GAME.touchBeginPoint = nil
	--SCENE.loadScene(SCENE.defScene);	
	--������Ϸ֡ѭ����Ӧ�ص�����	
	CCDirector:sharedDirector():getScheduler():scheduleScriptFunc(GAME.update, 0, false)
	return true
end

--֡��Ӧ-------------------------------------------------------------------------------------------------------
GAME.update = function()
	local delTime = 1.0/60.0;
	SCENE.update(delTime)
end


--[[--��Ϣ��Ӧ-----------------------------------------------------------------------------------------------------
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

