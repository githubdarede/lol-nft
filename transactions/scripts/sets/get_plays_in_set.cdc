import League from 0xTOPSHOTADDRESS

// This script returns an array of the play IDs that are
// in the specified match

// Parameters:
//
// matchID: The unique ID for the match whose data needs to be read

// Returns: [UInt32]
// Array of play IDs in specified match

pub fun main(matchID: UInt32): [UInt32] {

    let plays = League.getPlaysInMatch(matchID: matchID)!

    return plays
}