
SCENE_LOADING = {}
SCENE_LOADING.layerFarm 	= nil		--层
SCENE_LOADING.scene			= nil		--场景

--初始化
SCENE_LOADING.loadScene = function(width,height)
	if SCENE_LOADING.isLoad == true then	
		return true
	end
	SCENE_LOADING.width 	= width
	SCENE_LOADING.height 	= height
	SCENE_LOADING.tolTime= 0
	
	SCENE_LOADING.layerFarm = CCLayer:create()
	-- add in farm background
	local bg = CCSprite:create("farm.jpg")
	bg:setPosition(width / 2 + 80, height / 2)
	SCENE_LOADING.layerFarm:addChild(bg)
	
	local animate,frame = COMMON.creatAni("dog.png",105,95,2,0.5)
	SCENE_LOADING.testSprite = COMMON.creatSpriteFromAni( animate  ,frame, 100,100 )
	SCENE_LOADING.layerFarm:addChild(SCENE_LOADING.testSprite)
				
    SCENE_LOADING.scene = CCScene:create()
    SCENE_LOADING.scene:addChild(SCENE_LOADING.layerFarm)
	
	SCENE_LOADING.isLoad = true
	return true
end

--场景结束
SCENE_LOADING.isEnd = function()
	return SCENE_LOADING.endFlag
end

--帧响应-------------------------------------------------------------------------------------------------------
SCENE_LOADING.update = function(delTime)
    if SCENE_LOADING.isLoad == nil then	
		return false
	end	
	
	SCENE_LOADING.tolTime = SCENE_LOADING.tolTime+delTime
	
	local x, y = SCENE_LOADING.testSprite:getPosition()
	if x > SCENE_LOADING.width then
		x = 0
	else
		x = x + 1
	end
	
	if SCENE_LOADING.tolTime>2.0 then	
		SCENE_LOADING.endFlag = 1
	end

	SCENE_LOADING.testSprite:setPositionX(x)
end

--消息响应-----------------------------------------------------------------------------------------------------
SCENE_LOADING.onTouchBegan = function(x,y)
	SCENE_LOADING.touchBeginPoint ={x = x, y = y}
	return true
end

SCENE_LOADING.onTouchMoved = function(x,y)
	if SCENE_LOADING.touchBeginPoint then
		SCENE_LOADING.touchBeginPoint ={x = x, y = y}
	end
	return true
end

SCENE_LOADING.onTouchEnded = function(x,y)
	SCENE_LOADING.touchBeginPoint = nil
	return true
end

SCENE_LOADING.onTouch = function(eventType, x, y)
	if eventType == CCTOUCHBEGAN then
		return SCENE_LOADING.onTouchBegan(x, y)
	elseif eventType == CCTOUCHMOVED then
		return SCENE_LOADING.onTouchMoved(x, y)
	else
		return SCENE_LOADING.onTouchEnded(x, y)
	end
end
