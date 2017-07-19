#include "\z\ace\addons\main\script_component.hpp"

if (isServer || isDedicated) then {
	
	{ 
		if (isMultiplayer) then {
			_x enableSimulationGlobal false; 
		} else {
			_x enableSimulation false;
		};

		_x setVariable ["ace_map_hideBlueForceMarker", true];

	} forEach allUnits;

	// remove ace blu force tracking marker
	
	ace_map_BFT_Enabled = false;
	ace_map_mapShake = false;
	call ACE_map_fnc_blueForceTrackingUpdate;
	
	publicVariable "ace_map_BFT_Enabled";
	publicVariable "ace_map_mapShake";
	

	publicVariable "GRAD_REPLAY_DATABASE";
	missionnamespace setVariable ["GRAD_replay_isRunning", true, true];
	[] remoteExec ["GRAD_replay_fnc_initReplay", allPlayers, false];

	// disable BC radio vehicle marker for replay
	GRAD_RADIO_VEH_MARKER_HIDDEN = true;
	publicVariable "GRAD_RADIO_VEH_MARKER_HIDDEN";

	GRAD_TERMINAL_MARKER_HIDDEN = true;
	publicVariable "GRAD_TERMINAL_MARKER_HIDDEN";
	
};
