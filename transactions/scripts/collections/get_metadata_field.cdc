import League from 0xTOPSHOTADDRESS

// This script gets the metadata associated with a moment
// in a collection by looking up its playID and then searching
// for that play's metadata in the League contract. It returns
// the value for the specified metadata field

// Parameters:
//
// account: The Flow Address of the account whose moment data needs to be read
// momentID: The unique ID for the moment whose data needs to be read
// fieldToSearch: The specified metadata field whose data needs to be read

// Returns: String
// Value of specified metadata field

pub fun main(account: Address, momentID: UInt64, fieldToSearch: String): String {

    // borrow a public reference to the owner's moment collection 
    let collectionRef = getAccount(account).getCapability(/public/FilmCollection)
        .borrow<&{League.FilmCollectionPublic}>()
        ?? panic("Could not get public moment collection reference")

    // borrow a reference to the specified moment in the collection
    let token = collectionRef.borrowFilm(id: id)
        ?? panic("Could not borrow a reference to the specified moment")

    // Get the tokens data
    let data = token.data

    // Get the metadata field associated with the specific play
    let field = League.getPlayMetaDataByField(playID: data.playID, field: fieldToSearch) ?? panic("Play doesn't exist")

    log(field)

    return field
}