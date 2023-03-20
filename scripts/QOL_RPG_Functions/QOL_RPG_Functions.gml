/* =================================================================================================== *
 *     _____ __  __      ____   ____  _          _      _____ ____  _____            _______     __	   *
 *    / ____|  \/  |    / __ \ / __ \| |        | |    |_   _|  _ \|  __ \     /\   |  __ \ \   / /	   *
 *   | |  __| \  / |   | |  | | |  | | |        | |      | | | |_) | |__) |   /  \  | |__) \ \_/ /	   *
 *   | | |_ | |\/| |   | |  | | |  | | |        | |      | | |  _ <|  _  /   / /\ \ |  _  / \   /	   *
 *   | |__| | |  | |   | |__| | |__| | |____    | |____ _| |_| |_) | | \ \  / ____ \| | \ \  | |	   *
 *    \_____|_|  |_|    \___\_\\____/|______|   |______|_____|____/|_|  \_\/_/    \_\_|  \_\ |_|	   *
 *	  																								   *                                                                 
 *     //   ) )  //   ) ) //   ) )     /|    //| |     //   ) ) //    ) ) //   / / / /        //   / / * 
 *    //___/ /  //___/ / //           //|   // | |    //   / / //    / / //   / / / /        //____    *
 *   / ___ (   / ____ / //  ____     // |  //  | |   //   / / //    / / //   / / / /        / ____     * 
 *  //   | |  //       //    / /    //  | //   | |  //   / / //    / / //   / / / /        //          *
 * //    | | //       ((____/ /    //   |//    | | ((___/ / //____/ / ((___/ / / /____/ / //____/ /    *   
 *	  																								   *
 *    	GameMaker Quality of Life Library RPG Module					Coded by IMF24, et al.		   *
 *	  																								   *
 * =================================================================================================== */
/*	QUALITY OF LIFE RPG MODULE EXTENSION BY IMF24, ET AL.
	VERSION 1.0
	FOR GAMEMAKER VERSION 2023.2+

	This module requires the GM QOL Library Core:
	https://sites.google.com/view/gm-qol/downloads
	https://github.com/IMF24/GM-QOL
	
	This article contains information regarding new script format as of GM Version 2.3.0:
	https://help.yoyogames.com/hc/en-us/articles/360005277377
*/
// =====================================================================================
// HP / Life Functions
// =====================================================================================
// Heal HP function.
/// @arg {Real} amount								The amount of HP to heal.
/// @arg {Asset.GMObject|Id.Instance} target		The target object.
/// @arg {Real} variable							The variable to modify.
/// @return {Undefined}								Doesn't return anything.
/// @desc	Heals the selected target by a given amount. Defaults to the player.
function heal(__amount, __object = oPlayer_QOL_RPG, __variable = oPlayer_QOL_RPG.hp) { with (__object) __variable += __amount; }

// Damage HP function.
/// @arg {Real} amount								The amount of HP to damage the target by.
/// @arg {Asset.GMObject|Id.Instance} target		The target object.
/// @return {Undefined}								Doesn't return anything.
/// @desc	Damage the target by a given amount. The damage formula: amount * (100 / (100 + def))
function damage(__amount, __object = oPlayer_QOL_RPG) { return __amount * (100 / (100 + __object.def)); }