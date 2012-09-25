//
//  types.h
//  drawstory
//
//  Created by 张 靖宇 on 12-4-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef drawstory_types_h
#define drawstory_types_h


// lobby state
typedef enum 
{
    kLobbyStateUnhandle,
    kLobbyStateRegisterUser,
    kLobbyStateWaitingForRegisterUser,
    kLobbyStateLoginUser,
    kLobbyStateWaitingForLoginUser,
    kLobbyStateIdle,
    kLobbyStateWaitingForCreateRandomGame,
    kLobbyStateWaitingForQueryCurrentRandomGame,
    kLobbyStateWaitingForQueryReplay,
    kLobbyStatePaintQuestion,
    kLobbyStateSolveQuestion,
    kLobbyStateReplayResult,
} LobbyState;


// event from logic
typedef enum 
{
    kLogicEventQueryGameForUserFinished,
    kLogicEventGameStateChanged,
} LogicEvent;


// priority of touch for layers
typedef enum {
    kTouchPriorityGameListLayer = 0,
    kTouchPriorityGameLabelLayer = -1,
    kTouchPriorityRegisterLayer = -2, 
    kTouchPriorityMessageLayer = -3,

    kTouchPriorityPaintingLayer = -4,
    kTouchPriorityCanvasLayer = -5,
    kTouchPriorityTitleBarLayer = -6,
    kTouchPriorityCommandBarLayer = -6,
        
    kTouchPrioritySolvingLayer = -4,
    kTouchPriorityKeyboardLayer = -5,

} TouchPriority;


// width of brush
typedef enum {
    kBrushWidth1 = 4,
    kBrushWidth2 = 8,
    kBrushWidth3 = 16,
    kBrushWidth4 = 32,
    
    kBrushMax = kBrushWidth4,
} BrushWidth;


// draw mode
typedef enum {
    kPaintModeDraw,
    kPaintModeErase
} PaintMode;


#endif
