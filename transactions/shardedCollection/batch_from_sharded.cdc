import NonFungibleToken from 0xNFTADDRESS
import League from 0xTOPSHOTADDRESS
import LeagueShardedCollection from 0xSHARDEDADDRESS

// This transaction deposits a number of NFTs to a recipient

// Parameters
//
// recipient: the Flow address who will receive the NFTs
// momentIDs: an array of moment IDs of NFTs that recipient will receive

transaction(recipient: Address, momentIDs: [UInt64]) {

    let transferTokens: @NonFungibleToken.Collection
    
    prepare(acct: AuthAccount) {
        
        self.transferTokens <- acct.borrow<&LeagueShardedCollection.ShardedCollection>(from: /storage/ShardedMomentCollection)!.batchWithdraw(ids: momentIDs)
    }

    execute {

        // get the recipient's public account object
        let recipient = getAccount(recipient)

        // get the Collection reference for the receiver
        let receiverRef = recipient.getCapability(/public/MomentCollection).borrow<&{League.MomentCollectionPublic}>()!

        // deposit the NFT in the receivers collection
        receiverRef.batchDeposit(tokens: <-self.transferTokens)
    }
}