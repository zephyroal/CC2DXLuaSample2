
SCENE = {}

--初始化
SCENE.init = function(width,height)
	require "SCENE_LOADING"
	require "SCENE_GAME"
	SCENE.defScene		= SCENE_GAME
	SCENE.curScene		= nil
	SCENE.width			= width;
	SCENE.height			= height;
	return true
end

--加载Scene
SCENE.loadScene = function(scene)
	if SCENE.curScene ~= scene  then
		SCENE.curScene = scene
		SCENE.curScene.loadScene(SCENE.width,SCENE.height)		
		local runningScene = CCDirector:sharedDirector():getRunningScene()
		if runningScene == nil then
			CCDirector:sharedDirector():runWithScene(SCENE.curScene.scene)
		else
			CCDirector:sharedDirector():replaceScene(SCENE.curScene.scene)
		end	
	end
	return true
end

--帧响应-------------------------------------------------------------------------------------------------------
SCENE.update = function(delTime)
	if SCENE.curScene  ~= nil then
		SCENE.curScene.update(delTime)
		if SCENE.curScene.isEnd() == 1 then
			SCENE.loadScene(SCENE_GAME)
		end
	end
end

