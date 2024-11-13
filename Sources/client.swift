import Foundation
import Poker

@main
actor CPU: Player {
    var myPlayerID: Int = -1
    var myCards: [Card] = []
    var sharedCards: [Card] = []

    func cardsWereRevealed(event: CardReveal) {
        self.sharedCards.append(contentsOf: event.cards)
    }

    func turnDidOccur(event: Turn) {
        
    }

    func doTurn(event: TurnRequest) -> Action {
        return .fold
    }

    func beginRound(event: RoundStart) async {
        self.myPlayerID = event.playerID
        self.myCards = event.cards
        self.sharedCards = []
    }
}
