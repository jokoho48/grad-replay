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
	// call ACE_map_fnc_blueForceTrackingUpdate;
	
	publicVariable "ace_map_BFT_Enabled";
	publicVariable "ace_map_mapShake";
	

	missionnamespace setVariable ["GRAD_replay_isRunning", true, true];
	_replayLength = count GRAD_REPLAY_DATABASE;
	diag_log format ["replay length is %1", _replayLength];

	// set every client to know whats his number in line and display progress bar
	{
		[_replayLength, _forEachIndex + 1, count (allPlayers - entities "HeadlessClient_F")] remoteExec ["GRAD_replay_fnc_receiveData", _x];
	} forEach allPlayers - entities "HeadlessClient_F";

	// send to all clients at once, but one tidbit after another --> hopefully this works
	{
		_tidBit = str _x;
		[_tidBit] remoteExec ["GRAD_replay_fnc_addReplayPart", allPlayers - entities "HeadlessClient_F"];
		sleep 0.4;
	} forEach GRAD_REPLAY_DATABASE;

	// publicVariable "GRAD_REPLAY_DATABASE";
	sleep 1;
	diag_log format ["sending replay at serverTime %1", serverTime];
	[] remoteExec ["GRAD_replay_fnc_initReplay", allPlayers - entities "HeadlessClient_F", false];

	// copyToClipboard str GRAD_REPLAY_DATABASE;

};
